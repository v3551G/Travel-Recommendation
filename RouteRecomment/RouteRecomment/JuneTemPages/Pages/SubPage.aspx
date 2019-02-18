<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubPage.aspx.cs" Inherits="RouteRecomment.JuneTemPages.Pages.SubPage" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
	<form runat="server">
	
	<!--搜索框-->
	<div id="seek-top">
		<div class="Cen">
			<img src="../imagesH/LOGO.png"/>
			<div class="sousuo">
				
			<input type="text" name="text" id="seek-input" node-type="loginname" autocomplete="off" placeholder="桂林漓江">
			
			<div class="seek-button" title="搜索"><a href="#"></a></div>
			</div>
			 
                       
            <ul class="seek-login" id="seek-login">
                <li><a href="#">登陆</a></li>
                <li><a href="#">注册</a></li>
            </ul>
                        <div class="seek-login-after" id="seek-login-after">
                                <ul>
                                <li><a href=""  title="天际一线">天际一线天际一线天际一线天际一线</a>
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


<div id="MapAll">
<div class="allCount"><p>选中列表</p></div>
    <div id="MapMessage">
  
  <div id="Scroller-1">
   <div class="Scroller-Container" id="content_1">



     
    </div>
  </div>
  <div id="Scrollbar-Container">
  
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
 <input class="back-0" type="button"  id="button1" value="购物" onclick="Auto1()"/>
 <input class="back-1" type="button"  id="button2" value="景点" onclick="Auto2()"/>
 <input class="back-2" type="button"  id="button3" value="酒店" onclick="Auto3()"/>
 <input class="back-3" type="button"  id="button4" value="美食" onclick="Auto4()"/>
 <input class="back-4" type="button"  id="button5" value="娱乐" onclick="Auto5()"/>


  <!--百度地图容器-->
 <div id="dituContent"></div></div>
</div>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
<script type="text/javascript">
    //创建和初始化地图函数：
    var Info ="";
        var url;
    var a1=[];
    var a2=[];
    var a3=[];
    var a4=[];
    var a5=[];
    var SceName=[];
    var HtlName=[];
    var MallName=[];
    var ResName=[];
    var EnterName=[];
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
            
            Info = "";
            Info +=MallInfo[i*6];//景点名
                
            Info +="|";
            Info +=MallInfo[i*6+1];
            Info +="|";
            Info += url;
            MallName[i] = MallInfo[i*6];
		 	a1[i]=addMarker();
		 	 
		 	  }
         document.getElementById("button1").className="back-10";
        }
        else
        {
             for(var j=0;j<a1.length;j++)
		       map.removeOverlay(a1[j]);
            document.getElementById("button1").className="back-0";
            
            //清空
            var parDiv=document.getElementById("content_1");
            for(var MallCount=0;MallCount<MallName.length;MallCount++)
            { 
              var SceTemp= document.getElementById(MallName[MallCount]);
              parDiv.removeChild(SceTemp);
            }
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
            
            Info = "";
            Info +=SceneryInfo[i*6];//景点名
                
            Info +="|";
            Info +=SceneryInfo[i*6+1];
            Info +="|";
            Info += url;
        	a2[i]=addMarker();
            SceName[i] = SceneryInfo[i*6];

        		//alert(Info);
		  
         }
          document.getElementById("button2").className="back-11";
          //在这个地方加入滚动条
          var div1 = document.createElement("div");
          div1.className="Scrollbar-Track";
          div1.style.width="2px";
          div1.style.height="60px";
          div1.style.position="absolute";
          div1.style.left = "220px";
          div1.style.backgroundColor="#fff";
          
          var div2 = document.createElement("div");
          div2.className = "Scrollbar-Handle";
          div2.style.top="0px";
          div2.style.left="0px";
          div2.style.visibility="visible";
          div1.appendChild(div2);
          
          var div = document.getElementById("Scrollbar-Container");
          div.appendChild(div1);
        }
        else
        {
            for(var j=0;j<a2.length;j++)
			map.removeOverlay(a2[j]);
            document.getElementById("button2").className="back-1";
            //清空左边的显示
            var parDiv=document.getElementById("content_1");
            //alert(parDiv.id);
            //alert(SceName.length);
            for(var SceCount=0;SceCount<SceName.length;SceCount++)
            { 
             // var SceTemp = new Array;
             // for(var i=0;i<)
              var SceTemp= document.getElementById(SceName[SceCount]);
              parDiv.removeChild(SceTemp);
            }
        }
      }
    function Auto3(){
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
        
            Info = "";
            Info +=HotelInfo[i*6];//景点名
                
            Info +="|";
            Info +=HotelInfo[i*6+1];
            Info +="|";
            Info += url;
            HtlName[i] = HotelInfo[i*6];
		a3[i]=addMarker();
        }
        document.getElementById("button3").className="back-12";
        }
        else
        {
            for(var n=0;n<a3.length;n++)
  			map.removeOverlay(a3[n]);
            document.getElementById("button3").className="back-2";
            //清空
            var parDiv=document.getElementById("content_1");
            for(var HtlCount=0;HtlCount<HtlName.length;HtlCount++)
            { 
              var SceTemp= document.getElementById(HtlName[HtlCount]);
              parDiv.removeChild(SceTemp);
            }
    }
    }
    function Auto4(){
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
        
            Info = "";
            Info +=ResInfo[i*6];//景点名
                
            Info +="|";
            Info +=ResInfo[i*6+1];
            Info +="|";
            Info += url;
            ResName[i] = ResInfo[i*6];
		a4[i]=addMarker();
        }
        document.getElementById("button4").className="back-13";
        }
        else
        {
            for(var m=0;m<a4.length;m++)
			map.removeOverlay(a4[m]);
            document.getElementById("button4").className="back-3";
                        //清空
            var parDiv=document.getElementById("content_1");
            for(var ResCount=0;ResCount<ResName.length;ResCount++)
            { 
              var SceTemp= document.getElementById(ResName[ResCount]);
              parDiv.removeChild(SceTemp);
            }
    }
    }
    function Auto5()
    {
        var EnterInfo = new Array;
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
        
            Info = "";
            Info +=EnterInfo[i*6];//景点名
                
            Info +="|";
            Info +=EnterInfo[i*6+1];
            Info +="|";
            Info += url;
            EnterName[i]= EnterInfo[i*6];
		    a5[i]=addMarker();
		}
        document.getElementById("button5").className="back-14";
        }
        else
        {
            for(var j=0;j<a5.length;j++)
			map.removeOverlay(a5[j]);
            document.getElementById("button5").className="back-4";
            //清空
            var parDiv=document.getElementById("content_1");
            for(var EnterCount=0;EnterCount<EnterName.length;EnterCount++)
            { 
              var SceTemp= document.getElementById(EnterName[EnterCount]);
              parDiv.removeChild(SceTemp);
            }
            
    }
            }
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
            //label.hide();
            map.addOverlay(marker);
              createDiv(Info);//创建左边的
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
            
            //var EleUrl;
             function Yibool(result)
             {  //EleUrl = result;
                //alert(EleUrl);
                window.open(result,"_blank");
                
               // alert(result);
              //  window.location.href=result; //原始
                
             //  window.open(result,'_blank');
              //alert(result);
             // window.navigate(result);

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
			    //alert(json.title);
			     document.getElementById(json.title).onclick=function()
			    {
				  marker.openInfoWindow(iw);
				}
				if(!!json.isOpen)
				{
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
    
        function createDiv(EleInfo)
		{   
		    var InfoArr= new Array;
		    var count = EleInfo.split("|").length;
		    for(var Elei=0;Elei<count;Elei++)
		       InfoArr[Elei] = EleInfo.split("|")[Elei];
		    var div1=document.createElement("div");
		    div1.id=InfoArr[0];
			div1.style.height="auto";
			div1.style.width="230px";
			div1.style.fontSize="12px";
			div1.style.lineHeight="25px";
			div1.style.paddingTop="5px";
			div1.style.minHeight="70px";
			div1.style.borderBottom="1px dashed #999";
			div1.style.marginLeft="10px";
			//div1.className="SCdiv";
			
		    var div2=document.createElement("div");
		    div2.id="tex";
		    //div2.className="SCimg";
		    
		    var div3=document.createElement("div");
		    div3.style.overflow="left";
		    //div3.className="SCmessage";
			/*----------------*/
	    var img1=document.createElement("img");
			img1.src="../imagesH/house.png";
			img1.style.height="21";
			img1.style.width="5";
			img1.style.cssFloat="left"
			div2.appendChild(img1);
			/*----------------*/
	 	var a2=document.createElement("a");
			 a2.id=InfoArr[0];
			 a2.innerHTML=InfoArr[0];
			 a2.style.marginLeft="30px";
			 a2.style.color="#366c83";
			 a2.style.paddingTop="5px";
			 a2.href="javascript:void(0)";
			/*----------------*/
		var span2=document.createElement("span");
			span2.id=InfoArr[0];
			span2.style.marginLeft="30px";
			span2.style.paddingTop="5px";
			//span2.innerHTML=Arr.title;
			/*----------------*/
			
			
		var a1=document.createElement("a");
			a1.href=InfoArr[2];
			a1.target = "_blank";
			a1.innerHTML="详情";
			a1.style.textDecoration="none";
			a1.style.font="#366c83";
			a1.style.marginLeft="30px";
			a1.onmousemove=function(){this.style.color="#F00"};
			a1.onmouseout =function(){this.style.color="blue"};
			/*----------------*/
			div3.appendChild(a2);	
			span2.appendChild(a1);		
			div3.appendChild(span2);
		var p1=document.createElement("p");
		    p1.innerHTML="地址："+InfoArr[1];
			p1.style.marginLeft="30px";
			/*----------------*/
		/*var p2=document.createElement("p");
		    p2.innerHTML="电话："+"电话测试";
			p2.style.marginLeft="30px";*/
			/*----------------*/
			div3.appendChild(p1);
			//div3.appendChild(p2);
		var pDiv=document.getElementById("content_1");
		    
			div1.appendChild(div2);
			div1.appendChild(div3);
			pDiv.appendChild(div1);
			
			
		}
    //创建一个Icon
    function createIcon(json)
    {
        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
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
 <asp:ScriptManager ID="ScriptManager1"  runat="server"  AsyncPostBackTimeout="0"  >
  </asp:ScriptManager>
<div class="gonglve">
   

    <div id="gonglve">
        <img src="../imagesH/tra-logo.jpg" style="position:relative;top:23px;"/>
            <input type="button" class="active" value="它站" id="yangshi"/>
            <input class="TabButton" type="button" value="本站"  id="yangshi"/>
    
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Block">
        <ContentTemplate>
    <div id="spotContent" style="display:block;">
        
        <div class="Con" >
            <ul id="ConUl">
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
                        if (DTOtherStraSplit.Rows[i]["StrategyContent"].ToString().Length > 50)
                            Content = DTOtherStraSplit.Rows[i]["StrategyContent"].ToString().Substring(0, 50);
                        else
                            Content = DTOtherStraSplit.Rows[i]["StrategyContent"].ToString();

                        String AuthorUrl="";
                        if (PublishDT.Rows.Count > 0)
                            if (PublishDT.Rows[0]["PublisherUrl"] != null)
                                AuthorUrl = PublishDT.Rows[0]["PublisherUrl"].ToString();
                        
        	        %>
                <li>
                    <div class="spot-left"><a href=""><img src="../imagesH/one.jpg" style="width:190px;height:150px;"/></a></div>
                    <div class="spot-right">
                        <h3><%=DTOtherStraSplit.Rows[i]["StrategyTitle"].ToString()%></h3>
                         <%
                             if (AuthorUrl != "")
                             {
                                
                         %>
                        <span class="Auto"><a href=<%=AuthorUrl %>>作者：<%=PublishDT.Rows[0]["PublisherNickName"].ToString()%></a></span><%

                             }
                               else if (PublishDT.Rows.Count > 0)
                            {
                         %><span class="Auto">作者：<%=PublishDT.Rows[0]["PublisherNickName"].ToString()%></span><%
                            }
        				 %><span id="spotTime"><%=DTOtherStraSplit.Rows[i]["PublishTime"].ToString()%></span><p><%=Content%>....</p>
                        <span class="gonglveMore"><a href=<%=DTOtherStraSplit.Rows[i]["StrategyUrl"].ToString() %>>
                        &lt;<详细信息</a></span></div><hr style="border:none;clear:both;"/>
                </li>
        		<%
                }
                }
        		     %>
            </ul>

<div id="pages">
    <ul style=" margin-left:0px;">
	<li style=" margin-left:0px;">
        <webdiyer:AspNetPager ID="AspNetPager4" runat="server" Width="80%" 
                               PageSize="7"  CurrentPageIndex="1"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="Prev"   
                                    NextPageText="Next" UrlPaging="false" 
                                onpagechanging="StraSplit_PageChanging" 
            AlwaysShow="false" CurrentPageButtonPosition="End" NumericButtonCount="8" PagingButtonSpacing="0px" 
                             >
       </webdiyer:AspNetPager>
       </li>
    </ul>
</div>
        </div>
    </div>
	    </ContentTemplate>
        </asp:UpdatePanel>
        <div id="spotContent">
        
        <div class="Con" >
            <ul id="ConUl">
                <li>
                    <div class="spot-left"><a href=""><img src="../imagesH/04.jpg" style="width:190px;height:150px;"/></a></div>
                    <div class="spot-right">
                        <h3>攻略标题                        x;height:150px;"/></a></div>
                    <div class="spot-right">
                        <h3>攻略标题                        <span class="Auto"><a href="">作者：作者很多作者点击</a></span><span id="spotTime">2014-4-25</span>
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

<h1 id="commandLogo"><a href="" ><img src="../imagesH/command-logo.png" /></a></h1>




<div style="float:left;margin-left:22px;">

<!--热门景点-->
<div class="host-spot">
    <h1><img src="../imagesH/jingdian.jpg"/>&nbsp;热门景点</h1>

    <div class="host-img" style="background:url(../EleImages/漓江2.jpg);background-size:152px 142px;"> 
<a href="Scenery.aspx?SceneryID=66" target="_blank"  class="now"><font class="font-1">漓江</font><font class="font-2">桂林的灵魂</font></a> 
</div> 
<div class="host-img" style="background:url(../EleImages/西街2.jpg);background-size:152px 142px;"> 
<a href=""  target="_blank" class="now"><font class="font-1">西街</font><font class="font-2">国际情调</font></a> 
</div> 
<div class="host-img" style="background:url(../EleImages/象鼻山2.jpg);background-size:152px 142px;"> 
<a href="" target="_blank"  class="now"><font class="font-1">象鼻山</font><font class="font-2">桂林城徽</font></a> 
</div> 
<div class="host-img" style="background:url(../EleImages/月亮山2.jpg);background-size:152px 142px;"> 
<a href=""  target="_blank" class="now"><font class="font-1">月亮山</font><font class="font-2">阳朔奇景</font></a> 
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
            <li class="host-one" onmouseover="position1()">
                <p  style="color:#FF9600;"><a href="">漓江</a><a href="">龙颈河漂流</a><a href="">遇龙河</a></p>
            <p style="color:#FF9600;"><a href="">西街</a><a href="">七星公园</a><a href="">芦笛岩</a><a href="">象鼻山</a></p>
            </li>


            <li class="host-one" onmouseover="position2()">
                 <p><a href="">银子岩</a><a href="">漓江</a><a href="">遇龙河</a></p>
            <p><a href="">月亮山</a><a href="">梯田</a><a href="">象鼻山</a></p>
            </li>
               

            <li class="host-one" onmouseover="position3()">
                <p><a href="">蝴蝶泉</a><a href="">大榕树</a></p>
            <p><a href="">月亮山</a><a href="">银子岩</a><a href="">遇龙河</a></p>
            </li>
                

            <li class="host-two" onmouseover="position4()">
                <p><a href="">古东瀑布</a><a href="">冠岩</a><a href="">两江四湖</a><a href="">漓江</a></p>
            </li>
                

            <li class="host-two" onmouseover="position5()">
                <p><a href="">遇龙河</a><a href="">西街</a><a href="">漓江</a></p>
            </li>

                
            <li class="host-one" onmouseover="position6()">
                <p><a href="">漓江</a><a href="">蝴蝶泉</a><a href="">大榕树</a></p>
            <p><a href="">芦笛岩</a><a href="">象鼻山</a><a href="">两江四湖</a></p>
            </li>
                

            <li class="host-one" onmouseover="position7()">
                <p><a href="">蝴蝶泉</a><a href="">大榕树</a><a href="">月亮山</a></p>
            <p><a href="">碧莲峰</a><a href="">银子岩</a><a href="">遇龙河</a><a href="">西街</a></p>
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
        
        Res = Res.substring(0,Res.length-1);
        //alert(Res);
        PageMethods.GetDiaLogInfo(Res);
        
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
                <a href=""><input type="button" id="input2" onclick="noneedHelp()"/></a>
        </div>
        <div id="diabox2"  style="display:none;"><!-- -->

               
                        



                <div id="diabox2-child"><a href="">
                   <input type="button" id="input3" onclick="noAnswer()" />
                </a><!--不回答问题-->

                        <p class="questionTitle">先<span style="color:#2e96c2;font-size:20px;">回答</span>
                                这样几个<span style="color:#2e96c2;font-size:20px;">问题</span>吧</p>
                        <p class="ques1"><span style="font-size:16px;">1.</span style="margin-left:10px;">您希望旅行几天 ？<input type="text" id="Days"  value="3" style="width:62px;height:18px;margin-left:30px;margin-right:10px;"/>天</p>


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
                        
                <input  id="input4" value=" " onclick="Answer()" /><!--回答问题-->
                
                        
                </div>
        </div>
        <div id="diabox3" style="display:none;">
                
               <!--链接到推荐页面--> <a href="Recommend.aspx"><input  id="input5" value=" " onclick="goToSee()"/></a>
                <a href=""><input  id="input6" value=" " onclick="nogoToSee()"/></a>
        </div>
</div>
</body>
</html>
