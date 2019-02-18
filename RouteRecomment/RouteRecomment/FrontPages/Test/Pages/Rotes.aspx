<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rotes.aspx.cs" Inherits="RouteRecomment.FrontPages.Test.Pages.Rotes" %>

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
	       //alert(pointArr[i]);
	       var temp = pointArr[i].split(',');
	       alert(temp[1])
		   var leftp  = temp[1].split("|")[0];
		 // alert(leftp);
           var rightp   = temp[1].split("|")[1];
          // alert(rightp);
		   wholep[i]=new BMap.Point(rightp,leftp);  
	    }
	for(var k=0;k<wholep.length;k++)
	{
		if(k+1<wholep.length)
		  driving.search(wholep[k+1],wholep[k]);
	 }
	driving.setSearchCompleteCallback(function()
	{
		var Point;
        var pts = driving.getResults().getPlan(0).getRoute(0).getPath();    //通过驾车实例，获得一系列点的数组
        var polyline = new BMap.Polyline(pts);     
        map.addOverlay(polyline);
        for(var j=0;j<pointArr.length;j++)
		{
			Point[j]=pointArr[j]
		    var leftp  = Point[j].point.split("|")[0];
            var rightp   = Point[j].point.split("|")[1];
		    wholep[j]  = new BMap.Point(leftp,rightp); 
			var m=new BMap.Marker(Point[j].point);
			map.addOverlay(m);
			var lab=new BMap.Label(Point[j].title,{position:whole[j]});
			map.addOverlay[lab];
			}

        
        setTimeout(function()
        {
            map.setViewport([]);          //调整到最佳视野
        },1000);
        
    });
}
function A()
{    
    var Arr = '<%=RecommendRotes()%>';
    pointArr = Arr.split('*')[0];
    pointArr = pointArr.trim().split('-');
    /* pointArr =[{title:'遇龙河',point:'110.40895000000000000|24.79951000000000000'},
	            {title:'蝴蝶泉',point:'110.49682000000000000|24.74003000000000000'},
				{title:'西街',point:'110.49450000000000000|24.77510000000000000'}];*/
     drivingRoute();
}
A();
</script>

