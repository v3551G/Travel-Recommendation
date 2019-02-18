<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MapTest.aspx.cs" Inherits="RouteRecomment.FrontPages.Test.Pages.MapTest" %>

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
  <div>
  <input type="button" value="添加购物" id="button1" onclick="Auto1()" />
  <input type="button" value="添加景点" id="button2" onclick="Auto2()" />
  <input type="button" value="添加酒店" id="button3" onclick="Auto3()" />
  <input type="button" value="添加美食" id="button4" onclick="Auto4()" />
  <input type="button" value="添加娱乐" id="button5" onclick="Auto5()" />
</div>
<div id="l-map"></div>
<div id="r-result">
<div id="hLight1"><a href="javascript:void(0)" onClick="heightLight_1()">购物</a></div>
<div id="hLight2"><a href="javascript:void(0)" onClick="heightLight_2()">景点</a></div>
<div id="hLight3"><a href="javascript:void(0)" onClick="heightLight_3()">酒店</a></div>
<div id="hLight4"><a href="javascript:void(0)" onClick="heightLight_4()">美食</a></div>
<div id="hLight5"><a href="javascript:void(0)" onClick="heightLight_5()">娱乐</a></div>
</div>
</body>
<script type="text/javascript">
          //创建和初始化地图
        var map = new BMap.Map("l-map");//在百度地图容器中创建一个地图
        var point = new BMap.Point(110.305112,25.284055);//定义一个中心点坐标
        map.centerAndZoom(point,10);//设定地图的中心点和坐标并将地图显示在地图容器中
	    map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
        map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用图
		        //向地图中添加缩放控件
	    var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
	    map.addControl(ctrl_nav);
                //向地图中添加比例尺控件
	    var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
	    map.addControl(ctrl_sca);
</script>
<script type="text/javascript" >
function heightLight_1(){
	if(a1.getLabel().isVisible()==true)
	{
	a1.getLabel().hide();
	}
	else{
		a1.getLabel().show();
		}
}
function heightLight_2(){
	if(a2.getLabel().isVisible()==true){
	a2.getLabel().hide();
	}
	else{
		a2.getLabel().show();
		}
}
function heightLight_3(){
	if(a3.getLabel().isVisible()==true){
	a3.getLabel().hide();
	}
	else{
		a3.getLabel().show();
		}
}
function heightLight_4(){
	if(a4.getLabel().isVisible()==true){
	a4.getLabel().hide();
	}
	else{
		a4.getLabel().show();
		}
}
function heightLight_5(){
	if(a5.getLabel().isVisible()==true){
	a5.getLabel().hide();
	}
	else{
		a5.getLabel().show();
		}
}

</script>
<script type="text/javascript" >
var a1,a2,a3,a4,a5
    function Auto1()
    {
		if(document.getElementById("button1").value=="添加购物")
		{
	         sContent =
              "<img style='float:right;margin:4px' id='imgDemo' src='王城商厦.png' width='139' height='104' title=王城商厦'/>" + 
             "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>王城商厦是桂林的一个老字号商厦了，仅次于百货大楼的年</br>代，同样地处桂林的市中心，商品也挺齐全的，但一直没能赶超</br>微笑堂的人流量，所以效益次于前茅，不过价格挺实惠的。。。</p>" + 
"</div>";
             markerArr =[{title:"王城商厦",content:sContent,point:"110.305112|25.284055",isOpen:0,icon:{w:23,h:25,l:23,t:21,x:9,lb:12}}
		 ];
		 
		 		 a1=addMarker();
		 document.getElementById("button1").value="取购物消";
		}
		else
		{
			map.removeOverlay(a1);
		    document.getElementById("button1").value="添加购物";
	}
	}
	function Auto2(){
		if(document.getElementById("button2").value=="添加景点")
		{
	sContent =
"<img style='float:right;margin:4px' id='imgDemo' src='印象刘三姐.png' width='139' height='104' title='印象刘三姐'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>全世界最大的山水实景演出，民族与现代的结合，一场饕餮的视觉盛宴。。。</p>" + 
"</div>";
    markerArr = [{title:"印象刘三姐",content:sContent,point:"110.512947|24.771489",isOpen:0,icon:{w:23,h:25,l:46,t:21,x:9,lb:12}}
		 ];
		 a2=addMarker();
		  document.getElementById("button2").value="取购景点";
		}
		else
		{
			map.removeOverlay(a2);
		    document.getElementById("button2").value="添加景点";
	}
	  }
	function Auto3(){
		if(document.getElementById("button3").value=="添加酒店")
		{
	sContent =
"<img style='float:right;margin:4px' id='imgDemo' src='喜马拉雅山大酒店.png' width='139' height='104' title=喜马拉雅山大酒店'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>桂林喜马拉雅山大酒店位于桂林环城北二路虞山桥头香格里拉大酒店斜对面，集住宿、餐饮、KTV娱乐、旅游于一体的综合性酒店。</p>" + 
"</div>";
    markerArr = [{title:"喜马拉雅山大酒店",content:sContent,point:"110.31624|25.300724",isOpen:0,icon:{w:23,h:25,l:69,t:21,x:9,lb:12}}
		 ];
		a3=addMarker();
		document.getElementById("button3").value="取购酒店";
		}
		else
		{
			map.removeOverlay(a3);
		    document.getElementById("button3").value="添加酒店";
	}
	}
	function Auto4(){
		if(document.getElementById("button4").value=="添加美食")
		{
	sContent =
"<img style='float:right;margin:4px' id='imgDemo' src='桂林粥城.png' width='139' height='104' title==桂林粥城'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>桂林粥城－－桂林的消夜中心NO.1，口号是：&quot;美味夜时尚，愈夜愈美丽。。。。&quot;</p>" + 
"</div>";
    markerArr = [{title:"桂林粥城",content:sContent,point:"110.302015|25.279563",isOpen:0,icon:{w:23,h:25,l:92,t:21,x:9,lb:12}}
		 ];
		a4=addMarker();
		document.getElementById("button4").value="取购美食";
		}
		else
		{
			map.removeOverlay(a4);
		    document.getElementById("button4").value="添加美食";
	}
	}
	function Auto5(){
		if(document.getElementById("button5").value=="添加娱乐")
		{
			sContent =
"<img style='float:right;margin:4px' id='imgDemo' src='漓江民俗风情园.png' width='139' height='104' title=漓江民俗风情园'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>广西最大的旅游娱乐场所及最大的少数民族建筑群。。。</p>" + 
"</div>";
    markerArr = [{title:"漓江民俗风情园",content:sContent,point:"110.315481|25.293243",isOpen:0,icon:{w:23,h:25,l:0,t:21,x:9,lb:12}}
		 ];
		a5=addMarker();
		document.getElementById("button5").value="取购娱乐";
		}
		else
		{
			map.removeOverlay(a5);
		    document.getElementById("button5").value="添加娱乐";
	}
			}
</script>
<script type="text/javascript" >
//标注点数组
	var sContent;
    var markerArr;
	var hlight;
    //创建marker
    function addMarker(){
            for(var i=0;i<markerArr.length;i++){
            var json = markerArr[i];
            var p0 = json.point.split("|")[0];
            var p1 = json.point.split("|")[1];
            var point = new BMap.Point(p0,p1);
			var iconImg = createIcon(json.icon);
            var marker = new BMap.Marker(point,{icon:iconImg});
			var iw = createInfoWindow(i);
			var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
			marker.setLabel(label);
			label.hide();
            map.addOverlay(marker);
            label.setStyle({
                       /* borderColor:"#808080",
                        color:"#333",
                        cursor:"pointer"*/
						position:"absolute",
						background:"#EE5D5B",
						border:"1px solid #BC3B3A",
						color:"white",
						height:"18px",
						padding:"2px",
						lineHeight:"18px",
						whiteSpace:"nowrap",
						MozUserSelert:"none",
						fontSize:"12px"
            });
			(function(){
				var index = i;
				var _iw = createInfoWindow(i);
				var _marker = marker;
				_marker.addEventListener("dblclick",function(){
				  //  this.openInfoWindow(_iw);
					window.location.href='http://www.baidu.com/';
			    });
				_marker.addEventListener("mouseout",function(){
				 _marker.getLabel().hide();
			    });
				_marker.addEventListener("mouseover",function(){
				  _marker.getLabel().show();
			    });
				
				 _iw.addEventListener("mouseover",function()
				 {
				    _marker.getLabel().show();
			    })
			    _iw.addEventListener("open",function(){
				    _marker.getLabel().hide();
			    })
			    _iw.addEventListener("close",function(){
				    _marker.getLabel().show();
			    })
				_marker.addEventListener("click",function(){
				    _marker.openInfoWindow(_iw);
			    })
				if(!!json.isOpen){
					label.hide();
					_marker.openInfoWindow(_iw);
				}
			})()
        }
		return marker;
    }
    //创建InfoWindow
    function createInfoWindow(i){
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
        return iw;
    }
    //创建一个Icon
    function createIcon(json){
        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
        return icon;
    }</script>
</html>

