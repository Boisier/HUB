<?php
header("Content-Type: text/html; charset=UTF-8");

if($_GET['netTag'] != null)
{    
    //Init GQS
    require_once "REQUIRED/class.gqs.php";
    $gqs = new GQS();
    
    //get Network TAG
    $networkTAG = strtoupper($_GET['netTag']);
    
    //Set the current network
    $gqs->setNetwork($networkTAG);
    
    //Tag linked to a network?
    if(!$gqs->isNetwork($networkTAG))
    {
        //No
        echo "Bad network.";
        exit;
    }
    
    //Network is in database, do we have a master.php for it?
    if(!is_file("NETWORKS/".$networkTAG."/master.php"))
    {
        //No
        echo "master.php not found.";
        exit;
    }
    
    //Yes, get Infos about the newtork
    $netInfos = $gqs->getNetworkInfos($networkTAG);
    
    $networkName = $netInfos['name'];
    $networkLongName = $netInfos['longname'];
    
    $netFolderUp = "../NETWORKS/".$networkTAG."";
    $netFolder = "NETWORKS/".$networkTAG."";
    
    $netNameSpacePath = '\Networks\\'.$networkTAG.'\\';
}
else
{
    echo "Bad url.";
    exit;
}
?>
<!DOCTYPE html>
<html>
    <head>
        <title><?php echo $networkLongName; ?></title>
        <!-- jQuery -->
        <script type="text/javascript" src="../JS/jquery.js"></script>
        <!-- Plugins -->
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <!-- Main includes -->
        <link rel="stylesheet" type="text/css" href="../CSS/main.css">
        <script type="text/javascript" src="../JS/dijkstras.js"></script>
        <!-- Network includes -->
        <link rel="stylesheet" type="text/css" href="<?php echo $netFolderUp; ?>/master.css">
    </head>
    <body>
        <section id="topPart">
            <section id="route">
                <header>
                    <img src="<?php echo $netFolderUp; ?>/logo.png" id="networkIcon">  
                    <div id="mainTitle">
                        <?php echo $networkName; ?>
                    </div>
                </header>
                <section id="routeInfos">
                    <div class="row">
                        <div class="col-sm-12 stationBlock">
                            <h5>Départ</h5>
                            <h2 id="startStationBlock"></h2>
                        </div>
                        <div class="col-sm-12 arrowRoute"><i class="glyphicon glyphicon-arrow-down"></i></div>
                        <div class="col-sm-12 stationBlock">
                            <h5>Arrivée</h5>
                            <h2 id="endStationBlock"></h2>
                        </div> 
                    </div>
                    <div class="row" style="margin-top:25px;">
                        <div class="col-sm-12 timeEstimation">Temps estimé : <span id="timeEstimated">0</span> minutes</div>
                    </div>
                </section>
            </section>
            <div id="mapContainer">
                <svg width="1000" height="1500" id="mainMap" viewBox="0 350 1000 1500">
                <?php
                //We insert the current Network master
                require_once "NETWORKS/MTL/master.php";
                
                //Instantiate the printer
                $classPath = $netNameSpacePath.'printer';
                $printer = new $classPath($netFolder, $netFolderUp);
                
                //Print the background
                $printer->background();
                    
                //Fetch all lines of network
                $linesFetch = $gqs->getAllLines();

                //Initialisation des globaux
                $NETWORK = ["STATIONS" => [], "LINKS" => []];
                $LINES = [];
                    
                //Loop over every lines
                foreach($linesFetch as $l)
                {
                    $lineID = $l['line_id'];
                    $name = $l['line_name'];
                    $hex = $l['line_hex'];

                    $LINES[$lineID] = ['lineID' => $lineID, 'name' => $name, 'hex' => $hex];
                }

                //Fetch all the stations of the network
                $stations = $gqs->getAllStations();

                //On boucle sur les staions
                foreach($stations as $s)
                {
                    $stationID = $s['station_id'];
                    $name = $s['station_name'];
                    $main_hex = $LINES[$s['line_id']]['hex'];
                    $posx = $s['station_posx'];
                    $posy = $s['station_posy'];
                    $displayPos = $s['display_pos'];
                    $cuts = explode(",", $s['display_cut']);

                    $NETWORK["STATIONS"][$stationID] = ['station_id' => $stationID, 'name' => $name, 'cuts' => $cuts, 'main_hex' => $main_hex, 'posx' => $posx, 'posy' => $posy, 'displayPos' => $displayPos, "LINES" => []];

                    //Fetch neighboors of station
                    $neighboors = $gqs->getStationNeighboors($stationID);
                    
                    foreach($neighboors as $n)
                    {
                        if(!in_array($n['LA'], $NETWORK["STATIONS"][$stationID]["LINES"]))
                        {
                            array_push($NETWORK["STATIONS"][$stationID]["LINES"], $n['LA']);
                        }

                        if(!in_array($n['LB'], $NETWORK["STATIONS"][$stationID]["LINES"]))
                        {
                            array_push($NETWORK["STATIONS"][$stationID]["LINES"], $n['LB']);
                        }
                    }
                }

                //Fetch all the links of the network
                $links = $gqs->getAllLinks();
                
                foreach($links as $l)
                {
                    $link = ["linkID" => $l['link_id'],
                             "from" => $l['station_a'],
                             "line_from" => $l['line_a'],
                             "to" => $l['station_b'],
                             "line_to" => $l['line_b'],
                             "time" => $l['link_value'],
                             "STEPS" => []];
                    
                    $steps = $gqs->getLinkSteps($l['station_a'], $l['station_b']);

                    foreach($steps as $s)
                    {
                        array_push($link['STEPS'], ['type' => $s['step_type'], 'posx' => $s['step_posx'], 'posy' => $s['step_posy']]);
                    }

                    $NETWORK['LINKS'][$l['link_id']] = $link;
                }

                //Everything is now properly formated in $NETWORK and $LINES
                    
                $globalClasses = "";

                foreach($NETWORK['LINKS'] as $link)
                {
                    $printer->vertice($link, $NETWORK, $LINES);
                }

                foreach($NETWORK['STATIONS'] as $station)
                {
                    $printer->station($station, $NETWORK, $LINES);
                }
                ?>
                </svg>
            </div>
        </section>
        <!--<pre>
        <?php //print_r($NETWORK); ?>
        </pre> -->
        <script type="text/javascript">
            
            var NETWORK = <?php echo json_encode($NETWORK); ?>;
            
            var graph = new Graph();
            
            var currAction = null;
            var currStation = null;
            
            $(document).ready(function()
            {  
                //Initialisation des vertexes
                
                var vertex = [];
                
                for(i in NETWORK.LINKS)
                {
                    stationA = NETWORK.LINKS[i].from+"-"+NETWORK.LINKS[i].line_from;
                    stationB = NETWORK.LINKS[i].to+"-"+NETWORK.LINKS[i].line_to;
                    time = Number(NETWORK.LINKS[i].time);
                    
                    if(typeof vertex[stationA] === "undefined")
                    {
                        vertex[stationA] = {source: stationA, dest: []}
                    }
                    
                    vertex[stationA].dest[stationB] = time;
                    
                    if(typeof vertex[stationB] === "undefined")
                    {
                        vertex[stationB] = {source: stationB, dest: {}}
                    }
                    
                    vertex[stationB].dest[stationA] = time;
                }
                
                for(i in vertex)
                {
                    graph.addVertex(vertex[i].source, vertex[i].dest);
                }
                
                //Listeners
                $(".stationBtn").on({click: function() 
                {
                    stationID = $(this).data("stationid");
                  
                    if(currAction == null)
                    {
                        currAction = "search";
                        $(".selectedPath").removeClass("selectedPath");
                        $("#startStationBlock").html(NETWORK.STATIONS[stationID].name);
                        currStation = stationID;
                    }
                    else if(currAction == "search")
                    {
                        if(stationID != currStation)
                        {
                            route(currStation, stationID);
                            currAction = null;
                        }
                    }
                    
                }, mouseenter: function () 
                {
                    stationID = $(this).data("stationid");
                    
                    if(currAction == "search")
                    {
                        route(currStation, stationID);
                    }
                }
            });
        });
       
        function compareDistances(a,b) {
            if (a.distance < b.distance)
                return -1;
            else if (a.distance > b.distance)
                return 1;
            else 
                return 0;
        }
            
        var paths;
            
        function route(startStation, endStation)
        {
            paths = [];
            
            for(i in NETWORK.STATIONS[startStation].LINES)
            {
                for(y in NETWORK.STATIONS[endStation].LINES)
                {
                    paths.push(graph.shortestPath(
                        startStation+"-"+NETWORK.STATIONS[startStation].LINES[i], 
                        endStation+"-"+NETWORK.STATIONS[endStation].LINES[y]));
                }
            }
            
            $(".selectedPath").removeClass("selectedPath");
            
            paths.sort(compareDistances);
            
            pathStations = paths[0].path.concat(startStation).reverse();
            pathTime = paths[0].distance;
            
            $("#startStationBlock").html(NETWORK.STATIONS[startStation].name);
            $("#endStationBlock").html(NETWORK.STATIONS[endStation].name);
            $("#timeEstimated").html(pathTime);
                
                //$("#routeInfos").html("<p>Temps de trajet esimé : "+pathTime+" minutes</p>");
            
            for(var i = 0; i+1 < pathStations.length; i++)
            {
                var pointA = pathStations[i].toString();
                var pointB = pathStations[i+1].toString();
                
                var sIDA = pointA.split("-")[0];
                var sIDB = pointB.split("-")[0];
                
                $(".line[data-stationa="+sIDA+"][data-stationb="+sIDB+"]").addClass("selectedPath");
                $(".line[data-stationa="+sIDB+"][data-stationb="+sIDA+"]").addClass("selectedPath");
            }
        }
        </script>
    </body>
</html>