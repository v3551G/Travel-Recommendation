<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoutePlan.aspx.cs" Inherits="RouteRecomment.JuneThirdPages.Pages.RoutePlan" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
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
var currentTime;
function drivingRoute()
{       
         
	    var Point;
		var wholep=new Array;
		var driving = new BMap.DrivingRoute(map);
	    for(var i=0;i<pointArr.length;i++)
	    {  //获取数组
	       var Point=pointArr[i].split(',')[1];
		   var leftp  = Point.split('|')[0];
           var rightp   = Point.split('|')[1];
		   var p=new BMap.Point(leftp,rightp);
		   wholep[i]=new BMap.Point(leftp,rightp);  
	    }
	    
	   
		driving.search(wholep[0],wholep[1])

	
	setTimeout(function()
	    {
            map.setViewport(wholep);          //调整到最佳视野
           
            TimeRes +=currentTime;
            TimeRes +="|";
            // alert(TimeRes);
        },1000);
    
    var temptime = 0;    
	driving.setSearchCompleteCallback(function()
	{   
	  /* var timeRes="";
		var Point=new Array;
        var pts = driving.getResults().getPlan(0).getRoute(0).getPath();    //通过驾车实例，获得一系列点的数组
        var polyline = new BMap.Polyline(pts);     
        map.addOverlay(polyline);
        for(var j=0;j<pointArr.length;j++)
		{
			Point[j]=pointArr[j]
			var whole;
		    var left  = Point[j].point.split("|")[0];
            var right   = Point[j].point.split("|")[1];
		    whole  = new BMap.Point(left,right); 
			var iconImg = createIcon(Point[j].icon);
			var m=new BMap.Marker(whole,{icon:iconImg});
			map.addOverlay(m);
			var lab= new BMap.Label(Point[j].title,{position:whole});   
            map.addOverlay(lab);
		}*/
		var time  = driving.getResults(0).getPlan(0).getDuration(true);       //获取时间
		currentTime = time;
	
		//alert(time);
		/*var distance= driving.getResults().getPlan(0).getDistance(true);        //获取距离
		alert(distance);*/
        return driving;
    });
  
}
//创建一个Icon
    function createIcon(json)
    {
        var icon = new BMap.Icon("images/百度地图Marker（A）.png",
		           new BMap.Size(json.w,json.h),
				  {imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),
				    offset:new BMap.Size(json.x,json.h)})
        return icon;
    }
    
/*function A()
{ 
     //{title:"遇龙河",point:'110.40895000000000000|24.79951000000000000',icon:{w:21,h:34,l:0,t:0,x:6,lb:5}},
     pointArr =[//1:0代表A
	            {title:"蝴蝶泉",point:'110.49682000000000000|24.74003000000000000',icon:{w:21,h:34,l:21,t:0,x:6,lb:5}},//参数依次
				{title:"西街",point:'110.49450000000000000|24.77510000000000000',icon:{w:21,h:34,l:42,t:0,x:6,lb:5}}];//增加21
                      //的B，C
     var a=drivingRoute(); 
     
}*/

var AllRotes ='<%=InteSceInfo()%>';
var RotesCount = AllRotes.split('*').length;
var RotesInfoList =new Array;
var TimeRes;
var TempCount;
for(var Ri=0;Ri<RotesCount;Ri++)
     RotesInfoList[Ri] = AllRotes.split('*')[Ri];
 //alert(RotesCount);正确
for(var Rj=0;Rj<RotesInfoList.length;Rj++)
{    
     TempCount = RotesInfoList[Rj].split('-').length;
     //alert(TempCount);正确
     for(var Rk=0;Rk<TempCount-1;Rk++)
     {   
        pointArr = new Array();
        pointArr[0] = RotesInfoList[Rj].split('-')[Rk];
        pointArr[1] = RotesInfoList[Rj].split('-')[Rk+1];
        alert(pointArr[0]);
        alert(pointArr[1]);
        drivingRoute();
     }
     ;
     TimeRes=TimeRes.substring(0,TimeRes.length-1);
     TimeRes +="*";
     alert(TimeRes);
}

</script>
