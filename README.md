# HUB
HUB is a transportation system viewer based on SVG (to display the map), PHP, and JavaScript.
It used an SQL database to store informations about the networks, the stations, and the lines.

HUB use Djikstra's algorithm to calculate the fastest route between two stations.

HUB is made to be able to support different networks. *In Progress*

# Create a network

There is no way for now to fill the database automatically. You will have to fill it yourself.
Each folder in the **NETWORKS** folder correspond to a network.

The folder name must be the same as the **network_tag** in the database.

## Setting up the network folder

Every network folder needs to have at least three files on its root.
Those three files *WILL* be called by HUB.

### master.php

This file all the functions called by the main script.
It must be in its own namespace following a specific syntax : _Networks\\**network_tag**_, otherwise you'll get an error.

The **master.php** file must also contain a **Printer** class implementing different methods who will be called by the main process.

An empty **master.php** should look something like this :


``` PHP
//Defining currentNamepsace to avoir conflict
namespace Networks\MTL;

//Inclusion of global query system (GQS)
use \GQS;

//Use of a generic name for brievety. Namespace alreaduy here to ensure clarity
class Printer
{
    private $gqs;
    private $workingPath;
    private $displayPath;
    private $globalClasses = "";
    
    function __construct($currWorkinPath, $currDisplayinPath)
    {
        //Instantiation of a new GQS for our queries.
        $this->gqs = new GQS();
        
        //Save current paths
        $this->workingPath = $currWorkinPath;
        $this->displayPath = $currDisplayinPath;
    }
    
    function background()
    {
       //print map's background
    }
    
    function vertice($link, $NETWORK, $LINES)
    {
        //print link between station
    }
    
    function station($station, $NETWORK, $LINES)
    {
        //print station icon
    }
}

```

This can call other php files if needed. Just make sure that all the files are in the same network folder.

### master.css

This file contain all the styling rules you want to apply to the viewer.
It is imported after **main.css**, this let you customize the whole interface, in order to make it match your map's design.

### logo.png

Logo of your map/network. Use only for design purposes, but still required.
No support yet for other extensions, must be **logo.png**.

## The Global Query System

In order to improve security and stability, third-party networks interact with the database through the **Global Query System (GQS)** class.
The GQS give the user the possibility to call different methods to interact with the database. A GQS query will always return an Array, with the exception of *setNetwork()* and *isNetwork()* methods.

The methods available at this time are :
* **setNetwork(network_tag)** - Define current network to be used with future queries. Return void
* **isNetwork(network_tag)** - return true or false if the network is in the database or not. Return bool.
* **getNetworkInfos()** - Return informations about the current network
* **getAllLines()** - Return all the metrolines of the current network
* **getAllStations()** - Return all the stations of the current network
* **getStationNeighboors()** - Return all the lines of the neighboors of a station
* **getStationPlatforms()** - Return all the plateforms of a station
* **getStationSpecs()** - Return the specs of a station
* **getLinkSteps()** - Return the drawing steps of a particular link
* *More to come...*

Full documentation for each function is on its way!

The GQS will throw exception if you try to use one of the network related methods without having set the current network before.

## The NETWORK and LINES Arrays

When a map is rendered, the script start by gathering informations about the network and storing them in two arrays, **$NETWORK** and **$LINES**.

### LINES

**$LINES** contain informations about the lines of the network:

```
Array [lineID]
    lineID *- ID of the line*
    type *- type of the line*
    name *- Name of the line*
    hex *- Color of the line (#000000)*
```

### NETWORK

**$NETWORK** contain informations about the stations and the links/vertices


```
Array []
    STATIONS [station_id]
        station_id - ID of the station
        name - name of the station
        cuts - Line-breaks when displaying the name of the station on the map
        main_hex - Main color of the station → Color of the default set to the station
        posx - Main x position of the station on the map
        posy - Main y position of the station on the map
        displayPos - Postion indication for the position of the station name around the station
        LINES []
            int - ID of the line desserved by the station
        PLATFORMS [plateformID] - List of all the platform of the station
            platformID - ID of the platform
            type - type of the platform
            posx - X position of the platform NOT relative to the station
            posy - Y position of the platform NOT relative to the station
            displayPox - Indication for the position of labels related to this platform
    LINKS [linkID]
        linkID - ID of the link
        from - First station
        line_from - Line of first station
        platform_from - platform of first station - can be NULL
        to - Second station
        line_to - Line of second station
        platform_to - platform of first station - can be NULL
        time - travel time on the link
        comment - comment of the link
        STEPS [] - All the steps of the link (used on render)
            type - Type of step (Sharp/Round/...)
            posx - Step point X position
            posy - Step point Y position
```
---
The **NETWORK** and **LINES** arrays are passed as argument to Printer's methods **vertice** and **station**.

**DO NOT APPLY ANY CHANGES TO THE *NETWORK* AND *LINES* ARRAYS IS PASSED BY REFERENCE.** They are used by the main process to make the application work.

## Drawing the map

HUB use SVG to render the map. It allow the user to draw the network easily, using CSS for the design, and allowing user interactions with the element.

The current system gives you a lot of freedom when drawing the map. In couterpart, because a map in HUB is interactive, the different elements must respect specific caracteristic to allow interaction.

### Links

All the drawn links must have three specific `data-` attributes:
* `data-linkid` : The ID of the link (*linkID*)
* `data-stationa` : the first station of the link (*from*)
* `data-stationb` : the second station of the link (*to*)

If your link is made of multiple SVG elements, just assign them all the three `data-` attributes.

**Reserved CSS class** : The CSS class **selectedPath** is used by HUB to highlight the route found. You can't use selectedPath as one of your own CSS classes, but you can style it in your *master.css*.

If you want to print SVG elements related to the links, but who don't need to use **selectedPath** class, just ommit the data- attributes, without them, HUB will just ignore the elements.

### Stations

All the printed stations must have one specific `data-` attribute to be recognized by HUB
* `data-stationid` : The ID of the station (*station_id*)

If your station is made of multiple SVG elements, just assign them all the `data-stationid` attribute.
The elements who form the clickable part of the station icon must have the class **.stationBtn**. HUB use it to assign the eventListeners.

**Reserved CSS class** : The CSS class **selectedPath** is used by HUB to highlight the route found. You can't use selectedPath as one of your own CSS classes, but you can style it in your *master.css*.

If you want to print SVG elements related to the links, but who don't need to use **selectedPath** class, just ommit the data- attributes, without them, HUB will just ignore the elements.

## Interactions

You don't need to assign `onclick` attributes to your SVG elements. HUB will link the eventListeners itself. Just be sure to use the specified `data-` attributes and CSS classes.