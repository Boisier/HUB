<?php
//Current namespace is global

//Global Query System
//Allow third-part network to access the database wihtout writing and SQL.
class GQS
{
    private $bdd;
    private $netTag = null;
    
    function __construct()
    {
        //Login to the dataase
        $this->bdd = new PDO('mysql:host=localhost;dbname=stm', 'root', '');
        //Set characted encoding
        $this->bdd->exec("SET CHARACTER SET utf8");
    }
    
    public function setNetwork($networkTAG)
    {
        //set current network for next operations
        $this->netTag = $networkTAG;
    }
    
    private function netTag($checkNetwork)
    {
        if(is_null($this->netTag))
        {
            throw new Exception("No network has been defined", 101);
        }
        else if($checkNetwork)
        {
            if($this->isNetwork($this->netTag))
            {
                return $this->netTag;
            }
            else
            {
                throw new Exception("Network doesn't exist", 102);
            }
        }
        else
        {
            return $this->netTag;
        }
    }
    
    public function isNetwork()
    {
        $netTag = $this->netTag(false);
        
        //Check if given network tag exist in the database
        $stmt = $this->bdd->prepare("SELECT COUNT(*) FROM networks WHERE network_tag = :tag");
        $stmt->execute(array(":tag" => $netTag));
        $nbr = $stmt->fetchColumn();
        
        return $nbr == 0 ? false : true;
    }
    
    public function getNetworkInfos()
    {
        $netTag = $this->netTag(true);
        
        //Get network infos
        $stmt = $this->bdd->prepare("SELECT network_tag AS tag, network_name AS name, network_longname AS longname FROM networks WHERE network_tag = :tag");
        $stmt->execute(array(":tag" => $netTag));
        $n = $stmt->fetch();

        return $n;
    }
    
    public function getAllLines()
    {
        $netTag = $this->netTag(true);
        
        //Get all lines of network
        $stmt = $this->bdd->prepare("SELECT * FROM metrolines WHERE network_tag = :tag ORDER BY line_id"); 
        $stmt->execute(array(":tag" => $netTag));
        $lines = $stmt->fetchAll();
        
        
        return $lines;
    }
    
    public function getAllStations()
    {
        $netTag = $this->netTag(true);
        
        //Get all lines of network
        $stmt = $this->bdd->prepare("SELECT stations.* FROM stations JOIN metrolines ON metrolines.line_id = stations.line_id WHERE metrolines.network_tag = :tag ORDER BY line_id"); 
        $stmt->execute(array(":tag" => $netTag));
        $stations = $stmt->fetchAll();
        
        return $stations;
    }
    
    public function getStationNeighboors($stationID = null)
    {
        if(is_null($stationID))
        {
            throw new Exception("Station ID is not defined", 111);
        }
        
        //Get all stations of network
        $stmt = $this->bdd->prepare("SELECT line_a as LA, line_b as LB FROM links WHERE station_a = :saID OR station_b = :sbID GROUP BY station_a, station_b"); 
        $stmt->execute(array(":saID" => $stationID,
                             ":sbID" => $stationID));
        $neighboors = $stmt->fetchAll();
        
        return $neighboors;
    }
    
    public function getStationSpecs($stationID = null)
    {
        if(is_null($stationID))
        {
            throw new Exception("Station ID is not defined", 113);
        }
        
        //Get all stations of network
        $stmt = $this->bdd->prepare("SELECT * FROM stations_specs WHERE station_id = :sID ORDER BY spec_type DESC"); 
        $stmt->execute(array(":sID" => $stationID));
        $specs = $stmt->fetchAll();
        
        return $specs;
    }
    
    public function getAllLinks()
    {
        $netTag = $this->netTag(true);
        
        //Get all lines of network
        $stmt = $this->bdd->prepare("SELECT links.* FROM links JOIN metrolines ON metrolines.line_id = links.line_a WHERE metrolines.network_tag = :tag ORDER BY link_comment, line_id"); 
        $stmt->execute(array(":tag" => $netTag));
        $links = $stmt->fetchAll();
        
        return $links;
    }
    
    public function getLinkSteps($sA = null, $sB = null)
    {
        if(is_null($sA) || is_null($sB))
        {
            throw new Exception("One or more link ID is not defined", 112);
        }
        
        //Get all steps of link
        $stmt = $this->bdd->prepare("SELECT * FROM links_steps WHERE (station_a = :sA1 AND station_b = :sB1) OR (station_a = :sB2 AND station_b = :sA2)"); 
        $stmt->execute(array(":sA1" => $sA,
                             ":sA2" => $sB,
                             ":sB1" => $sB,
                             ":sB2" => $sB));
        $steps = $stmt->fetchAll();
        
        return $steps;
    }
    
    public function getLinkID($stationA, $lineA, $stationB, $lineB)
    {
        if(is_null($stationA) || is_null($lineA) || is_null($stationB) || is_null($lineB))
        {
            throw new Exception("One or more arguments are missing.", 113);
        }
        
        //Get the link id
        $stmt = $this->bdd->prepare("SELECT link_id FROM links WHERE (station_a = :sA1 AND line_a = :lA1 AND station_b = :sB1 AND line_b = :lB1) OR (station_a = :sB2 AND line_a = :lB2 AND station_b = :sA1 AND line_b = :lA2)");
        $stmt->execute(array(":sA1" => $stationA,
                             ":lA1" => $lineA,
                             ":sB1" => $stationB,
                             ":lB1" => $lineB,
                             ":sA2" => $stationA,
                             ":lA2" => $lineA,
                             ":sB2" => $stationB,
                             ":lB2" => $lineB));
        $linkID = $stmt->fetchColumn();
        
        return $linkID;
    }
}