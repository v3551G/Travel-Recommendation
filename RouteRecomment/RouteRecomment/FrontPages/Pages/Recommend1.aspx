<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recommend1.aspx.cs" Inherits="RouteRecomment.FrontPages.Pages.Recommend1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;}
#l-map{height:100%;width:78%;float:left;border-right:2px solid #bcbcbc;}
#r-result{height:100%;width:20%;float:left;}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=C51768d657a80ebc94d29815b53b7415"></script>
<title>起终点可拖拽的驾车导航</title>
</head>
<body>
<div id="l-map"></div>

<div id="r-result"></div>           

</body>
</html>
<script type="text/javascript">

// 百度地图API功能
var map = new BMap.Map("l-map");
map.centerAndZoom(new BMap.Point(110.305112,25.284055), 10);
map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用图
var pointArr;
function drivingRoute()
{
	    var wholep=new Array;
		var driving = new BMap.DrivingRoute(map);
		var temp;
	    for(var i=0;i<pointArr.length;i++)
	    {  //获取数组
	       var temp = pointArr[i].split(',');
		   var leftp  = temp[1].split("|")[0];
           var rightp   = temp[1].split("|")[1];
           alert(leftp);
           alert(rightp);
		   wholep[i]=new BMap.Point(rightp,leftp); 
	    }
	for(var k=0;k<wholep.length;k++)
	{
		if(k+1<wholep.length)
		  driving.search(wholep[k+1],wholep[k]);
	 }
	setTimeout(function()
	{
            map.setViewport(wholep);          //调整到最佳视野
        },1000);
        
	driving.setSearchCompleteCallback(function()
	{
        var pts = driving.getResults().getPlan(0).getRoute(0).getPath();    //通过驾车实例，获得一系列点的数组
        var polyline = new BMap.Polyline(pts);     
        map.addOverlay(polyline);
        for(var j=0;j<pointArr.length;j++)
		{
			var whole;
			var temp = pointArr[j].split(',');
		    var left  =temp[1].split("|")[0];
            var right =temp[1].split("|")[1];
		    whole  = new BMap.Point(right,left); 
			var m=new BMap.Marker(whole);
			map.addOverlay(m);
			var lab= new BMap.Label(temp[0],{position:whole});   
            map.addOverlay(lab);
		}
		var time  = driving.getResults().getPlan(0).getDuration(true);       //获取时间
		var distance= driving.getResults().getPlan(0).getDistance(true);     //获取距离
		var doc=document.getElementById("r-result");
		alert("时间为："+time);
        return driving;
    });
}
function A()
{
        var Arr = '<%=RecommendRotes()%>';
        pointArr = Arr.split('*')[0];
        pointArr = pointArr.trim().split('-');
     var a=drivingRoute();
}
A();
</script>

