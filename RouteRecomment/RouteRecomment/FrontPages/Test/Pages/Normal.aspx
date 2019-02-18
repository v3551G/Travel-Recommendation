<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Normal.aspx.cs" Inherits="RouteRecomment.FrontPages.Test.Pages.Normal" %>

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
<title>规划</title>
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

 var transit = new BMap.DrivingRoute(map,
    {
            renderOptions: 
            {
				map: map,
				panel: "r-result",
				//enableDragging : true //起终点可进行拖拽
			},  
    });
	var s_pStart=new BMap.Point(110.512947,24.771489);
	var s_pEnd=new BMap.Point(110.305112,25.284055);
    transit.search(s_pStart,s_pEnd);
</script>
