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
It must be in its own namespace following a specific syntax : _Networks\\**network_tag**_

The **master.php** file must also contain a **Printer** class implementing different method who will be called by the main process.

An empty **master.php** should somthing like this :


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
The GQS give the user the possibility to call different methods to interact with the database. A GQS query will always return an Array, with the exception of *setNetwork* and *isNetwork()* methods.

The methods available at this time are :
* **setNetwork(network_tag)** - Define current network to be used with future queries. Return void
* **isNetwork(network_tag)** - return true or false if the network is in the database or not. Return bool.
* **getNetworkInfos()** - Return informations about the current network
* **getAllLines()** - Return all the metrolines of the current network
* **getAllStations()** - Return all the stations of the current network
* **getStationNeighboors()** - Return all the lines of the neighboors of a station
* **getStationSpecs()** - Return the specs of a station
* **getLinkSteps()** - Return the drawing steps of a particular link
* *More to come...*