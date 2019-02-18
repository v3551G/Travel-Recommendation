<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Food.aspx.cs" Inherits="RouteRecomment.JuneTemPages.Pages.Food" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/food.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../js/jquery.1.4.2-min.js" ></script>
<script src="../js/food.js"></script>
<script src="../js/jqfood.js"></script>
<script src="../js/jingling.js"></script>
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
  ObjScroll.ScrollTrack.style.height = ObjScroll.MaxScroll+2 + "px";
  ObjScroll.ScrollBox.style.height = ObjScroll.MaxScroll + "px"; 
  ObjScroll.ScrollHandle.style.marginTop = "0px";
  ObjScroll.ScrollHandle.style.height = Math.floor(ObjScroll.MaxScroll/ObjScroll.ScrollAmount)  + "px";
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

	.scrollbox{float:left; width:200px; height:300px;overflow:hidden;  font-size:12px;line-height:120%; padding-right:20px;}
	.slidebar{width:7px;overflow:hidden;background-color:#ddd; height:200px; float:left;border-radius:5px;}
	.handle{cursor:pointer;width:7px;background-color:#999;border-radius:5px; float:left; }

</style>

<title>food</title>


</head>

<body>
<form runat="server">
<div id="all-body">

<img src="../imagesZ/bg-4.png"/>


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
         <div id="h-title"><h2><%=ResName%></h2></div>
         <div class="photo clearfix">
                             
              <div id="focus">
              <ul>
              <%
                  for (int i = 0; i < ResPicDT.Rows.Count; i++)
                  {
                      String PicUrl = ResPicDT.Rows[i]["PicPath"].ToString();
                      PicUrl = PicUrl.Substring(PicUrl.IndexOf('U'));
                      PicUrl = "../../../" + "Admin/" + PicUrl;
              %>
                  <li><a href="#" target="_blank" title=""><img alt="" src=<%=PicUrl%>/></a></li>
              <%} %>
              <%
                 if (ResPicDT.Rows.Count == 0)
                  {
                      string MoRenPic = "../../../Admin/UpLoadPics/201404190157570thumb%20(1).jpg";
              %>
               <li><a href="#" target="_blank" title=""><img alt="" src="../imagesZ/tp-2.jpg" /></a></li>
                  <li><a href="#" target="_blank" title=""><img alt="" src="../imagesZ/tp-3.jpg" /></a></li>
                  <li><a href="#" target="_blank" title=""><img alt="" src="../imagesZ/tp-4.jpg" /></a></li>
                  <li><a href="#" target="_blank" title=""><img alt="" src="../imagesZ/tp-5.jpg" /></a></li>
                  <li><a href="#" target="_blank" title=""><img alt="" src="../imagesZ/tp-6.jpg" /></a></li>
                                <%
                  } 
              %>
              </ul>
              </div>
<!--             
             <div class="txt"><a href="#"><img src="../imagesZ/txt-01.png" width="188" height="52" alt="广场" /></a></div>-->
          <div class="messages">
                <div id="m-1">
                     <div class="h-lev"><img src="../imagesZ/m-1.png" /></div>
                     <div id="m-t"> 地址：
                      <%=Address%>
                     </div>
                 </div><!--m-1 end-->
                 <div style="clear:both"></div>
                 
                    <div id="m-2">
                         <div class="h-lev"><img src="../imagesZ/m-2.png" /></div>
                         <div id="m-t"> 
                             联系方式：<%=PhoneNum%><br />
                             <!--传    真：0213-223232323-->
                             <br />
                         </div>
                    </div><!--m-1 end-->
                    
                    <div id="m-3">
                         <div class="h-lev"><img  src="../imagesZ/m-3.png" /></div>
                         <div id="m-t"> 
                             营业时间：<%=OpenTime%>
                             <br />
                         </div>
                    </div><!--m-1 end-->
                    
                    
                     <div id="m-4">
                         <div class="h-lev"><img src="../imagesZ/m-4.png" /></div>
                  
                           <div class="scrollbox" id="scroll_1">
    <div id="content_1" style="font-size:12px; line-height:25px;">
        餐馆介绍：<%=Introduce%>
    </div>
</div>
<div class="slidebar" id="scrollbar_1">
    <div id="handle_1" class="handle"></div>
</div>
                  
                  
                  
                    </div><!--m-1 end-->
                 
          </div>
             
          </div>
          
      
      </div><!--header end-->
        
      <div id="content">
          <div id="c-left">
           
        
           
           <div id="c-food">
               <p>推荐菜</p>
             </div>
            <div id="c-food-name">
            
            
              <ul>
               <% 
                    for (int i = 0; i < FoodNoPic.Rows.Count; i++)
                    {        

                %>
                 <li><a href="#"><%=FoodNoPic.Rows[i]["FoodName"].ToString() %></a><span id="number">(25)</span></li>
                                 <%
                    }
                         %>
              </ul> 
              
              
           </div>
           <div id="food-picture">
                                    <%
                  for (int i = 0; i < FoodWithPic.Rows.Count; i++)
                  {
                      String PicUrl = FoodWithPic.Rows[i]["PicPath"].ToString();
                      PicUrl = PicUrl.Substring(PicUrl.IndexOf('U'));
                      PicUrl = "../../../" + "Admin/" + PicUrl;
                   %>
              <div id="picture-1">
                      <a href="#"><img src=<%=PicUrl%> width="205" height="137" alt="菜" /></a>
                      <a href="#"><p><%=FoodWithPic.Rows[i]["FoodName"].ToString() %></p></a>
              </div> 
                            <%
                  }         
               %>

              <div id="c-change-1"><a href="#">换一批</a></div>
           
           </div>
           
        
            <div style="clear:both;"></div>      
           
            
         <!--end c-btn-->
             
             
              <!--其他网站评论开始-->
             <div id="div1">
                 
                     <h2>其他网站的评论</h2>
                <h3>
                  <input type="button" class="active" value="携程" />
                  <input type="button" value="大众点评" />
                  <input type="button" value="爱帮" />
               </h3>
                <asp:ScriptManager ID="ScriptManager1"  runat="server"  AsyncPostBackTimeout="0"  >
                </asp:ScriptManager>
                 <!--携程开始-->
                  <div id="miao" style="display:block;"> 
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Block">
                    <ContentTemplate>
                     <%
                         if (XieChenDT.Rows.Count == 0)
                         {
                     %>
                       <center>
                            <div id="notext"><img src="../imagesZ/notie.png" />对不起，暂时无评论！</div>
                        </center>
                     <%
                         }
                         else
                         { 
                            %>
                  <div id="temp">
                         综合评价:
                         <div id="d-img">
                         <%   
                             float StarNum=0.0f;
                             String XCAvgPrice="--";
                             String XCTaste = "--";
                             String XCatmosphere = "--";
                             String XCService = "--";
                             if (XCTotalRate.Rows.Count > 0)
                             {
                                if (XCTotalRate.Rows[0]["AvgRate"] != null && XCTotalRate.Rows[0]["AvgRate"] != "")
                                     StarNum = float.Parse(XCTotalRate.Rows[0]["AvgRate"].ToString());
                                if(XCTotalRate.Rows[0]["AvgPrice"]!=null&&XCTotalRate.Rows[0]["AvgPrice"].ToString()!="")
                                    XCAvgPrice= XCTotalRate.Rows[0]["AvgPrice"].ToString();
                                if (XCTotalRate.Rows[0]["Taste"] != null && XCTotalRate.Rows[0]["Taste"].ToString() != "")
                                    XCTaste = XCTotalRate.Rows[0]["Taste"].ToString();
                                if (XCTotalRate.Rows[0]["atmosphere"] != null && XCTotalRate.Rows[0]["atmosphere"].ToString() != "")
                                    XCatmosphere = XCTotalRate.Rows[0]["atmosphere"].ToString();
                                if (XCTotalRate.Rows[0]["Service"] != null && XCTotalRate.Rows[0]["Service"].ToString() != "")
                                    XCService = XCTotalRate.Rows[0]["Service"].ToString();
                             
                             }
                             for (int i = 0; i < StarNum-1; i++)
                             {
                              %>
                         <img src="../imagesZ/star-1.png" height="21" width="21" alt="星星" id="c-img-1" />
                          <%
                             }
                         %>
                        <!--<a href="#">(3.9/5分)  <span style="padding-left:20px;"> 89%用户推荐</span></a>-->
                        
                        
                        
                          <span id="up-value">(<span style="font-size:20px; color:#F60;">3.9</span>/5分)</span>
                         <span id="up-value"> <span style="font-size:20px; color:#F60;">89%</span>用户推荐</span>
                         <span id="up-value">人均 <span id="pingfen">￥<%=XCAvgPrice%></span></span>
                         <span id="up-value">口味 <span id="pingfen"><%=XCTaste%>分</span></span>
                         <span id="up-value">环境 <span id="pingfen"><%=XCatmosphere%>分</span></span>
                         <span id="up-value">服务 <span id="pingfen"><%=XCService%></span></span>
                         </div>
                       </div>
                        <%
                          for (int k = 0; k < XieChenDT.Rows.Count; k++)
                          {
                              int Score = int.Parse(XieChenDT.Rows[k]["Rate"].ToString());

                           %>
                      <div id="temp-1">
                        <div id="c-portrait">
                           <a href="#"><img src="../imagesZ/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#"><%=XieChenDT.Rows[k]["PublisherNickName"].ToString()%></a></p>
                        </div>
                        <div id="c-btn-value">
                           <div id="c-star">
                                                           <% 
                          for (int j = 0; j < Score; j++)
                          {
                                %> 
                              <img src="../imagesZ/star-2.png" width="14" height="14" alt="pingfen" />
                                          <%
                          }
                               
                              %>
                              <span id="c-star-l">5.0分</span>
                               <span id="u-value">人均 ￥<%=XieChenDT.Rows[k]["AvgPrice"].ToString()%></span>
                               <span id="u-value">口味 <%=XieChenDT.Rows[k]["Taste"].ToString()%></span>
                               <span id="u-value">环境 <%=XieChenDT.Rows[k]["Environment"].ToString()%></span>
                               <span id="u-value">服务 <%=XieChenDT.Rows[k]["Service"].ToString()%></span>
                           </div>
                        </div>
                        <div id="c-btn-txt">
                            <p id="c-value"><%=XieChenDT.Rows[k]["Content"].ToString()%></p>
                            <p id="c-time"><%=XieChenDT.Rows[k]["PublishTime"].ToString()%></p>
                        </div>
                        
                      </div>
                      <div style="clear:both"></div>
                              <%
                          }
                            
                        %>
                     <div id="r-page">
                            <div class="black2">
                          <webdiyer:AspNetPager ID="AspNetPager4" runat="server" Width="100%" 
                               PageSize="2"  CurrentPageIndex="1"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="Prev"   
                                    NextPageText="Next" UrlPaging="false" 
                               onpagechanging="XieChen_PageChanging" AlwaysShow="True" 
                           >
                          </webdiyer:AspNetPager>
                       </div>  
                     </div> 
                     <%} %>
                   </ContentTemplate>
                   </asp:UpdatePanel>
                  </div>
              <!--携程  end-->
              
                 <!--大众点评开始-->
                  <div id="miao"> 
                   <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Block">
                   <ContentTemplate>
                      <%
                     if (DaZhongDT.Rows.Count == 0)
                       { 
                       %>
                       <center>
                            <div id="notext"><img src="../imagesZ/notie.png" />对不起，暂时无评论！</div>
                        </center>
                       <%}
                       else
                       {
                            %>
                    
                
                 <!--有评论的样式-->  
                    
                  <div id="temp">
 
                         综合评价:
                         <div id="d-img">
                           <% 
                             float DZScore = 0; ;
                             String DZAvgPrice = "--";
                             String DZTaste = "--";
                             String DZEnvironment = "--";
                             String DZService = "--";
                             if (DZTotalRate.Rows.Count > 0)
                             {
                                
                                 if (DZTotalRate.Rows[0]["AvgRate"] != null && DZTotalRate.Rows[0]["AvgRate"] != "")
                                     DZScore = float.Parse(DZTotalRate.Rows[0]["AvgRate"].ToString());
                                 if (DZTotalRate.Rows[0]["AvgPrice"] != null && DZTotalRate.Rows[0]["AvgPrice"].ToString() != "")
                                     DZAvgPrice = DZTotalRate.Rows[0]["AvgPrice"].ToString();
                                 if (DZTotalRate.Rows[0]["Taste"] != null && DZTotalRate.Rows[0]["Taste"].ToString() != "")
                                     DZTaste = DZTotalRate.Rows[0]["Taste"].ToString();
                                 if (DZTotalRate.Rows[0]["Environment"] != null && DZTotalRate.Rows[0]["Environment"].ToString() != "")
                                     DZEnvironment = DZTotalRate.Rows[0]["Environment"].ToString();
                                 if (DZTotalRate.Rows[0]["Service"] != null && DZTotalRate.Rows[0]["Service"].ToString() != "")
                                     DZService = DZTotalRate.Rows[0]["Service"].ToString();

                             }
                             for(int i=0;i<DZScore;i++)
                             {
                          %>
                         <img src="../imagesZ/star-1.png" height="21" width="21" alt="星星" id="c-img-1" />
                          <%
                             }
                              %>
                        <!--<a href="#">(936人)</a>-->
                        <span id="up-value">人均 ￥<%=DZAvgPrice%></span>
                         <span id="up-value">口味 <%=DZTaste%></span>
                         <span id="up-value">环境 <%=DZEnvironment%></span>
                         <span id="up-value">服务 <%=DZService%></span>
                         </div>
                       </div>
                       <%
                           for (int j = 0; j < DaZhongDT.Rows.Count; j++)
                           {     
                       %>
                       <div id="temp-1">
                        <div id="c-portrait">
                           <a href="#"><img src="../imagesZ/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#">海信</a></p>
                        </div>
                        <div id="c-btn-value">
                           <div id="c-star"> 
                           <%
                                for (int i = 0; i < int.Parse(DaZhongDT.Rows[j]["Rate"].ToString()); i++)
                                {
                            %>  
                              <img src="../imagesZ/star-2.png" width="14" height="14" alt="pingfen" />
                               <%
                                } 
                            %>
                              <span id="c-star-l"><%=int.Parse(DaZhongDT.Rows[j]["Rate"].ToString()) %>分</span>
                              <span id="u-value">人均 ￥<%=DaZhongDT.Rows[j]["AvgPrice"].ToString() %></span>
                               <span id="u-value">口味 <%=DaZhongDT.Rows[j]["Taste"].ToString() %></span>
                               <span id="u-value">环境 <%=DaZhongDT.Rows[j]["Environment"].ToString() %></span>
                               <span id="u-value">服务 <%=DaZhongDT.Rows[j]["Service"].ToString() %></span>
                           </div>
                        </div>
                        <div id="c-btn-txt">
                            <p id="c-value"><%=DaZhongDT.Rows[j]["Content"].ToString() %></p>
                            <p id="c-time"><%=DaZhongDT.Rows[j]["PublishTime"].ToString() %></p>
                        </div>
                        
                      </div>
                      <div style="clear:both"></div>
                      <%
                           } 
                      %>
                      <div id="r-page"> 
                      <div class="black2">
                      <webdiyer:AspNetPager ID="AspNetPager1" runat="server" Width="100%" 
                               PageSize="2"  CurrentPageIndex="1"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="Prev"   
                                    NextPageText="Next" UrlPaging="false" 
                               onpagechanging="DaZhong_PageChanging" AlwaysShow="True">
                      </webdiyer:AspNetPager>
                      </div>
                      </div>  
                      <%} %>
                     </ContentTemplate>
                    </asp:UpdatePanel>
                   
                  </div>
                  <!--大众点评 end-->
                  
                      <!--爱帮开始-->
                      <div id="miao">
                     <asp:UpdatePanel ID="UpdatePanel3" runat="server" RenderMode="Block" >
                  <ContentTemplate>
                  <%
                      if (AiBangDT.Rows.Count == 0)
                      {
                         %>
                         <center>
                            <div id="Div2"><img src="../imagesZ/notie.png" />对不起，暂时无评论！</div>
                        </center>
                        <%}

                      else
                      { %>
                     <div id="temp">
                         综合评价:
                         <div id="d-img">
                          <%  
                            int ABAvgScore = 0;
                            String ABAvgRate = "--";

                            if (DZTotalRate.Rows.Count > 0)
                            {
                                if (ABTotalTate.Rows[0]["AvgRate"] != null && ABTotalTate.Rows[0]["AvgRate"] != "")
                                    ABAvgScore = int.Parse(ABTotalTate.Rows[0]["AvgRate"].ToString());
                                if (ABTotalTate.Rows[0]["AvgRate"] != null && ABTotalTate.Rows[0]["AvgRate"] != "")
                                    ABAvgRate = ABTotalTate.Rows[0]["AvgRate"].ToString();


                            }
                            for (int k = 0; k < ABAvgScore; k++)
                            {
                         %>
                         <img src="../imagesZ/star-1.png" height="21" width="21" alt="星星" id="c-img-1" />
                         <%
                            }
                         %>
                        <a href="#">(936人)</a>
                        <span id="up-value">人均 ￥<%=ABAvgRate%></span>

                         <!--<span id="up-value">服务 7.5</span>-->
                         </div>
                       </div>
                       <%
                           for (int k = 0; k < AiBangDT.Rows.Count; k++)
                           {
                               float StarNum = float.Parse(AiBangDT.Rows[k]["Rate"].ToString());
                            %>
                       <div id="temp-1">
                        <div id="c-portrait">
                           <a href="#"><img src="../imagesZ/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#"><%=AiBangDT.Rows[k]["PublisherNickName"].ToString()%></a></p>
                        </div>
                        <div id="c-btn-value">
                           <div id="c-star">
                           <% for (int m = 0; m < StarNum-1; m++)
                               {
                                %>  
                              <img src="../imagesZ/star-2.png" width="14" height="14" alt="pingfen" />
                              <%
                               }
                                   %>
                              <span id="c-star-l"><%=AiBangDT.Rows[k]["Rate"].ToString()%>分</span>
                              <span id="u-value">人均 ￥65</span>
                              <span id="Span1">口味 <%=AiBangDT.Rows[k]["Taste"].ToString()%></span>
                               <span id="u-value">环境 <%=AiBangDT.Rows[k]["Environment"].ToString()%></span>
                               <span id="Span2">服务 <%=AiBangDT.Rows[k]["Service"].ToString()%></span>
                              
                           </div>
                        </div>
                        <div id="c-btn-txt">
                            <p id="c-value"><%=AiBangDT.Rows[k]["Content"].ToString()%></p>
                            <p id="c-time"><%=AiBangDT.Rows[k]["PublishTime"].ToString()%></p>
                        </div>
                        
                      </div>
                         <div style="clear:both"></div>
                                  <%
                           }
                         %>         
                    <div id="r-page">
                     <div class="black2">
                               <webdiyer:AspNetPager ID="AspNetPager2" runat="server" Width="100%" 
                               PageSize="3"  CurrentPageIndex="1"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="Prev"   
                                    NextPageText="Next" UrlPaging="false" 
                               onpagechanging="AiBang_PageChanging" AlwaysShow="True">
                            </webdiyer:AspNetPager>
                      </div>
                    </div> 
                    <!-- 爱帮 end-->
                    <%} %>
                     </ContentTemplate>
                    </asp:UpdatePanel>
                    </div>

            </div> 
             
             
          </div><!--end c-left-->
          
          
          <!--end c-right start-->
          <div id="c-right">
              <div id="r-up">
                 <h2><img src="../imagesZ/fire.png" width="25" height="25" style="padding-right:10px; padding-top:5xp; ">大家还看了</h2>
                 <div id="r-list">
                   <div id="r-img"><a href="#"><img src="../EleImages/椿记烧鹅叠彩店.jpg" width="152" height="103" alt="酒店图片链接"/></a></div>
                   <div id="r-ms">
                      <h3><a href="#">椿记烧鹅(叠彩店)</a></h3>
                      <p>地址：叠彩区 中山北路1号桂林酒店2楼</p>
                      <p>联系电话：0773-2828898 </p>
                      <p>营业时间：24小时营业</p>
                      
                   </div>
                 </div>
                 <div style="clear:both"></div>
                 <!--end r-list-->
                 <div id="r-list">
                   <div id="r-img"><a href="#"><img src="../EleImages/老根农家饭店.jpg" width="152" height="103" alt="酒店图片链接"/></a></div>
                   <div id="r-ms">
                      <h3><a href="#">老根农家饭店</a></h3>
                      <p>地址：阳朔县 旧县(近遇龙河)</p>
                      <p>联系电话：0773-8772715</p>
                      <p>营业时间：24小时营业</p>
                      
                   </div>
                 </div><!--end r-list-->
                   <div style="clear:both"></div>
                 <div id="r-list">
                    <div id="r-img"><a href="#"><img src="../EleImages/万景楼.jpg" width="152" height="103" alt="酒店图片链接"/></a></div>
                   <div id="r-ms">
                      <h3><a href="#">万景楼</a></h3>
                      <p>地址：龙胜各族自治县 龙胜县和平乡大寨村龙脊梯田景区</p>
                      <p>联系电话：13877352218</p>
                      <p>营业时间：24小时营业</p>
                      
                   </div>
                 </div><!--end r-list-->
                   <div style="clear:both"></div>
                
                 <div id="r-change">
                   <p><a href="#">换一批</a></p>
                 
                 </div>
               <div style="clear:both"></div>
             </div>  <!--end r-up-->
             <div style="clear:both"></div>
             
               <div id="r-but">
                 <h2>大家点评</h2>
                 <!--无评论的样式-->   
                    <center>
                      <div id="notext-1" style=" "><img src="../imagesZ/notie.png" />对不起，暂时无评论！</div>
                    </center>
                    <!--end-->  
                    
                   <!--
                <!--有评论的样式-->      
                   <!--start r-but
                   <div class="vll">
                   
                  <div id="r-list-b">
                        <div id="r-img-b">    
                            <a href="#"><img src="../imagesZ/m-hp2.png" width="68" height="80" alt="用户头像链接"/></a>
                            <p id="r-user"><a href="#">叶蓓子</a></p>
                         </div>
                           <div id="r-ms-b">
                            <h2>
                              <a href="#">
                                评分:5分
                                <img src="../imagesZ/star-3.png" />
                                <img src="../imagesZ/star-3.png" />
                                <img src="../imagesZ/star-3.png" />
                                <img src="../imagesZ/star-3.png" />
                                <img src="../imagesZ/star-3.png" />
                               </a>
                            </h2>
                          <p>还行呀，很不错，一下还会来的，继续来支持，来了还行来！还行呀，很不错，一下还会来的，继续来支持，来了还行来还行呀，很不错，一下还会来的，继续来支持，来dkldldjkdjfkdljfjs款到即发肯德基款到即发的健康的健康飞机都快疯了的健康了街道口了还行来</p>
                           <div id="p-time">2014-01-20</div>
                             
                      
                   </div>
                   </div> <!--end r-list-b-
                   <div id="r-list-b">
                        <div id="r-img-b">    
                            <a href="#"><img src="../imagesZ/m-hp2.png" width="68" height="80" alt="用户头像链接"/></a>
                            <p id="r-user"><a href="#">叶蓓子</a></p>
                         </div>
                           <div id="r-ms-b">
                            <h2>
                              <a href="#">
                                评分:5分
                                <img src="../imagesZ/star-3.png" />
                                <img src="../imagesZ/star-3.png" />
                                <img src="../imagesZ/star-3.png" />
                                <img src="../imagesZ/star-3.png" />
                                <img src="../imagesZ/star-3.png" />
                               </a>
                            </h2>
                          <p>还行呀，很不错，一下还会来的，继续来支持，来了还行来！！还行呀，很不错，一下还会来的，继续来支持，来！还行呀，很不错，一下还会来的，继续来支持，来</p>
                          <div id="p-time">2014-01-20</div>
                      
                   </div>
                   </div><!--end r-list-b
                   
                  <div id="r-list-b">
                        <div id="r-img-b">    
                            <a href="#"><img src="../imagesZ/m-hp2.png" width="68" height="80" alt="用户头像链接"/></a>
                            <p id="r-user"><a href="#">叶蓓子</a></p>
                         </div>
                           <div id="r-ms-b">
                            <h2>
                              <a href="#">
                                评分:5分
                                <img src="../imagesZ/star-3.png" />
                                <img src="../imagesZ/star-3.png" />
                                <img src="../imagesZ/star-3.png" />
                                <img src="../imagesZ/star-3.png" />
                                <img src="../imagesZ/star-3.png" />
                               </a>
                            </h2>
                          <p>还行呀，很不错，一下还会来的，继续来支持，来了还行来！</p>
                          <div id="p-time">2014-01-20</div>
                      
                   </div>
                   </div><!--end r-list-b-
                   <div id="l-page">
                     <div class="black2"><span class="disabled"> < </span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a>...<a href="#?page=7">7</a><a href="#?page=8">8</a><a href="#?page=2"> > </a></div></p>
                   </div>
                  </div> -->
                 <!--end--> 
                   <div id="r-v">
                      <a href="#"><img src="../imagesZ/chat3.png" />
                      我来评论：</a>
                   </div>
                   <div id="r-v-v">
                      <div id="star">
                          <span>点击星星就能打分</span>
                          <ul>
                              <li><a href="javascript:;">1</a></li>
                              <li><a href="javascript:;">2</a></li>
                              <li><a href="javascript:;">3</a></li>
                              <li><a href="javascript:;">4</a></li>
                              <li><a href="javascript:;">5</a></li>
                          </ul>
                          <span></span>
                          <p></p>
                       </div>
                    <!--end r-but--->   
                   </div>
                    <textarea id="r-tex" cols="35" rows="2" ></textarea>
                    <div id="r-warn">还可以输入120个字<span id="r-bottom"><button></button></span></div>
                   
                 
               </div> <!--end r-but--->
          </div><!--end right--->
          </div><!--end content--->
      <div style="clear:both"></div>
      
      </form>
            <!--精灵的代码-->
      
       <div id="smallJL">
        <div id="floatWindow">
                <img id="myimg01" src="../imagesZ/JL1.png" width="126" height="100" onMouseOver="changeImg()" onMouseOut="changeBack()" onClick="IsNeedHelp()">
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
      
        <!--end-->  
      <div id="blue-line"></div>
      <div id="footer" >
         <p>友情链接：美团 |  淘宝旅游  | 去哪儿  |  马蜂窝  |  携程  |  同城  |  豆瓣  |  百度旅游  |</p><br />
         <p>网络文化经营许可证：文网文[2010]040号|增值电信业务经营许可证：浙B2-20080224-1|信息网络传播视听节目许可证：1109364号</p>
      
      </div>
  
   
</div>
</div>
<script>InitScrollBar('scroll_1','content_1','scrollbar_1','handle_1',300);</script>
</body>
</html>

