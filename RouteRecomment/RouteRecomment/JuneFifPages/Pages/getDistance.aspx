<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getDistance.aspx.cs" Inherits="RouteRecomment.JuneFifPages.Pages.getDistance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=您的密钥"></script>
	<title>测距</title>
</head>


<body>
    <div id="allmap"></div>
    
</body>
</html>

<script type="text/javascript">
    // 百度地图API功能、
    var map = new BMap.Map("allmap");
    map.centerAndZoom("桂林", 12);  //初始化地图,设置城市和地图级别。
    var RowCount = '<%=RowCount %>' ;
    var Distance = '<%=Distance %>' ;
    var formatDist = new Array(RowCount);
    for (var i = 0; i < RowCount; i++)
    {
        for (var j = 0; j < RowCount && j<=i; j++)
        {
            var pointA = new BMap.Point(Latlon[i][0], Latlon[i][1]);
            var pointB = new BMAP.Point(Latlon[j][0], Latlon[j][1]);
            var Idist = (map.getDistance(pointA, pointB)).toFixed(0);

            Distance[i][j] = Idist;  
        }
        //
        for(var k=0; k<RowCount; k++)
        {
            formatDist[i] += Dist[i][k];
            if (k != RowCount-1 )
                formatDist[i] += "#";

        }
    }
    alert("all the distance have been saved,next write it to file");
    //var data =
    PageMethods.writeDisToFile(formatDist);

</script>



