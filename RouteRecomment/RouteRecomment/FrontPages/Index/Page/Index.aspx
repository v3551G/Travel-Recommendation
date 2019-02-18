<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="RouteRecomment.FrontPages.Index.Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>路线推荐</title>
<link rel="stylesheet" type="text/css" href="../css/index.css"/>
<script type="text/javascript" src="../Js/jquery.1.4.2-min.js"></script>
<script type="text/javascript" src="../Js/jquery-1.7.2-min.js"></script>
<script type="text/javascript" src="../Js/head.js"></script>

<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
   <script type="text/javascript" src="../Js/jquery.velocity.min.js"></script>
	<style type="text/css">
</style>
</head>

<body>
	<hr class="in" style="border:none;"/>
	<img class="indexBackImg" src="../images/index-body.jpg" style="height:619px;"/>
	<div class="seek-top">
		<div class="Cen">
			<img src="../images/LOGO.png"/>
			<div class="sousuo">
				
			<input type="text" name="text" id="seek-input" node-type="loginname" autocomplete="off" placeholder="云南丽江">
			
			<div class="seek-button" title="搜索"><a href="#"></a></div>
			</div>
			<ul class="seek-login">
				<li><a href="">登陆</a></li>
				<li><a href="">注册</a></li>
			</ul>
		</div>
			
	</div>

	<div class="index-body">
		<div class="index-map" style="width:1025px;height:457px;box-shadow:#4C8EBA 5px 5px 5px;float:left;">
			<div id="dituContent"></div></div><!--地图设置成的大小-->

<script type="text/javascript">
    //´´½¨ºÍ³õÊ¼»¯µØÍ¼º¯Êý£º
    function initMap(){
        createMap();//´´½¨µØÍ¼
        setMapEvent();//ÉèÖÃµØÍ¼ÊÂ¼þ
        addMapControl();//ÏòµØÍ¼Ìí¼Ó¿Ø¼þ
        addMarker();//ÏòµØÍ¼ÖÐÌí¼Ómarker
    }
    
    //´´½¨µØÍ¼º¯Êý£º
    function createMap(){
        var map = new BMap.Map("dituContent");
        var point = new BMap.Point(108.826882,38);
        map.centerAndZoom(point,5);
        window.map = map;
    }
    
    //µØÍ¼ÊÂ¼þÉèÖÃº¯Êý£º
    function setMapEvent(){
        map.enableDragging();//ÆôÓÃµØÍ¼ÍÏ×§ÊÂ¼þ£¬Ä¬ÈÏÆôÓÃ(¿É²»Ð´)
        map.enableScrollWheelZoom();//ÆôÓÃµØÍ¼¹öÂÖ·Å´óËõÐ¡
        map.enableDoubleClickZoom();//ÆôÓÃÊó±êË«»÷·Å´ó£¬Ä¬ÈÏÆôÓÃ(¿É²»Ð´)
        map.enableKeyboard();//ÆôÓÃ¼üÅÌÉÏÏÂ×óÓÒ¼üÒÆ¶¯µØÍ¼
    }
    
    //µØÍ¼¿Ø¼þÌí¼Óº¯Êý£º
    function addMapControl(){
        //ÏòµØÍ¼ÖÐÌí¼ÓËõ·Å¿Ø¼þ
  var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
  map.addControl(ctrl_nav);
        //ÏòµØÍ¼ÖÐÌí¼ÓËõÂÔÍ¼¿Ø¼þ
  //var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
  //map.addControl(ctrl_ove);
        //ÏòµØÍ¼ÖÐÌí¼Ó±ÈÀý³ß¿Ø¼þ
  var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
  map.addControl(ctrl_sca);
    }
    
    //±ê×¢µãÊý×é
    var markerArr = [{title:"桂林",content:"桂林信息",point:"108.702413|26.240106",isOpen:0,icon:{w:23,h:25,l:46,t:21,x:9,lb:12}}
     ];
    //´´½¨marker
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
            map.addOverlay(marker);
            label.setStyle({
                        borderColor:"#808080",
                        color:"#333",
                        cursor:"pointer"
            });
      
      (function(){
        var index = i;
        var _iw = createInfoWindow(i);
        var _marker = marker;
        _marker.addEventListener("click",function(){
           
          window.location.href='SubPage.aspx';
          });
          _iw.addEventListener("open",function(){
            _marker.getLabel().hide();
          })
          _iw.addEventListener("close",function(){
            _marker.getLabel().show();
          })
        label.addEventListener("click",function(){
            _marker.openInfoWindow(_iw);
          })
        if(!!json.isOpen){
          label.hide();
          _marker.openInfoWindow(_iw);
        }
      })()
        }
    }
   
    function createInfoWindow(i){
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
        return iw;
    }
    
    function createIcon(json){
        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
        return icon;
    }
    
    initMap();
</script>











 <script type="text/javascript">
// function myone(){
//     $("#fair").animate({top:"0px"},700);
//        $("#fair").slideup("slow");
//     $("#fair").slideDown("slow");


// }
// function mytwo(){
//     $("#fair").animate({top:"113px"},700);
//        $("#fair").slideup("slow");
//     $("#fair").slideDown("slow");

// }
// function mythree(){
//     $("#fair").animate({top:"170px"},700);

// }
// function myfour(){
//     $("#fair").animate({top:"230px"},700);
//        $("#fair").slideup("slow");
//     $("#fair").slideDown("slow");

// }
// function myfive(){
//     $("#fair").animate({top:"290px"},700);
//        $("#fair").slideup("slow");
//     $("#fair").slideDown("slow");

// }
// function mysix(){
//     $("#fair").animate({top:"345px"},700);
//        $("#fair").slideup("slow");
//     $("#fair").slideDown("slow");

// }
// function myseven(){
//     $("#fair").animate({top:"405px"},700);
//        $("#fair").slideup("slow");
//     $("#fair").slideDown("slow");

// }
// </script>

		







		<hr style="border:none;clear:both;"/>
		<div class="host-hostImg">
			<img src="../images/index-spot1.png"/><a href=""><img class="refresh-right" src="../images/refresh1.png"/></a>
		</div>
		
		<div class="index-hostSpot">
			<div class="spot-left">
				<a   class="now" href="../../Pages/Scenery.aspx?SceneryID=74"><figcaption>漓江</figcaption>
					<img src="../images/漓江1.jpg" onmouseover="this.src='../images/漓江2.jpg'" 
					onmouseout="this.src='../images/漓江1.jpg'"/></a>
				<a  class="now" href="../../Pages/Scenery.aspx?SceneryID=28"><figcaption class="hudie">西街</figcaption>
					<img class="spot-bottomImg" src="../images/西街1.jpg"  onmouseover="this.src='../images/西街2.jpg'" 
					onmouseout="this.src='../images/西街1.jpg'"/></a></div>
			
			<div class="spot-right"><a class="now" href="../../Pages/Scenery.aspx?SceneryID=62"><figcaption>象鼻山</figcaption>
				<img src="../images/象鼻山1.jpg"  onmouseover="this.src='../images/象鼻山2.jpg'" 
					onmouseout="this.src='../images/象鼻山1.jpg'"/></a>
				<a href="../../Pages/Scenery.aspx?SceneryID=23" class="now" ><figcaption class="hudie">遇龙河</figcaption>
				<img class="spot-bottomImg" src="../images/遇龙河1.jpg"  onmouseover="this.src='../images/遇龙河2.jpg'" 
					onmouseout="this.src='../images/遇龙河1.jpg'"/></a>
				<a href="../../Pages/Scenery.aspx?SceneryID=24" class="now" ><figcaption class="hudie">月亮山</figcaption>
				<img class="spot-bottomImg" src="../images/月亮山1.jpg"  onmouseover="this.src='../images/月亮山2.jpg'" 
					onmouseout="this.src='../images/月亮山1.jpg'"/></a></div>
			<hr style="border:none;clear:both;"/>
		</div>
<div class="host-ways">		
<div id="fair"><img src="../images/myFair.png" /></div>
        
        
        <h1>热门路线<a href=""><img class="refresh-right" src="../images/refresh1.png"/></a></h1>
        
        
    
    <div id="Ways">
        <ul>
            <li class="host-one" name="host-one"   onmouseover="myOne()">
                <p><a href="">漓江</a><a href="">蝴蝶泉</a><a href="">大榕树</a></p>
           
            </li>


            <li class="host-two" name="host-two"   onmouseover="mytwo()">
                 <p><a href="">漓江</a><a href="">龙颈河漂流</a><a href="">遇龙河</a><a href="">大榕树</a><a href="">月亮山</a></p>
            <p><a href="">西街</a><a href="">七星公园</a><a href="">芦笛岩</a><a href="">象鼻山</a><a href="">两江四湖</a></p>
           
            </li>
               

            <li class="host-three" name="host-one"  onmouseover="mythree()" >
              
            <p><a href="">遇龙河</a><a href="">西街</a><a href="">漓江</a></p>
            </li>
                

            <li class="host-four" name="host-four"   onmouseover="myfour()">
                <p><a href="">西街</a><a href="">漓江</a><a href="">遇龙河</a><a href="">大榕树</a><a href="">蝴蝶泉</a></p>
            </li>
                

            <li class="host-five" name="host-five"   onmouseover="myfive()">
                <p><a href="">古东瀑布</a><a href="">冠岩</a><a href="">两江四湖</a><a href="">漓江</a></p>
                
            </li>

                
            <li class="host-six" name="host-six"   onmouseover="mysix()">
                <p><a href="">银子岩</a><a href="">漓江</a><a href="">遇龙河</a><a href="">大榕树</a></p>
            <p><a href="">月亮山</a><a href="">梯田</a><a href="">象鼻山</a></p>
            </li>
                

            <li class="host-seven" name="host-seven"   onmouseover="myseven()">
                <p><a href="">蝴蝶泉</a><a href="">大榕树</a><a href="">月亮山</a><a href="">碧莲峰</a></p>
            <p><a href="">银子岩</a><a href="">遇龙河</a><a href="">西街</a><a href="">象鼻山</a></p>
            </li>


        </ul>
        
    </div>
    
</div>


		<!--页脚轮播-->

		<div class="host-hostImg">
			<img src="../images/index-spot.png"/><a href=""><img class="refresh-right" style="left:820px;"src="../images/refresh1.png"/></a>
		</div>
		<hr style="width:1010px;border:none;border-top:4px solid #f39800;position:relative;top:-1px;left:18px;"/>


		 <div class="rollBox">
     <div class="LeftBotton" onmousedown="ISL_GoUp()" onmouseup="ISL_StopUp()" onmouseout="ISL_StopUp()"></div>
     <div class="Cont" id="ISL_Cont">
      <div class="ScrCont">
       <div id="List1">

        <!-- 图片列表 begin -->
         <div class="pic">
          <a href="" target="_blank"><img src="../images/北京.jpg"  /></a>
          <div>
           <span><div class="spot"><h3>北京</h3><p></p></div><h2></h2></span>
            
          </div>
         </div>    
  

   <div class="pic">
          <a href="" target="_blank"><img src="../images/桂林.jpg"  /></a>
         <div>
           <span><div class="spot"><h3>桂林</h3><p></p></div><h2></h2></span>
            
          </div>
         </div>
         <div class="pic">
          <a href="" target="_blank"><img src="../images/杭州.jpg"  /></a>
          <div>
           <span><div class="spot"><h3>杭州</h3><p></p></div><h2></h2></span>
            
          </div>
         </div>
         <div class="pic">
          <a href="" target="_blank"><img src="../images/厦门.jpg" /></a>
          <div>
           <span><div class="spot"><h3>厦门</h3><p></p></div><h2></h2></span>
           
          </div>
         </div>
         <div class="pic">
          <a href="" target="_blank"><img src="../images/上海.jpg"  /></a>
          <div>
           <span><div class="spot"><h3>上海</h3><p></p></div><h2></h2></span>
            
          </div>
         </div>
           <div class="pic">
          <a href="" target="_blank"><img src="../images/昆明.jpg"  /></a>
          <div>
           <span><div class="spot"><h3>昆明</h3><p></p></div><h2></h2></span>
            
          </div>
         </div>
         <div class="pic">
          <a href="" target="_blank"><img src="../images/三亚.jpg"  /></a>
          <div>
           <span><div class="spot"><h3>三亚</h3><p></p></div><h2></h2></span>
            
          </div>
         </div>
                    <div class="pic">
          <a href="" target="_blank"><img src="../images/成都.jpg"  /></a>
          <div>
           <span><div class="spot"><h3>成都</h3><p></p></div><h2></h2></span>
            
          </div>
         </div>
   
        <!-- 图片列表 end -->

       </div>
       <div id="List2"></div>
      </div>
     </div>
     <div class="RightBotton" onmousedown="ISL_GoDown()" onmouseup="ISL_StopDown()" onmouseout="ISL_StopDown()"></div>
   </div>
</body>
<script type="text/javascript">
<!--//--><![CDATA[//><!--
//图片滚动列表 jb51.net
var Speed = 1; //速度(毫秒)
var Space = 5; //每次移动(px)
var PageWidth = 726; //翻页宽度
var fill = 0; //整体移位
var MoveLock = false;
var MoveTimeObj;
var Comp = 0;
var AutoPlayObj = null;
GetObj("List2").innerHTML = GetObj("List1").innerHTML;
GetObj('ISL_Cont').scrollLeft = fill;
GetObj("ISL_Cont").onmouseover = function(){clearInterval(AutoPlayObj);}
GetObj("ISL_Cont").onmouseout = function(){AutoPlay();}
AutoPlay();
function GetObj(objName){if(document.getElementById){return eval('document.getElementById("'+objName+'")')}else{return eval('document.all.'+objName)}}
function AutoPlay(){ //自动滚动
 clearInterval(AutoPlayObj);
 AutoPlayObj = setInterval('ISL_GoDown();ISL_StopDown();',3000); //间隔时间
}
function ISL_GoUp(){ //上翻开始
 if(MoveLock) return;
 clearInterval(AutoPlayObj);
 MoveLock = true;
 MoveTimeObj = setInterval('ISL_ScrUp();',Speed);
}
function ISL_StopUp(){ //上翻停止
 clearInterval(MoveTimeObj);
 if(GetObj('ISL_Cont').scrollLeft % PageWidth - fill != 0){
  Comp = fill - (GetObj('ISL_Cont').scrollLeft % PageWidth);
  CompScr();
 }else{
  MoveLock = false;
 }
 AutoPlay();
}
function ISL_ScrUp(){ //上翻动作
 if(GetObj('ISL_Cont').scrollLeft <= 0){GetObj('ISL_Cont').scrollLeft = GetObj('ISL_Cont').scrollLeft + GetObj('List1').offsetWidth}
 GetObj('ISL_Cont').scrollLeft -= Space ;
}
function ISL_GoDown(){ //下翻
 clearInterval(MoveTimeObj);
 if(MoveLock) return;
 clearInterval(AutoPlayObj);
 MoveLock = true;
 ISL_ScrDown();
 MoveTimeObj = setInterval('ISL_ScrDown()',Speed);
}
function ISL_StopDown(){ //下翻停止
 clearInterval(MoveTimeObj);
 if(GetObj('ISL_Cont').scrollLeft % PageWidth - fill != 0 ){
  Comp = PageWidth - GetObj('ISL_Cont').scrollLeft % PageWidth + fill;
  CompScr();
 }else{
  MoveLock = false;
 }
 AutoPlay();
}
function ISL_ScrDown(){ //下翻动作
 if(GetObj('ISL_Cont').scrollLeft >= GetObj('List1').scrollWidth){GetObj('ISL_Cont').scrollLeft = GetObj('ISL_Cont').scrollLeft - GetObj('List1').scrollWidth;}
 GetObj('ISL_Cont').scrollLeft += Space ;
}
function CompScr(){
 var num;
 if(Comp == 0){MoveLock = false;return;}
 if(Comp < 0){ //上翻
  if(Comp < -Space){
   Comp += Space;
   num = Space;
  }else{
   num = -Comp;
   Comp = 0;
  }
  GetObj('ISL_Cont').scrollLeft -= num;
  setTimeout('CompScr()',Speed);
 }else{ //下翻
  if(Comp > Space){
   Comp -= Space;
   num = Space;
  }else{
   num = Comp;
   Comp = 0;
  }
  GetObj('ISL_Cont').scrollLeft += num;
  setTimeout('CompScr()',Speed);
 }
}
//--><!]]>
</script>







		<!--页脚-->
		<div class="seek-foot">
	<img src="../images/HR1.png"  />
        <span>友情链接：</span>
        <ul>
                <li><a href="" target="_blank" >美团</a> </li>
                <li><a href="" target="_blank" >淘宝旅游</a>   </li>
                <li><a href="" target="_blank" >去哪儿</a>  </li>
                <li><a href="" target="_blank" >马蜂窝</a></li>
                <li><a href="" target="_blank" >携程</a>  </li>
                <li><a href="" target="_blank" >同城</a>   </li>
                <li><a href="" target="_blank" >豆瓣</a>  </li>
                <li><a href="" target="_blank" >百度旅游</a>   </li>
                <hr style="border:none;clear:both;"/>
        </ul>
        <p>               
网络文化经营许可证：文网文[2010]040号|增值电信业务经营许可证：浙B2-20080224-1|信息网络传播视听节目许可证：1109364号</p>
</div>
<hr style="border:none;clear:both;"/>


	</div>
	


	
</body>
</html>

