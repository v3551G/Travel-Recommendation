<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubPage.aspx.cs" Inherits="RouteRecomment.FrontPages.Pages.SubPage" %>

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
    <!-- 应用百度地图api-->
  <script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
  
	<style>
	.seek-body{margin-left:-510px;left:50%;width:1020px;
		position:relative;/*top:-1423px;*/z-index:0;}
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
			<ul class="seek-login">
				<li><a href="">登陆</a></li>
				<li><a href="">注册</a></li>
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
#map-1{width:630px;height:438px;background:#f2f1ec;margin-left:3px;margin-top:-45px;border:1px solid #d8d7d2;}
</style>

<div id="Map">
        <ul>
               <!-- <li class="back-0"></li>
                <li class="back-1"></li>
                <li class="back-2"></li>
                <li class="back-3"></li>
                <li class="back-4"></li>-->
   
  <input type="button" value="添加景点" id="button2" onclick="Auto2()" />
  <input type="button" value="添加购物" id="button1" onclick="Auto1()" />
  <input type="button" value="添加酒店" id="button3" onclick="Auto3()" />
  <input type="button" value="添加美食" id="button4" onclick="Auto4()" />
  <input type="button" value="添加娱乐" id="button5" onclick="Auto5()" />
        </ul>
       <div style="width:630px;height:430px;border:#ccc solid 1px;" id="map-1"></div>
       <!-- <div  style="width:630px;height:430px;border:#ccc solid 1px;" id="dituContent">-->
</div>

<script type="text/javascript">
        var ma=document.getElementById("Map");
        var map = ma.getElementsByTagName("li");
  

        for(var i=0;i<map.length;i++)
        {
                map[i].flag=3;
                map[i].index=i;
                map[i].onclick=function()
                {       
                        var str="back-";

                        if(this.flag == 1)
                        {
                                this.className=str.concat(this.index);

                                this.flag = 2;

                        }else
                        {

                                this.className=str.concat(this.index+10);
                                this.flag = 1;
                        }

                }
               
        }
        </script>




<!--热门景点-->
<div class="host-spot">
	<h1>热门景点</h1>

	<div class="host-img" style="background:url(../images/host-1.jpg);background-size:152px 142px;"> 
<a href="" target="_blank"  class="now"><font class="font-1">梯田</font><font class="font-2">梯田世界之冠</font></a> 
</div> 
<div class="host-img" style="background:url(../images/host-2.jpg);background-size:152px 142px;"> 
<a href=""  target="_blank" class="now"><font class="font-1">水上乐园</font><font class="font-2">挑战刺激</font></a> 
</div> 
<div class="host-img" style="background:url(../images/host-3.jpg);background-size:152px 142px;"> 
<a href="" target="_blank"  class="now"><font class="font-1">乐满地</font><font class="font-2">挑战你的胆量</font></a> 
</div> 
<div class="host-img" style="background:url(../images/host-4.jpg);background-size:152px 142px;"> 
<a href=""  target="_blank" class="now"><font class="font-1">阳朔</font><font class="font-2">百里漓江百里画廊</font></a> 
</div> 

</div>

<!--旅游攻略-->
                  <asp:ScriptManager ID="ScriptManager1"  runat="server"  AsyncPostBackTimeout="0"  >
                  </asp:ScriptManager>
<div id="traval-guide">
	<div id="div1">
		<img src="../images/tra-logo.jpg" style="position:relative;top:23px;"/>
	<input type="button" class="active" value="热门" />
	<input type="button" value="最新" />
	<h1 id="commandLogo"><a href=""><img src="../images/command-logo.png" /></a></h1>

	<div id="guideConten" style="display:block;">
        
        <div id="medhtod"> 
        	<ul>
        		<li>

        			<div class="guide-left" ><img style="width:190px;height:150px;"src="../images/one.jpg" title="海洋乡" alt="海洋乡"/></div>
        			<div class="guide-right">
        				<h3>旅游攻略</h3>
        				<span class="Auth">作者：作者</span><span id="guide-Time">2014-4-19</span>
        				<p>旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略</p>
        				<a href=""><<详细信息</a>
        			</div>	
        		
        		</li>
        		<li><div class="guide-left" ><img  style="width:190px;height:150px;"src="../images/one.jpg" title="海洋乡" alt="海洋乡"/></div>
        			<div class="guide-right">
        				<h3>旅游攻略</h3>
        				<span class="Auth">作者：作者</span><span id="guide-Time">2014-4-19</span>
        				<p>旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略</p>
        				<a href=""><<详细信息</a>
        			</div>	</li>
        		<li><div class="guide-left" ><img style="width:190px;height:150px;" src="../images/one.jpg" title="海洋乡" alt="海洋乡"/></div>
        			<div class="guide-right">
        				<h3>旅游攻略</h3>
        				<span class="Auth">作者：作者</span><span id="guide-Time">2014-4-19</span>
        				<p>旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略</p>
        				<a href=""><<详细信息</a>
        			</div>	</li>
        		<li><div class="guide-left" ><img  style="width:190px;height:150px;"src="../images/one.jpg" title="海洋乡" alt="海洋乡"/></div>
        			<div class="guide-right">
        				<h3>旅游攻略</h3>
        				<span class="Auth">作者：作者</span><span id="guide-Time">2014-4-19</span>
        				<p>旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略旅游攻略</p>
        				<a href=""><<详细信息</a>
        			</div>	</li>
        	</ul>
        </div>
       
      
        <!--分页-->
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



<script type="text/javascript">
function myone(){
    $("#fair").animate({top:"50px"},700);
       $("#fair").slideup("slow");
    $("#fair").slideDown("slow");


}
function mytwo(){
    $("#fair").animate({top:"65px"},700);
       $("#fair").slideup("slow");
    $("#fair").slideDown("slow");

}
function mythree(){
    $("#fair").animate({top:"135px"},700);

}
function myfour(){
    $("#fair").animate({top:"200px"},700);
       $("#fair").slideup("slow");
    $("#fair").slideDown("slow");

}
function myfive(){
    $("#fair").animate({top:"265px"},700);
       $("#fair").slideup("slow");
    $("#fair").slideDown("slow");

}
function mysix(){
    $("#fair").animate({top:"335px"},700);
       $("#fair").slideup("slow");
    $("#fair").slideDown("slow");

}
function myseven(){
    $("#fair").animate({top:"400px"},700);
       $("#fair").slideup("slow");
    $("#fair").slideDown("slow");

}
</script>
<div id="fair"><img src="../images/myFair.png" /></div>
        <div class="host-ways">
        
        <h1>热门路线<a href=""><img class="refresh-right" src="../images/refresh1.png"/></a></h1>
        
        
    
    <div id="Ways">
        <ul>
            <li class="host-one" name="host-one"   onmouseover="myOne()">
                <p><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a></p>
            <p><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a><a href="">蝴蝶泉</a></p>
            </li>


            <li class="host-two" name="host-two"   onmouseover="mytwo()">
                 <p><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a></p>
            <p><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a></p>
            </li>
               

            <li class="host-three" name="host-one"  onmouseover="mythree()" >
                <p><a href="">漓江</a><a href="">老榕树</a></p>
            <p><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a></p>
            </li>
                

            <li class="host-four" name="host-four"   onmouseover="myfour()">
                <p><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a><a href="">蝴蝶泉</a></p>
            </li>
                

            <li class="host-five" name="host-five"   onmouseover="myfive()">
                <p><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a></p>
            </li>

                
            <li class="host-six" name="host-six"   onmouseover="mysix()">
                <p><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a></p>
            <p><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a><a href="">蝴蝶泉</a></p>
            </li>
                

            <li class="host-seven" name="host-seven"   onmouseover="myseven()">
                <p><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a></p>
            <p><a href="">漓江</a><a href="">老榕树</a><a href="">蝴蝶泉</a><a href="">蝴蝶泉</a></p>
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

<script type="text/javascript">
    var isHotel = true;
    var url;
    var a1=[];
    var a2=[];
    var a3=[];
    var a4=[];
    var a5=[];
    //创建和初始化地图函数：
    function initMap()
    {
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        //addMarker();//向地图中添加marker
    }
    
    //创建地图函数：
    function createMap()
    {
        var map = new BMap.Map("map-1");//在百度地图容器中创建一个地图
        var point = new BMap.Point(110.305112,25.284055);//定义一个中心点坐标
        map.centerAndZoom(point,10);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
		//enableMassClear();
    }
    
    //地图事件设置函数：
    function setMapEvent()
    {
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
		if(document.getElementById("button1").value=="添加购物")
		{    		     
		     for(var i=0;i<Math.ceil(MallInfo.length/6);i++)
		     {
	         sContent =
              "<img style='float:right;margin:4px' id='imgDemo' src='"+MallInfo[i*5+5]+"' width='139' height='104' title='"+MallInfo[i*5]+"'/>" + 
             "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+MallInfo[i*5+1]+"</p>" + 
"</div>";
             markerArr =[{title:MallInfo[i*5],content:sContent,point:MallInfo[i*5+2]+"|"+MallInfo[i*5+3],isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ];   
	
		     url="Shopping.aspx?ShopID="+MallInfo[i*5+4];
		 	 a1[i]=addMarker();
		 	 }
		 	 document.getElementById("button1").value="取消购物";
		 
	   }
		else
		{   
		    for(var j=0;j<a1.length;j++)
		       map.removeOverlay(a1[j]);
		    document.getElementById("button1").value="添加购物";		    
	    }
	}
	

	function Auto2()
	 {  
           
        var SceneryInfo = new Array;
        var temp = '<%=GetScenery()%>';
        SceneryInfo = temp.split("|");

		if(document.getElementById("button2").value=="添加景点")
		{
        for(var i=0;i<Math.ceil(SceneryInfo.length/6);i++)
        { 
         
	sContent =
"<img style='float:right;margin:4px' id='imgDemo' src='"+SceneryInfo[i*5+5]+"' width='139' height='104' title='"+SceneryInfo[i*5]+"'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+SceneryInfo[i*5+1]+"</p>" + 
"</div>";                                                                                     
        markerArr = [{title:SceneryInfo[i*5],content:sContent,point:SceneryInfo[i*5+2]+"|"+SceneryInfo[i*5+3],isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}];
     
		url="Scenery.aspx?SceneryID="+SceneryInfo[i*5+4];

		a2[i]=addMarker();
		//alert(url);
		}
		document.getElementById("button2").value="取消景点";
		}
		else
		{   
		    
		    for(var j=0;j<a2.length;j++)
			map.removeOverlay(a2[j]);
		    document.getElementById("button2").value="添加景点";
	    }
	  }
	function Auto3(){
	    var HotelInfo = new Array;
        var temp = '<%=GetHotel()%>';
        HotelInfo = temp.split("|");
		if(document.getElementById("button3").value=="添加酒店")
		{
		for(var i=0;i<Math.ceil(HotelInfo.length/6);i++)
		
        { 

	sContent =
"<img style='float:right;margin:4px' id='imgDemo' src='"+HotelInfo[i*5+5]+"' width='139' height='104' title='"+HotelInfo[i*5]+"'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+HotelInfo[i*5+1]+"</p>" + 
"</div>";
    markerArr = [{title:HotelInfo[i*5],content:sContent,point:HotelInfo[i*5+2]+"|"+HotelInfo[i*5+3],isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ];
		url="Hotel.aspx?HotelID="+HotelInfo[i*5+4];
		a3[i]=addMarker();
		}
		document.getElementById("button3").value="取消酒店";
		}
		else
		{   
		for(var n=0;n<a3.length;n++)
		   {
			map.removeOverlay(a3[n]);
			}
		    document.getElementById("button3").value="添加酒店";
	}
	}
	function Auto4(){
	    var ResInfo = new Array;
        var temp = '<%=GetRestaurant()%>';
        ResInfo = temp.split("|");
		if(document.getElementById("button4").value=="添加美食")
		{
		for(var i=0;i<Math.ceil(ResInfo.length/6);i++)
		{
	sContent =
"<img style='float:right;margin:4px' id='imgDemo' src='"+ResInfo[i*5+5]+"' width='139' height='104' title='"+ResInfo[i*5]+"'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+ResInfo[i*5+1]+"</p>" + 
"</div>";
    markerArr = [{title:ResInfo[i*5],content:sContent,point:ResInfo[i*5+2]+"|"+ResInfo[i*5+3],isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ];
		 url="Food.aspx?ResID="+ResInfo[i*5+4];
		a4[i]=addMarker();
		}
		document.getElementById("button4").value="取消美食";
		}
		else
		{    
		    for(var m=0;m<a4.length;m++)
			map.removeOverlay(a4[m]);
		    document.getElementById("button4").value="添加美食";
	}
	}
	function Auto5(){
	
		var ResInfo = new Array;
        var temp = '<%=GetEntertain()%>';
        EnterInfo = temp.split("|");
		if(document.getElementById("button5").value=="添加娱乐")
		{
				for(var i=0;i<Math.ceil(EnterInfo.length/6);i++)
		{
			sContent =
"<img style='float:right;margin:4px' id='imgDemo' src='"+EnterInfo[i*5+5]+"' width='139' height='104' title='"+EnterInfo[i*5]+"'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+EnterInfo[i*5+1]+"</p>" + 
"</div>";
    markerArr = [{title:EnterInfo[i*5],content:sContent,point:EnterInfo[i*5+2]+"|"+EnterInfo[i*5+3],isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ];
		
		url="Entertainment.aspx?EnterID="+EnterInfo[i*5+4];
		a5[i]=addMarker();
		}
		document.getElementById("button5").value="取消娱乐";
		}
		else
		{   
		    for(var j=0;j<a5.length;j++)
			map.removeOverlay(a5[j]);
		    document.getElementById("button5").value="添加娱乐";
	    }
	   }
    //标注点数组
	var sContent;
    var markerArr;
    //创建marker
    function addMarker( )
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
               window.location.href=result;
              // alert(result);
             }
             
            	marker.addEventListener("click",function()
				{
				  //  p0是经度 p1是纬度
                    var change = p0+"|"+p1;
                    var test = "你好";
				   // alert(change);
				    //alert(change);
				    
				     PageMethods.GetTypeAndID(change,Yibool);
			
				    //alert(s);
					//window.location.href="http:\\www.baidu.com";
			    });
			    iw.addEventListener("open",function(){
				    marker.getLabel().hide();
			    })
			    iw.addEventListener("close",function(){
				    marker.getLabel().show();
			    })
				label.addEventListener("click",function(){
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
</html>
