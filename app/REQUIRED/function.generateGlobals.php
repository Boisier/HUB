<?php
function generateGlobals($netTag)
{
    //Init GQS
    require_once "REQUIRED/class.gqs.php";
    $gqs = new GQS();
    
    //Set the current network
    $gqs->setNetwork($netTag);
    
    //Fetch all lines of network
    $linesFetch = $gqs->getAllLines();

    //Initialisation des globaux
    $NETWORK = ["STATIONS" => [], "LINKS" => []];
    $LINES = [];

    //Loop over every lines
    foreach($linesFetch as $l)
    {
        $lineID = $l['line_id'];
        $type = $l['line_type'];
        $name = $l['line_name'];
        $hex = $l['line_hex'];

        $LINES[$lineID] = ['lineID' => $lineID, 'type' => $type, 'name' => $name, 'hex' => $hex];
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
                 "comment" => $l['link_comment'],
                 "STEPS" => []];

        $steps = $gqs->getLinkSteps($l['station_a'], $l['station_b']);

        foreach($steps as $s)
        {
            array_push($link['STEPS'], ['type' => $s['step_type'], 'posx' => $s['step_posx'], 'posy' => $s['step_posy']]);
        }

        $NETWORK['LINKS'][$l['link_id']] = $link;
    }
    
    return [$LINES, $NETWORK];
}