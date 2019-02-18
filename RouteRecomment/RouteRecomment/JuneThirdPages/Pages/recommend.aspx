<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="recommend.aspx.cs" Inherits="RouteRecomment.JuneThirdPages.Pages.Recommend" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>路线推荐</title>
    	<link rel="stylesheet" type="text/css" href="../css/recommend.css"><!--css-->
    <style>
	.seek-body{margin:0 auto;width:1020px;
		/*top:-1423px;*/z-index:0;}

</style>
</head>
<body >
  	<!--搜索框-->
	<div id="seek-top">
		<div class="Cen">
			<img src="../images/LOGO.png"/>
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
	



    <div id="allBody">
        <div>
    <div id="Map">
 <input class="back-0" type="button"  id="button1" onclick="Auto1()"/>
 <input class="back-1" type="button"  id="button2" onclick="Auto2()"/>
 <input class="back-2" type="button"  id="button3" onclick="Auto3()"/>
 <input class="back-3" type="button"  id="button4" onclick="Auto4()"/>
 <input class="back-4" type="button"  id="button5" onclick="Auto5()"/>
</div>
    <div id="MapMessage">
  
  <div id="Scroller-1">
    <!--一线天被触发事件添加内容-->
    <script>
    function haveThing()
    {
        alert("一线天被触发了");
    }
    </script>
   <div class="Scroller-Container">
       <%
           for (int i = 0; i < DetailSceArr.Length; i++)
           {
               String Sla = DetailSceArr[i].Split(',')[1].Split('|')[1];
               String SLon = DetailSceArr[i].Split(',')[1].Split('|')[0];
               BLL.Scenery.SceneryInfoBLL _SceneryInfoBLL = new BLL.Scenery.SceneryInfoBLL();

               System.Data.DataTable DT = _SceneryInfoBLL.IsSceneryExist(float.Parse(Sla), float.Parse(SLon));
               if (DT.Rows.Count > 0)
               {
                   String Loc = "";
                   String Phone;
                   if (DT.Rows[0]["SceneryLoc"] != null)
                       Loc = DT.Rows[0]["SceneryLoc"].ToString();
                   String url = "Scenery.aspx?SceneryID=" + DT.Rows[0]["SceneryID"].ToString();
            %>
        <div class="SCdiv">
        <div class="SCimg"><img src="../images/house.png" /></div>
        <div class="SCmessage">
            <p><a href="" onclick="haveThing()"><%=SceNameList[i]%></a><a href=<%=url%> style="margin-left:30px;">详情>></a></p>
            <p>地址：<%=Loc%></p>
            
            <p>标签：景区</p>
        </div>
        </div>
        <%
           }
           }
             %>

     
    </div>
  </div>
</div>
 <!-- <div id="Scrollbar-Container">
    <div class="Scrollbar-Track">
      <div class="Scrollbar-Handle"></div>
    </div>
  </div>-->
      <!--地图部分-->
    <script type="text/javascript" src="../JS/jsScroller.js"></script>
   <script type="text/javascript" src="../JS/jsScrollbar.js"></script>
<script type="text/javascript">
var scroller  = null;
var scrollbar = null;
  scroller  = new jsScroller(document.getElementById("Scroller-1"), 225, 507);
  scrollbar = new jsScrollbar (document.getElementById("Scrollbar-Container"), scroller, false);
</script>


  <!--百度地图容器-->
  <div style="float:left;border:#ccc solid 1px;width:767px;height:511px;margin-left:20px;" id="dituContent"></div>  
  <hr style="border:none;clear:both;"/>
</div>

<!--推荐结果相关攻略-->
<style>
.tuijian{width:1024px;height:auto;margin-top:20px;padding:10px;}
.tuijian h1{color:#4e98ca;margin-bottom:20px;}
</style>
<div class="tuijian" >
    <h1>推荐结果相关攻略</h1>
    <div class="Con"  >
            <ul >
                  <%
           String RoteArr = RecommendRotes();
           String RotesArr = RoteArr.Split('*')[0];
           String[] pointArr = RotesArr.Trim().Split('-');
           for (int i = 0; i < TxtFP.Length; i++)
           {
               String Content = GetTxt(TxtFP[i]);
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
                     if(ShenLue.Length>200)
                         ShenLue = ShenLue.Substring(0,200);
                     
                    
                     
                 }
                 else
                 { 
                   if(Content.Trim().Length > 200)
                       ShenLue = Content.Trim().Substring(0,200);
                     else
                       ShenLue = Content;
                   
                    
                 }

                 FullContent = TxtFP[i]+"|";
                   
                 for (int j = 0; j < pointArr.Length; j++)
                 {

                    var temp = pointArr[j].Split(',');
                     String geshi = "<b style='color:Red;'>" + temp[0] + "</b>";
                     if (ShenLue.Contains(temp[0]))
                         ShenLue = ShenLue.Replace(temp[0], geshi);

                     /*  if (FullContent.Contains(temp[0]))
                          FullContent = FullContent.Replace(temp[0],geshi);*/
                     //var temp = pointArr[j].Split(',');
                     FullContent += temp[0];
                     FullContent +="|";
                 } 
                 FullContent = FullContent.Substring(0,FullContent.Length-1);
               }

               int Star = Content.LastIndexOf("本文地址：");
               String Url = " ";

               Url = "newpage.aspx?FP=" + FullContent;
              /* 
               * if (Star > 0)
               {
                   int END = Content.LastIndexOf(")");
                  Url = Content.Substring(Star + 5, END - Star - 5);

               }
               if (Url!= " ")
                   ShenLue += ".";
               */
                              
                          
                     %>
                <li id="HighLight">

                    <div class="spot-left" >
                        <a href=""><img src="../images/one.jpg" style="width:190px;height:150px;"/></a>
                    </div>
                    <div class="spot-right" >
                             <p><%=ShenLue%>...</p>
                             <span class="gonglveMore"><a href=<%=Url %> target="_blank">详细信息</a></span>
                     </div><hr style="border:none;clear:both;"/>
                </li>
                <%
           } %>
                
            </ul>

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

</div>
</body>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=C51768d657a80ebc94d29815b53b7415"></script>
<script type="text/javascript">

// 百度地图API功能
var map = new BMap.Map("dituContent");
map.centerAndZoom(new BMap.Point(110.305112,25.284055), 10);
map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用图
var pointArr;
var a1 = '{w:21,h:34,l:';
var count = 0;
var a2;
var a3 =',t:0,x:6,lb:5}'; 
function drivingRoute()
{
	    var wholep=new Array;
		var driving = new BMap.DrivingRoute(map);
		var temp;
	    for(var i=0;i<pointArr.length;i++)
	    {  //获取数组
	       var temp = pointArr[i].split(',');
		   var leftp  = temp[1].split("|")[0];
           var rightp   = temp[1].split("|")[1];
		   wholep[i]=new BMap.Point(rightp,leftp); 
	    }
	for(var k=0;k<wholep.length;k++)
	{
		if(k+1<wholep.length)
		  driving.search(wholep[k+1],wholep[k]);
	 }
	setTimeout(function()
	{
            map.setViewport(wholep);          //调整到最佳视野
        },1000);
        
	driving.setSearchCompleteCallback(function()
	{
        var pts = driving.getResults().getPlan(0).getRoute(0).getPath();    //通过驾车实例，获得一系列点的数组
        var polyline = new BMap.Polyline(pts);     
        map.addOverlay(polyline);
       
        for(var j=0;j<pointArr.length;j++)
		{
			var whole;
			var temp = pointArr[j].split(',');
		    var left  =temp[1].split("|")[0];
            var right =temp[1].split("|")[1];
		    whole  = new BMap.Point(right,left); 
		    
		    var icon = 
		    {
		       w:21,
		       h:34,
		       l:j*21,
		       t:0,
		       lb:5
		    };
		   //var icon = {w:21,h:34,l:21,t:0,x:6,lb:5};
		    var iconImg = createIcon(icon);
			var m=new BMap.Marker(whole,{icon:iconImg});
	      		
			map.addOverlay(m);
			var lab= new BMap.Label(temp[0],{position:whole});   
            map.addOverlay(lab);
            
            //高亮显示关键字
           //HighLight(temp[0]);
		}
		var time  = driving.getResults().getPlan(0).getDuration(true);       //获取时间
		var distance= driving.getResults().getPlan(0).getDistance(true);     //获取距离
		var doc=document.getElementById("r-result");
		//alert("时间为："+time);
        return driving;
    });
}

//创建一个Icon
    function createIcon(json)
    {
        var icon = new BMap.Icon("../Test/images/百度地图Marker（A）.png",
		           new BMap.Size(json.w,json.h),
				  {imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),
				    offset:new BMap.Size(json.x,json.h)})
        return icon;
    }
    
function A()
{
        var Arr = '<%=RecommendRotes()%>';
        pointArr = Arr.split('*')[0];
        pointArr = pointArr.trim().split('-');
        var a=drivingRoute();
        
}
A();

</script>

</html>
