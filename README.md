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

Every network folder needs to have at list two files on its root :

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
       //print background map
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

