<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="STSTime2.aspx.cs" Inherits="RouteRecomment.FrontPages.Test.Pages.STSTime2" %>

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
<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">

// 百度地图API功能
var map = new BMap.Map("allmap");
map.centerAndZoom(new BMap.Point(110.305112,25.284055), 12);
var output = "";




var transit = new BMap.DrivingRoute(map, {renderOptions: {map: map},
    onSearchComplete: searchComplete,
    onPolylinesSet: function(){        
        setTimeout(function(){alert(output)},"1000");
    }});
    


var searchComplete = function (results){
    if (transit.getStatus() != BMAP_STATUS_SUCCESS)
    {   
    alert("未执行");
        return ;
    }
  
        var plan = results.getPlan(0);
        output += plan.getDuration(true) + "\n";                //获取时间

}
for(var i=0;i<3;i++)
{
transit.search("恭城周渭祠（周王庙）", "恭城武庙");
}


</script>