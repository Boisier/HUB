<?php
//   @author : Valentin Dufois - valentin@dufois.fr
//   This file is made to be used with the HUB project.

//   Montréal Network

//Defining currentNamepsace to avoir conflict
namespace Networks\MTL;

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
       echo '<image x="20" y="0" width="1000" height="1550" xlink:href="'.$this->displayPath.'/background.svg" />';
    }
    
    function vertice($link, $NETWORK, $LINES)
    {
        if(($link['from'] != $link['to']) && ($link['line_from'] == $link['line_to']))
        {
            //Le lien n'est pas interne à une station, on le dessine
            $linkID = $link['linkID'];
            $sA = $link['from'];
            $sB = $link['to'];

            $color = $LINES[$link['line_from']]['hex'];

            $linkPoints = [];

            //On insère toutes les étapes des tracés
            array_push($linkPoints, ["x" => $NETWORK['STATIONS'][$link['from']]['posx'], "y" => $NETWORK['STATIONS'][$link['from']]['posy']]);

            foreach($link['STEPS'] as $step)
            {
                array_push($linkPoints, ["x" => $step['posx'], "y" => $step['posy']]);
            }

            array_push($linkPoints, ["x" => $NETWORK['STATIONS'][$link['to']]['posx'], "y" => $NETWORK['STATIONS'][$link['to']]['posy']]);

            foreach($linkPoints as $key => $points)
            {
                //On vérifie que l'on est pas à la fin du tableau
                if($key+1 != count($linkPoints))
                {
                    $x1 = $linkPoints[$key]["x"];
                    $y1 = $linkPoints[$key]["y"];
                    $x2 = $linkPoints[$key+1]["x"];
                    $y2 = $linkPoints[$key+1]["y"];

                    echo '<line 
                        x1="'.$x1.'" 
                        y1="'.$y1.'" 
                        x2="'.$x2.'" 
                        y2="'.$y2.'" 
                        data-linkid="'.$linkID.'"
                        data-stationa="'.$sA.'"
                        data-stationb="'.$sB.'"
                        class="link-'.$linkID.' line'.$this->globalClasses.'" 
                        style="stroke:'.$color.'" />';
                }
            }
        }
    }
    
    function station($station, $NETWORK, $LINES)
    {
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
        $x = $station['posx'];
        $y = $station['posy'];
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
                case "TERMINUS":
                    $frontClasses .= " terminus";
                    $backClasses .= " terminus";
                    $textClasses .= " terminus";
                    $rAddon = 2;
                    $isTerminus = true;
                    $addDotes = true;
                break;
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

        if(count($station["LINES"]) != 1)
        {
            $backClasses .= " intersec";
            $textClasses .= " intersec";
            $rAddon = 2;
            $addDotes = true;
        }

        if($isTerminus && $isIntersec)
        {
            $r = "6";
        }

        //Position du libelle
        $textPosX = 0;
        $textPosY = 0;

        switch($displayPos)
        {
            case "top":
                $textPosX = 0;
                $textPosY = -20;
                $textAlign = "middle";
                $textClasses .= " top";
            break;
            case "topright":
                $textPosX = 10;
                $textPosY = -12;
                $textAlign = "start";
            break;
            case "right":
                $textPosX = 18;
                $textPosY = 3;
                $textAlign = "start";
            break;
            case "bottomright":
                $textPosX = 15;
                $textPosY = 15;
                $textAlign = "start";
            break;
            case "bottom":
                $textPosX = 0;
                $textPosY = 20;
                $textAlign = "middle";
                $textClasses .= " bottom";
            break;
            case "bottomleft":
                $textPosX = -13;
                $textPosY = 15;
                $textAlign = "end";
                $textClasses .= " moveleft";
            break;
            case "left":
                $textPosX = -18;
                $textPosY = 3;
                $textAlign = "end";
                $textClasses .= " moveleft";
            break;
            case "topleft":
                $textPosX = -15;
                $textPosY = -15;
                $textAlign = "end";
                $textClasses .= " moveleft";
            break;
        }

        if(count($station["LINES"]) != 1 || $isTerminus || $isIntersec)
        {
            for($i = 0; $i < count($station["LINES"]); $i++)
            {
                $textDotes .= '<span class="lineDot" style="background-color:'.$LINES[$station["LINES"][$i]]['hex'].'"></span>';
            }
        }

        if($rAddon != 0)
        {
            echo '<circle cx="'.$x.'" cy="'.$y.'" r="'.($r+$rAddon).'px" data-stationID="'.$sID.'" class="station-'.$sID.' station'.$backClasses.' stationBtn" />';
        }

        echo '<circle cx="'.$x.'" cy="'.$y.'" r="'.$r.'px" data-stationID="'.$sID.'" class="station-'.$sID.' station'.$frontClasses.' stationBtn" />';
        echo '<circle cx="'.$x.'" cy="'.$y.'" r="'.($r+$rAddon+1).'px" data-stationID="'.$sID.'" class="station-'.$sID.' stationOutline stationBtn" style="stroke:'.$lineColor.';" />';

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
                    $txt .= substr($stationName, $cuts[$i]).$textIcons."<br>";;
                }
            }

            $txt .= '</span>';
        }
        else
        {
            $txt = $textDotes.'<span class="name">'.$stationName.'</span>'.$textIcons;
        }

        echo '<foreignObject x="'.($x+$textPosX-200).'" y="'.($y+$textPosY-15).'" width="300" height="150">
                    <div class="stationLabel'.$textClasses.' '.$textAlign.'"><span class="libelle">'.$txt.'</span></div>
                </foreignObject>';
    }
}