﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="RouteRecomment.JuneTemPages.Pages.Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>路线推荐</title>
<link rel="stylesheet" type="text/css" href="../css/index.css"/>
<script type="text/javascript" src="../js/jquery.1.4.2-min.js"></script>
<script type="text/javascript" src="../js/jquery-1.7.2-min.js"></script>
<script type="text/javascript" src="../js/head.js"></script>

<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
   <script type="text/javascript" src="../js/jquery.velocity.min.js"></script>
	<style type="text/css">




</style>
</head>

<body>
	<hr class="in" style="border:none;"/>
	<img class="indexBackImg" src="../imagesH/index-body.jpg" style="height:619px;"/>
	<div class="seek-top">
		<div class="Cen">
			<img src="../imagesH/LOGO.png"/>
			<div class="sousuo">
				
			<input type="text" name="text" id="seek-input" node-type="loginname" autocomplete="off" placeholder="桂林漓江">
			
			<div class="seek-button" title="搜索"><a href="#"></a></div>
			</div>
			
<!--登陆部分-->
                       
      <ul class="seek-login" id="seek-login">
        <li><a href="#">登陆</a></li>
        <li><a href="#">注册</a></li>
      </ul>
                        <div class="seek-login-after" id="seek-login-after">
                                <ul>
                                <li><a href="" title="天际一线">天际一线</a><a href="" style="margin-left:20px;" 
                                        >注销</a></li>
                                <li>欢迎来到路线推荐网</li>
                                </ul>
                        </div>

		</div>

    <iframe width="190" scrolling="no" height="80" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=12&bdc=%23&icon=1&num=1" style="float:left;margin-top:-105px;margin-left:8px;"></iframe>


			
	</div>

	<div class="index-body">
		<div class="index-map" style="width:1025px;height:497px;box-shadow:#4C8EBA 5px 5px 5px;float:left;margin-top:-40px;">
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
        var map = new BMap.Map("dituContent");//ÔÚ°Ù¶ÈµØÍ¼ÈÝÆ÷ÖÐ´´½¨Ò»¸öµØÍ¼
        var point = new BMap.Point(108.826882,38);//¶¨ÒåÒ»¸öÖÐÐÄµã×ø±ê
        map.centerAndZoom(point,5);//Éè¶¨µØÍ¼µÄÖÐÐÄµãºÍ×ø±ê²¢½«µØÍ¼ÏÔÊ¾ÔÚµØÍ¼ÈÝÆ÷ÖÐ
        window.map = map;//½«map±äÁ¿´æ´¢ÔÚÈ«¾Ö
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
    var markerArr = [{title:"桂林",content:"桂林山水甲天下",point:"108.702413|26.240106",isOpen:0,icon:{w:23,h:25,l:46,t:21,x:9,lb:12}}
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
          //this.openInfoWindow(_iw);
          window.location.href='SubPage.aspx';
          });
          _iw.addEventListener("open",function(){
            _marker.getLabel().hide();
          })
          _iw.addEventListener("close",function(){
            _marker.getLabel().show();
          })
        label.addEventListener("click",function(){
            //_marker.openInfoWindow(_iw);
          })
        if(!!json.isOpen){
          label.hide();
          _marker.openInfoWindow(_iw);
        }
      })()
        }
    }
    //´´½¨InfoWindow
    function createInfoWindow(i){
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
        return iw;
    }
    //´´½¨Ò»¸öIcon
    function createIcon(json){
       // var icon = new BMap.Icon("http://app.baidu.com/map/imagesH/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
          var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
        return icon;
    }
    
    initMap();//´´½¨ºÍ³õÊ¼»¯µØÍ¼
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
			<img src="../imagesH/index-spot1.png"/><a href=""><img class="refresh-right" src="../imagesH/refresh1.png"/></a>
		</div>
		
		<div class="index-hostSpot">
			<div class="spot-left">
				<a   class="now" href=""><figcaption>黄山</figcaption>
					<img src="../indexPic/黄山1.jpg" onmouseover="this.src='../indexPic/黄山2.jpg'" 
					onmouseout="this.src='../indexPic/黄山1.jpg'"/></a>
				<a  class="now" href=""><figcaption class="hudie">西湖</figcaption>
					<img class="spot-bottomImg" src="../indexPic/西湖1.jpg"  onmouseover="this.src='../indexPic/西湖2.jpg'" 
					onmouseout="this.src='../indexPic/西湖1.jpg'"/></a></div>
			
			<div class="spot-right"><a class="now" href=""><figcaption>张家界</figcaption>
				<img src="../indexPic/张家界1.jpg"  onmouseover="this.src='../indexPic/张家界2.jpg'" 
					onmouseout="this.src='../indexPic/张家界1.jpg'"/></a>
				<a href="" class="now" ><figcaption class="hudie">武夷山</figcaption>
				<img class="spot-bottomImg" src="../indexPic/武夷山1.jpg"  onmouseover="this.src='../indexPic/武夷山2.jpg'" 
					onmouseout="this.src='../indexPic/武夷山1.jpg'"/></a>
				<a href="" class="now" ><figcaption class="hudie">普陀山</figcaption>
				<img class="spot-bottomImg" src="../indexPic/普陀山1.jpg"  onmouseover="this.src='../indexPic/普陀山2.jpg'" 
					onmouseout="this.src='../indexPic/普陀山1.jpg'"/></a></div>
			<hr style="border:none;clear:both;"/>
		</div>
<div class="host-ways">		
<!-- <div id="fair"><img src="../imagesH/myFair.png" /></div> -->
        
        
        <h1><img src="../imagesH/dajia.png" width="28px" height="30px" style="margin-top:5px;margin-left:-30px;"/>&nbsp;热门路线<a href=""><img class="refresh-right" src="../imagesH/refresh1.png"/>
        <div id="fair" style="position:relative;left:9px;"><img src="../imagesH/myFair.png" /></div> 
      </a></h1>
        
 <script>
function position1()
{
    var fair=document.getElementById("fair");
    fair.style.top="40px";

}
function position2()
{
    var fair=document.getElementById("fair");
    fair.style.top="95px";

}
function position3()
{
    var fair=document.getElementById("fair");
    fair.style.top="155px";

}
function position4()
{
    var fair=document.getElementById("fair");
    fair.style.top="215px";

}
function position5()
{
    var fair=document.getElementById("fair");
    fair.style.top="275px";

}
function position6()
{
    var fair=document.getElementById("fair");
    fair.style.top="335px";

}
function position7()
{
    var fair=document.getElementById("fair");
    fair.style.top="390px";

}
</script>    
    
    <div id="Ways" >
        <ul >
            <li class="host-one" onmouseover="position1()" >
                <p  style="color:#FF9600;"><a href="Scenery.aspx?SceneryID=34">漓江</a><a href="">八达岭长城</a><a href="">十三陵</a></p>
            
            </li>


            <li class="host-one" onmouseover="position2()">
                 <p><a href="">古文化街</a><a href="">塘沽洋货市场</a></p>
            <p><a href="">南市食品街</a><!--<a href="">老榕树</a><a href="">蝴蝶泉</a>--></p>
            </li>
               

            <li class="host-one" onmouseover="position3()">
                <p><a href="">避暑山庄</a><a href="">普宁寺</a><a href="">海河外滩</a></p>
            
            </li>
                

            <li class="host-two" onmouseover="position4()">
                <p style="color:#FF9600;"><a href="">十三陵水库</a><a href="">鸟巢水立方</a><a href="">石牌坊</a><a href="">古神道</a></p>
            </li>
                

            <li class="host-two" onmouseover="position5()">
                <p><a href="">小布达拉宫</a><a href="">双塔山</a><!--<a href="">蝴蝶泉</a>--><a href="">南北戴河</a></p>
            </li>

                
            <li class="host-one" onmouseover="position6()">
                <p><a href="">黄金海岸</a><a href="">沙雕大世界</a><a href="">奥林匹克公园</a></p>
            </li>
                

            <li class="host-one" onmouseover="position7()">
                <p><a href="">西湖美景</a><a href="">雷峰塔</a><a href="">飞来峰</a></p>
           <!-- <p><a href="">玄武湖</a><a href="">阅江楼</a><a href="">蝴蝶泉</a><a href="">蝴蝶泉</a></p>-->
            </li>


        </ul>
        
    </div>
    
</div>


		<!--页脚轮播-->

		<div class="host-hostImg">
			<img src="../imagesH/index-spot.png"/><a href=""><img class="refresh-right" style="left:820px;"src="../imagesH/refresh1.png"/></a>
		</div>
		<hr style="width:1010px;border:none;border-top:4px solid #f39800;position:relative;top:-1px;left:18px;"/>


		 <div class="rollBox">
     <div class="LeftBotton" onmousedown="ISL_GoUp()" onmouseup="ISL_StopUp()" onmouseout="ISL_StopUp()"></div>
     <div class="Cont" id="ISL_Cont">
      <div class="ScrCont">
       <div id="List1">

        <!-- 图片列表 begin -->
         <div class="pic">
          <a href="" target="_blank"><img src="../EleImages/北京.jpg"  /></a>
          <div>
           <span><div class="spot"><h3>北京</h3><p></p></div><h2></h2></span>
            
          </div>
         </div>       

   <div class="pic">
          <a href="" target="_blank"><img src="../EleImages/桂林.jpg"  /></a>
         <div>
           <span><div class="spot"><h3>桂林</h3><p></p></div><h2></h2></span>
            
          </div>
         </div>
         <div class="pic">
          <a href="" target="_blank"><img src="../EleImages/杭州.jpg"  /></a>
          <div>
           <span><div class="spot"><h3>杭州</h3><p></p></div><h2></h2></span>
            
          </div>
         </div>
         <div class="pic">
          <a href="" target="_blank"><img src="../EleImages/厦门.jpg" /></a>
          <div>
           <span><div class="spot"><h3>厦门</h3><p></p></div><h2></h2></span>
           
          </div>
         </div>
         <div class="pic">
          <a href="" target="_blank"><img src="../EleImages/上海.jpg"  /></a>
          <div>
           <span><div class="spot"><h3>上海</h3><p></p></div><h2></h2></span>
            
          </div>
         </div>
   <div class="pic">
          <a href="" target="_blank"><img src="../EleImages/昆明.jpg"  /></a>
          <div>
           <span><div class="spot"><h3>昆明</h3><p></p></div><h2></h2></span>
            
          </div>
         </div> 
         <div class="pic">
          <a href="" target="_blank"><img src="../EleImages/三亚.jpg"  /></a>
          <div>
           <span><div class="spot"><h3>三亚</h3><p></p></div><h2></h2></span>
            
          </div>
         </div> 
         <div class="pic">
          <a href="" target="_blank"><img src="../EleImages/成都.jpg"  /></a>
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
<!--</body>-->
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
	<img src="../imagesH/HR1.png"  />
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
	

<script>
function changeImg()
{
 var bigimg = document.getElementById("myimg01");
 bigimg.src="../imagesH/JL2.gif";
}
function changeBack()
{
 var bigimg = document.getElementById("myimg01");
 bigimg.src="../imagesH/JL1.gif";
}
function diabox1()
{
        var dia1=document.getElementById("diabox1");
        dia1.style.display="block";
}
function IsNeedHelp()
{
        var bigimg=document.getElementById("myimg01");
        
        bigimg.src="../imagesH/JL3.gif";
        //bigimg.src="../imagesH/JL4.png";
        bigimg.onmouseout="";
        bigimg.onmouseover="";
        bigimg.onclick="";
        setTimeout("diabox1()",1000);
}
function needHelp()
{
        var dia1=document.getElementById("diabox1");
        var dia2=document.getElementById("diabox2");
        var bigimg=document.getElementById("myimg01");
        dia1.style.display="none";

        dia2.style.display="block";
        bigimg.src="../imagesH/JL4.png";
}
function noneedHelp()
{
        var dia1=document.getElementById("diabox1");
        var bigimg=document.getElementById("myimg01");
        dia1.style.display="none";
        bigimg.src="../imagesH/JL1.png";
        bigimg.onmouseover="changeImg()";
        bigimg.onmouseout="changeBack()";
        bigimg.onclick="IsNeedHelp()";
}
function noAnswer()
{
        var dia2=document.getElementById("diabox2");
        var bigimg=document.getElementById("myimg01");
        dia2.style.display="none";
        bigimg.src="../imagesH/JL1.png";
}
function Answer()
{
        var dia2=document.getElementById("diabox2");
        var dia3=document.getElementById("diabox3");
        dia2.style.display="none";
        dia3.style.display="block";
}
function goToSee()
{
        var dia3=document.getElementById("diabox3");
        dia3.style.display="none";
        var bigimg=document.getElementById("myimg01");
        bigimg.src="../imagesH/JL1.png";
}
</script>
        <style>
                #floatWindow{position:fixed;right:0;top:30%;}
                #diabox1{width:123px;height:105px;position:fixed;right:60px;top:22%;
                        background:url(../imagesH/diabox1.png) no-repeat;}
                #diabox01{display:block;}
                #diabox1 #input1{width:17px;height:7px;background:url(../imagesH/go.png) no-repeat;
                        border:none;cursor:pointer;margin-top:52px;margin-left:40px;}
                #diabox1 #input2{width:13px;height:7px;background:url(../imagesH/no.png) no-repeat;
                        border:none;cursor:pointer;margin-left:10px;}
                #diabox2{width:468px;height:530px;background:#c2bfbd;border-radius:10px;
                        position:fixed;top:18%;right:120px;opacity:0.95;filter:alpha(opacity=95);-moz-opacity:0.95;}
                #diabox2 #diabox2-child{width:390px;height:460px;background:#fff;border-radius:10px;
                        position:fixed;top:22%;right:137px;
                        font-size:13px;font-family:微软雅黑;color:#000;padding-top:20px;padding-left:40px;}
                #diabox2 #diabox2-child p+p{text-align:left;margin:15px;}
                #diabox2 #diabox2-child .questionTitle{font-size:15px;font-family:微软雅黑;color:#000;text-align:center;}
                #diabox2 #diabox2-child .ques1{width:320px;}
                #diabox2 #input4{width:101px;height:37px;background:url(../imagesH/submit.png) no-repeat;
                        border:none;cursor:pointer;margin-left:130px;}
                #diabox2 #input3{width:50px;height:52px;background:url(../imagesH/nosee.png) no-repeat;
                        border:none;cursor:pointer;position:fixed;margin-left:355px;margin-top:-35px;}
                #diabox3{width:123px; height:105px;position:fixed;right:60px;top:22%;
                        background:url(../imagesH/diabox3.png) no-repeat;}
                #smallJL a,#smallJL a:visited,#smallJL a:hover,#smallJL a:link{text-decoration:none;color:none;}
                #diabox3 #input5{width:17px;height:7px;background:url(../imagesH/go.png) no-repeat;
                        border:none;cursor:pointer;margin-top:52px;margin-left:40px;}
                #diabox3 #input6{width:13px;height:7px;background:url(../imagesH/no.png) no-repeat;
                        border:none;cursor:pointer;margin-left:10px;}
#smallJL input[type=checkbox],
#smallJL input[type=radio]{
-webkit-appearance: none;
appearance: none;
width: 13px;
height: 13px;
margin: 0;
cursor: pointer;
vertical-align: bottom;
background: #fff;
border: 1px solid B9BBBE;
-webkit-border-radius: 1px;
-moz-border-radius: 1px;
border-radius: 1px;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
box-sizing: border-box;
position: relative;
border:1px solid #ccc;


}


#smallJL input[type=checkbox]:active,
#smallJL input[type=radio]:active {
border-color: #c6c6c6;
background: #ebebeb;
}


#smallJL input[type=checkbox]:hover {
border-color: #c6c6c6;
-webkit-box-shadow: inset 0 2px 2px rgba(0,0,0,0.1);
-moz-box-shadow: inset 0 2px 2px rgba(0,0,0,0.1);
box-shadow: inset 0 2px 2px rgba(0,0,0,0.1);
}


#smallJL input[type=checkbox]:checked,
#smallJL input[type=radio]:checked {
background: #fff;
}


#smallJL input[type=checkbox]:checked::after,
#smallJL input[type=radio]:checked::after {
content: url(../imagesH/checkmark1.png);
display: block;
position: absolute;
top: -7px;
right: 0px;
left: -5px;
}


#smallJL input[type=checkbox]:focus {
outline: none;
border-color:#4d90fe;
 
}
        </style>
        <div id="smallJL">
        <div id="floatWindow">
                <img id="myimg01" src="../imagesH/JL1.png" width="126" height="100" onmouseover="changeImg()" onmouseout="changeBack()" onclick="IsNeedHelp()">
        </div>
        <div id="diabox1" style="display:none;">
                
                <input type="buton" id="input1" onclick="needHelp()"/>
                <a href=""><input type="button" id="input2" onclick="noneedHelp()"/></a>
        </div>
        <div id="diabox2"  style="display:none;"><!-- -->

               
                        



                <div id="diabox2-child"><a href="">
                   <input type="button" id="input3" onclick="noAnswer()" />
                </a><!--不回答问题-->

                        <p class="questionTitle">先<span style="color:#2e96c2;font-size:20px;">回答</span>
                                这样几个<span style="color:#2e96c2;font-size:20px;">问题</span>吧</p>
                        <p class="ques1"><span style="font-size:16px;">1.</span style="margin-left:10px;">您希望旅行几天 ？<input type="text" style="width:62px;height:18px;margin-left:30px;margin-right:10px;"/>天</p>


                        <p class="ques1"><span style="font-size:16px;">2.</span style="margin-left:10px;">您预期的消费 ？
                                <input type="text" style="width:62px;height:18px;margin-left:40px;margin-right:10px;"/>元</p>
                        
                        <p class="ques1"><span style="font-size:16px;">3.</span style="margin-left:10px;">      您的陪同人员？（可多选）
                                       
                        </p>
                        <p>
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;&nbsp;爱人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;&nbsp;朋友
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;&nbsp;儿子或女儿&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;&nbsp;父母
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </p>

                        <p class="ques1"><span style="font-size:16px;">3.</span style="margin-left:10px;">      您喜欢的景点类型？（可多选）
                                       
                        </p>
                        <p><!--若改变复选框的内容字体的多少，可能形式会有点不同，可调整一下&nbsp;数量这个代表一个空格-->
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;
                                地质地貌景观旅游资源等
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;
                                水体景观旅游资源
                                <br/>
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;
                                生物旅游资源&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;
                                文物古迹&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;
                                园林
                                <br/>
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;
                                宗教文化&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;
                                城乡风貌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;
                                现代设施
                               <br/>
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;
                                民俗风情
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;
                                饮食与购物类
                        </p>
                        <p class="ques1"><span style="font-size:16px;">3.</span style="margin-left:10px;"> 
                                您的年龄段？
                                       
                        </p>
                        <p>
                                <input type="radio" name="age" style="position:relative;top:-2px;"/>&nbsp;10岁以下
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="age" style="position:relative;top:-2px;"/>&nbsp;10岁到18岁
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="age" style="position:relative;top:-2px;"/>&nbsp;19岁到30岁
                                <br/>
                                <input type="radio" name="age" style="position:relative;top:-2px;"/>&nbsp;31岁到45岁
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="age" style="position:relative;top:-2px;"/>&nbsp;46岁到60岁
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="age" style="position:relative;top:-2px;"/>&nbsp;60岁以上
                        </p>
                        
                <input type="submit" id="input4" value=" " onclick="Answer()" /><!--回答问题-->
                
                        
                </div>
        </div>
        <div id="diabox3" style="display:none;">
                
               <!--链接到推荐页面--> <a href="recommend.aspx"><input type="submit" id="input5" value=" " onclick="goToSee()"/></a>
                <a href=""><input type="submit" id="input6" value=" " onclick="nogoToSee()"/></a>
        </div>
</div>
	
</body>
</html>

