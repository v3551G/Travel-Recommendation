<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recommend.aspx.cs" Inherits="RouteRecomment.JuneTemPages.Pages.Recommend" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/recommended.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../js/jquery.1.4.2-min.js" ></script>
<script type="text/javascript" src="../js/recommended.js" ></script>
<script type="text/javascript">
 <!--
function InitScrollBar(txtBox,txtContent,txtTrack,txtHandle,vHeight){
    //对象初始化
    var ObjScroll = new Object();
    ObjScroll.MaxScroll = vHeight;
    ObjScroll.ScrollBox = document.getElementById(txtBox);
 ObjScroll.ScrollContent = document.getElementById(txtContent);
 ObjScroll.ScrollTrack = document.getElementById(txtTrack);
 ObjScroll.ScrollHandle = document.getElementById(txtHandle);
 //对象不存在
    if(!(ObjScroll.ScrollBox && ObjScroll.ScrollContent && ObjScroll.ScrollTrack  && ObjScroll.ScrollHandle)){
        ObjScroll.ScrollTrack.style.display = "none";
        return;
    }
    //初始化元件高度、位置
 ObjScroll.ScrollAmount = ObjScroll.ScrollContent.offsetHeight/ObjScroll.MaxScroll;
 if(ObjScroll.ScrollAmount>1){
  ObjScroll.ScrollHandle.onmousedown = function(e){
      if (!e)
            e = window.event;
      beginDrag(e);
  }
  if(document.all){
      ObjScroll.ScrollContent.onmousewheel = function(){wheelScroll(event);}
  }
  else{
      ObjScroll.ScrollContent.addEventListener("DOMMouseScroll", wheelScroll, false); 
  }
  ObjScroll.ScrollTrack.style.height = ObjScroll.MaxScroll+282 + "px";
  ObjScroll.ScrollBox.style.height = ObjScroll.MaxScroll +280+ "px"; 
  ObjScroll.ScrollHandle.style.marginTop = "0px";
  ObjScroll.ScrollHandle.style.height = Math.floor(ObjScroll.MaxScroll/ObjScroll.ScrollAmount)  + 280 + "px";
  ObjScroll.MaxLength =  ObjScroll.MaxScroll - Math.floor(ObjScroll.MaxScroll/ObjScroll.ScrollAmount);
     
 }
 else{
  ObjScroll.ScrollTrack.style.display = "none";
 }
 //鼠标滚轮事件
 function wheelScroll(event){ 
     var wAmount = event.wheelDelta;
     if(!wAmount) wAmount = -event.detail*40;     
     ObjScroll.ScrollBox.scrollTop -= wAmount/12;
     if(ObjScroll.ScrollBox.scrollTop == 0) {
         ObjScroll.ScrollHandle.style.marginTop = "0px";
     }
     else if(ObjScroll.ScrollBox.scrollTop == ObjScroll.ScrollContent.offsetHeight - ObjScroll.MaxScroll){
         ObjScroll.ScrollHandle.style.marginTop = ObjScroll.MaxLength +"px";
     }
     else{
         ObjScroll.ScrollHandle.style.marginTop = parseInt(ObjScroll.ScrollHandle.style.marginTop) - Math.floor(wAmount/(12*ObjScroll.ScrollAmount)) + "px";
     }
     if(parseInt(ObjScroll.ScrollHandle.style.marginTop) > ObjScroll.MaxLength) ObjScroll.ScrollHandle.style.marginTop = ObjScroll.MaxLength +"px";
 }
 //拖动滚动条事件
 function beginDrag(event) {
        var deltaY = event.clientY - parseInt(ObjScroll.ScrollHandle.style.marginTop);        
        document.onmousemove = moveHandler;
        document.onmouseup = upHandler;
     document.onmouseout = outHandler;  
     if(document.all) ObjScroll.ScrollHandle.setCapture();
        //鼠标拖动事件
        function moveHandler(e) {
            if (!e)
            e = window.event;
            ObjScroll.ScrollHandle.style.marginTop = (e.clientY - deltaY) + "px";
            if((e.clientY - deltaY)<0)
      {ObjScroll.ScrollHandle.style.marginTop = 0 +"px";}
            else if((e.clientY - deltaY)>ObjScroll.MaxLength){ObjScroll.ScrollHandle.style.marginTop = ObjScroll.MaxLength +"px";}
      else{
       ObjScroll.ScrollBox.scrollTop = Math.floor((e.clientY - deltaY ) * ObjScroll.ScrollAmount);   
      }
        }
        //鼠标释放
        function upHandler(e){
            if (!e) e = window.event;
            document.onmouseup = "";
            document.onmousemove = "";
      document.onmouseout = "";
      if(document.all) ObjScroll.ScrollHandle.releaseCapture();
        }
     //鼠标移开
     function outHandler(e){
            if (!e) e = window.event;        
            document.onmouseup = "";
            document.onmousemove = "";
      document.onmouseout = "";
      if(document.all) ObjScroll.ScrollHandle.releaseCapture();
        }
    }
}

 
</script>

 


 
<style type="text/css">

.scrollbox{float:left; width:235px; height:580px;overflow:hidden;  font-size:12px;line-height:120%; padding-right:20px;}
.slidebar{width:7px;overflow:hidden;background-color:#ddd; height:200px; float:left;border-radius:5px;}
.handle{cursor:pointer;width:7px;background-color:#999;border-radius:5px; float:left; }

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
		
			<img src="../imagesZ/LOGO.png"/>
			<div class="sousuo">
				
			<input type="text" name="text" id="seek-input" node-type="loginname" autocomplete="off" placeholder="桂林漓江">
			
			<div class="seek-button" title="搜索"><a href="#"></a></div>
			</div>
			<ul class="seek-login" id="loginfirst">
				<li><a>登陆</a></li>
				<li><a>注册</a></li>
        
			</ul>
                 <div id="logined">
                
               <p> Hi,<a href="">叶蓓子</a>您好！欢迎来到天际一线智慧一线智慧推荐旅游网<a href="" style="padding-left:30px;" >退出</a></p>
             <!--  <p>智慧推荐旅游网</p>-->
               
            </div>
            <div id="weather"><iframe width="190" scrolling="no" height="80" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=12&bdc=%23&icon=1&num=1"></iframe></div>
			
	</div>

         </div>
        
      
      </div><!--header end-->
       <div style="clear:both"></div>
       
       
       <div id="content">
             <div id="input">
             
                <input type="button1" value="推荐线路一" id="bottom1" >
                <input type="button2" value="推荐线路二" id="bottom2">
                <input type="button3" value="推荐线路三" id="bottom3" class="active">
                <input type="button4" value="推荐线路四" id="bottom4">
                <input type="button5" value="推荐线路五" id="bottom5" >
            
             </div> 

             <div id="messages">
              <div class="scrollbox" id="scroll_1">
                 <div id="content_1">
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
                  <div id="text"> 
                         <div id="tex"><img src="../imagesZ/house.png" height="28" width="21"><span id="yixiantian"><%=SceNameList[i]%></span> <span id="xiangqing"><a href=<%=url%>>详情>></a></span></div>
                         <p>地址：<%=Loc%></p>
                         <%
                            if (i != DetailSceArr.Length - 1)
                           {
                         %>
                         <p>适游时间：<%=SceneryTime[i] %>分钟</p>
                         <p>到下一景点时间：<%=ToNextTime[i]%>分钟</p>
                         <%
                            }
                         %>
                   
       
                 </div>
                       <%
           }
           }
             %>    
                   
                </div>
          </div>
          
          
          
          <div class="slidebar" id="scrollbar_1">
              <div id="handle_1" class="handle"></div>
          </div>
          <div style="clear:both"></div>   
             
        </div><!--messages end-->
         <div id="map">
             
             
             这里放地图！！！！！！！！！！！！！！！！！！
             
         </div><!--map end-->
           <div style="clear:both"></div> 
           
           
           <div id="gonglue">
                <div id="biaoti">
                  <h1> <img src="../imagesZ/hand.png">与推荐结果相关的攻略</h1>
                </div>
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
                <div id="g-1" style="margin-top:30px;">
                     <div id="imagesZ"><img src="../imagesZ/flowers (2).jpg" width="201" height="120" alt="tupian"></div>
                     <div id="text-1">
                       <h3></h3>
                       <h3></h3>
                      <p  style="text-indent:2em;"><%=ShenLue%>...</p>
                      <p id="xq"><a href=<%=Url %> target="_blank">详情>></a></p>
                     </div>
                </div>
                <div style="clear:both"></div>
                      <%
           } %>
            
        
            
   
                
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

<script>InitScrollBar('scroll_1','content_1','scrollbar_1','handle_1',300);</script>
</body>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=C51768d657a80ebc94d29815b53b7415"></script>
<script type="text/javascript">

// 百度地图API功能
var map = new BMap.Map("map");
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
        var icon = new BMap.Icon("../EleImages/百度地图Marker（A）.png",
		           new BMap.Size(json.w,json.h),
				  {imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),
				    offset:new BMap.Size(json.x,json.h)})
        return icon;
    }
    
function A()
{
        var Arr = '<%=RecommendRotes()%>';
        pointArr = Arr.split('*')[0];
        //alert(pointArr);
        pointArr = pointArr.trim().split('-');
        var a=drivingRoute();
        
}
A();

</script>
</html>



