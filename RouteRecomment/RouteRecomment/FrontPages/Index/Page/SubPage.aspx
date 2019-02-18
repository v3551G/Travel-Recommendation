<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubPage.aspx.cs" Inherits="RouteRecomment.FrontPages.Index.Page.SubPage" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
	<title>路线推荐</title>
	<link rel="stylesheet" type="text/css" href="../css/ways.css"><!--css-->
	<link rel="stylesheet" type="text/css" href="../css/lunbo.css"><!--轮播css-->
	<script type="text/javascript" src="../Js/jquery.1.4.2-min.js"></script>
	<script type="text/javascript" src="../Js/lunbo.js"></script><!--轮播的特效-->
	<script type="text/javascript" src="../Js/tab.js"></script><!--选项卡-->
    <!--  <script type="text/javascript" src="../Js/Map.js"></script> 地图-->
    <script type="text/javascript" src="../Js/jquery.velocity.min.js"></script>

	<style>
	.seek-body{margin-left:-510px;left:50%;width:1020px;
		position:relative;/*top:-1423px;*/z-index:0;}


.seek-login-after{list-style-type:none;position:relative;left:810px;top:-115px;/*width:100px;*/
    font-size:18px;font-family:黑体;line-height:25px;}
.seek-login-after li{margin-left:45px;clear:top;color:#000;}
.seek-login-after li a{color:#000;text-decoration:none;}



</style>
<script>

</script>

</head>
<body>
	<form runat="server">	
	<!--搜索框-->
	<div id="seek-top">
		<div class="Cen">
			<img src="../images/LOGO.png"/>
			<div class="sousuo">
				
			<input type="text" name="text" id="seek-input" node-type="loginname" autocomplete="off" placeholder="云南丽江">
			
			<div class="seek-button" title="搜索"><a href="#"></a></div>
			</div>
			<ul class="seek-login-after">
                <li><a href="" title="天际一线">天际一线</a></li>
                <li>欢迎来到路线推荐网</li>
            </ul>
                </div>
			
	</div>
	<!-- <img class="back-img" src="../images/back-img.png" /> -->
	<!--body-->
	<div class="seek-body">


		<!--轮播-->
		<div class="lunbo clearfix">

<div id="focus">
<ul>
    <li><a href="" target="_blank" title=""><img alt="" src="../images/01.jpg" /></a></li>
    <li><a href="" target="_blank" title=""><img alt="" src="../images/02.jpg" /></a></li>
    <li><a href="" target="_blank" title=""><img alt="" src="../images/03.jpg" /></a></li>
    <li><a href="" target="_blank" title=""><img alt="" src="../images/04.jpg" /></a></li>
    <li><a href="" target="_blank" title=""><img alt="" src="../images/05.jpg" /></a></li>
</ul>
</div>
</div> <!-- lunbo End -->


<style>
#dituContent{width:628px;height:550px;background:#f2f1ec;margin-left:3px;
border:#ccc solid 1px;margin-left:3px;margin-top:-3px;}
.iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap;}
    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word;}
    #MapAll{width:635px;height:639px;float:left;margin-top:30px;}
    #Map{background:#5dade2;width:635px;height:89px;padding-top:10px;border-radius:5px;}
    /*#Map{width:640px;height:89px;padding-top:10px;border-radius:5px;}*/
  #Map input{cursor:pointer;width:110px;height:44px;background:red;margin-left:10px;border:none;}
  #Map input:hover,#Map input:link,#Map input:visited{border:none;}
  #Map .back-0{background:url(../images/shopping-1.png) no-repeat;}
    #Map .back-1{background:url(../images/spots-1.png) no-repeat;}
      #Map .back-2{background:url(../images/grogshop-1.png) no-repeat;}
        #Map .back-3{background:url(../images/food-1.png) no-repeat;}
          #Map .back-4{background:url(../images/pastime-1.png) no-repeat;}


#Map .back-10{background:url(../images/shopping-2.png) no-repeat;}
    #Map .back-11{background:url(../images/spots-2.png) no-repeat;}
      #Map .back-12{background:url(../images/grogshop-2.png) no-repeat;}
        #Map .back-13{background:url(../images/food-2.png) no-repeat;}
          #Map .back-14{background:url(../images/pastime-2.png) no-repeat;}


          
</style>
<div id="MapAll">
<div id="Map">
 <input class="back-0" type="button"  id="button1" onclick="Auto1()"/>
 <input class="back-1" type="button"  id="button2" onclick="Auto2()"/>
 <input class="back-2" type="button"  id="button3" onclick="Auto3()"/>
 <input class="back-3" type="button"  id="button4" onclick="Auto4()"/>
 <input class="back-4" type="button"  id="button5" onclick="Auto5()"/>


  <!--百度地图容器-->
  <div id="dituContent"></div></div>
</div>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
<script type="text/javascript">
    //创建和初始化地图函数：
    var url;
    var a1=[];
    var a2=[];
    var a3=[];
    var a4=[];
    var a5=[];
    function initMap()
    {
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
    function addMapControl()
    {
        //向地图中添加缩放控件
    var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
    map.addControl(ctrl_nav);
                //向地图中添加比例尺控件
    var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
    map.addControl(ctrl_sca);
    }
    function Auto1()
    {   
        var MallInfo = new Array;
        var temp = '<%=GetShop()%>';
        MallInfo = temp.split("|");
        if(document.getElementById("button1").className=="back-0")
        {
          for(var i=0;i<Math.ceil(MallInfo.length/6);i++)
		     {
		     
             sContent =
              "<img style='float:right;margin:4px' id='imgDemo' src='"+MallInfo[i*6+5]+"' width='139' height='104' title='"+MallInfo[i*6]+"'/>" + 
             "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+MallInfo[i*6+1]+"</p>" + 
"</div>";
             markerArr =[{title:MallInfo[i*6],content:sContent,point:MallInfo[i*6+2]+"|"+MallInfo[i*6+3],isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
         ];
             url="Shopping.aspx?ShopID="+MallInfo[i*6+4];
		 	 a1[i]=addMarker();
		 	 
		 	  }
         document.getElementById("button1").className="back-10";
        }
        else
        {
             for(var j=0;j<a1.length;j++)
		       map.removeOverlay(a1[j]);
            document.getElementById("button1").className="back-0";
        }
    }
    function Auto2()
    {   
        var SceneryInfo = new Array;
        var temp = '<%=GetScenery()%>';
        SceneryInfo = temp.split("|");
        if(document.getElementById("button2").className=="back-1")
        {
        for(var i=0;i<Math.ceil(SceneryInfo.length/6);i++)
        { 
    sContent =
"<img style='float:right;margin:4px' id='imgDemo' src='"+SceneryInfo[i*6+5]+"' width='139' height='104' title='"+SceneryInfo[i*6]+"'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+SceneryInfo[i*6+1]+"</p>" + 
"</div>";
    markerArr = [{title:SceneryInfo[i*6],content:sContent,point:SceneryInfo[i*6+2]+"|"+SceneryInfo[i*6+3],isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
         ];
        url="Scenery.aspx?SceneryID="+SceneryInfo[i*6+4];

		a2[i]=addMarker();
         }
          document.getElementById("button2").className="back-11";
        }
        else
        {
            for(var j=0;j<a2.length;j++)
			map.removeOverlay(a2[j]);
            document.getElementById("button2").className="back-1";
    }
      }
    function Auto3()
    {   
        var HotelInfo = new Array;
        var temp = '<%=GetHotel()%>';
        HotelInfo = temp.split("|");
        if(document.getElementById("button3").className=="back-2")
        { 
         for(var i=0;i<Math.ceil(HotelInfo.length/6);i++)
		
        { 

    sContent =
"<img style='float:right;margin:4px' id='imgDemo' src='"+HotelInfo[i*6+5]+"' width='139' height='104' title='"+HotelInfo[i*6]+"'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+HotelInfo[i*6+1]+"</p>" + 
"</div>";
    markerArr = [{title:HotelInfo[i*6],content:sContent,point:HotelInfo[i*6+2]+"|"+HotelInfo[i*6+3],isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
         ];
        url="Hotel.aspx?HotelID="+HotelInfo[i*6+4];
		a3[i]=addMarker();
        }
        document.getElementById("button3").className="back-12";
        }
        else
        {
            for(var n=0;n<a3.length;n++)
  			map.removeOverlay(a3[n]);
            document.getElementById("button3").className="back-2";
    }
    }
    function Auto4()
    {   
        var ResInfo = new Array;
        var temp = '<%=GetRestaurant()%>';
        ResInfo = temp.split("|");
        if(document.getElementById("button4").className=="back-3")
        {
        for(var i=0;i<Math.ceil(ResInfo.length/6);i++)
		{
    sContent =
"<img style='float:right;margin:4px' id='imgDemo' src='"+ResInfo[i*6+5]+"' width='139' height='104' title=='"+ResInfo[i*6]+"'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+ResInfo[i*6+1]+"</p>" + 
"</div>";
    markerArr = [{title:ResInfo[i*6],content:sContent,point:ResInfo[i*6+2]+"|"+ResInfo[i*6+3],isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
         ];
        
        url="Food.aspx?ResID="+ResInfo[i*6+4];
		a4[i]=addMarker();
        }
        document.getElementById("button4").className="back-13";
        }
        else
        {
            for(var m=0;m<a4.length;m++)
			map.removeOverlay(a4[m]);
            document.getElementById("button4").className="back-3";
    }
    }
    function Auto5()
    {   
        var ResInfo = new Array;
        var temp = '<%=GetEntertain()%>';
        EnterInfo = temp.split("|");
        if(document.getElementById("button5").className=="back-4")
        {  
        for(var i=0;i<Math.ceil(EnterInfo.length/6);i++)
		{
            sContent =
"<img style='float:right;margin:4px' id='imgDemo' src='"+EnterInfo[i*6+5]+"' width='139' height='104' title='"+EnterInfo[i*6]+"'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+EnterInfo[i*6+1]+"</p>" + 
"</div>";
    markerArr = [{title:EnterInfo[i*6],content:sContent,point:EnterInfo[i*6+2]+"|"+EnterInfo[i*6+3],isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
         ];
        url="Entertainment.aspx?EnterID="+EnterInfo[i*6+4];
		a5[i]=addMarker();
		}
        document.getElementById("button5").className="back-14";
        }
        else
        {
            for(var j=0;j<a5.length;j++)
			map.removeOverlay(a5[j]);
            document.getElementById("button5").className="back-4";
    }
            }
    //标注点数组
    var sContent;
    var markerArr;
    //创建marker
    function addMarker()
    {
            for(var i=0;i<markerArr.length;i++)
            {
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
            

             function Yibool(result)
             { 
               //window.open(result,'newwindow');
                //window.location.href=result; //原始
               window.open(result,'self');
              //alert(result);
             }
             
            	marker.addEventListener("click",function()
				{

                    var change = p0+"|"+p1;
                    var test = "你好";
				    
				     PageMethods.GetTypeAndID(change,Yibool);
			    });
			    
			    iw.addEventListener("open",function()
			    {
				    marker.getLabel().hide();
			    })
			    iw.addEventListener("close",function()
			    {
				    marker.getLabel().show();
			    })
				label.addEventListener("click",function()
				{
				    marker.openInfoWindow(iw);
			    })
				if(!!json.isOpen){
					label.hide();
					marker.openInfoWindow(iw);
				}
           
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
    //创建一个Icon
    function createIcon(json)
    {
        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
        return icon;
    }
    
    initMap();//创建和初始化地图
</script>



<!--热门景点-->
<div class="host-spot">
	<h1>热门景点</h1>

	<div class="host-img" style="background:url(../images/漓江2.jpg);background-size:152px 142px;"> 
<a href="../../Pages/Scenery.aspx?SceneryID=74" target="_blank"  class="now"><font class="font-1">漓江</font><font class="font-2">桂林的灵魂</font></a> 
</div> 
<div class="host-img" style="background:url(../images/西街2.jpg);background-size:152px 142px;"> 
<a href="../../Pages/Scenery.aspx?SceneryID=28"  target="_blank" class="now"><font class="font-1">西街</font><font class="font-2">国际情调</font></a> 
</div> 
<div class="host-img" style="background:url(../images/象鼻山2.jpg);background-size:152px 142px;"> 
<a href="../../Pages/Scenery.aspx?SceneryID=62" target="_blank"  class="now"><font class="font-1">象鼻山</font><font class="font-2">桂林城徽</font></a> 
</div> 
<div class="host-img" style="background:url(../images/月亮山2.jpg);background-size:152px 142px;"> 
<a href="../../Pages/Scenery.aspx?SceneryID=24"  target="_blank" class="now"><font class="font-1">月亮山</font><font class="font-2">阳朔奇景</font></a> 
</div> 

</div>

<!--旅游攻略-->
                  <asp:ScriptManager ID="ScriptManager1"  runat="server"  AsyncPostBackTimeout="0"  >
                  </asp:ScriptManager>
<div id="traval-guide">
	<div id="div1">
		<img src="../images/tra-logo.jpg" style="position:relative;top:23px;"/>
	<input type="button" class="active" value="它站" />
	<input type="button" value="本站" />
	<h1 id="commandLogo"><a href=""><img src="../images/command-logo.png" /></a></h1>

	<div id="guideConten" style="display:block;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Block">
        <ContentTemplate>
        <div id="medhtod"> 
        	<ul>
        	<%
                if (DTOtherStraSplit.Rows.Count > 0)
                {
                    for (int i = 0; i < DTOtherStraSplit.Rows.Count; i++)
                    {
                        System.Data.DataTable PublishDT = new System.Data.DataTable();
                        if (!Convert.IsDBNull(DTOtherStraSplit.Rows[i]["PublisherID"] ))
                        {
                            PublishDT = _OtherStraBLL.GetPIByPubID(int.Parse(DTOtherStraSplit.Rows[i]["PublisherID"].ToString()));
                               
                        }
                        String Content;
                        if (DTOtherStraSplit.Rows[i]["StrategyContent"].ToString().Length > 100)
                            Content = DTOtherStraSplit.Rows[i]["StrategyContent"].ToString().Substring(0, 100);
                        else
                            Content = DTOtherStraSplit.Rows[i]["StrategyContent"].ToString();

                        String AuthorUrl="";
                        if (PublishDT.Rows.Count > 0)
                            if (PublishDT.Rows[0]["PublisherUrl"] != null)
                                AuthorUrl = PublishDT.Rows[0]["PublisherUrl"].ToString();
                        
        	        %>
        		<li>
               
        			<div class="guide-left" ><img style="width:190px;height:150px;"src="../images/one.jpg" title="海洋乡" alt="海洋乡"/></div>
        			<div class="guide-right">
        				<h3><%=DTOtherStraSplit.Rows[i]["StrategyTitle"].ToString()%></h3>
        				<%
                            if (AuthorUrl != "")
                            {
                                
                         %>
                         <span class="Auth" ><a href=<%=AuthorUrl %> class="Auth">作者：<%=PublishDT.Rows[0]["PublisherNickName"].ToString()%></a></span>
                         <%
                            }

                            else if (PublishDT.Rows.Count > 0)
                            {
                         %>
        				<span class="Auth">作者：<%=PublishDT.Rows[0]["PublisherNickName"].ToString()%></span>
        				<%
                            }
        				 %>
        				<span id="guide-Time"><%=DTOtherStraSplit.Rows[i]["PublishTime"].ToString()%></span>
        				<p><%=Content%></p>
        				<a href=<%=DTOtherStraSplit.Rows[i]["StrategyUrl"].ToString() %>>详细信息</a>
        			</div>	
        		
        		</li>
        		<%
                }
                }
        		     %>
        	</ul>
        </div>
       
      
        <!--分页-->
        <div id="pages">
	<ul>
	<li>
        <webdiyer:AspNetPager ID="AspNetPager4" runat="server" Width="100%" 
                               PageSize="3"  CurrentPageIndex="1"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="Prev"   
                                    NextPageText="Next" UrlPaging="false" 
                                onpagechanging="StraSplit_PageChanging" AlwaysShow="false" 
                             >
       </webdiyer:AspNetPager>
       </li>
	</ul>
</div>
	
    	</div>
	    </ContentTemplate>
        </asp:UpdatePanel>
	<div id="guideConten">
        
        <div id="medhtod" > 
        	<ul>
        		<li>

        			<div class="guide-left" ><img src="../images/two.jpg" title="海洋乡" alt="海洋乡"/></div>
        			<div class="guide-right">
        				<h3>旅游攻略</h3>
        				<span class="Auth">作者：作者</span><span id="guide-Time">2014-4-19</span>
        				<p>旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略</p>
        				<a href=""><<详细信息</a>
        			</div>	
        		
        		</li>
        		<li><div class="guide-left" ><img src="../images/two.jpg" title="海洋乡" alt="海洋乡"/></div>
        			<div class="guide-right">
        				<h3>旅游攻略</h3>
        				<span class="Auth">作者：作者</span><span id="guide-Time">2014-4-19</span>
        				<p>旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略</p>
        				<a href=""><<详细信息</a>
        			</div>	</li>
        		<li><div class="guide-left" ><img src="../images/two.jpg" title="海洋乡" alt="海洋乡"/></div>
        			<div class="guide-right">
        				<h3>旅游攻略</h3>
        				<span class="Auth">作者：作者</span><span id="guide-Time">2014-4-19</span>
        				<p>旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略</p>
        				<a href=""><<详细信息</a>
        			</div>	</li>
        		<li><div class="guide-left" ><img src="../images/two.jpg" title="海洋乡" alt="海洋乡"/></div>
        			<div class="guide-right">
        				<h3>旅游攻略</h3>
        				<span class="Auth">作者：作者</span><span id="guide-Time">2014-4-19</span>
        				<p>旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略</p>
        				<a href=""><<详细信息</a>
        			</div>	</li>
        	</ul>
        </div>
        <div id="pages">
	<ul>
                <li id="home-page"><a href="" style="padding:2px 10px;text-align:center;">首&nbsp;页</a></li>
                <li class="pre-page"><a href="" ><<</a></li>
                <li  class="current-page">1</li>
                <li><a href="">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a>...</li>
                <li><a href="#">5</a></li>
                <li class="next-page"><a href="">>></a></li>
                <li id="last-page"><a href="" style="padding:2px 2px;text-align:center;">最后一页</a></li>
        </ul>
</div>
   	</div>




</div>

   
</div>



<!--热门路线-->
<div id="fair"><img src="../images/myFair.png" /></div>
        <div class="host-ways">
        
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
	

	</div>
       
    <div class="seek-foot">
	<img src="../images/HR.png"  />
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
</form>
</body>
</html>
