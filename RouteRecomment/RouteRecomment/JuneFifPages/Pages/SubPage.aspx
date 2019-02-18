<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubPage.aspx.cs" Inherits="RouteRecomment.JuneFifPages.Pages.SubPage" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
	<title>路线推荐</title>
	<link rel="stylesheet" type="text/css" href="../css/ways.css"><!--css-->
	<link rel="stylesheet" type="text/css" href="../css/lunbo.css"><!--轮播css-->
	<link rel="stylesheet" type="text/css" href="../css/jquery.jscrollpane.codrops2.css" />
	<script type="text/javascript" src="../js/jquery.min.js"></script>
        <script type="text/javascript" src="../js/jquery.jscrollpane.min.js"></script>
        <script type="text/javascript" src="../js/jquery.mousewheel.js"></script>
	<script type="text/javascript" src="../js/tab.js"></script><!--选项卡-->

    <!--++轮播 -->
    <base target="_blank" />
    <!-- <link rel="stylesheet" type="text/css" href="http://hovertree.com/texiao/js/1/css/style.css" /> -->
    <link rel="Stylesheet" type="text/css" href="../css/lunbo_subpage_top.css" /> <!-- 定义上方图片轮播 -->
    <script type="text/javascript" src="http://hovertree.com/texiao/js/1/js/koala.min.1.5.js"></script>
    <script type="text/javascript">
        Qfast.add('widgets', { path: "http://hovertree.com/texiao/js/1/js/terminator2.2.min.js", type: "js", requires: ['fx'] });
        Qfast(false, 'widgets', function () {
            K.tabs({
                id: 'decoroll2', //焦点图包裹id
                conId: "decoimg_a2", //大图域包裹id
                tabId: "deconum2", //小圆点数字提示id
                tabTn: "a",
                conCn: '.decoimg_b2', //大图域配置class
                auto: 1, //自动播放 1或0
                effect: 'fade', //效果配置
                eType: 'mouseover', // 鼠标事件
                pageBt: true, //是否有按钮切换页码
                bns: ['.prev', '.next'], //前后按钮配置class
                interval: 2500// 停顿时间
            })
        })
   </script>


    <!--详细信息-->
   <%--<script type="text/javascript" src="../js/jquery.velocity.min.js"></script>--%>
  <%--   <script type="text/javascript" src="../js/jquery-1.7.2-min.js"></script> --%>
	<style>
	.seek-body{margin:0 auto;width:1020px;
		/*top:-1423px;*/z-index:0;}
		            a, input:focus, textarea:focus {
                outline: none;
            }
            
            
            
            #MapMessage {
  position: relative;
  float:left;
  width:225px;height:590px;
  background-color: #fff;
} 
 .allCount{width:225px;height:55px;line-height:55px;background:#5dade2;text-align:center;}
 .allCount p{font-family:微软雅黑;font-size:22px;color:#fff;}
            .container2 {
            	width: 225px;
            	height: auto;
            	background-color: none;
            	float: left;
            }
            
            .container2 .div_scroll {
            	width: 100%;
            	height: 580px;
            	overflow: auto;
            	float: left;
            }	
            
            .container2 .scroll_container {
            	overflow: hidden;
            	position: relative;
            	background-color: none;
            }
            
            .container2 .scroll_absolute {
                position: absolute;
            }
            
            .container2 .scroll_vertical_bar {
                position: absolute;
                top: 0;
                right: 0;
                width: 5px;
                height: 100%;
                background: none;
                margin: 0;
                padding: 0;
            }
            
            .container2 .scroll_track {
            	position: relative;
            	background-color:#CCC;
            	border-radius:5px;
            }
            
            .container2 .scroll_drag {
            	position: relative;
            	top: 0;
            	left: 0;
            	cursor: pointer;
            	background-color:#666;
            	border-radius:5px;
            }
            
            .container2 .scroll_arrow {
            	text-indent: -20000px;
            	display: block;
            	cursor: pointer;
            	background-color: #369DB4;
            }
            
            .container2 .scroll_vertical_bar .scroll_arrow {
                height: 16px;
            }

</style>


</head>
<body>
	<form runat="server" >
	
	<!--搜索框-->
	<div id="seek-top">
		<div class="Cen">
			<img src="../imagesH/LOGO.png"/>
			<div class="sousuo">
				
			<input type="text" name="text" id="seek-input" node-type="loginname" autocomplete="off" placeholder="桂林漓江">
			
			<div class="seek-button" title="搜索"><a href="#"></a></div>
			</div>
			 
                       
            <ul class="seek-login" id="seek-login">
                <li><a href="<%=person.ToString() %>" target="_blank"><%=login.ToString() %></a></li>
                <!--<li><a href="login1.aspx" target="_blank">登录</a></li>-->
                <li><a href="zhuce.aspx" target="_blank">注册</a></li>
            </ul>
                        <%-- <div class="seek-login-after" id="seek-login-after">
                                <ul>
                                <li>Hi,   <a href="" title="天际一线">天际一线</a></li>
                                <li>您好！欢迎来到路线推荐网路线推荐网路线推荐网</li>
                                <li><a href="" style="margin-left:20px;">注销</a></li>
                                </ul>
                        </div>--%>
                        <div id="weather">
                            <iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=12&bdc=%23&icon=1&num=1" width="190" height="80" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="float:left;margin-top:-5px;margin-left:8px;"></iframe>
                        </div>
                </div>
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


		<%--<!--轮播-->
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
</div>--%> <!-- lunbo End -->

        <!--轮播-->
   <div id="decoroll2" class="imgfocus">
      <div id="decoimg_a2" class="imgbox">
        <ul>
            <li>
              <div class="decoimg_b2">  <a href="" target="_blank" title=""><img alt="" src="../imagesH/01.jpg" style="width:1021px;height:418px;"/></a>  </div>
            </li>
            <li>
              <div class="decoimg_b2"> <a href="" target="_blank" title=""><img alt="" src="../imagesH/02.jpg" style="width:1021px;height:418px;"/></a>  </div>  
            </li>
            <li>
               <div class="decoimg_b2">  <a href="" target="_blank" title=""><img alt="" src="../imagesH/03.jpg" style="width:1021px;height:418px;"/></a>  </div>  
            </li>
            <li>
               <div class="decoimg_b2">  <a href="" target="_blank" title=""><img alt="" src="../imagesH/04.jpg" style="width:1021px;height:418px;"/></a>   </div>  
            </li>
            <li>
               <div class="decoimg_b2">  <a href="" target="_blank" title=""><img alt="" src="../imagesH/05.jpg" style="width:1021px;height:418px;"/></a>   </div>  
            </li>
        </ul>
           
    </div>
    <ul id="deconum2" class="num_a2">
       <li><a href="javascript:void(0)" hidefocus="true" target="_self">景点名称1</a></li>
       <li><a href="javascript:void(0)" hidefocus="true" target="_self">龙胜梯田</a></li>
       <li><a href="javascript:void(0)" hidefocus="true" target="_self">海洋乡银杏林</a></li>
       <li><a href="javascript:void(0)" hidefocus="true" target="_self">漓江</a></li>
       <li><a href="javascript:void(0)" hidefocus="true" target="_self">景点名称5</a></li>
    </ul>
</div>


 <div id="MapAll">
            <div class="allCount">
                <p>选中列表</p>
            </div>
            <!-- id="div_scrollC"-->
            <div id="MapMessage">
                    <!--<div class="top div_scroll" id="bd">
                <ul id="ul">

                </ul>
        </div>
        
        <div class="scroll" id="scroll">
                <p id="p"></p>
        </div>-->
                    <div class="container">
                        <div class="wrapper">
                            <div id="jp-container" class="jp-container">
                                <!--<div id="tex">
                                    <img src="../images/house.png" height="28" width="21">
                                    <span id="yixiantian">一线天</span>
                                    <span id="xiangqing">
                                        <a href="">详情>></a>
                                    </span>
                                <p>地址：长潭大道155</p>
                                <p>电话：(0753)88621115</p>
                                <p>标签：景区</p>
                            </div>-->
                        </div>
                        <div class="clr"></div>
                    </div>
                </div>
        </div>
          <script type="text/javascript">
          var Scroll = function(){
			$(function() {
			
				// the element we want to apply the jScrollPane
				var $el					= $('#jp-container').jScrollPane({
					verticalGutter 	: -16
				}),
						
				// the extension functions and options 	
					extensionPlugin 	= {
						
						extPluginOpts	: {
							// speed for the fadeOut animation
							mouseLeaveFadeSpeed	: 500,
							// scrollbar fades out after hovertimeout_t milliseconds
							hovertimeout_t		: 1000,
							// if set to false, the scrollbar will be shown on mouseenter and hidden on mouseleave
							// if set to true, the same will happen, but the scrollbar will be also hidden on mouseenter after "hovertimeout_t" ms
							// also, it will be shown when we start to scroll and hidden when stopping
							useTimeout			: false,
							// the extension only applies for devices with width > deviceWidth
							deviceWidth			: 980
						},
						hovertimeout	: null, // timeout to hide the scrollbar
						isScrollbarHover: false,// true if the mouse is over the scrollbar
						elementtimeout	: null,	// avoids showing the scrollbar when moving from inside the element to outside, passing over the scrollbar
						isScrolling		: false,// true if scrolling
						addHoverFunc	: function() {
							
							// run only if the window has a width bigger than deviceWidth
							if( $(window).width() <= this.extPluginOpts.deviceWidth ) return false;
							
							var instance		= this;
							
							// functions to show / hide the scrollbar
							$.fn.jspmouseenter 	= $.fn.show;
							$.fn.jspmouseleave 	= $.fn.fadeOut;
							
							// hide the jScrollPane vertical bar
							var $vBar			= this.getContentPane().siblings('.jspVerticalBar').hide();
							
							/*
							 * mouseenter / mouseleave events on the main element
							 * also scrollstart / scrollstop - @James Padolsey : http://james.padolsey.com/javascript/special-scroll-events-for-jquery/
							 */
							$el.bind('mouseenter.jsp',function() {
								
								// show the scrollbar
								$vBar.stop( true, true ).jspmouseenter();
								
								if( !instance.extPluginOpts.useTimeout ) return false;
								
								// hide the scrollbar after hovertimeout_t ms
								clearTimeout( instance.hovertimeout );
								instance.hovertimeout 	= setTimeout(function() {
									// if scrolling at the moment don't hide it
									if( !instance.isScrolling )
										$vBar.stop( true, true ).jspmouseleave( instance.extPluginOpts.mouseLeaveFadeSpeed || 0 );
								}, instance.extPluginOpts.hovertimeout_t );
								
								
							}).bind('mouseleave.jsp',function() {
								
								// hide the scrollbar
								if( !instance.extPluginOpts.useTimeout )
									$vBar.stop( true, true ).jspmouseleave( instance.extPluginOpts.mouseLeaveFadeSpeed || 0 );
								else {
								clearTimeout( instance.elementtimeout );
								if( !instance.isScrolling )
										$vBar.stop( true, true ).jspmouseleave( instance.extPluginOpts.mouseLeaveFadeSpeed || 0 );
								}
								
							});
							
							if( this.extPluginOpts.useTimeout ) {
								
								$el.bind('scrollstart.jsp', function() {
								
									// when scrolling show the scrollbar
									clearTimeout( instance.hovertimeout );
									instance.isScrolling	= true;
									$vBar.stop( true, true ).jspmouseenter();
									
								}).bind('scrollstop.jsp', function() {
									
									// when stop scrolling hide the scrollbar (if not hovering it at the moment)
									clearTimeout( instance.hovertimeout );
									instance.isScrolling	= false;
									instance.hovertimeout 	= setTimeout(function() {
										if( !instance.isScrollbarHover )
											$vBar.stop( true, true ).jspmouseleave( instance.extPluginOpts.mouseLeaveFadeSpeed || 0 );
									}, instance.extPluginOpts.hovertimeout_t );
									
								});
								
								// wrap the scrollbar
								// we need this to be able to add the mouseenter / mouseleave events to the scrollbar
								var $vBarWrapper	= $('<div/>').css({
									position	: 'absolute',
									left		: $vBar.css('left'),
									top			: $vBar.css('top'),
									right		: $vBar.css('right'),
									bottom		: $vBar.css('bottom'),
									width		: $vBar.width(),
									height		: $vBar.height()
								}).bind('mouseenter.jsp',function() {
									
									clearTimeout( instance.hovertimeout );
									clearTimeout( instance.elementtimeout );
									
									instance.isScrollbarHover	= true;
									
									// show the scrollbar after 100 ms.
									// avoids showing the scrollbar when moving from inside the element to outside, passing over the scrollbar								
									instance.elementtimeout	= setTimeout(function() {
										$vBar.stop( true, true ).jspmouseenter();
									}, 100 );	
									
								}).bind('mouseleave.jsp',function() {
									
									// hide the scrollbar after hovertimeout_t
									clearTimeout( instance.hovertimeout );
									instance.isScrollbarHover	= false;
									instance.hovertimeout = setTimeout(function() {
										// if scrolling at the moment don't hide it
										if( !instance.isScrolling )
											$vBar.stop( true, true ).jspmouseleave( instance.extPluginOpts.mouseLeaveFadeSpeed || 0 );
									}, instance.extPluginOpts.hovertimeout_t );
									
								});
								
								$vBar.wrap( $vBarWrapper );
							
							}
						
						}
						
					},
					
					// the jScrollPane instance
					jspapi 			= $el.data('jsp');
					
				// extend the jScollPane by merging	
				$.extend( true, jspapi, extensionPlugin );
				jspapi.addHoverFunc();
			
			});
			}
			Scroll();
		</script>
        <div id="Map">
            <input class="back-0" type="button" id="button1" onclick="Auto2()" />
            <input class="back-1" type="button" id="button2" onclick="Auto1()" />
            <input class="back-2" type="button" id="button3" onclick="Auto3()" />
            <input class="back-3" type="button" id="button4" onclick="Auto4()" />
            <input class="back-4" type="button" id="button5" onclick="Auto5()" />
            <!--百度地图容器-->
            <div id="dituContent"></div>
            <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=C51768d657a80ebc94d29815b53b7415"></script>
<script type="text/javascript">
   //创建和初始化地图函数：
var Info = "";
var url;
var a1 = [];
var a2 = [];
var a3 = [];
var a4 = [];
var a5 = [];
var SceName = [];
var HtlName = [];
var MallName = [];
var ResName = [];
var EnterName = [];
function initMap() {
    createMap();//创建地图
    setMapEvent();//设置地图事件
    addMapControl();//向地图添加控件
    //addMarker();//向地图中添加marker
} 
    
//创建地图函数：
function createMap() {  
    var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
    var point = new BMap.Point(110.190658, 25.262053);//定义一个中心点坐标
    map.centerAndZoom(point, 10);//设定地图的中心点和坐标并将地图显示在地图容器中
    window.map = map;//将map变量存储在全局
    //enableMassClear();
}
    
//地图事件设置函数：
function setMapEvent() {
    map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
    map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用图

}
    
//地图控件添加函数：
function addMapControl() {
    //向地图中添加缩放控件
    var ctrl_nav = new BMap.NavigationControl({ anchor: BMAP_ANCHOR_TOP_LEFT, type: BMAP_NAVIGATION_CONTROL_LARGE });
    map.addControl(ctrl_nav);
    //向地图中添加比例尺控件
    var ctrl_sca = new BMap.ScaleControl({ anchor: BMAP_ANCHOR_BOTTOM_LEFT });
    map.addControl(ctrl_sca);
}
function Auto1() {
    var MallInfo = new Array;
   var temp = '<%=GetShop()%>';
     MallInfo = temp.split("|");
    if (document.getElementById("button2").className == "back-1") {
        for (var i = 0; i < Math.ceil(MallInfo.length / 6); i++) {

            sContent =
            "<img style='float:right;margin:4px' id='imgDemo' src='" + MallInfo[i * 6 + 5] + "' width='139' height='104' title='" + MallInfo[i * 6] + "'/>" +
            "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>" + MallInfo[i * 6 + 1] + "</p>" +
            "</div>";
            markerArr = [{ title: MallInfo[i * 6], content: sContent, point: MallInfo[i * 6 + 2] + "|" + MallInfo[i * 6 + 3], isOpen: 0, icon: { w: 20 , h: 26, l: 28, t: 34, x: 9, lb: 12 } }
            ];
            url = "Shopping.aspx?ShopID=" + MallInfo[i * 6 + 4];

            Info = "";
            Info += MallInfo[i * 6];//景点名
                
            Info += "|";
            Info += MallInfo[i * 6 + 1];
            Info += "|";
            Info += url;
            Info += "|";
            Info += (i + 1).toString();
            MallName[i] = MallInfo[i * 6];
            a1[i] = addMarker();

        }
        document.getElementById("button2").className = "back-11";
    }
    else {
        for (var j = 0; j < a1.length; j++)
            map.removeOverlay(a1[j]);
        document.getElementById("button2").className = "back-1";
            
        //清空
        var parDiv = document.getElementsByClassName("jspPane")[0];
        console.log(parDiv)
         for (var MallCount = 0; MallCount < MallName.length; MallCount++) {
             var SceTemp = document.getElementById(MallName[MallCount]);
             parDiv.removeChild(SceTemp);
         }
    }
    Scroll();
}
function Auto2() {


    var SceneryInfo = new Array;
    var temp = '<%=GetScenery()%>';

    SceneryInfo = temp.split("|");
    if (document.getElementById("button1").className == "back-0") {
        for (var i = 0; i < Math.ceil(SceneryInfo.length / 6); i++) {
            sContent =
            "<img style='float:right;margin:4px' id='imgDemo' src='" + SceneryInfo[i * 6 + 5] + "' width='139' height='104' title='" + SceneryInfo[i * 6] + "'/>" +
            "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>" + SceneryInfo[i * 6 + 1] + "</p>" +
            "</div>";
            markerArr = [{ title: SceneryInfo[i * 6], content: sContent, point: SceneryInfo[i * 6 + 2] + "|" + SceneryInfo[i * 6 + 3], isOpen: 0, icon: { w: 20 , h: 26, l: 110, t: 34, x: 9, lb: 12 } }
            ];
            url = "Scenery.aspx?SceneryID=" + SceneryInfo[i * 6 + 4];

            Info = "";
            Info += SceneryInfo[i * 6];//景点名
                
            Info += "|";
            Info += SceneryInfo[i * 6 + 1];
            Info += "|";
            Info += url;
            Info += "|";
            Info += (i + 1).toString();
            a2[i] = addMarker();
            SceName[i] = SceneryInfo[i * 6];

            //alert(Info);
		  
        }
        document.getElementById("button1").className = "back-10";

    }
    else {
        for (var j = 0; j < a2.length; j++)
            map.removeOverlay(a2[j]);
        document.getElementById("button1").className = "back-0";
        //清空左边的显示
         var parDiv = document.getElementsByClassName("jspPane")[0];
        //alert(parDiv.id);
        //alert(SceName.length);
        for (var SceCount = 0; SceCount < SceName.length; SceCount++) { 
            // var SceTemp = new Array;
            // for(var i=0;i<)
            var SceTemp = document.getElementById(SceName[SceCount]);
            parDiv.removeChild(SceTemp);
        }
    }
    Scroll();
}
function Auto3() {
    var HotelInfo = new Array;
    var temp = '<%=GetHotel()%>';
    HotelInfo = temp.split("|");
    if (document.getElementById("button3").className == "back-2") {
        for (var i = 0; i < Math.ceil(HotelInfo.length / 6); i++) {

            sContent =
            "<img style='float:right;margin:4px' id='imgDemo' src='" + HotelInfo[i * 6 + 5] + "' width='139' height='104' title='" + HotelInfo[i * 6] + "'/>" +
            "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>" + HotelInfo[i * 6 + 1] + "</p>" +
            "</div>";
            markerArr = [{ title: HotelInfo[i * 6], content: sContent, point: HotelInfo[i * 6 + 2] + "|" + HotelInfo[i * 6 + 3], isOpen: 0, icon: { w: 20 , h: 26, l: 80, t: 34, x: 9, lb: 12 } }
            ];
            url = "Hotel.aspx?HotelID=" + HotelInfo[i * 6 + 4];

            Info = "";
            Info += HotelInfo[i * 6];//景点名
                
            Info += "|";
            Info += HotelInfo[i * 6 + 1];
            Info += "|";
            Info += url;
            Info += "|";
            Info += (i + 1).toString();
            HtlName[i] = HotelInfo[i * 6];
            a3[i] = addMarker();
        }
        document.getElementById("button3").className = "back-12";
    }
    else {
        for (var n = 0; n < a3.length; n++)
            map.removeOverlay(a3[n]);
        document.getElementById("button3").className = "back-2";
         var parDiv = document.getElementsByClassName("jspPane")[0];
        for (var HtlCount = 0; HtlCount < HtlName.length; HtlCount++) {
            var SceTemp = document.getElementById(HtlName[HtlCount]);
            parDiv.removeChild(SceTemp);
        }
    }
    Scroll();
}
function Auto4() {
    var ResInfo = new Array;
    var temp = '<%=GetRestaurant()%>';
    ResInfo = temp.split("|");
    if (document.getElementById("button4").className == "back-3") {
        for (var i = 0; i < Math.ceil(ResInfo.length / 6); i++) {
            sContent =
            "<img style='float:right;margin:4px' id='imgDemo' src='" + ResInfo[i * 6 + 5] + "' width='139' height='104' title=='" + ResInfo[i * 6] + "'/>" +
            "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>" + ResInfo[i * 6 + 1] + "</p>" +
            "</div>";
            markerArr = [{ title: ResInfo[i * 6], content: sContent, point: ResInfo[i * 6 + 2] + "|" + ResInfo[i * 6 + 3], isOpen: 0, icon: {w: 20 , h: 26, l: 54, t: 34, x: 9, lb: 12 } }
            ];

            url = "Food.aspx?ResID=" + ResInfo[i * 6 + 4];

            Info = "";
            Info += ResInfo[i * 6];//景点名
                
            Info += "|";
            Info += ResInfo[i * 6 + 1];
            Info += "|";
            Info += url;
            Info += "|";
            Info += (i + 1).toString();
            ResName[i] = ResInfo[i * 6];
            a4[i] = addMarker();
        }
        document.getElementById("button4").className = "back-13";
    }
    else {
        for (var m = 0; m < a4.length; m++)
            map.removeOverlay(a4[m]);
         document.getElementById("button4").className = "back-3";
          var parDiv = document.getElementsByClassName("jspPane")[0];
        for (var ResCount = 0; ResCount < ResName.length; ResCount++) {
            var SceTemp = document.getElementById(ResName[ResCount]);
            parDiv.removeChild(SceTemp);
        }
    }
    Scroll();
}
function Auto5() {
    var EnterInfo = new Array;
    var temp = '<%=GetEntertain()%>';
    EnterInfo = temp.split("|");
    if (document.getElementById("button5").className == "back-4") {
        for (var i = 0; i < Math.ceil(EnterInfo.length / 6); i++) {
            sContent =
            "<img style='float:right;margin:4px' id='imgDemo' src='" + EnterInfo[i * 6 + 5] + "' width='139' height='104' title='" + EnterInfo[i * 6] + "'/>" +
            "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>" + EnterInfo[i * 6 + 1] + "</p>" +
            "</div>";
            markerArr = [{ title: EnterInfo[i * 6], content: sContent, point: EnterInfo[i * 6 + 2] + "|" + EnterInfo[i * 6 + 3], isOpen: 0, icon: { w: 20 , h: 26, l: 0, t: 34, x: 9, lb: 12} }
            ];
            url = "Entertainment.aspx?EnterID=" + EnterInfo[i * 6 + 4];

            Info = "";
            Info += EnterInfo[i * 6];//景点名
                
            Info += "|";
            Info += EnterInfo[i * 6 + 1];
            Info += "|";
            Info += url;
            Info += "|";
            Info += (i + 1).toString();
            EnterName[i] = EnterInfo[i * 6];
            a5[i] = addMarker();
        }
        document.getElementById("button5").className = "back-14";
    }
    else {
        for (var j = 0; j < a5.length; j++)
            map.removeOverlay(a5[j]);
        document.getElementById("button5").className = "back-4";
         var parDiv = document.getElementsByClassName("jspPane")[0];
        for (var EnterCount = 0; EnterCount < EnterName.length; EnterCount++) {
            var SceTemp = document.getElementById(EnterName[EnterCount]);
            // alert(SceTemp);
            parDiv.removeChild(SceTemp);
        }

    }
    Scroll();
}
var sContent;
var markerArr;
//创建marker
function addMarker() {
    for (var i = 0; i < markerArr.length; i++) {
        var json = markerArr[i];
        var p0 = json.point.split("|")[0];
        var p1 = json.point.split("|")[1];
        var point = new BMap.Point(p0, p1);
        var iconImg = createIcon(json.icon);
        var marker = new BMap.Marker(point, { icon: iconImg });
        var iw = createInfoWindow(i);
        var label = new BMap.Label(json.title, { "offset": new BMap.Size(json.icon.lb - json.icon.x + 10, -20) });
        marker.setLabel(label);
        label.hide();
        marker.href = '#'+json.title;
        map.addOverlay(marker);
            
        /*  setTimeout(function(){
          map.setViewport(point);          //调整到最佳视野
                  },1000);*/


        createDiv(Info);//创建左边的
        var A = document.getElementById(json.title);
        var B = A.getElementsByClassName('aa');
        label.setStyle({
            /* borderColor:"#808080",
             color:"#333",
             cursor:"pointer"*/
            position: "absolute",
            background: "#EE5D5B",
            border: "1px solid #BC3B3A",
            color: "white",
            height: "18px",
            padding: "2px",
            lineHeight: "18px",
            whiteSpace: "nowrap",
            MozUserSelert: "none",
            fontSize: "12px"
        });
            
        //var EleUrl;
        function Yibool(result) {  //EleUrl = result;
            //alert(EleUrl);
            window.open(result, "_blank");
                
            // alert(result);
            //  window.location.href=result; //原始
                
            //  window.open(result,'_blank');
            //alert(result);
            // window.navigate(result);

        }
        marker.addEventListener("mouseover", function () {
            marker.getLabel().show();
            json.icon.t = 0;
            var iconImg1 = createIcon(json.icon);
            marker.setIcon(iconImg1);
            B[0].className = 'bb aa';
			     });
        marker.addEventListener("mouseout", function () {
            marker.getLabel().hide();
            marker.setIcon(iconImg);
             if (json.isOpen == 0) {
                   B[0].className = 'aa';
             }
			     });


        iw.addEventListener("close", function () {
            marker.setIcon(iconImg);
             B[0].className = 'aa';
             json.isOpen = 0;
        })
        marker.addEventListener("click", function () {
            marker.openInfoWindow(iw);
            // var m =document.createElement('a');
            // m.href = '#' + json.title;
            // m.onclick = "";
            // m.click();
            
            var Id = document.getElementById(json.title);
            if(Id) {
            var S = document.getElementsByClassName('jspPane')[0];
                Id.offsetTop = 0;
                var t = Id.offsetTop;
                S.style.top = -t + 'px';
            }
            
        })
        //alert(json.title);
        A.addEventListener('click', function(){
            marker.openInfoWindow(iw);
        });
        A.addEventListener('mouseover', function() {
            //  marker.openInfoWindow(iw);
            json.icon.t = 0;
            var iconImg1 = createIcon(json.icon);
            marker.setIcon(iconImg1);
        });
        A.addEventListener('mouseout', function() {
            marker.setIcon(iconImg);
        });
        iw.addEventListener("open", function () {
            // icon.t = 33;
           
            marker.getLabel().hide();
            B[0].className = 'bb aa';
            json.isOpen = 1;
             json.icon.t = 0;
            var iconImg1 = createIcon(json.icon);
            marker.setIcon(iconImg1);
        })
        if (!!json.isOpen) {
            label.hide();
            marker.openInfoWindow(iw);
        }
    }
    return marker;
}
//创建InfoWindow
function createInfoWindow(i) {
    var json = markerArr[i];
    var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>" + json.content + "</div>");
    return iw;
}

function createDiv(EleInfo) {
    var InfoArr = new Array;
    var count = EleInfo.split("|").length;
    for (var Elei = 0; Elei < count; Elei++)
        InfoArr[Elei] = EleInfo.split("|")[Elei];
    var a = document.createElement("a");
    a.className = 'txt';
    a.href = "javascript:void(0);"
    a.id = InfoArr[0];
    // a.name = InfoArr[0];
    
    var img1 = document.createElement("img");
    img1.src = "../imagesH/house.png";
    img1.style.height = "28px";
    img1.style.width = "21px";
    a.appendChild(img1);
    
    var span2 = document.createElement("span");
    span2.innerHTML = InfoArr[0];
    span2.className = 'aa';
    a.appendChild(span2);
    
    var a1 = document.createElement("a");
    a1.href = InfoArr[2];
    a1.target = "_blank";
    a1.innerHTML="详情";
    a1.onmousemove = function () { this.style.color = "#F00" };
    a1.onmouseout = function () { this.style.color = "blue" };
    a.appendChild(a1);
    
    var p1 = document.createElement("p");
    p1.innerHTML = "地址：" + InfoArr[1];
    a.appendChild(p1);

    var pDiv = document.getElementsByClassName('jspPane')[0];
    pDiv.appendChild(a);

}
//创建一个Icon
function createIcon(json) {
    // var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
    var icon = new BMap.Icon("../EleImages/ditu.png", new BMap.Size(json.w, json.h), { imageOffset: new BMap.Size(-json.l, -json.t), infoWindowOffset: new BMap.Size(json.lb + 5, 1), offset: new BMap.Size(json.x, json.h) })

    return icon;
}
</script>

</div>
</div>

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
            
           <input type="button" value="本站" name="navbar">
            <input type="button" id="active" value="它站" name="navbar"/>
            


    <div id="spotContent"  >
        
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

<div id="pages" style="margin-bottom:30px;">
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
</div><hr style="border:none;both:clear;" />
        </div>
    </div>
     <asp:ScriptManager ID="ScriptManager1"  runat="server"  AsyncPostBackTimeout="0" >
  </asp:ScriptManager>
             <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Block">
        <ContentTemplate>

    <div id="spotContent" style="display:block">
             
        <div class="Con" >

            <ul id="ConUl">
                                	<%
                if (DTOtherStraSplit.Rows.Count > 0)
                {
                    for (int i = 0; i < DTOtherStraSplit.Rows.Count; i++)
                    {
                        System.Data.DataTable PublishDT = new System.Data.DataTable();
                        System.Data.DataTable PicInfoDT = new System.Data.DataTable();
                        System.Data.DataTable OtherSceneryDT = new System.Data.DataTable();
                        if (!Convert.IsDBNull(DTOtherStraSplit.Rows[i]["PublisherID"] ))
                        {
                            PublishDT = _OtherStraBLL.GetPIByPubID(int.Parse(DTOtherStraSplit.Rows[i]["PublisherID"].ToString()));
                               
                        }
                        String Content;
                        if (DTOtherStraSplit.Rows[i]["StrategyContent"].ToString().Length > 50)
                            Content = DTOtherStraSplit.Rows[i]["StrategyContent"].ToString().Substring(0, 50);
                        else
                            Content = DTOtherStraSplit.Rows[i]["StrategyContent"].ToString();

                        String AuthorUrl="";
                        if (PublishDT.Rows.Count > 0)
                            if (PublishDT.Rows[0]["PublisherUrl"] != null)
                                AuthorUrl = PublishDT.Rows[0]["PublisherUrl"].ToString();
                        //+++用于显示攻略对应的图片 StrategyID --> SceneryID --> PicInfo
                        OtherSceneryDT = _PicInfoBLL.GetOtherSceneryByStrategyID(int.Parse(DTOtherStraSplit.Rows[i]["StrategyID"].ToString()) % 2); //注：等图片资源补齐后将%2去掉
                        if (OtherSceneryDT.Rows.Count > 0)
                            if (OtherSceneryDT.Rows[0]["SceneryID"] != null)
                                PicInfoDT = _PicInfoBLL.GetPicBySceID(int.Parse(OtherSceneryDT.Rows[0]["SceneryID"].ToString()));
                        String PicUrl = "";
                        if (PicInfoDT.Rows.Count > 0)
                        {
                            if (PicInfoDT.Rows[0]["PicPath"] != null)
                            {
                                PicUrl = PicInfoDT.Rows[0]["PicPath"].ToString();
                                PicUrl = PicUrl.Substring(PicUrl.IndexOf('U'));//数据库中格式../../../UpLoadPics/.jpg，从U开始截取，修改PicUrl
                                PicUrl = "../../../" + "Admin/" + PicUrl;

                            }
                        }
                        //Response.Write(PicUrl + int.Parse(DTOtherStraSplit.Rows[i]["StrategyID"].ToString()) % 2); //
                        if (PicUrl.Equals(""))
                        {
                            PicUrl = "../imagesH/04.jpg ";
                        }
        	        %>
        	       
                <li>
                    <div class="spot-left"><a href=""><img src=<%=PicUrl %>  style="width:190px;height:150px;"/></a></div>
                    <div class="spot-right">
                        <h3><%=DTOtherStraSplit.Rows[i]["StrategyTitle"].ToString()%></h3>
                         <%
                             if (AuthorUrl != "")
                             {
                                
                         %>
                        <span class="Auto"><a href=<%=AuthorUrl %> target="_blank">作者：<%=PublishDT.Rows[0]["PublisherNickName"].ToString()%></a></span><%

                             }
                               else if (PublishDT.Rows.Count > 0)
                            {
                         %><span class="Auto">作者：<%=PublishDT.Rows[0]["PublisherNickName"].ToString()%></span><%
                            }
        				 %><span id="spotTime"><%=DTOtherStraSplit.Rows[i]["PublishTime"].ToString()%></span><p><%=Content%>....</p>
                        <span class="gonglveMore"><a href=<%=DTOtherStraSplit.Rows[i]["StrategyUrl"].ToString()%>  target="_blank"><<详细信息</a></span></div><hr style="border:none;clear:both;"/>
                </li>
        		<%
                }
                }
        		     %>

            </ul>

<div id="pages">
    <ul>

        <li>
                <webdiyer:AspNetPager  ID="AspNetPager4" runat="server"
                               PageSize="7"  CurrentPageIndex="1"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="Prev"   
                                    NextPageText="Next" UrlPaging="false" 
                                onpagechanging="StraSplit_PageChanging" 
            AlwaysShow="false" NumericButtonCount="7"  
                    
                             >
       </webdiyer:AspNetPager>
        </li>

    </ul>
</div><hr style="border:none;clear:both;" />
     
     
        </div>

    </div>
</ContentTemplate>
</asp:UpdatePanel>
    
</div>
</div>

<h1 id="commandLogo"><a href=""><img src="../imagesH/command-logo3.png" /></a></h1>




<div style="float:left;margin-left:18px;">

<!--热门景点-->
<div class="host-spot">
    <h1><!-- <img src="../imagesH/jingdian.jpg"/> -->&nbsp;热门景点</h1>

    <div class="host-img" style="background:url(../EleImages/漓江2.jpg);background-size:152px 142px;"> 

<a href="Scenery.aspx?SceneryID=66" target="_blank"  class="now"><font class="font-1">漓江</font><font class="font-2">桂林的灵魂</font></a> 
</div> 
<div class="host-img" style="background:url(../EleImages/西街2.jpg);background-size:152px 142px;"> 
<a href="Scenery.aspx?SceneryID=28"  target="_blank" class="now"><font class="font-1">西街</font><font class="font-2">国际情调</font></a> 
</div> 
<div class="host-img" style="background:url(../EleImages/象鼻山2.jpg);background-size:152px 142px;"> 
<a href="Scenery.aspx?SceneryID=54" target="_blank"  class="now"><font class="font-1">象鼻山</font><font class="font-2">桂林城徽</font></a> 
</div> 
<div class="host-img" style="background:url(../EleImages/月亮山2.jpg);background-size:152px 142px;"> 
<a href="Scenery.aspx?SceneryID=25"  target="_blank" class="now"><font class="font-1">月亮山</font><font class="font-2">阳朔奇景</font></a> 
</div> 

</div>

<!--热门路线-->


        <div class="host-ways">
        
        <h1><span style="position:relative;left:-10px;">热门路线</span> 
             <!-- <img src="../imagesH/dajia.png" width="30px" height="30px" style="line-height:55px;padding-top:5px;"/> -->
            
            
            <a href=""><img class="refresh-right" src="../imagesH/refresh1.png"/></a>
            <div id="fair"><img src="../imagesH/myFair.png" /></div>  
        </h1>
        
<script>
function position1()
{
    var fair=document.getElementById("fair");
    fair.style.top="80px";

}
function position2()
{
    var fair=document.getElementById("fair");
    fair.style.top="160px";

}
function position3()
{
    var fair=document.getElementById("fair");
    fair.style.top="230px";

}
function position4()
{
    var fair=document.getElementById("fair");
    fair.style.top="286px";

}
function position5()
{
    var fair=document.getElementById("fair");
    fair.style.top="355px";

}
function position6()
{
    var fair=document.getElementById("fair");
    fair.style.top="440px";

}
function position7()
{
    var fair=document.getElementById("fair");
    fair.style.top="450px";

}



function display(obj,dis)
{
    var fair=document.getElementById(obj);
    fair.style.display=dis;
}
</script>    
    
    <div id="Ways">
        
            <div class="host-one" onmouseover="position1()">
                <p  style="color:#FF9600;"><a href="Scenery.aspx?SceneryID=66">漓江</a><a href="Scenery.aspx?SceneryID=29">龙颈河漂流</a><a href="Scenery.aspx?SceneryID=23">遇龙河</a></p>
               <p><a href="Scenery.aspx?SceneryID=28">西街</a><a href="Scenery.aspx?SceneryID=59">七星公园</a><a href="Scenery.aspx?SceneryID=42">芦笛岩</a><a href="Scenery.aspx?SceneryID=54">象鼻山</a>  </p>
            </div>
            <hr style="border:1px dashed #d0d0d0;"/>


            <div class="host-one" onmouseover="position2()">
                 <p><a href="Scenery.aspx?SceneryID=13">银子岩</a><a href="Scenery.aspx?SceneryID=66">漓江</a><a href="Scenery.aspx?SceneryID=23">遇龙河</a></p>
            <p><a href="Scenery.aspx?SceneryID=25">月亮山</a><a href="Scenery.aspx?SceneryID=115">梯田</a><a href="Scenery.aspx?SceneryID=54">象鼻山</a></p>
            </div>
            <hr style="border:1px dashed #d0d0d0;"/>


             <div class="host-one" onmouseover="position3()">
                
               <p><a href="Scenery.aspx?SceneryID=66">漓江</a><a href="Scenery.aspx?SceneryID=26">老榕树</a><a href="Scenery.aspx?SceneryID=34">蝴蝶泉</a>  </p>
            </div>
            <hr style="border:1px dashed #d0d0d0;"/>


            <div class="host-one" onmouseover="position4()">
                
                             <p><a href="Scenery.aspx?SceneryID=34">蝴蝶泉</a><a href="Scenery.aspx?SceneryID=26">大榕树</a></p>
            <p><a href="Scenery.aspx?SceneryID=25">月亮山</a><a href="Scenery.aspx?SceneryID=13">银子岩</a><a href="Scenery.aspx?SceneryID=23">遇龙河</a></p>
            </div>
            <hr style="border:1px dashed #d0d0d0;"/>

            <div class="host-one" onmouseover="position5()">
                 <p><a href="Scenery.aspx?SceneryID=70">古东瀑布</a><a href="Scenery.aspx?SceneryID=66">漓江冠岩</a><a href="Scenery.aspx?SceneryID=43">两江四湖</a></p>
            </div>
            <hr style="border:1px dashed #d0d0d0;"/>


            <div class="host-one" onmouseover="position6()">
                            <p><a href="Scenery.aspx?SceneryID=66">漓江</a><a href="Scenery.aspx?SceneryID=34">蝴蝶泉</a><a href="Scenery.aspx?SceneryID=26">大榕树</a></p>
            <p><a href="Scenery.aspx?SceneryID=42">芦笛岩</a><a href="Scenery.aspx?SceneryID=54">象鼻山</a><a href="Scenery.aspx?SceneryID=43">两江四湖</a></p>
            </div>
            <hr style="border:1px dashed #d0d0d0;"/>
    </div>
    
</div>
	

	</div>
 



<div class="seek-foot">
	<img src="../imagesH/HR.png"  />
       
        <ul>
                <li>友情链接：</li>
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
</div>
</form>
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
        bigimg.src="../imagesH/JL1.gif";
        bigimg.onmouseover= function()
        {
                changeImg();
        }
        bigimg.onmouseout= function()
        {
             changeBack();   
        }
       
        bigimg.onclick= function()
        {
                IsNeedHelp();
        }
        
}
function noAnswer()
{
        var dia2=document.getElementById("diabox2");
        var bigimg=document.getElementById("myimg01");
        dia2.style.display="none";
        bigimg.src="../imagesH/JL1.gif";
        bigimg.onmouseover= function()
        {
                changeImg();
        }
        bigimg.onmouseout= function()
        {
             changeBack();   
        }
       
        bigimg.onclick= function()
        {
                IsNeedHelp();
        }
}
function Answer()
{
        var dia2=document.getElementById("diabox2");
        var dia3=document.getElementById("diabox3");
        dia2.style.display="none";
        dia3.style.display="block";
        
                var Res = document.getElementById("Days").value;
        Res +="*";
        var CheckArray = document.all("check2");
        //alert(CheckArray.length);
        for(var CI=0;CI<CheckArray.length;CI++)
        {
          if(CheckArray[CI].checked==true)
          {
            Res +="1";
          }
          else
           Res +="0";
          Res +="|";
        }
        Res = Res.substring(0, Res.length - 1);
        //++++++++++++++++
        Res += "*";
        var ticketPrice = document.getElementById("money").value;
        Res += ticketPrice;
        Res += "*";
        var company = document.all("check1");
        for (var i = 0; i < company.length; i++) {
            if (company[i].checked == true) {
                Res += "1";
            }
            else
                Res += "0";
            Res += "|";
        }

        Res = Res.substring(0, Res.length - 1);
        Res += "*";
        var ageRange = document.getElementsByName("age");
        for (var j = 0; jage.length; j++) {
            if (ageRange[j].checked == true) {
                Res += "1";
            }
            else
                Res += "0";
            Res += "|";
        }
        Res = Res.substring(0, Res.length - 1);
        //+++++++++++++++++
        //alert(Res);
        PageMethods.GetDiaLogInfo(Res);
}
function goToSee()
{
        var dia3=document.getElementById("diabox3");
        dia3.style.display="none";
        var bigimg=document.getElementById("myimg01");
        bigimg.src="../imagesH/JL1.gif";
        bigimg.onmouseover= function()
        {
                changeImg();
        }
        bigimg.onmouseout= function()
        {
             changeBack();   
        }
       
        bigimg.onclick= function()
        {
                IsNeedHelp();
        }
}

function nogoToSee()
{
        var dia1=document.getElementById("diabox1");
        var dia3=document.getElementById("diabox3");
        var bigimg=document.getElementById("myimg01");
        dia1.style.display="none";
         dia3.style.display="none";
        bigimg.src="../imagesH/JL1.gif";
        bigimg.onmouseover= function()
        {
                changeImg();
        }
        bigimg.onmouseout= function()
        {
             changeBack();   
        }
       
        bigimg.onclick= function()
        {
                IsNeedHelp();
        }
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
left: -5px
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
                <input type="button" id="input2" onclick="noneedHelp()"/>
        </div>
        <div id="diabox2"  style="display:none;"><!-- -->

               
                        



                <div id="diabox2-child">
                   <input type="button" id="input3" onclick="noAnswer()" />
                <!--不回答问题-->

                         <p class="questionTitle">先<span style="color:#2e96c2;font-size:20px;">回答</span>
                                这样几个<span style="color:#2e96c2;font-size:20px;">问题</span>吧</p>
                        <p class="ques1"><span style="font-size:16px;">1.</span style="margin-left:10px;">1.您希望旅行几天 ？<input type="text" id="Days"  value="3" style="width:62px;height:18px;margin-left:30px;margin-right:10px;"/>天</p>


                        <p class="ques1"><span style="font-size:16px;">2.</span style="margin-left:10px;">2.您预期的消费 ？
                                <input type="text" style="width:62px;height:18px;margin-left:40px;margin-right:10px;"/>元</p>
                        
                        <p class="ques1"><span style="font-size:16px;">3.</span style="margin-left:10px;">      3.您的陪同人员？（可多选）
                                       
                        </p>
                        <p>
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;&nbsp;爱人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;&nbsp;朋友
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;&nbsp;儿子或女儿&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;&nbsp;父母
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </p>

                        <p class="ques1"><span style="font-size:16px;">3.</span style="margin-left:10px;">     4. 您喜欢的景点类型？（可多选）
                                       
                        </p>
                        <p><!--若改变复选框的内容字体的多少，可能形式会有点不同，可调整一下&nbsp;数量这个代表一个空格-->
                                <input type="checkbox" id="check2" style="position:relative;top:-2px;"/>&nbsp;
                                地文景观&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check2" style="position:relative;top:-2px;"/>&nbsp;
                                水域风光&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check2" style="position:relative;top:-2px;"/>&nbsp;
                                大气与太空景观&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <br/>
                                <input type="checkbox" id="check2" style="position:relative;top:-2px;"/>&nbsp;
                                生物景观&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check2" style="position:relative;top:-2px;"/>&nbsp;
                                文物古迹&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check2" style="position:relative;top:-2px;"/>&nbsp;
                                古典园林&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <br/>
                                <input type="checkbox" id="check2" style="position:relative;top:-2px;"/>&nbsp;
                                文学艺术&nbsp;&nbsp;&nbsp;&nbsp;
                                
                                <input type="checkbox" id="check2" style="position:relative;top:-2px;"/>&nbsp;
                                 宗教文化&nbsp;&nbsp;&nbsp;&nbsp;
                               
                                <input type="checkbox" id="check2" style="position:relative;top:-2px;"/>&nbsp;
                                城乡风貌
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <br/>
                                <input type="checkbox" id="check2" style="position:relative;top:-2px;"/>&nbsp;
                                现代设施&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check2" style="position:relative;top:-2px;"/>&nbsp;
                                名俗风情&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check2" style="position:relative;top:-2px;"/>&nbsp;
                                饮食与购物
                                
                        </p>
                        <p class="ques1"><span style="font-size:16px;">3.</span style="margin-left:10px;"> 
                                5.您的年龄段？
                                       
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
                        
                <input  id="input4" value=" " onclick="Answer()" /><!--回答问题-->
                
                        
                </div>
        </div>
        <div id="diabox3" style="display:none;">
                
               <!--链接到推荐页面--> <a href="Recommend.aspx" target="_blank"><input  id="input5" value=" " onclick="goToSee()"/></a>
                <input  id="input6" value=" " onclick="nogoToSee()"/>
        </div>
</div>
<script>
window.onload = function(){
initMap();//创建和初始化地图
Auto1();
}
</script>
</body>
</html>
