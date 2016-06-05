<?php

if(!isset($_GET['action']))
{
    throw new Exception('$_GET Action not defined');
}

switch($_GET['action'])
{
    case "routeDetails":
    
        //Init GQS
        require_once "REQUIRED/class.gqs.php";
        $gqs = new GQS();

        //get Network TAG
        $networkTAG = strtoupper($_POST['netTag']);

        //Set the current network
        $gqs->setNetwork($networkTAG);

        //Tag linked to a network?
        if(!$gqs->isNetwork($networkTAG))
        {
            //No
            throw new Exception("Bad network.");
            exit;
        }

        //Network is in database, do we have a master.php for it?
        if(!is_file("NETWORKS/".$networkTAG."/master.php"))
        {
            //No
            throw new Exception("master.php not found.");
            exit;
        }
        
        //Insert the globals Generator
        require_once "REQUIRED/function.generateGlobals.php";

        //Generate the globals
        $globals = generateGlobals($networkTAG);
        $LINES = $globals[0];
        $NETWORK = $globals[1];
        
        $route = $_POST['path'];
        
        //Yes, get Infos about the newtork
        $netInfos = $gqs->getNetworkInfos($networkTAG);

        $networkName = $netInfos['name'];
        $networkLongName = $netInfos['longname'];

        $netFolderUp = "../NETWORKS/".$networkTAG."";
        $netFolder = "NETWORKS/".$networkTAG."";

        $netNameSpacePath = '\Networks\\'.$networkTAG.'\\';
        //We insert the current Network master
        require_once "NETWORKS/".$networkTAG."/master.php";

        //Instantiate the printer
        $classPath = $netNameSpacePath.'Printer';
        $printer = new $classPath($netFolder, $netFolderUp);
        
        //Loop over the route path to build a new one that can be used by the printer
        $STATIONS = [];
        $LINKS = [];
        
        for($i = 0; $i+1 < count($route); $i++)
        {
            $pointA = $route[$i];
            $pointB = $route[$i+1];
            
            $stationA = explode("-", $pointA)[0];
            $stationB = explode("-", $pointB)[0];
            
            $lineB = explode("-", $pointB)[1];
            if($i == 0)
            {
                $lineA = $lineB;
            }
            else
            {
                $lineA = explode("-", $pointA)[1]; 
            }
            
            $linkID = $gqs->getLinkID($stationA, $lineA, $stationB, $lineB);
            
            array_push($LINKS, $linkID);
            
            if($i == 0)
            {
                array_push($STATIONS, $stationA);
            }
            
            array_push($STATIONS, $stationB);
        }
        
        /*echo "<pre>";
        print_r($STATIONS);
        echo "</pre>";
        
        echo "<pre>";
        print_r($LINKS);
        echo "</pre>";*/
        
        //Espace entre les stations
        $steps = 85 / (count($STATIONS) - 1);
        
        //Affichage des liens
        for($i = 0; $i+1 < count($STATIONS); $i++)
        {
            $startX = $steps * $i + 5;
            $endX = $steps * ($i + 1) + 5;
            
            $printer->detailsLink($LINKS[$i], $startX, $endX, $NETWORK, $LINES);
        }
        
        //Affichage des stations
        for($i = 0; $i < count($STATIONS); $i++)
        {
            $posX = $steps * $i + 5;
        
            $printer->detailsStation($STATIONS[$i], $posX, $NETWORK, $LINES);
        }
        
    break;
}