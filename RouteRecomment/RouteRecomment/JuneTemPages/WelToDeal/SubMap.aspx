<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubMap.aspx.cs" Inherits="RouteRecomment.JuneTemPages.Test.SubMap" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
	<title>路线推荐</title>
	<link rel="stylesheet" type="text/css" href="../css/ways.css"><!--css-->
	<link rel="stylesheet" type="text/css" href="../css/lunbo.css"><!--轮播css-->
	<script type="text/javascript" src="../js/jquery.1.4.2-min.js"></script>
	<script type="text/javascript" src="../js/lunbo.js"></script><!--轮播的特效-->
	<script type="text/javascript" src="../js/tab.js"></script><!--选项卡-->
    <!--  <script type="text/javascript" src="../js/Map.js"></script> 地图-->
    <script type="text/javascript" src="../js/jquery.velocity.min.js"></script>


	<style>
	.seek-body{margin:0 auto;width:1020px;
		/*top:-1423px;*/z-index:0;}
</style>
<script>

</script>

</head>
<body>
	
	
	<!--搜索框-->
	<div id="seek-top">
		<div class="Cen">
			<img src="../imagesH/LOGO.png"/>
			<div class="sousuo">
				
			<input type="text" name="text" id="seek-input" node-type="loginname" autocomplete="off" placeholder="云南丽江">
			
			<div class="seek-button" title="搜索"><a href="#"></a></div>
			</div>
			 
                       
            <ul class="seek-login" id="seek-login">
                <li><a href="#">登陆</a></li>
                <li><a href="#">注册</a></li>
            </ul>
                        <div class="seek-login-after" id="seek-login-after">
                                <ul>
                                <li><a href="" title="天际一线">天际一线天际一线天际一线天际一线</a>
                                    <a href="" style="margin-left:20px;" 
                                        >注销</a></li>
                                <li>欢迎来到路线推荐网</li>
                                </ul>
                        </div>
                </div>
                <iframe width="190" scrolling="no" height="80" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=12&bdc=%23&icon=1&num=1" style="float:left;margin-top:-105px;margin-left:8px;"></iframe>

                
                <script>
                var lo=document.getElementById("seek-login");
                var loLi=lo.getElementsByTagName("li");
                var loO=document.getElementById("seek-login-after");

                    for(var i=0;i<loLi.length;i++)
                    {

                        loLi[i].onclick=function()
                         {

                                loO.style.display="block";//显示注销
                                lo.style.display="none";//登陆前的样式

                         };
                    }
                </script>
			
	</div>
	<!-- <img class="back-img" src="../imagesH/back-img.png" /> -->
	<!--body-->
	<div class="seek-body">


		<!--轮播-->
		<div class="lunbo clearfix">

<div id="focus">
<ul>
    <li><a href="" target="_blank" title=""><img alt="" src="../imagesH/01.jpg" style="width:1021px;height:418px;"/></a></li>
    <li><a href="" target="_blank" title=""><img alt="" src="../imagesH/02.jpg" style="width:1021px;height:418px;"/></a></li>
    <li><a href="" target="_blank" title=""><img alt="" src="../imagesH/03.jpg" style="width:1021px;height:418px;"/></a></li>
    <li><a href="" target="_blank" title=""><img alt="" src="../imagesH/04.jpg" style="width:1021px;height:418px;"/></a></li>
    <li><a href="" target="_blank" title=""><img alt="" src="../imagesH/05.jpg" style="width:1021px;height:418px;"/></a></li>
</ul>
</div>
</div> <!-- lunbo End -->


<div id="MapAll"><div class="allCount"><p>共有10条搜索结果</p></div>
    <div id="MapMessage">
  
  <div id="Scroller-1">
   <div class="Scroller-Container" id="content_1">
 
     
    </div>
  </div>
  <div id="Scrollbar-Container">
    <div class="Scrollbar-Track">
      <div class="Scrollbar-Handle"></div>
    </div>
  </div>
</div>
  
      <!--地图部分-->
    <script type="text/javascript" src="../js/jsScroller.js"></script>
<script type="text/javascript" src="../js/jsScrollbar.js"></script>
<script type="text/javascript">
var scroller  = null;
var scrollbar = null;
  scroller  = new jsScroller(document.getElementById("Scroller-1"), 225, 605);
  scrollbar = new jsScrollbar (document.getElementById("Scrollbar-Container"), scroller, false);
</script>


<div id="Map">
 <input class="back-0" type="button"  id="button1" onClick="Auto1()"/>
 <input class="back-1" type="button"  id="button2" onClick="Auto2()"/>
 <input class="back-2" type="button"  id="button3" onClick="Auto3()"/>
 <input class="back-3" type="button"  id="button4" onClick="Auto4()"/>
 <input class="back-4" type="button"  id="button5" onClick="Auto5()"/>


  <!--百度地图容器-->
 <div id="dituContent"></div></div>
</div>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
<script type="text/javascript">
    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        //addMarker();//向地图中添加marker
    }
    
    //创建地图函数：
    function createMap(){
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(110.305112,25.284055);//定义一个中心点坐标
        map.centerAndZoom(point,10);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
        //enableMassClear();
    }
    
    //地图事件设置函数：
    function setMapEvent(){
        map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
        map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用图

    }
    
    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
    var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
    map.addControl(ctrl_nav);
                //向地图中添加比例尺控件
    var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
    map.addControl(ctrl_sca);
    }
    function Auto1(){
        if(document.getElementById("button1").className=="back-0")
        {
             sContent =
              "<img style='float:right;margin:4px' id='imgDemo' src='王城商厦.png' width='139' height='104' title=王城商厦'/>" + 
             "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>王城商厦是桂林的一个老字号商厦了，仅次于百货大楼的年</br>代，同样地处桂林的市中心，商品也挺齐全的，但一直没能赶超</br>微笑堂的人流量，所以效益次于前茅，不过价格挺实惠的。。。</p>" + 
"</div>";
             markerArr =[{title:"王城商厦",content:sContent,point:"110.305112|25.284055",isOpen:0,icon:{w:16,h:21,l:0,t:21,x:9,lb:12}}
         ];
                 a1=addMarker();
         document.getElementById("button1").className="back-10";
        }
        else
        {
            map.removeOverlay(a1);
            document.getElementById("button1").className="back-0";
    }
    }
    function Auto2(){
        if(document.getElementById("button2").className=="back-1")
        {
    sContent =
"<img style='float:right;margin:4px' id='imgDemo' src='印象刘三姐.png' width='139' height='104' title='印象刘三姐'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>全世界最大的山水实景演出，民族与现代的结合，一场饕餮的视觉盛宴。。。</p>" + 
"</div>";
    markerArr = [{title:"印象刘三姐",content:sContent,point:"110.512947|24.771489",isOpen:0,icon:{w:16,h:21,l:16,t:21,x:9,lb:12}}
         ];
         a2=addMarker();
          document.getElementById("button2").className="back-11";
        }
        else
        {
            map.removeOverlay(a2);
            document.getElementById("button2").className="back-1";
    }
      }
    function Auto3(){
        if(document.getElementById("button3").className=="back-2")
        {
    sContent =
"<img style='float:right;margin:4px' id='imgDemo' src='喜马拉雅山大酒店.png' width='139' height='104' title=喜马拉雅山大酒店'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>桂林喜马拉雅山大酒店位于桂林环城北二路虞山桥头香格里拉大酒店斜对面，集住宿、餐饮、KTV娱乐、旅游于一体的综合性酒店。</p>" + 
"</div>";
    markerArr = [{title:"喜马拉雅山大酒店",content:sContent,point:"110.31624|25.300724",isOpen:0,icon:{w:16,h:21,l:32,t:21,x:9,lb:12}}
         ];
        a3=addMarker();
        document.getElementById("button3").className="back-12";
        }
        else
        {
            map.removeOverlay(a3);
            document.getElementById("button3").className="back-2";
    }
    }
    function Auto4(){
        if(document.getElementById("button4").className=="back-3")
        {
    sContent =
"<img style='float:right;margin:4px' id='imgDemo' src='桂林粥城.png' width='139' height='104' title==桂林粥城'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>桂林粥城－－桂林的消夜中心NO.1，口号是：&quot;美味夜时尚，愈夜愈美丽。。。。&quot;</p>" + 
"</div>";
    markerArr = [{title:"桂林粥城",content:sContent,point:"110.302015|25.279563",isOpen:0,icon:{w:16,h:21,l:48,t:21,x:9,lb:12}}
         ];
        a4=addMarker();
        document.getElementById("button4").className="back-13";
        }
        else
        {
            map.removeOverlay(a4);
            document.getElementById("button4").className="back-3";
    }
    }
    function Auto5(){
        if(document.getElementById("button5").className=="back-4")
        {
            sContent =
"<img style='float:right;margin:4px' id='imgDemo' src='漓江民俗风情园.png' width='139' height='104' title=漓江民俗风情园'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>广西最大的旅游娱乐场所及最大的少数民族建筑群。。。</p>" + 
"</div>";
    markerArr = [{title:"漓江民俗风情园",content:sContent,point:"110.315481|25.293243",isOpen:0,icon:{w:16,h:21,l:64,t:21,x:9,lb:12}}
         ];
        a5=addMarker();
        document.getElementById("button5").className="back-14";
        }
        else
        {
            map.removeOverlay(a5);
            document.getElementById("button5").className="back-4";
    }
            }
    //标注点数组
    var sContent;
    var markerArr;
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
			setTimeout(function(){
            map.setViewport(point);          //调整到最佳视野
                    },1000);
			createDiv(json);
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
                _marker.addEventListener("click",function(){
                  //  this.openInfoWindow(_iw);
                    window.location.href='http://www.baidu.com/';
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
				var a1=document.getElementById(json.title).onclick=function(){
				_marker.openInfoWindow(_iw);}
                if(!!json.isOpen){
                    label.hide();
                    _marker.openInfoWindow(_iw);
                }
            })()
        }
        return marker;
    }
    //创建InfoWindow
    function createInfoWindow(i)
    {
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
        return iw;
    }
		function createDiv(Arr)
		{
		var div1=document.createElement("div");
		    div1.id="div1";
			div1.style.height="auto";
			div1.style.width="230px";
			div1.style.fontSize="12px";
			div1.style.lineHeight="25px";
			div1.style.paddingTop="5px";
			div1.style.minHeight="110px";
			div1.style.borderBottom="1px dashed #999";
			div1.style.marginLeft="10px";
			
		var div2=document.createElement("div");
		    div2.id="tex";
		var div3=document.createElement("div");
		    div3.style.overflow="left";
			/*----------------*/
	    var img1=document.createElement("img");
			img1.src="../imagesH/house.png";
			img1.style.height="28";
			img1.style.width="21";
			img1.style.cssFloat="left"
			/*----------------*/
		var a2=document.createElement("a");
			a2.id=Arr.title;
			a2.innerHTML=Arr.title;
			 a2.style.marginLeft="30px";
			 a2.style.color="#366c83";
			 a2.style.paddingTop="5px";
			 a2.href="javascript:void(0)";
			/*----------------*/
		var span2=document.createElement("span");
			span2.id=Arr.title;
			span2.style.marginLeft="30px";
			span2.style.paddingTop="5px";
			//span2.innerHTML=Arr.title;
			/*----------------*/
		var a1=document.createElement("a");
			a1.href=Arr.href;
			a1.innerHTML="详情";
			a1.style.textDecoration="none";
			a1.style.font="#366c83";
			a1.onmousemove=function(){this.style.color="#F00"};
			a1.onmouseout =function(){this.style.color="blue"};
			/*----------------*/
		var p1=document.createElement("p");
		    p1.innerHTML="地址："+Arr.address;
			p1.style.paddingLeft="30px";
			/*----------------*/
		var p2=document.createElement("p");
		    p2.innerHTML="电话："+Arr.phoneNumber;
			p2.style.paddingLeft="30px";
			/*----------------*/
		var pDiv=document.getElementById("content_1");
		    
			div1.appendChild(div2);
			div1.appendChild(div3);
			div2.appendChild(img1);
			div3.appendChild(a2);
			div3.appendChild(span2);
			span2.appendChild(a1);
			div3.appendChild(p1);
			div3.appendChild(p2);
			pDiv.appendChild(div1);
		}
    //创建一个Icon
    function createIcon(json)
    {
        var icon = new BMap.Icon("../images/icon4.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
        return icon;
    }
    
    initMap();//创建和初始化地图
</script>





<!--旅游攻略-->

<!-- <div id="traval-guide">
	<div id="div1">
		<img src="../imagesH/tra-logo.jpg" style="position:relative;top:23px;"/>
	<input type="button" class="active" value="热门" />
	<input type="button" value="最新" />
	<h1 id="commandLogo"><a href=""><img src="../imagesH/command-logo.png" /></a></h1>

	<div id="guideConten" style="display:block;">
        
        <div id="medhtod"> 
        	
</div>
	
    	</div>

	<div id="guideConten">
        
        <div id="medhtod" > 
        	
        </div>
        
   	</div>




</div>

   
</div> -->
<!--攻略-->

<div class="gonglve">
   

    <div id="gonglve">
        <img src="../imagesH/tra-logo.jpg" style="position:relative;top:23px;"/>
            <input type="button" class="active" value="热门" />
            <input class="TabButton" type="button" value="最新" />


    <div id="spotContent" style="display:block;">
        
        <div class="Con" >
            <ul id="ConUl">
                <li>
                    <div class="spot-left"><a href=""><img src="../imagesH/one.jpg" style="width:190px;height:150px;"/></a></div>
                    <div class="spot-right">
                        <h3>攻略标题</h3>
                        <span class="Auto"><a href="">作者：作者很多作者点</a></span><span id="spotTime">2014-4-25</span>
                        <p>正文攻略正文攻略正文</p>
                        <span class="gonglveMore"><a href=""><<详细信息</a></span>
                    </div><hr style="border:none;clear:both;"/>
                </li>
                <li>
                    <div class="spot-left"><a href=""><img src="../imagesH/one.jpg" style="width:190px;height:150px;"/></a></div>
                    <div class="spot-right">
                        <h3>攻略标题</h3>
                        <span class="Auto"><a href="">作者：作者很多作者点</a></span><span id="spotTime">2014-4-25</span>
                        <p>正文攻略正文攻略正文攻略正文攻略</p>
                        <span class="gonglveMore"><a href=""><<详细信息</a></span>
                    </div><hr style="border:none;clear:both;"/>
                </li>
                <li>
                    <div class="spot-left"><a href=""><img src="../imagesH/one.jpg" style="width:190px;height:150px;"/></a></div>
                    <div class="spot-right">
                        <h3>攻略标题</h3>
                        <span class="Auto"><a href="">作者：作者很多作者点击</a></span><span id="spotTime">2014-4-25</span>
                        <p>正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略...</p>
                        <span class="gonglveMore"><a href=""><<详细信息</a></span>
                    </div><hr style="border:none;clear:both;"/>
                </li>
                 <li>
                    <div class="spot-left"><a href=""><img src="../imagesH/one.jpg" style="width:190px;height:150px;"/></a></div>
                    <div class="spot-right">
                        <h3>攻略标题</h3>
                        <span class="Auto"><a href="">作者：作者很多作者点击</a></span><span id="spotTime">2014-4-25</span>
                        <p>正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略...</p>
                        <span class="gonglveMore"><a href=""><<详细信息</a></span>
                    </div><hr style="border:none;clear:both;"/>
                </li>
            </ul>

<div id="pages">
    <ul>
        <li id="home-page"><a href="" style="padding:2px 10px;text-align:center;">首&nbsp;页</a></li>
        <li class="pre-page"><a href="" ><<</a></li>
        <li  class="current-page">1</li>
        <li><a href="">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a>...</li>
        <li class="next-page"><a href="">>></a></li>
        <li id="last-page"><a href="" style="padding:2px 2px;text-align:center;">最后一页</a></li>
    </ul>
</div>
        </div>
    </div>

    <div id="spotContent">
        
        <div class="Con" >
            <ul id="ConUl">
                <li>
                    <div class="spot-left"><a href=""><img src="../imagesH/04.jpg" style="width:190px;height:150px;"/></a></div>
                    <div class="spot-right">
                        <h3>攻略标题</h3>
                        <span class="Auto"><a href="">作者：作者很多作者点击</a></span><span id="spotTime">2014-4-25</span>
                        <p>正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略...</p>
                        <span class="gonglveMore"><a href=""><<详细信息</a></span>
                    </div><hr style="border:none;clear:both;"/>
                </li>
                <li>
                    <div class="spot-left"><a href=""><img src="../imagesH/04.jpg" style="width:190px;height:150px;"/></a></div>
                    <div class="spot-right">
                        <h3>攻略标题</h3>
                        <span class="Auto"><a href="">作者：作者很多作者点击</a></span><span id="spotTime">2014-4-25</span>
                        <p>正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略...</p>
                        <span class="gonglveMore"><a href=""><<详细信息</a></span>
                    </div><hr style="border:none;clear:both;"/>
                </li>
                <li>
                    <div class="spot-left"><a href=""><img src="../imagesH/04.jpg" style="width:190px;height:150px;"/></a></div>
                    <div class="spot-right">
                        <h3>攻略标题</h3>
                        <span class="Auto"><a href="">作者：作者很多作者点击拉</a></span><span id="spotTime">2014-4-25</span>
                        <p>正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略...</p>
                        <span class="gonglveMore"><a href=""><<详细信息</a></span>
                    </div><hr style="border:none;clear:both;"/>
                </li>
                 <li>
                    <div class="spot-left"><a href=""><img src="../imagesH/04.jpg" style="width:190px;height:150px;"/></a></div>
                    <div class="spot-right">
                        <h3>攻略标题</h3>
                        <span class="Auto"><a href="">作者：作者很多作者点击拉</a></span><span id="spotTime">2014-4-25</span>
                        <p>正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略...</p>
                        <span class="gonglveMore"><a href=""><<详细信息</a></span>
                    </div><hr style="border:none;clear:both;"/>
                </li>
                <li>
                    <div class="spot-left"><a href=""><img src="../imagesH/04.jpg" style="width:190px;height:150px;"/></a></div>
                    <div class="spot-right">
                        <h3>攻略标题</h3>
                        <span class="Auto"><a href="">作者：作者很多作者点击拉</a></span><span id="spotTime">2014-4-25</span>
                        <p>正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略...正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略...正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略...正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略...</p>
                        <span class="gonglveMore"><a href=""><<详细信息</a></span>
                    </div><hr style="border:none;clear:both;"/>
                </li>
            </ul>

<div id="pages">
    <ul>
        <li id="home-page"><a href="" style="padding:2px 10px;text-align:center;">首&nbsp;页</a></li>
        <li class="pre-page"><a href="" ><<</a></li>
        <li  class="current-page">1</li>
        <li><a href="">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a>...</li>
        <li class="next-page"><a href="">>></a></li>
        <li id="last-page"><a href="" style="padding:2px 2px;text-align:center;">最后一页</a></li>
    </ul>
</div>
        </div>
    </div>
    
</div>
</div>

<h1 id="commandLogo"><a href=""><img src="../imagesH/command-logo.png" /></a></h1>




<div style="float:left;margin-left:22px;">

<!--热门景点-->
<div class="host-spot">
    <h1><img src="../imagesH/jingdian.jpg"/>&nbsp;热门景点</h1>

    <div class="host-img" style="background:url(../imagesH/host-1.jpg);background-size:152px 142px;"> 
<a href="" target="_blank"  class="now"><font class="font-1">梯田</font><font class="font-2">梯田世界之冠</font></a> 
</div> 
<div class="host-img" style="background:url(../imagesH/host-2.jpg);background-size:152px 142px;"> 
<a href=""  target="_blank" class="now"><font class="font-1">水上乐园</font><font class="font-2">挑战刺激</font></a> 
</div> 
<div class="host-img" style="background:url(../imagesH/host-3.jpg);background-size:152px 142px;"> 
<a href="" target="_blank"  class="now"><font class="font-1">乐满地</font><font class="font-2">挑战你的胆量</font></a> 
</div> 
<div class="host-img" style="background:url(../imagesH/host-4.jpg);background-size:152px 142px;"> 
<a href=""  target="_blank" class="now"><font class="font-1">阳朔</font><font class="font-2">百里漓江百里画廊</font></a> 
</div> 

</div>

<!--热门路线-->


        <div class="host-ways">
        
        <h1><img src="../imagesH/dajia.png" width="28px" height="30px" style="margin-top:5px;margin-left:-30px;"/>&nbsp;热门路线 
            
            <a href=""><img class="refresh-right" src="../imagesH/refresh1.png"/></a>
            <div id="fair" style="position:relative;left:-10px;"><img src="../imagesH/myFair.png" /></div> 
        </h1>
        
<script>
function position1()
{
    var fair=document.getElementById("fair");
    fair.style.top="55px";

}
function position2()
{
    var fair=document.getElementById("fair");
    fair.style.top="125px";

}
function position3()
{
    var fair=document.getElementById("fair");
    fair.style.top="190px";

}
function position4()
{
    var fair=document.getElementById("fair");
    fair.style.top="257px";

}
function position5()
{
    var fair=document.getElementById("fair");
    fair.style.top="325px";

}
function position6()
{
    var fair=document.getElementById("fair");
    fair.style.top="390px";

}
function position7()
{
    var fair=document.getElementById("fair");
    fair.style.top="450px";

}
</script>    
    
    <div id="Ways">
        <ul>
            <li class="host-one" onMouseOver="position1()">
                <p  style="color:#FF9600;"><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a></p>
            <p style="color:#FF9600;"><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a><a href="">蝴蝶泉</a></p>
            </li>


            <li class="host-one" onMouseOver="position2()">
                 <p><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a></p>
            <p><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a></p>
            </li>
               

            <li class="host-one" onMouseOver="position3()">
                <p><a href="">漓江</a><a href="">老榕树</a></p>
            <p><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a></p>
            </li>
                

            <li class="host-two" onMouseOver="position4()">
                <p><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a><a href="">蝴蝶泉</a></p>
            </li>
                

            <li class="host-two" onMouseOver="position5()">
                <p><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a></p>
            </li>

                
            <li class="host-one" onMouseOver="position6()">
                <p><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a></p>
            <p><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a><a href="">蝴蝶泉</a></p>
            </li>
                

            <li class="host-one" onMouseOver="position7()">
                <p><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a></p>
            <p><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a><a href="">蝴蝶泉</a></p>
            </li>


        </ul>
        
    </div>
    
</div>
	

	</div>
 

<div>

<div class="seek-foot">
	<img src="../imagesH/HR.png"  />
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
left: -5px
}


#smallJL input[type=checkbox]:focus {
outline: none;
border-color:#4d90fe;
 
}
        </style>
        <div id="smallJL">
        <div id="floatWindow">
                <img id="myimg01" src="../imagesH/JL1.png" width="126" height="100" onMouseOver="changeImg()" onMouseOut="changeBack()" onClick="IsNeedHelp()">
        </div>
        <div id="diabox1" style="display:none;">
                
                <input type="buton" id="input1" onClick="needHelp()"/>
                <a href=""><input type="button" id="input2" onClick="noneedHelp()"/></a>
        </div>
        <div id="diabox2"  style="display:none;"><!-- -->

               
                        



                <div id="diabox2-child"><a href="">
                   <input type="button" id="input3" onClick="noAnswer()" />
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
                        
                <input type="submit" id="input4" value=" " onClick="Answer()" /><!--回答问题-->
                
                        
                </div>
        </div>
        <div id="diabox3" style="display:none;">
                
               <!--链接到推荐页面--> <a href="recommend.html"><input type="submit" id="input5" value=" " onClick="goToSee()"/></a>
                <a href=""><input type="submit" id="input6" value=" " onClick="nogoToSee()"/></a>
        </div>
</div>
</body>
</html>