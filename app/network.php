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
        <script type="text/javascript" src="../JS/main.js"></script>
        <!-- Network includes -->
        <link rel="stylesheet" type="text/css" href="<?php echo $netFolderUp; ?>/master.css">
    </head>
    <body>
        <section id="topPart">
            <section id="route">
                <header>
                    <img src="<?php echo $netFolderUp; ?>/logo.png" class="networkIcon">  
                    <div class="mainTitle">
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
                require_once "NETWORKS/".$networkTAG."/master.php";
                
                //Instantiate the printer
                $classPath = $netNameSpacePath.'Printer';
                $printer = new $classPath($netFolder, $netFolderUp);
                
                //Print the background
                $printer->background();
                    
                //Insert the globals Generator
                require_once "REQUIRED/function.generateGlobals.php";
                    
                //Generate the globals
                $globals = generateGlobals($networkTAG);
                $LINES = $globals[0];
                $NETWORK = $globals[1];

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
            <!--<pre>
            <?php //print_r($NETWORK); ?>
            </pre> -->
            <script type="text/javascript">
                var NETWORK = <?php echo json_encode($NETWORK); ?>;
                var netTag = '<?php echo $networkTAG; ?>';
                
                $(document).ready(initMap);                
            </script>
        </section>
        <section id="routeDetails" style="display:none;">
            <header>
                <img src="<?php echo $netFolderUp; ?>/logo.png" class="networkIcon"> 
                <div class="mainTitle">
                    Itinéraire
                </div>
            </header> 
            <svg id="routeLine" width="100%" height="300"></svg>
            <section id="routeStats">

            </section>
        </section>
    </body>
</html>