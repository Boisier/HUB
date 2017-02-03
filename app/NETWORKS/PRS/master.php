<?php
//   @author : Valentin Dufois - valentin@dufois.fr
//   This file is made to be used with the HUB project.

//   Montréal Network

//Defining currentNamepsace to avoir conflict
namespace Networks\PRS;

//Inclusion of global query system (GQS)
use \GQS;

//Use of a generic name for brievety. Namespace alreaduy here to ensure clarity
class printer
{
    private $gqs;
    private $workingPath;
    private $displayPath;
    private $globalClasses = "";
    
    function __construct($currWorkinPath, $currDisplayinPath)
    {
        //Instantiation of a new GQS for our queries.
        $this->gqs = new GQS();
        $this->workingPath = $currWorkinPath;
        $this->displayPath = $currDisplayinPath;
    }
    
    function background()
    {
       echo '<image x="-10" y="3" width="1350" height="1350" xlink:href="'.$this->displayPath.'/background.svg" />';
    }
    
    function vertice($link, $NETWORK, $LINES)
    {
        if($link['from'] != $link['to'] && $link['line_from'] == $link['line_to'])
        {
            //Le lien n'est pas interne à une station, on le dessine
            $linkID = $link['linkID'];
            $sA = $link['from'];
            $sB = $link['to'];

            $color = $LINES[$link['line_from']]['hex'];
            $lineType = $LINES[$link['line_from']]['type'];

            $linkPoints = [];

            //On insère toutes les étapes des tracés
            if($link['platform_from'] != NULL)
            {
                array_push($linkPoints, ["x" => $NETWORK['STATIONS'][$link['from']]["PLATFORMS"][$link['platform_from']]['posx'], "y" => $NETWORK['STATIONS'][$link['from']]["PLATFORMS"][$link['platform_from']]['posy'], "type" => "angle"]);
            }
            else
            {
                array_push($linkPoints, ["x" => $NETWORK['STATIONS'][$link['from']]['posx'], "y" => $NETWORK['STATIONS'][$link['from']]['posy'], "type" => "angle"]);
            }
            
            foreach($link['STEPS'] as $step)
            {
                array_push($linkPoints, ["x" => $step['posx'], "y" => $step['posy'], "type" => $step['type']]);
            }
            
            if($link['platform_to'] != NULL)
            {
                array_push($linkPoints, ["x" => $NETWORK['STATIONS'][$link['to']]["PLATFORMS"][$link['platform_to']]['posx'], "y" => $NETWORK['STATIONS'][$link['to']]["PLATFORMS"][$link['platform_to']]['posy'], "type" => "angle"]);
            }
            else
            {
                array_push($linkPoints, ["x" => $NETWORK['STATIONS'][$link['to']]['posx'], "y" => $NETWORK['STATIONS'][$link['to']]['posy'], "type" => "angle"]);
            }
            
            foreach($linkPoints as $key => $points)
            {
                //On vérifie que l'on est pas à la fin du tableau
                if($key+1 != count($linkPoints) && ($linkPoints[$key+1]["type"] != "arc" || $linkPoints[$key]["type"] == "arc"))
                {
                    $x1 = $linkPoints[$key]["x"];
                    $y1 = $linkPoints[$key]["y"];
                    $x2 = $linkPoints[$key+1]["x"];
                    $y2 = $linkPoints[$key+1]["y"];
                    
                    $endOfLine = 'data-linkid="'.$linkID.'"
                                  data-stationa="'.$sA.'"
                                  data-stationb="'.$sB.'"
                                  class="line '.$this->globalClasses.' '.$lineType.'" 
                                  style="stroke:'.$color.'" />';
                    
                    if($linkPoints[$key]["type"] == "angle")
                    {                    
                        echo '<line 
                            x1="'.$x1.'" 
                            y1="'.$y1.'" 
                            x2="'.$x2.'" 
                            y2="'.$y2.'" 
                            '.$endOfLine;
                    }
                    else if($linkPoints[$key]["type"] == "arc")
                    {
                        $magnitude = 5;
                        $x0 = $linkPoints[$key-1]["x"];
                        $y0 = $linkPoints[$key-1]["y"];
                        
                        //Start of arc
                        $sPoint = $this->getArcPoint($magnitude, $x0, $y0, $x1, $y1); 
                        
                        //End of arc
                        $ePoint = $this->getArcPoint($magnitude, $x2, $y2, $x1, $y1); 
                        
                        if($sPoint != [$x0, $y0])
                        {
                             echo '<line 
                            x1="'.$x0.'" 
                            y1="'.$y0.'" 
                            x2="'.$sPoint[0].'" 
                            y2="'.$sPoint[1].'" 
                            '.$endOfLine;
                        }
                        
                        echo '<path 
                            d="M'.$sPoint[0].' '.$sPoint[1].' Q '.$x1.' '.$y1.' '.$ePoint[0].' '.$ePoint[1].'" 
                            fill="none"
                            '.$endOfLine;
                        
                        if($ePoint != [$x2, $y2] && $key+1 != count($linkPoints) && $linkPoints[$key+1]["type"] != "arc")
                        {
                             echo '<line 
                            x1="'.$ePoint[0].'" 
                            y1="'.$ePoint[1].'" 
                            x2="'.$x2.'" 
                            y2="'.$y2.'" 
                            '.$endOfLine;
                        }
                            
                        $linkPoints[$key]["x"] = $ePoint[0];
                        $linkPoints[$key]["y"] = $ePoint[1];
                    }
                }
            }
        }
        else if($link['comment'] == "corr")
        {
            $linkID = $link['linkID'];
            $sID = $link['from'];
            
            $x1 = $NETWORK['STATIONS'][$link['from']]["PLATFORMS"][$link['platform_from']]['posx'];
            $y1 = $NETWORK['STATIONS'][$link['from']]["PLATFORMS"][$link['platform_from']]['posy'];
            $x2 = $NETWORK['STATIONS'][$link['to']]["PLATFORMS"][$link['platform_to']]['posx'];
            $y2 = $NETWORK['STATIONS'][$link['to']]["PLATFORMS"][$link['platform_to']]['posy'];
            
            echo '<line 
                x1="'.$x1.'" 
                y1="'.$y1.'" 
                x2="'.$x2.'" 
                y2="'.$y2.'" 
                data-linkid="'.$linkID.'"
                data-stationid="'.$sID.'"
                class="corr back'.$this->globalClasses.' station-'.$sID.'"/>';  
            
            echo '<line 
                x1="'.$x1.'" 
                y1="'.$y1.'" 
                x2="'.$x2.'" 
                y2="'.$y2.'" 
                data-linkid="'.$linkID.'"
                data-stationid="'.$sID.'"
                class="corr front'.$this->globalClasses.' station-'.$sID.' stationBtn"/>';  
        }
    } 
    
    function getArcPoint($magnitude, $x0, $y0, $x1, $y1)
    {
        $vAx = $x0 - $x1;
        $vAy = $y0 - $y1;
        
        $uA = sqrt(pow($vAx, 2) + pow($vAy, 2));
        
        if($uA > $magnitude)
        {
            $angA = atan2($vAy, $vAx);
            $vAx = $magnitude * cos($angA);
            $vAy = $magnitude * sin($angA);
            $x = $x1 + $vAx;
            $y = $y1 + $vAy;
        }
        else
        {
            $x = $x0;
            $y = $y0;
        }
        
        return [$x, $y];
    }
    
    function getLinesLinks($in, $stationID, $NETWORK)
    {
        $results = [];

        foreach($NETWORK["LINKS"] as $link)
        {
            /*if($in)
            {
                if($link["from"] == $stationID)
                {
                    $results[$link["platform_from"]] = $link["line_from"];
                }
            }
            else
            {
                if($link["to"] == $stationID)
                {
                    $results[$link["platform_to"]] = $link["line_to"];
                }
            }*/
            
            if(($link["from"] == $stationID || $link["to"] == $stationID) && $link["from"] != $link["to"])
            {
                if($link["from"] == $stationID)
                {
                    array_push($results, $link['line_from'].'-'.$link["platform_from"]);
                }
                else
                {
                    array_push($results, $link['line_to'].'-'.$link["platform_to"]);
                }
            }
        }
        
        return $results;
    }
    
    function station($station, $NETWORK, $LINES)
    {
        $sID = $station['station_id'];
        
        //display variables
            //Bonus classes
            $frontClasses = "";
            $backClasses = "";
            $textClasses = "";
            //Station attributes
            $inCorr = false;
            $isIntersec = false;
            $displayMainPoint = true;
            //Design variables
            $lineColor = $station['main_hex'];
            $x = $station['posx']; //Position of the main station
            $y = $station['posy']; //Position of the main station
            $addDotes = false;
            $r = "3.5"; //Base radius
            $rAddon = 0; //Outline width -> 0 : No outline
            //Station Label
            $displayPos = $station['displayPos'];
            $stationName = $station['name'];
            $cuts = $station['cuts'];
            $textDotes = "";

        
        $specs = $this->gqs->getStationSpecs($sID);

        //Is this station a terminus ? 
        $in = $this->getLinesLinks(true, $sID, $NETWORK);
        $out = $this->getLinesLinks(false, $sID, $NETWORK);
        
        $terminusTemp = array_count_values($in);
        $terminus = [];
        
        foreach($terminusTemp as $key => $occur)
        {
            if($occur == 1)
            {
                $lineID = explode('-', $key)[0];
                $platformID = explode('-', $key)[1];
                
                $terminus[$platformID] = $lineID;
            }
        }
        
        if($sID == 79)
        {
            echo '<script>console.log(`'.print_r($in).'-'.print_r($terminus).'`)</script>';
        }
        
        //Specifications of the station
        /*$specs = $this->gqs->getStationSpecs($sID);

        foreach($specs as $spec)
        {
            switch($spec['spec_type'])
            {
                case "CORR":
                    $inCorr = true;
                break;
            }
        }*/
        
        if(count($station["PLATFORMS"]) != 0)
        {
            //Station is a big correspondance point
            $r = 2.5;
            
            //Loop over every plateform of the station
            foreach($station["PLATFORMS"] as $p)
            {
                if(array_key_exists($p["platformID"], $terminus))
                {
                    $lineID = $terminus[$p["platformID"]];
                    $lineColor = $LINES[$lineID]["hex"];
                    $platformDisplayPos = $p['displayPos'];
                    
                    echo '<circle cx="'.$p['posx'].'" cy="'.$p['posy'].'" r="'.$r.'px" data-stationID="'.$sID.'" class="station-'.$sID.' station'.$frontClasses.' stationBtn" style="fill:'.$lineColor.'"/>';
                    
                    $txt = '<span class="lineDot" style="background-color:'.$LINES[$lineID]['hex'].'">
                        '.$LINES[$lineID]['name'].' 
                    </span>';
                    
                    echo '<foreignObject x="'.($p['posx']-200).'" y="'.($p['posy']-100).'" width="400" height="200">
                    <div class="stationLabel '.$platformDisplayPos.' '.$textClasses.'"><span class="libelle"><div>'.$txt.'</div></span></div>
                    </foreignObject>';
                }
            }
        }
        else
        {
            $isTerminus = count($terminus) > 0 ? true : false;
            //This is a simple station
            //Is this an intersection ?
            if(count($station["LINES"]) > 1)
            {
                $isIntersec = true;
                $frontClasses .= " intersec";
                $textClasses .= " intersec";
                $addDotes = true;
            }

            //Station is a big correspondance point ?
            if($isTerminus && !$isIntersec)
            {
                $lineColor = "#000";
            }

            if($displayMainPoint)
            {
                if($rAddon != 0)
                {
                    echo '<circle cx="'.$x.'" cy="'.$y.'" r="'.($r+$rAddon).'px" data-stationID="'.$sID.'" class="station-'.$sID.' station'.$backClasses.' stationBtn" />';
                }

                echo '<circle cx="'.$x.'" cy="'.$y.'" r="'.$r.'px" data-stationID="'.$sID.'" class="station-'.$sID.' station'.$frontClasses.' stationBtn" style="fill:'.$lineColor.'"/>';
            }
            
            if($isTerminus)
            {
                foreach($terminus as $lineID)
                {
                    $textDotes .= '<span class="lineDot" style="background-color:'.$LINES[$lineID]['hex'].'">
                        '.$LINES[$lineID]['name'].' 
                    </span>';
                }
            }
        }
        
        //Statio label

        if($cuts[0] != 0)
        {                
            $txt = $textDotes.'<span class="name">';

            array_unshift($cuts, 0);
            for($i = 0; $i<count($cuts); $i++)
            {
                if(isset($cuts[$i+1]))
                {
                    $txt .= substr($stationName, $cuts[$i], $cuts[$i+1] - $cuts[$i])."<br>";
                }
                else
                {
                    $txt .= substr($stationName, $cuts[$i])."<br>";
                }
            }

            $txt .= '</span>';
        }
        else
        {
            $txt = $textDotes.'<span class="name">'.$stationName.'</span>';
        }

        if($displayPos != "none")
        {
            echo '<foreignObject x="'.($x-200).'" y="'.($y-100).'" width="400" height="200">
                    <div class="stationLabel '.$displayPos.' '.$textClasses.'"><span class="libelle"><div>'.$txt.'</div></span></div>
                    </foreignObject>';
        }
    }
    
    public function detailsLink($linkID, $startX, $endX, $NETWORK, $LINES)
    {
        echo $linkID;
        $posY = 200;
        $link = $NETWORK['LINKS'][$linkID];
        $printTime = false;
        
        if(($link['from'] != $link['to']) && ($link['line_from'] == $link['line_to']))
        {
            //Le lien n'est pas interne à une station, on le dessine en tant que tracé de train
            $color = $LINES[$link['line_from']]['hex'];
        }
        else
        {
            $color = $LINES[0]['hex'];
        
            $posX = $startX + (($endX - $startX) / 2);    
            $printTime = true;
        }
        
        echo '<line 
            x1="'.$startX.'%" 
            y1="'.$posY.'" 
            x2="'.$endX.'%" 
            y2="'.$posY.'"
            class="line selectedPath" 
            style="stroke:'.$color.'" />';       

        if($printTime)
        {
            echo '<foreignObject x="0" y="'.($posY - 22).'" width="100%" height="150">
                    <div class="walkingTimeBloc" style="margin-left:'.$posX.'%">
                        <p class="walkingTime" style="margin-left:-51px">
                            <span class="libelle">'.$link['time'].' min</span><br>
                            <span class="icon"><img src="'.$this->displayPath.'/ICONS/MTL-WALK.png"></span>
                        </p>
                    </div>
                </foreignObject>';
        }
    }
    
    public function detailsStation($stationID, $posX, $extrem, $NETWORK, $LINES)
    {
        $station = $NETWORK['STATIONS'][$stationID];
        $sID = $station['station_id'];

        $frontClasses = "";
        $backClasses = "";
        $textClasses = "";
        $textIcons = "";
        $textDotes = "";
        $addDotes = false;
        $isIntersec = false;
        $isTerminus = false;
        $r = "5.5";
        $rAddon = 0;
        $x = $posX;
        $y = 200;
        $displayPos = $station['displayPos'];
        $stationName = $station['name'];
        $textAlign = "middle";
        $lineColor = $station['main_hex'];
        $cuts = $station['cuts'];

        $specs = $this->gqs->getStationSpecs($sID);

        foreach($specs as $spec)
        {
            switch($spec['spec_type'])
            {
                case "MULTIMODAL":
                    $backClasses .= " multimodal";
                    $rAddon = 2;
                break;
                case "PARKING":
                    $textIcons .= ' <span class="icon"><img src="'.$this->displayPath.'/ICONS/MTL-PARKING.png"></span>';
                break;
                case "ELEVATOR":
                    $textIcons .= ' <span class="icon"><img src="'.$this->displayPath.'/ICONS/MTL-ELEVATOR.png"></span><span class="specLine" style="background-color:'.$LINES[$spec['spec_value']]['hex'].'"></span>';
                break;
                case "BUSTERMINAL":
                    $textIcons .= ' <span class="icon"><img src="'.$this->displayPath.'/ICONS/MTL-BUSTERMINAL.png"></span>';
                break;
                case "TRAINSTATION":
                    $textIcons .= ' <span class="icon"><img src="'.$this->displayPath.'/ICONS/MTL-TRAINSTATION.png"></span>';
                break;
            }
        }
        
        if($extrem)
        {
            $frontClasses .= " terminus";
            $backClasses .= " terminus";
            $rAddon = 2;
            $isTerminus = true;
            $addDotes = true;
        }

        if(count($station["LINES"]) > 1)
        {
            $backClasses .= " intersec";
            $rAddon = 2;
            $addDotes = true;
        }

        if($isTerminus && $isIntersec)
        {
            $r = "6";
        }

        if($rAddon != 0)
        {
            echo '<circle cx="'.$posX.'%" cy="'.$y.'" r="'.($r+$rAddon).'px" class="station'.$backClasses.'" />';
        }

        echo '<circle cx="'.$posX.'%" cy="'.$y.'" r="'.$r.'px" class="station'.$frontClasses.'" style="fill:'.$lineColor.'"/>';
        
        $txt = $textDotes.'<span class="name">'.$stationName.'</span>'.$textIcons;

        echo '<foreignObject x="'.($posX).'%" y="'.($y-25).'" width="300" height="150">
                    <div class="stationLabel'.$textClasses.' details"><span class="libelle">'.$txt.'</span></div>
                </foreignObject>';
    }
}