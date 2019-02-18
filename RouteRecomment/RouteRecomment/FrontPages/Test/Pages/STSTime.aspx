<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="STSTime.aspx.cs" Inherits="RouteRecomment.FrontPages.Test.Pages.STSTime" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
<title>计算驾车时间与距离</title>
</head>

<body>
<form runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<div id="allmap"></div>
</form>
</body>
</html>
<script type="text/javascript">

// 百度地图API功能
var map = new BMap.Map("allmap");
map.centerAndZoom(new BMap.Point(110.305112,25.284055), 12);
var output = "";

var SceName1;
var SceName2;
var a;
var b;
var AllSceStr = '<%=GetAllScenery()%>';
var SceArrStr = new Array;
SceArrStr = AllSceStr.split("|");
var SceArr = new Array();
for(var i=0;i<SceArrStr.length;i++)
{
   SceArr[i] = new Array();
   for(var j=0;j<SceArrStr.length;j++)
   SceArr[i][j] = "0";
}

var Result = "";

  
var i=1;

    var searchComplete = function (results)
    {
        if (transit.getStatus() != BMAP_STATUS_SUCCESS)
        {   
           alert("没执行"+i);
           i++;
            return ;
        }
            var plan = results.getPlan(0);
            output = plan.getDuration(true);                //获取时间
            SceArr[a][b]= output;       
           alert(output+i);
            i++;


    }
    for(var A=0;A<SceArrStr.length;A++)
    {  
      a= A;
      //alert(a);
      SceName1 = SceArrStr[A];
      for(var B=0;B<SceArrStr.length;B++)
      {


          var transit = new BMap.DrivingRoute(map, {renderOptions: {map: map},
          onSearchComplete: searchComplete});
        
          b= B;
          //alert(b);
          SceName2 = SceArrStr[B];
       
          transit.search(SceName1,SceName2);
       
      }
      
    }
    
    function ReturnBack() 
    {
   for(var si=0;si<SceArrStr.length;si++)
     for(var sj=0;sj<SceArrStr.length;sj++)
     {  
        
        Result += SceArr[si][sj];
        Result +="|";  
     }
     
     PageMethods.WriteSTSTime(Result);
     }
</script>




