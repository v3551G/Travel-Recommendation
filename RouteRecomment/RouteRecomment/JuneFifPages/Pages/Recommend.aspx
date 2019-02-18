<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recommend.aspx.cs" Inherits="RouteRecomment.JuneFifPages.Pages.Recommend" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script src="../js/jquery.js"  type="text/javascript" ></script>
<script src="../js/recommended.js" type="text/javascript"></script>
<script src="../js/mousewheel.js" type="text/javascript" ></script>
<script src="../js/easyscroll.js" type="text/javascript" ></script>

<link rel="stylesheet" type="text/css"  href="../css/recommended.css" />
<link rel="stylesheet" type="text/css" href="../css/ways.css" /> <!--css-->
<link rel="stylesheet" type="text/css" href="../css/lunbo.css" /> <!--轮播css-->
<link rel="stylesheet" type="text/css" href="../css/jquery.jscrollpane.codrops2.css" />
<!--
<script type="text/javascript">$(function(){$('.div_scroll').scroll_absolute({arrows:true})});</script>   -->
<!-- .container2 arrows: false -->
<!--<script type="text/javascript">$(function(){$('.container2 .div_scroll').scroll_absolute({arrows:false})});</script>
    -->
<style type="text/css">

	*{margin:0;padding:0;list-style-type:none;}

a, input:focus, textarea:focus {
    outline: none;
}


.container2 .div_scroll p {

	font-size:12px;line-height:220%;text-align:left;
	padding-right:5px;
   
}	


.container2 {
   
	width: 240px;
	height: auto;
	background-color: none;
	float: left;
    /* */
   
   
}

.container2 .div_scroll {
	width: 100%;
	height: 592px;
	overflow: auto;
	float: left;
    position: relative;
        top: -12px;
        left: 0px;
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
    height: 16px;}

.content {
    width: 100%;
}
.content .MapAll {
    width: 100%;   
}

</style>

<title>推荐</title>


</head>

<body>
<div id="all-body">

<!--<img src="../imagesZ/bg-4.png"/>-->
       

<div id="all">
      
      <div id="header" >
         <div id="nav">
        
          <div id="seek-top">
	      	<div class="Cen">
		
			    <img src="../imagesZ/LOGO.png"/>
               
			    <div class="sousuo">                  
		          <input type="text" name="textSearchName"  id="seek-input"  onkeydown="searchProjectName()" node-type="loginname" autocomplete="off" placeholder="漓江" />
                  <div class="seek-button" onclick="searchProjectName()" title ="搜索"><a href='#'></a></div>
			    </div>
             
               <%--<div class="sousuo">
                   <form id="form1" runat="server">                   
                       <input  type="text" name="textSearchName"  id="seek-input"  onkeydown="searchProjectName()" node-type="loginname" autocomplete="off" placeholder="漓江" />
                   </form>
                 

                   <div class="seek-button" id="seek-button" title ="搜索"><a href="#"></a></div>
                    
               </div>--%>
                 
                <ul id="loginfirst" class="seek-login">
                    <li><a href="<%=person.ToString() %>" target="_blank"><%=login.ToString() %></a>
                <!--<li><a href="login1.aspx" target="_blank">登录</a></li>-->
                    </li>
                    <li><a href="zhuce.aspx" target="_blank">注册</a></li>
                </ul>
                 
   <script type="text/javascript">

       var ID;
       $(function () {
           $("#seek-button").click(function () {
               $.ajax({
                   type: "post", //要用post方式                 
                   url: "Recommend.aspx/searchSlaSLon",//方法所在页面和方法名
                   contentType: "application/json; charset=utf-8",
                   dataType: "json",
                   success: function (data) {
                       alert(data.d);//返回的数据用data.d获取内容，如果返回的是C#复杂对象这里返回的就是Json对象，这一点非常Nice
                       ID = data.d; //
                   },
                   error: function (err) {
                       alert(err);
                   }
               });
           });
       });

       //输入风景名称后触发此函数，实现模糊查询
       function searchProjectName() {

           //var clickSceName = document.getElementById("")
           var projectNameValue = document.getElementById("seek-input").value;
           PageMethods.searchSlaSLon(projectNameValue);                    //ajax技术
           //var myregExep = new RegExp("'" + projectNameValue + "'", "g");
           //存放查询到的项目名称
           var name = new Array();
           var j = 0;
           for (var i = 0; i < Sce.length; i++) {
               if (Sce[i].contains(projectNameValue)) {
                   name[j] = Sce[i];
                   j++;
               }
           }
           //绘制名称列表
           drawProjectNameList(name);
       }
       //绘制下拉框风景名称列表
       function drawProjectNameList(projectNameSet) {
           var strLi = "";
           //绘制项目名称列表
           for (var i = 0; i < projectNameSet.length; i++) {
               strLi += "<li id='li '" + i + "' '  onmouseover='setBackcolorOnmouse(this)' onclick='showSelectProjectName(this)' style='background-color:white'>" + projectNameSet[i] + "</li>";
           }
           document.getElementById("Itemtext").innerHTML = "";
           if (strLi != "")
               document.getElementById("Itemtext").innerHTML = strLi;
           //设置每个li的text值
           var liSet = document.getElementById("Itemtext").getElementsByTagName("li");
           for (var i = 0; i < liSet.length; i++) {
               liSet.item(i).text = projectNameSet[i];
           }
       }
       //鼠标移动到下拉风景名称是改变颜色
       function setBackcolorOnmouse(object) {
           //变色前先将之前的一项颜色和下滑线去掉
           var liSet = document.getElementById("Itemtext").getElementsByTagName("li");
           for (var i = 0; i < liSet.length; i++) {
               liSet.item(i).style.backgroundColor = "white";
               liSet.item(i).style.textDecoration = "";
           }
           //设置颜色和下滑线
           object.style.backgroundColor = "silver";
           object.style.textDecoration = "underline";
       }
       //鼠标点击下拉框中风景名称后，将其显示到搜索输入框
       function showSelectProjectName(object) {
           document.getElementById('seek-input').value = object.text;
       }

   </script>    

                <div id="logined">     
                     <p> Hi,<a href="">叶蓓kkkk子</a>您好！欢迎来到天际一线智慧一线智慧推荐旅游网<a href="" style="padding-left:20px;" >退出</a></p>             
                </div>
                <div id="weather">
                            <iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=12&bdc=%23&icon=1&num=1" width="190" height="80" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="float:left;margin-top:-5px;margin-left:8px;"></iframe>

                        </div>             
		   </div>		
	     </div>	     
       </div>
   </div>
   <!--header end-->

<div style="clear:both"></div>


          
<div id="content" class="content">
  <div id="MapAll" class="MapAll">    
        <div id="input">
            <input class="back-1" type="button"  id="button1" onclick="Auto1()" />
            <input class="back-2" type="button"  id="button2" onclick="Auto2()" />
            <input class="back-3" type="button"  id="button3" onclick="Auto3()" />
            <input class="back-4" type="button"  id="button4" onclick="Auto4()" />
            <input class="back-5" type="button"  id="button5" onclick="Auto5()" />
        </div>
            <!--左侧显示景点 -->       
        <div class="container2">
                <div id="wrapper" class="wrapper" >
                     
                    <div id="div_scroll" class="div_scroll"> 
                       		
	                </div>
                    <div id="text_right" class="text_right" >

                    </div>
                </div>
        </div>

        <script type ="text/javascript">
            //使用了jScrollPane和jQuery来实现这种滚动条显示和隐藏的美化效果
            var Scroll = function () {
                $(function () {
                    // the element we want to apply the jScrollPane
                    var $el = $('#div_scroll').jScrollPane({ //div_scroll
                        verticalGutter: -16
                    }),

                    // the extension functions and options 	
                        extensionPlugin = {

                            extPluginOpts: {
                                // speed for the fadeOut animation
                                mouseLeaveFadeSpeed: 500,
                                // scrollbar fades out after hovertimeout_t milliseconds
                                hovertimeout_t: 1000,
                                // if set to false, the scrollbar will be shown on mouseenter and hidden on mouseleave
                                // if set to true, the same will happen, but the scrollbar will be also hidden on mouseenter after "hovertimeout_t" ms
                                // also, it will be shown when we start to scroll and hidden when stopping
                                useTimeout: false,
                                // the extension only applies for devices with width > deviceWidth
                                deviceWidth: 980
                            },
                            hovertimeout: null, // timeout to hide the scrollbar
                            isScrollbarHover: false,// true if the mouse is over the scrollbar
                            elementtimeout: null,	// avoids showing the scrollbar when moving from inside the element to outside, passing over the scrollbar
                            isScrolling: false,// true if scrolling
                            addHoverFunc: function () {

                                // run only if the window has a width bigger than deviceWidth
                                if ($(window).width() <= this.extPluginOpts.deviceWidth) return false;

                                var instance = this;

                                // functions to show / hide the scrollbar
                                $.fn.jspmouseenter = $.fn.show;
                                $.fn.jspmouseleave = $.fn.fadeOut;

                                // hide the jScrollPane vertical bar
                                var $vBar = this.getContentPane().siblings('.jspVerticalBar').hide();

                                /*
                                    * mouseenter / mouseleave events on the main element
                                    * also scrollstart / scrollstop - @James Padolsey : http://james.padolsey.com/javascript/special-scroll-events-for-jquery/
                                    */
                                $el.bind('mouseenter.jsp', function () {

                                    // show the scrollbar
                                    $vBar.stop(true, true).jspmouseenter();

                                    if (!instance.extPluginOpts.useTimeout) return false;

                                    // hide the scrollbar after hovertimeout_t ms
                                    clearTimeout(instance.hovertimeout);
                                    instance.hovertimeout = setTimeout(function () {
                                        // if scrolling at the moment don't hide it
                                        if (!instance.isScrolling)
                                            $vBar.stop(true, true).jspmouseleave(instance.extPluginOpts.mouseLeaveFadeSpeed || 0);
                                    }, instance.extPluginOpts.hovertimeout_t);


                                }).bind('mouseleave.jsp', function () {

                                    // hide the scrollbar
                                    if (!instance.extPluginOpts.useTimeout)
                                        $vBar.stop(true, true).jspmouseleave(instance.extPluginOpts.mouseLeaveFadeSpeed || 0);
                                    else {
                                        clearTimeout(instance.elementtimeout);
                                        if (!instance.isScrolling)
                                            $vBar.stop(true, true).jspmouseleave(instance.extPluginOpts.mouseLeaveFadeSpeed || 0);
                                    }

                                });

                                if (this.extPluginOpts.useTimeout) {

                                    $el.bind('scrollstart.jsp', function () {

                                        // when scrolling show the scrollbar
                                        clearTimeout(instance.hovertimeout);
                                        instance.isScrolling = true;
                                        $vBar.stop(true, true).jspmouseenter();

                                    }).bind('scrollstop.jsp', function () {

                                        // when stop scrolling hide the scrollbar (if not hovering it at the moment)
                                        clearTimeout(instance.hovertimeout);
                                        instance.isScrolling = false;
                                        instance.hovertimeout = setTimeout(function () {
                                            if (!instance.isScrollbarHover)
                                                $vBar.stop(true, true).jspmouseleave(instance.extPluginOpts.mouseLeaveFadeSpeed || 0);
                                        }, instance.extPluginOpts.hovertimeout_t);

                                    });

                                    // wrap the scrollbar
                                    // we need this to be able to add the mouseenter / mouseleave events to the scrollbar
                                    var $vBarWrapper = $('<div/>').css({
                                        position: 'absolute',
                                        left: $vBar.css('left'),
                                        top: $vBar.css('top'),
                                        right: $vBar.css('right'),
                                        bottom: $vBar.css('bottom'),
                                        width: $vBar.width(),
                                        height: $vBar.height()
                                    }).bind('mouseenter.jsp', function () {

                                        clearTimeout(instance.hovertimeout);
                                        clearTimeout(instance.elementtimeout);

                                        instance.isScrollbarHover = true;

                                        // show the scrollbar after 100 ms.
                                        // avoids showing the scrollbar when moving from inside the element to outside, passing over the scrollbar								
                                        instance.elementtimeout = setTimeout(function () {
                                            $vBar.stop(true, true).jspmouseenter();
                                        }, 100);

                                    }).bind('mouseleave.jsp', function () {

                                        // hide the scrollbar after hovertimeout_t
                                        clearTimeout(instance.hovertimeout);
                                        instance.isScrollbarHover = false;
                                        instance.hovertimeout = setTimeout(function () {
                                            // if scrolling at the moment don't hide it
                                            if (!instance.isScrolling)
                                                $vBar.stop(true, true).jspmouseleave(instance.extPluginOpts.mouseLeaveFadeSpeed || 0);
                                        }, instance.extPluginOpts.hovertimeout_t);

                                    });

                                    $vBar.wrap($vBarWrapper);

                                }

                            }

                        },

                        // the jScrollPane instance
                        jspapi = $el.data('jsp');

                    // extend the jScollPane by merging	
                    $.extend(true, jspapi, extensionPlugin);
                    jspapi.addHoverFunc();

                });
            }
            Scroll();
      </script>

      <div id="dituContents" >    
            <!--显示标记地图 -->
            <div id="map">
             
             
            </div><!--map end-->
            <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=C51768d657a80ebc94d29815b53b7415"></script>
            <script type="text/javascript">
                // 百度地图API功能
                //var map = new BMap.Map("map");  //参数map为id
                //map.centerAndZoom(new BMap.Point(110.305112,25.284055), 10);
                //map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
                //map.enableContinuousZoom();     //启用地图惯性拖拽，默认禁用图

                //var a1 = '{w:21,h:34,l:';
                var count = 0;
                //var a2;
                //var a3 = ',t:0,x:6,lb:5}';
                //"小红帽句柄"
                var a1 = [];
                var a2 = [];
                var a3 = [];
                var a4 = [];
                var a5 = [];
                //线路句柄
                var ra1;
                var ra2;
                var ra3;
                var ra4;
                var ra5;
                //线路景点名称作为ID
                var SceName1 = [];
                var SceName2 = [];
                var SceName3 = [];
                var SceName4 = [];
                var SceName5 = [];

                var sContent;
                var markerArr;
                var pointArr;
                var pointArrs;

                //+++添加
                function initMap() {
                    createMap();    //创建地图
                    setMapEvent();  //设置地图事件
                    addMapControl();//向地图添加控件
                    //addMarker();  //向地图中添加marker
                }
                //创建地图函数
                function createMap() {
                    var map = new BMap.Map("map");                    //参数id=map
                    var point = new BMap.Point(110.173211, 25.161358);//定义一个中心点坐标  110度17分32.11秒,北纬25度16分13.58   110.305112, 25.284055
                    map.centerAndZoom(point, 10);                     //设定地图的中心点和坐标并将地图显示在地图容器中
                    window.map = map;                                 //将map变量存储在全局
                    //enableMassClear();
                }
                //地图事件设置函数
                function setMapEvent() {
                    map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
                    map.enableContinuousZoom();     //启用地图惯性拖拽，默认禁用图

                }
                //地图控件添加函数
                function addMapControl() {
                    //向地图中添加缩放控件
                    var ctrl_nav = new BMap.NavigationControl({ anchor: BMAP_ANCHOR_TOP_LEFT, type: BMAP_NAVIGATION_CONTROL_LARGE });
                    map.addControl(ctrl_nav);
                    //向地图中添加比例尺控件
                    var ctrl_sca = new BMap.ScaleControl({ anchor: BMAP_ANCHOR_BOTTOM_LEFT });
                    map.addControl(ctrl_sca);
                }

                //绘制线路
                function drivingRoute() {
                    var wholep = new Array;
                    var driving = new BMap.DrivingRoute(map);//创建驾车实例
                    var temp;
                    for (var i = 0; i < pointArr.length; i++) {  //获取数组
                        var temp = pointArr[i].split(',');
                        var leftp = temp[1].split("|")[0]; //经度
                        var rightp = temp[1].split("|")[1];//维度
                        wholep[i] = new BMap.Point(rightp, leftp); //存储路线中的各个景点
                    }
                    //驾车搜索
                    for (var k = 0; k < wholep.length; k++) {
                        if (k + 1 < wholep.length)
                            driving.search(wholep[k + 1], wholep[k]);
                    }
                    setTimeout(function () {
                        map.setViewport(wholep);          //调整到最佳视野
                    }, 1000);

                    driving.setSearchCompleteCallback(function () {
                        var pts = driving.getResults().getPlan(0).getRoute(0).getPath();    //通过驾车实例，获得一系列点的数组
                        var polyline = new BMap.Polyline(pts); //创建折线   
                        map.addOverlay(polyline);              //添加折线覆盖物

                        for (var j = 0; j < pointArr.length; j++) {
                            var whole;
                            var temp = pointArr[j].split(',');
                            var left = temp[1].split("|")[0];
                            var right = temp[1].split("|")[1];
                            whole = new BMap.Point(right, left);

                            var icon =
                            {
                                w: 21,
                                h: 34,
                                l: j * 21,
                                t: 0,
                                lb: 5
                            };
                            //var icon = {w:21,h:34,l:21,t:0,x:6,lb:5};
                            /*   暂时关闭
                            var iconImg = createIcon(icon);
                            var m=new BMap.Marker(whole,{icon:iconImg}); //标记图形
                    
                            map.addOverlay(m);
                            var lab= new BMap.Label(temp[0],{position:whole});   //景点名
                            map.addOverlay(lab);
                            */
                            //高亮显示关键字
                            //HighLight(temp[0]);
                        }
                        var time = driving.getResults().getPlan(0).getDuration(true);       //获取时间
                        var distance = driving.getResults().getPlan(0).getDistance(true);     //获取距离
                        var doc = document.getElementById("r-result");
                        //alert("时间为："+time);
                        return driving;
                    });
                }

                //创建一个Icon
                function createIcon(json) {
                    var icon = new BMap.Icon("../EleImages/百度地图Marker（A）.png",
                                new BMap.Size(json.w, json.h),
                                {
                                    imageOffset: new BMap.Size(-json.l, -json.t), infoWindowOffset: new BMap.Size(json.lb + 5, 1),
                                    offset: new BMap.Size(json.x, json.h)
                                })
                    return icon;
                }
                function addMapControl() {
                    //向地图中添加缩放控件
                    var ctrl_nav = new BMap.NavigationControl({ anchor: BMAP_ANCHOR_TOP_LEFT, type: BMAP_NAVIGATION_CONTROL_LARGE });
                    map.addControl(ctrl_nav);
                    //向地图中添加比例尺控件
                    var ctrl_sca = new BMap.ScaleControl({ anchor: BMAP_ANCHOR_BOTTOM_LEFT });
                    map.addControl(ctrl_sca);
                }

                function Auto() {
                    var Arr = '<%=RecommendRotes()%>';
                    pointArr = Arr.split('*')[0];
                    //alert(pointArr);
                    pointArr = pointArr.trim().split('-');
                    var a = drivingRoute();
                }
                // A();
                var Sla;
                var Slon;
                var SlaSln = new Array;
                var RouInfo = new Array;
                var Info = "";
                var pointAr;
                var pointArr = new Array;

                function Auto1() {

                    var Arr = '<%=RecommendRotes()%>';
                //alert("Arr:" + Arr);
                var getRI = '<%=getFirRouteInfo()%>';
                //alert("getRI:" + getRI); //
                if (getRI.length == 0)
                    alert("抱歉，目前没有能满足您要求的旅游线路.");
                if (getRI.length != 0) {
                    RouInfo = getRI.split('|');

                    pointAr = Arr.split('*')[0];
                    pointArr = pointAr.split('-');
                    //alert("pointArr:" + pointArr);
                    //var a = drivingRoute(); //
                    if (document.getElementById("button1").className == "back-1") {
                        for (var i = 0; i < pointArr.length ; i++) {
                            sContent =
                            "<img style='float:right;margin:4px' id='imgDemo' src='" + RouInfo[8 * i + 5] + "' width='139' height='104' title='" + RouInfo[8 * i] + "'/>" +
                            "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>" + RouInfo[8 * i + 1] + "</p>" +
                            "</div>";
                            markerArr = [{ title: RouInfo[8 * i], content: sContent, point: RouInfo[8 * i + 3] + "|" + RouInfo[8 * i + 4], isOpen: 0, icon: { w: 20, h: 26, l: 110, t: 34, x: 9, lb: 12 } }
                            ];

                            Info = "";//依次为：景点名称 景点地址 “详细”跳转url  适游时间 到下一点时间  计数
                            Info += RouInfo[8 * i];
                            Info += "|";
                            Info += RouInfo[8 * i + 1]; //
                            Info += "|";
                            Info += RouInfo[8 * i + 2]; //
                            Info += "|";
                            Info += RouInfo[8 * i + 6];
                            Info += "|";
                            if (i == pointArr.length - 1)
                                Info += "";
                            else
                                Info += RouInfo[8 * i + 7];
                            Info += "|";
                            Info += (i + 1).toString();
                            //alert("Auto1-Info:" + Info);//Test
                            a1[i] = addMarker();
                            SceName1[i] = RouInfo[8 * i];
                        }
                        ra1 = drivingRoute();
                        document.getElementById("button1").className = "back-10";

                    }
                    else {
                        document.getElementById("button1").className = "back-1";
                        //清空地图上覆盖的景点信息
                        for (var j = 0; j < a1.length; j++)
                            map.removeOverlay(a1[j]);
                        a1 = "";

                        //清空左边显示的景点信息
                        var parDiv = document.getElementsByClassName('div_scroll')[0]; //jspPane 
                        //alert(parDiv.id);
                        //alert(SceName.length);
                        for (var SceCount = 0; SceCount < SceName1.length; SceCount++) {
                            var SceTemp = document.getElementById(SceName1[SceCount]);
                            parDiv.removeChild(SceTemp);
                        }
                        //SceName1 = "";
                        //parDiv = "";
                        //map.removeOverlay(ra1.polyline);
                        //ra1 = "";
                        map.clearOverlays();

                    }
                    Scroll();
                }

            }
            //Auto1();

            function Auto2() {
                var Arr = '<%=RecommendRotes()%>';
                var getRI = '<%=getSecRouteInfo()%>';
                var count = Arr.split('*').length;
                //alert("getRI:" + getRI); //
                if (getRI == "")
                    alert("只推荐出来" + count + "条线路！");
                if (getRI != "") {
                    RouInfo = getRI.trim().split('|');
                    pointAr = Arr.split('*')[1];
                    pointArr = pointAr.trim().split('-');
                    if (document.getElementById("button2").className == "back-2") {
                        for (var i = 0; i < pointArr.length ; i++) {
                            sContent =
                            "<img style='float:right;margin:4px' id='imgDemo' src='" + RouInfo[8 * i + 5] + "' width='139' height='104' title='" + RouInfo[8 * i] + "'/>" +
                            "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>" + RouInfo[8 * i + 1] + "</p>" +
                            "</div>";
                            markerArr = [{ title: RouInfo[8 * i], content: sContent, point: RouInfo[8 * i + 3] + "|" + RouInfo[8 * i + 4], isOpen: 0, icon: { w: 20, h: 26, l: 110, t: 34, x: 9, lb: 12 } }
                            ];

                            Info = "";//依次为：景点名称 景点地址 “详细”跳转url  适游时间 到下一点时间  计数   
                            Info += RouInfo[8 * i];
                            Info += "|";
                            Info += RouInfo[8 * i + 1]; //
                            Info += "|";
                            Info += RouInfo[8 * i + 2]; //
                            Info += "|";
                            Info += RouInfo[8 * i + 6];
                            Info += "|";
                            if (i == pointArr.length - 1)
                                Info += "";
                            else
                                Info += RouInfo[8 * i + 7];
                            Info += "|";
                            Info += (i + 1).toString();
                            //alert("Auto1-Info:" + Info);//Test
                            SceName2[i] = RouInfo[8 * i];
                            a1[i] = addMarker();
                        }
                        document.getElementById("button2").className = "back-11";
                        ra2 = drivingRoute();

                    }
                    else {
                        document.getElementById("button2").className = "back-2";
                        for (var j = 0; j < a2.length; j++)
                            map.removeOverlay(a2[j]);
                        a2 = "";

                        //清空左边的显示
                        var parDiv = document.getElementsByClassName('div_scroll')[0]; //jspPane
                        //alert(parDiv.id);
                        //alert(SceName.length);
                        for (var SceCount = 0; SceCount < SceName2.length; SceCount++) {
                            var SceTemp = document.getElementById(SceName2[SceCount]);
                            parDiv.removeChild(SceTemp);
                        }
                        //SceName2 = "";
                        //parDiv = "";
                        //map.removeOverlay(ra2.polyline);
                        //ra2 = "";
                        map.clearOverlays();
                    }

                }
                Scroll();
            }

            function Auto3() {
                var Arr = '<%=RecommendRotes()%>';
                var getRI = '<%=getThiRouteInfo()%>';
                var count = Arr.split('*').length;
                //alert("getRI:" + getRI); //
                if (getRI == "")
                    alert("只推荐出来" + count + "条线路！");
                if (getRI != "") {
                    RouInfo = getRI.split('|');
                    pointAr = Arr.split('*')[2];
                    pointArr = pointAr.trim().split('-');
                    if (document.getElementById("button3").className == "back-3") {
                        for (var i = 0; i < pointArr.length ; i++) {
                            sContent =
                            "<img style='float:right;margin:4px' id='imgDemo' src='" + RouInfo[8 * i + 5] + "' width='139' height='104' title='" + RouInfo[8 * i] + "'/>" +
                            "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>" + RouInfo[8 * i + 1] + "</p>" +
                            "</div>";
                            //markerArr = [{ title: SceneryInfo[i * 6], content: sContent, point: SceneryInfo[i * 6 + 2] + "|" + SceneryInfo[i * 6 + 3], isOpen: 0, icon: { w: 20, h: 26, l: 110, t: 34, x: 9, lb: 12 } }
                            //];         //景点名称 [图片路径 景点名称 景点简介] [经度 纬度] 
                            //url = "Scenery.aspx?SceneryID=" + SceneryInfo[i * 6 + 4]; //
                            markerArr = [{ title: RouInfo[8 * i], content: sContent, point: RouInfo[8 * i + 3] + "|" + RouInfo[8 * i + 4], isOpen: 0, icon: { w: 20, h: 26, l: 110, t: 34, x: 9, lb: 12 } }
                            ];
                            Info = "";//依次为：景点名称 景点地址 “详细”跳转url  适游时间 到下一点时间  计数
                            Info += RouInfo[8 * i];
                            Info += "|";
                            Info += RouInfo[8 * i + 1]; //
                            Info += "|";
                            Info += RouInfo[8 * i + 2]; //
                            Info += "|";
                            Info += RouInfo[8 * i + 6];
                            Info += "|";
                            if (i == pointArr.length - 1)
                                Info += "";
                            else
                                Info += RouInfo[8 * i + 7];
                            Info += "|";
                            Info += (i + 1).toString();
                            //alert("Auto1-Info:" + Info);//Test
                            SceName3[i] = RouInfo[8 * i];
                            a3[i] = addMarker();
                        }
                        document.getElementById("button3").className = "back-12";
                        ra3 = drivingRoute();

                    }
                    else {
                        for (var j = 0; j < a3.length; j++)
                            map.removeOverlay(a3[j]);
                        a3 = "";
                        document.getElementById("button3").className = "back-3";

                        //清空左边的显示
                        var parDiv = document.getElementsByClassName('div_scroll')[0]; //jspPane
                        //alert(parDiv.id);
                        //alert(SceName.length);
                        for (var SceCount = 0; SceCount < SceName3.length; SceCount++) {
                            var SceTemp = document.getElementById(SceName3[SceCount]);
                            parDiv.removeChild(SceTemp);
                        }
                        //SceName3 = "";
                        //parDiv = "";
                        //map.removeOverlay(ra3.polyline);
                        //ra3 = "";
                        map.clearOverlays();
                    }
                }
                Scroll();
            }

            function Auto4() {
                var Arr = '<%=RecommendRotes()%>';
                var getRI = '<%=getForRouteInfo()%>';
                var count = Arr.split('*').length;
                //alert("getRI:" + getRI); //
                if (getRI == "")
                    alert("只推荐出来" + count + "条线路！");
                if (getRI != "") {
                    RouInfo = getRI.split('|');
                    pointAr = Arr.split('*')[3];
                    pointArr = pointAr.trim().split('-');
                    if (document.getElementById("button4").className == "back-4") {
                        for (var i = 0; i < pointArr.length ; i++) {
                            //var SceID = parseInt(url[3][i].split('=')[1].toString());
                            sContent =
                            "<img style='float:right;margin:4px' id='imgDemo' src='" + RouInfo[8 * i + 5] + "' width='139' height='104' title='" + RouInfo[8 * i] + "'/>" +
                            "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>" + RouInfo[8 * i + 1] + "</p>" +
                            "</div>";
                            //markerArr = [{ title: SceneryInfo[i * 6], content: sContent, point: SceneryInfo[i * 6 + 2] + "|" + SceneryInfo[i * 6 + 3], isOpen: 0, icon: { w: 20, h: 26, l: 110, t: 34, x: 9, lb: 12 } }
                            //];         //景点名称 [图片路径 景点名称 景点简介] [经度 纬度] 
                            //url = "Scenery.aspx?SceneryID=" + SceneryInfo[i * 6 + 4]; //
                            //SlaSln = pointArr[i].split(',')[1].split('|');
                            markerArr = [{ title: RouInfo[8 * i], content: sContent, point: RouInfo[8 * i + 3] + "|" + RouInfo[8 * i + 4], isOpen: 0, icon: { w: 20, h: 26, l: 110, t: 34, x: 9, lb: 12 } }
                            ];
                            Info = "";//依次为：景点名称 景点地址 “详细”跳转url  适游时间 到下一点时间  计数
                            Info += RouInfo[8 * i];
                            Info += "|";
                            Info += RouInfo[8 * i + 1]; //
                            Info += "|";
                            Info += RouInfo[8 * i + 2]; //
                            Info += "|";
                            Info += RouInfo[8 * i + 6];
                            Info += "|";
                            if (i == pointArr.length - 1)
                                Info += "";
                            else
                                Info += RouInfo[8 * i + 7];
                            Info += "|";
                            Info += (i + 1).toString();
                            //alert("Auto1-Info:" + Info);//Test
                            SceName4[i] = RouInfo[8 * i];
                            a4[i] = addMarker();
                        }
                        document.getElementById("button4").className = "back-13";
                        ra4 = drivingRoute();
                    }
                    else {

                        for (var j = 0; j < a4.length; j++)
                            map.removeOverlay(a4[j]);
                        a4 = "";
                        document.getElementById("button4").className = "back-4";


                        //清空左边的显示
                        var parDiv = document.getElementsByClassName('div_scroll')[0]; //jspPane
                        //alert(parDiv.id);
                        //alert(SceName.length);
                        for (var SceCount = 0; SceCount < SceName4.length; SceCount++) {
                            var SceTemp = document.getElementById(SceName4[SceCount]);
                            parDiv.removeChild(SceTemp);
                        }
                        //SceName4 = "";
                        //parDiv = "";
                        //map.removeOverlay(ra4.polyline);
                        //ra4 = "";
                        map.clearOverlays();
                    }
                }
                Scroll();
            }

            function Auto5() {
                var Arr = '<%=RecommendRotes()%>';
                var getRI = '<%=getFifRouteInfo()%>';
                var count = Arr.split('*').length;
                //alert("getRI:" + getRI); //
                if (getRI == 0)
                    alert("只推荐出来" + count + "条线路！");
                if (getRI != "") {
                    RouInfo = getRI.split('|');
                    pointAr = Arr.split('*')[4];
                    pointArr = pointAr.trim().split('-');

                    if (document.getElementById("button5").className == "back-5") {
                        for (var i = 0; i < pointArr.length ; i++) {
                            //var SceID = parseInt(url[4][i].split('=')[1].toString());
                            sContent =
                            "<img style='float:right;margin:4px' id='imgDemo' src='" + RouInfo[8 * i + 5] + "' width='139' height='104' title='" + RouInfo[8 * i] + "'/>" +
                            "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>" + RouInfo[8 * i + 1] + "</p>" +
                            "</div>";
                            //markerArr = [{ title: SceneryInfo[i * 6], content: sContent, point: SceneryInfo[i * 6 + 2] + "|" + SceneryInfo[i * 6 + 3], isOpen: 0, icon: { w: 20, h: 26, l: 110, t: 34, x: 9, lb: 12 } }
                            //];         //景点名称 [图片路径 景点名称 景点简介] [经度 纬度] 
                            //url = "Scenery.aspx?SceneryID=" + SceneryInfo[i * 6 + 4]; //
                            //SlaSln = pointArr[i].split(',')[1].split('|');
                            markerArr = [{ title: RouInfo[8 * i], content: sContent, point: RouInfo[8 * i + 3] + "|" + RouInfo[8 * i + 4], isOpen: 0, icon: { w: 20, h: 26, l: 110, t: 34, x: 9, lb: 12 } }
                            ];
                            Info = "";//依次为：景点名称 景点地址 “详细”跳转url  适游时间 到下一点时间  计数
                            Info += RouInfo[8 * i];
                            Info += "|";
                            Info += RouInfo[8 * i + 1]; //
                            Info += "|";
                            Info += RouInfo[8 * i + 2]; //
                            Info += "|";
                            Info += RouInfo[8 * i + 6];
                            Info += "|";
                            if (i == pointArr.length - 1)
                                Info += "";
                            else
                                Info += RouInfo[8 * i + 7];
                            Info += "|";
                            Info += (i + 1).toString();
                            //alert("Auto1-Info:" + Info);//Test
                            SceName5[i] = RouInfo[8 * i];
                            a5[i] = addMarker();
                        }
                        document.getElementById("button5").className = "back-14";
                        ra5 = drivingRoute();
                    }
                    else {
                        for (var j = 0; j < a5.length; j++)
                            map.removeOverlay(a5[j]);
                        a5 = "";
                        document.getElementById("button5").className = "back-5";

                        //清空左边的显示
                        var parDiv = document.getElementsByClassName('div_scroll')[0]; //jspPane
                        //alert(parDiv.id);
                        //alert(SceName.length);
                        for (var SceCount = 0; SceCount < SceName5.length; SceCount++) {
                            var SceTemp = document.getElementById(SceName5[SceCount]);
                            parDiv.removeChild(SceTemp);
                        }
                        //SceName5 = "";
                        //parDiv = "";
                        //map.removeOverlay(ra5.polyline);
                        //ra5 = "";
                        map.clearOverlays();
                    }
                }
                Scroll();
            }

            //创建marker
            function addMarker() {
                for (var i = 0; i < markerArr.length; i++) {
                    var json = markerArr[i];
                    var p0 = json.point.split("|")[0];   //经度
                    var p1 = json.point.split("|")[1];   //维度
                    var point = new BMap.Point(p0, p1);  //定位点
                    var iconImg = createIcon(json.icon); //标注的形状、位置
                    var marker = new BMap.Marker(point, { icon: iconImg });//景点标注
                    var iw = createInfoWindow(i);        //创建信息框
                    var label = new BMap.Label(json.title, { "offset": new BMap.Size(json.icon.lb - json.icon.x + 10, -20) });  //地图上的文本标注
                    marker.setLabel(label);
                    label.hide();
                    marker.href = '#' + json.title;
                    map.addOverlay(marker);            //标注覆盖图层

                    /*  setTimeout(function(){
                        map.setViewport(point);          //调整到最佳视野
                                },1000);*/

                    //alert("addMarker-Info:" + Info);//
                    createDiv(Info);                   //创建窗口左边的景点介绍
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
                    //对marker进行事件监听： mouseover/mouseout/close/click
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
                    marker.addEventListener("click", function () {
                        marker.openInfoWindow(iw);
                        // var m =document.createElement('a');
                        // m.href = '#' + json.title;
                        // m.onclick = "";
                        // m.click();

                        var Id = document.getElementById(json.title);
                        if (Id) {
                            var S = document.getElementsByClassName('jspPane')[0];//jspPane     div_scroll
                            Id.offsetTop = 0;
                            var t = Id.offsetTop;
                            S.style.top = -t + 'px';
                        }

                    })
                    //alert(json.title);
                    //对左侧景点名称A进行事件监听： mouseover/mouseout/close/click
                    A.addEventListener('click', function () {
                        marker.openInfoWindow(iw);
                    });
                    A.addEventListener('mouseover', function () {
                        //  marker.openInfoWindow(iw);
                        json.icon.t = 0;
                        var iconImg1 = createIcon(json.icon);
                        marker.setIcon(iconImg1);
                    });
                    A.addEventListener('mouseout', function () {
                        marker.setIcon(iconImg);
                    });
                    //对信息框iw进行事件监听
                    iw.addEventListener("close", function () {
                        marker.setIcon(iconImg);
                        B[0].className = 'aa';
                        json.isOpen = 0;
                    })
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
            //创建信息窗口
            function createInfoWindow(i) {
                var json = markerArr[i];
                var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>" + json.content + "</div>");
                return iw;
            }
            //创建左侧景点信息
            function createDiv(EleInfo) {
                var InfoArr = new Array;
                var count = EleInfo.split("|").length;
                for (var Elei = 0; Elei < count; Elei++)
                    InfoArr[Elei] = EleInfo.split("|")[Elei];
                //alert("createDiv-EleInfo:" + EleInfo);//
                //alert("createDIv-InfoArr:" + InfoArr);//
                var a = document.createElement("a"); //a
                a.className = 'txt';
                a.href = "javascript:void(0);"
                a.id = InfoArr[0];
                // a.name = InfoArr[0];

                //InfoArr:景点名称 景点地址 “详细”跳转url  适游时间 到下一点时间  计数
                //用JavaScript代码编写XHTML页面
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
                a1.innerHTML = "详情";
                a1.onmousemove = function () { this.style.color = "#F00" };
                a1.onmouseout = function () { this.style.color = "blue" };
                a.appendChild(a1);

                var p1 = document.createElement("p");
                p1.innerHTML = "地址：" + InfoArr[1];
                a.appendChild(p1);

                var p2 = document.createElement("p");
                p2.innerHTML = "&nbsp&nbsp&nbsp适游时间：" + InfoArr[3] + "分钟";
                a.appendChild(p2);

                var p3 = document.createElement("p");
                p3.innerHTML = "&nbsp&nbsp&nbsp到下一景点时间：" + InfoArr[4] + "分钟";
                a.appendChild(p3);

                var pDiv = document.getElementsByClassName('div_scroll')[0]; //  div_scroll
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
<!--推荐结果游记部分 -->
     <div style="clear:both"></div> 
           
           
     <div id="gonglue">
         <div id="biaoti">
              <h1> <img src="../imagesZ/hand.png">与推荐结果相关的游记</h1>
         </div>
           <%
           String RoteArr = RecommendRotes();
           String RotesArr = RoteArr.Split('*')[0]; //只取一条线路
           String[] pointArr = RotesArr.Trim().Split('-'); //每个元素格式：景点，经度|纬度
           for (int i = 0; i < TxtFP[0].Length; i++)
           {   
               
               String Content = GetTxt(TxtFP[0][i]);
               String FullContent="";
               String ShenLue="";
               if (Content.Length > 400)
               {
                    //1.判断乱码的位置
                    //2.根据位置来截取
                 if(Content.Contains("Baidu Button END"))
                 {
                    //先从这个位置直接截取后面的内容
                    
                     int S = Content.IndexOf("Baidu Button END");
                     ShenLue = Content.Substring(S+16,Content.Length-16-S);
                     if(ShenLue.Length>150)
                         ShenLue = ShenLue.Substring(0, 150);      
                 }
                 else
                 {
                     if (Content.Trim().Length > 150)
                       ShenLue = Content.Trim().Substring(0, 150);
                     else
                       ShenLue = Content;  
                 }

                 FullContent = TxtFP[0][i]+"|";
                   
                 for (int j = 0; j < pointArr.Length; j++)
                 {

                     var temp = pointArr[j].Split(','); 
                     String geshi = "<b style='color:Red;'>" + temp[0] + "</b>";
                     if (ShenLue.Contains(temp[0]))
                         ShenLue = ShenLue.Replace(temp[0], geshi);


                     FullContent += temp[0];
                     FullContent +="|";
                 } 
                 FullContent = FullContent.Substring(0,FullContent.Length-1);
               }

               int Star = Content.LastIndexOf("本文地址：");
               String Url = " ";

               Url = "newpage.aspx?FP=" + FullContent;  //FullContent格式：景点|景点|景点
               //
               Random RD = new Random();
               int RandomNum =0;
               String ScePicURL = "";
               int Minite = DateTime.Now.Millisecond;
               if (PicUrlList.Count != 0)
               {
                   RandomNum = Minite % PicUrlList.Count;
                   ScePicURL = PicUrlList[RandomNum]; //从PicUrlList中随机选择一张图片
               }
               else
                   ScePicURL = "../imagesH/back-img.png";
                       
               %>
               
                <div id="g-1">
                     <div id="images"><img src= <%=ScePicURL%>   width="201" height="120" alt="tupian"></div>
                     <div id="text-1">
                        <h3>第<%=i+1 %>篇相关游记</h3>
                        <a href=""></a>
                <p  style="text-indent:2em;"><%=ShenLue.Trim()%>...</p>
                        <p id="xq"><a href=<%=Url %> target="_blank">详情>></a></p>
                     </div>
                </div>

            
              <%
           }
           %>
               
      </div>                
   </div> <!--end content-->

            
 <!--精灵的代码-->
      <div style="clear:both"></div>
      <div id="blue-line"></div>
      <div id="footer" >
         <p>友情链接：美团 |  淘宝旅游  | 去哪儿  |  马蜂窝  |  携程  |  同城  |  豆瓣  |  百度旅游  |</p><br />
         <p>网络文化经营许可证：文网文[2010]040号|增值电信业务经营许可证：浙B2-20080224-1|信息网络传播视听节目许可证：1109364号</p>
      
      </div>
     
     </div>
</div>
    <script type="text/javascript">
        //初始时执行Auto1()
        window.onload = function () {
            initMap();//创建和初始化地图
            Auto1();
        }
    </script>
</body>

</html>

