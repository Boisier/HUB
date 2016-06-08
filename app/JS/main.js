var graph = new Graph();

var currAction = null;
var currStation = null;

function initMap()
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
    $("*[data-stationid]").on({click: function() 
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
                    route(currStation, stationID, true);
                    currAction = null;
                }
            }
            
        }, mouseenter: function () 
        {
            stationID = $(this).data("stationid");

            if(currAction == "search")
            {
                route(currStation, stationID, false);
            }
        }
    });
}

function compareDistances(a,b) {
    if (a.distance < b.distance)
        return -1;
    else if (a.distance > b.distance)
        return 1;
    else 
        return 0;
}

var paths;

function route(startStation, endStation, final)
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

    pathStations = paths[0].path.reverse();
    pathTime = paths[0].distance;
    
    startStation = pathStations[0].toString().split("-")[0];
    endStation = pathStations[pathStations.length-1].toString().split("-")[0];

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

        $("*[data-stationa="+sIDA+"][data-stationb="+sIDB+"]").addClass("selectedPath");
        $("*[data-stationa="+sIDB+"][data-stationb="+sIDA+"]").addClass("selectedPath");
        
        if(i == 0)
        {
            $(".station-"+sIDA).addClass("selectedPath");
        }
        
        $(".station-"+sIDB).addClass("selectedPath"); 
    }

    if(final)
    {
        printRouteDetails(pathStations)
    }
}

function printRouteDetails(pathStations)
{
    //Print Route
    jqXHR = $.ajax({
        method: "POST",
        url: "../print.php?action=routeDetails",
        data: {
            path: pathStations,
            netTag: netTag
        }
    }).done(function(data)
    {
        $("#routeLine").html(data);
    
        $("#routeDetails").show();
        $('html, body').animate({
            scrollTop: $("#routeDetails").offset().top
        }, 1000);
    });
}