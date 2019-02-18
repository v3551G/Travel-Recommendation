<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Entertainment.aspx.cs" Inherits="RouteRecomment.JuneFifPages.Pages.Entertainment" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/Entertainment.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../js/jquery.1.4.2-min.js" ></script>
<script src="../js/Entertainment.js"></script>
<script src="../js/jqEntertainment.js"></script>
<script src="../js/jingling.js"></script>

<script src="../js/jquery.js"  type="text/javascript" ></script>
<script src="../js/mousewheel.js" type="text/javascript" ></script>
<script src="../js/easyscroll.js" type="text/javascript" ></script>

<script type="text/javascript">$(function(){$('.div_scroll').scroll_absolute({arrows:true})});</script>

<!-- .container2 arrows: false -->
<script type="text/javascript">$(function(){$('.container2 .div_scroll').scroll_absolute({arrows:false})});</script>

	

<title>Entertainment</title>



<style type="text/css">

*{margin:0;padding:0;list-style-type:none;}

a, input:focus, textarea:focus {
    outline: none;
}


.container2 .div_scroll p {

	font-size:12px;line-height:220%;text-align:left;text-indent:2em;
	padding-right:5px;
}	



.container2 {
	width: 240px;
	height: auto;
	background-color: none;
	float: left;
}

.container2 .div_scroll {
	width: 100%;
	height: 230px;
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
    height: 16px;osition:absolute;border-radius:5px;}
.top ul p{font-size:12px;line-height:220%;text-align:left;text-indent:2em;}

</style>
</head>

<body>
<form runat="server">
<div id="all-body">

<img src="../imagesZ/bg1-.png"/>


<div id="all">
      
      <div id="header" >

         <div id="nav">
         
          
    
    
    <div id="seek-top">
		<div class="Cen">
		
			<img src="../imagesZ/LOGO.png"/>
			<div class="sousuo">
				
			<input type="text" name="text" id="seek-input" node-type="loginname" autocomplete="off" placeholder="桂林漓江">
			
			<div class="seek-button" title="搜索"><a href="#"></a></div>
			</div>
                        
                       
			<ul class="seek-login" id="loginfirst">
				<li><a href="<%=person.ToString() %>" target="_blank"><%=login.ToString() %></a></li>
                <!--<li><a href="login1.aspx" target="_blank">登录</a></li>-->
                <li><a href="zhuce.aspx" target="_blank">注册</a></li>
        
			</ul>
            <%--<div id="logined">
                
               <p> Hi,<a href="">叶蓓kkkk子</a>您好！欢迎来到天际一线智慧一线智慧推荐旅游网<a href="" style="padding-left:20px;" >退出</a></p>
            
               
            </div>--%>
            <div id="weather">
                <iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=12&bdc=%23&icon=1&num=1" width="190" height="80" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="float:left;margin-top:-5px;margin-left:8px;"></iframe>
            </div>
                        
		</div>
			
	</div>
    
    
    
    
    
    

         </div>
         <div id="h-title"><h2><%=EntertainmentName%></h2></div>
         <div class="photo clearfix">
                    
            
           
              <div id="focus">
              <ul>
              <%
                  for (int i = 0; i < EnterPicDT.Rows.Count; i++)
                  {
                      String PicUrl = EnterPicDT.Rows[i]["PicPath"].ToString();
                      PicUrl = PicUrl.Substring(PicUrl.IndexOf('U'));
                      PicUrl = "../../../" + "Admin/" + PicUrl;
                     
               %>
                  <li><a href="#" target="_blank" title=""><img alt="" src=<%=PicUrl%>/></a></li>
                      <%
                  }
                  if (EnterPicDT.Rows.Count == 0)
                  {
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
                     <div id="m-t"> 
                        <p>地址： <%=Local%></p>
                     </div>
                 </div><!--m-1 end-->
                 <div style="clear:both"></div>
                 
                    <div id="m-2">
                         <div class="h-lev"><img src="../imagesZ/m-2.png" /></div>
                         <div id="m-t"> 
                             <p>联系方式：<%=PhoneNum%></p>
                             <!--<p>传    真：0213-223232323</p>-->
                         </div>
                    </div><!--m-1 end-->
                    
                    <div id="m-3">
                         <div class="h-lev"><img  src="../imagesZ/m-3.png" /></div>
                         <div id="m-t"> 
                             <p>营业时间：<%=OpenTime%></p>
                             <!--<p>营业时间：10：00~22:00</p>-->
                         </div>
                    </div><!--m-1 end-->
                    
                     <div style="clear:both"></div>
                     <div id="m-4">
                         <div class="h-lev"><img src="../imagesZ/m-4.png" /></div>
                          
                        <div class="container2">

     <div class="div_scroll">
			<p> 娱乐简介：<%=Introduce%></p>
	
	</div>
	

</div>
                  
           
                    </div><!--m-1 end-->
                 
          </div>
             
          </div>
          
      
      </div><!--header end-->
        
      <div id="content">
          <div id="c-left">
      
             <div style="clear:both"></div>
             <div id="c-btn">
               <p>其他网站的评论</p>
             </div><!--end c-btn-->
             
             
              <!--其他网站评论开始-->
             <div id="div1">
                 
                  <input type="button" class="active"  value="大众点评" />
                  <input type="button" value="爱帮" />
                  <asp:ScriptManager ID="ScriptManager1"  runat="server"  AsyncPostBackTimeout="0"  >
                  </asp:ScriptManager>
                
              
                 <!--大众点评开始-->
                  <div id="miao" style="display:block;"> 
                   <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Block">
                    <ContentTemplate>
                  <%
                      if (DZTotalDT.Rows.Count == 0)
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
                  
                  
                   <!--有评论的样式-->
                  <div id="temp">
                         综合评价:
                         <div id="d-img">
                                                                           <%  
                        float StarNum;
                        String AvgPrice;
                        String Product;
                        String Environment;
                        String Service;

                        if (DaZhongDT.Rows.Count > 0)
                        {
                            if (DZTotalDT.Rows[0]["AvgRate"] != null && DZTotalDT.Rows[0]["AvgRate"] != "")
                            {
                                StarNum = float.Parse(DZTotalDT.Rows[0]["AvgRate"].ToString());
                            }
                            else
                                StarNum = 0;
                            if (DZTotalDT.Rows[0]["AvgPrice"] != "" & DZTotalDT.Rows[0]["AvgPrice"] != null)
                                AvgPrice = DZTotalDT.Rows[0]["AvgPrice"].ToString();
                            else AvgPrice = "--";
                            if (DZTotalDT.Rows[0]["Taste"] != "" & DZTotalDT.Rows[0]["Taste"] != null)
                                Product = DZTotalDT.Rows[0]["Taste"].ToString();
                            else Product = "--";
                            if (DZTotalDT.Rows[0]["Environment"] != "" & DZTotalDT.Rows[0]["Environment"] != null)
                                Environment = DZTotalDT.Rows[0]["Environment"].ToString();
                            else Environment = "--";
                            if (DZTotalDT.Rows[0]["Service"] != "" & DZTotalDT.Rows[0]["Service"] != null)
                                Service = DZTotalDT.Rows[0]["Service"].ToString();
                            else Service = "--";
                        }
                        else
                        {
                            StarNum = 0;
                            AvgPrice = "--";
                            Product = "--";
                            Environment = "--";
                            Service = "--";
                        }

                        for (int i = 0; i < StarNum; i++)
                        {
                         %>  
                         <img src="../imagesZ/star-1.png" height="21" width="21" alt="星星" id="c-img-1" />
                        <%} %>
                        <a href="#">(936人)</a>
                        <span id="up-value">人均 ￥<%=AvgPrice%></span><span id="up-value">口味 <%=Product%></span>
                         <span id="up-value">环境 <%=Environment%></span>
                         <span id="up-value">服务 <%=Service%></span>
                         </div>
                       </div>
                                               <%
                                                   for (int j = 0; j < DaZhongDT.Rows.Count; j++)
                                                   {
                                                       int TempStartNum = int.Parse(DaZhongDT.Rows[j]["Rate"].ToString());
                        %>
                       <div id="temp-1">
                        <div id="c-portrait">
                           <a href="#"><img src="../imagesZ/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#"><%=DaZhongDT.Rows[j]["PublisherNickName"].ToString()%></a></p>
                        </div>
                        <div id="c-btn-value">
                           <div id="c-star">     
                           <%
                                                   for (int k = 0; k < TempStartNum; k++)
                                                   {
                             %>                
                                    <img src="../imagesZ/star-2.png" width="14" height="14" alt="pingfen" />
                              <%
                                                   }  
                                %>
                              <span id="c-star-l"><%=TempStartNum%>分</span>
                              <span id="u-value">人均 ￥<%=DaZhongDT.Rows[j]["AvgPrice"].ToString()%></span><span id="u-value">口味 <%=DaZhongDT.Rows[j]["Taste"].ToString()%></span>
                               <span id="u-value">环境 <%=DaZhongDT.Rows[j]["Environment"].ToString()%></span>
                               <span id="u-value">服务 <%=DaZhongDT.Rows[j]["Service"].ToString()%></span>
                           </div>
                        </div>
                        <div id="c-btn-txt">
                            <p id="c-value"><%=DaZhongDT.Rows[j]["Content"].ToString()%></p>
                            <p id="c-time"><%=DaZhongDT.Rows[j]["PublishTime"].ToString()%></p>
                        </div>
                        
                      </div>
                      <div style="clear:both"></div>
                      <%} %>
                        <div id="r-page"> 
                           <div class="black2">
                           <webdiyer:AspNetPager ID="AspNetPager4" runat="server" Width="100%" 
                               PageSize="2"  CurrentPageIndex="1"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="Prev"   
                                    NextPageText="Next" UrlPaging="false" 
                               onpagechanging="DaZhong_PageChanging" AlwaysShow="True" 
                             >
                            </webdiyer:AspNetPager>
                      </div>                
                       </div>   
                      
                     <!--end-->
                     
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
                      <div id="notext" style=" "><img src="../imagesZ/notie.png" />对不起，暂时无评论！</div>
                    </center>
                          <%}
                         else
                         {
                               %>
                     <div id="temp">
                         综合评价:
                         <div id="d-img">
                          <%   
                          float ABTotal = 0.0f;
                          String ABAvgPrice = "--";
                          if (ABTotalDT.Rows.Count > 0)
                          {
                              if (ABTotalDT.Rows[0]["AvgRate"] != null && ABTotalDT.Rows[0]["AvgRate"] != "")
                                  ABTotal = float.Parse(ABTotalDT.Rows[0]["AvgRate"].ToString());
                              if (ABTotalDT.Rows[0]["AvgPrice"] != "" && ABTotalDT.Rows[0]["AvgPrice"] != null)
                              {
                                  ABAvgPrice = ABTotalDT.Rows[0]["AvgPrice"].ToString();
                              }
                          }
                          for(int i=0;i<ABTotal;i++)
                          {
                          %>
                         <img src="../imagesZ/star-1.png" height="21" width="21" alt="星星" id="c-img-1" />
                         <%} %>
                       
                        <span id="up-value">人均 ￥<%=ABAvgPrice%></span></div>
                       </div>
                        <%
                        for (int j = 0; j < AiBangDT.Rows.Count; j++)
                        {
                            float StarNum = float.Parse(AiBangDT.Rows[j]["Rate"].ToString());
                         %>
                       <div id="temp-1">
                        <div id="c-portrait">
                           <a href="#"><img src="../imagesZ/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#"><%=AiBangDT.Rows[j]["PublisherNickName"].ToString()%></a></p>
                        </div>
                        <div id="c-btn-value">
                           <div id="c-star">    
                           <%
                               for (int k = 0; k < StarNum; k++)
                               {
                             %>                           
                              <img src="../imagesZ/star-2.png" width="14" height="14" alt="pingfen" />
                                <%
                               } 
                            %>
                              <span id="c-star-l"><%=StarNum %>分</span>
                             <!-- <span id="u-value">人均 ￥65</span>
                               <span id="u-value">口味 7.5</span>
                               <span id="u-value">环境 7.5</span>
                               <span id="u-value">服务 7.5</span>-->
                           </div>
                        </div>
                        <div id="c-btn-txt">
                            <p id="c-value"><%=AiBangDT.Rows[j]["Content"].ToString()%></p>
                            <p id="c-time"><%=AiBangDT.Rows[j]["PublishTime"].ToString()%></p>
                        </div>
                        
                      </div>
                         <div style="clear:both"></div>
                     <%} %>
                      <div id="r-page">
                        <div class="black2">
                               <webdiyer:AspNetPager ID="AspNetPager2" runat="server" Width="100%" 
                               PageSize="3"  CurrentPageIndex="1"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="Prev"   
                                    NextPageText="Next" UrlPaging="false" 
                               onpagechanging="AiBang_PageChanging" AlwaysShow="false">
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
                 <h2><img src="../imagesZ/fire.png" width="25" height="25" style="padding-right:10px; padding-top:5px; ">大家还看了</h2>
                 <div id="r-list">
                   <div id="r-img"><a href="Entertainment.aspx?EnterID=6"><img src="../EleImages/朵儿咖啡馆.jpg" width="152" height="103" alt="酒店图片链接"/></a></div>
                   <div id="r-ms">
                      <h3><a href="#">朵儿咖啡馆</a></h3>
                      <p>地址：七星区建干路</p>
                      <p>联系电话：5896680</p>
                      <p>营业时间：24小时营业</p>
                      
                   </div>
                 </div>
                 <div style="clear:both"></div>
                 <!--end r-list-->
                 <div id="r-list">
                   <div id="r-img"><a href="Entertainment.aspx?EnterID=1"><img src="../EleImages/俪舍咖啡.jpg" width="152" height="103" alt="酒店图片链接"/></a></div>
                   <div id="r-ms">
                      <h3><a href="#">俪舍咖啡</a></h3>
                       <p>地址：秀峰区滨江路18号</p>
                      <p>联系电话：2106880</p>
                      <p>营业时间：24小时营业</p>
                      
                   </div>
                 </div><!--end r-list-->
                   <div style="clear:both"></div>
                 <div id="r-list">
                    <div id="r-img"><a href="Entertainment.aspx?EnterID=5"><img src="../EleImages/南溪山影院.jpg" width="152" height="103" alt="酒店图片链接"/></a></div>
                   <div id="r-ms">
                      <h3><a href="#">南溪山影院</a></h3>
                      <p>地址：中山南路</p>
                      <p>联系电话：3835064</p>
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
               
               
                   
                    
    <!-- 评论区-- >   
         <!-- 显示评论-->                         
                  <div class="vll">
                  <%
           //根据SceneryID找到相应的Scenery评论
         if (PublicComment != null && PublicComment.Rows.Count > 0) { 
             
             for (int i = 0; i < PublicComment.Rows.Count; i++ ) {
                 String CmtContent = PublicComment.Rows[i]["CommentContent"].ToString();
                 String CmtTime    = PublicComment.Rows[i]["PublishTime"].ToString();
                 String CmtScore   = PublicComment.Rows[i]["Rate"].ToString();
                 String CmtUserID = PublicComment.Rows[i]["UserID"].ToString();
                 CmtUser = _EntertainmentBLL.GetCmtUserAccountByUserID(CmtUserID);
                 String CmtUserName = CmtUser.Rows[0]["UserAccount"].ToString();
                  %>                     
                  <div id="r-list-b">
                        <div id="r-img-b">    
                            <a href="#"><img src="../imagesZ/m-hp2.png" width="68" height="80" alt="用户头像链接"/></a>
                            <p id="r-user"><a href="#"><%=CmtUserName %></a></p>
                         </div>
                           <div id="r-ms-b">
                            <h2>
                              <a href="#">评分:<%=CmtScore %>分
                                         <%
                                            float CmtScor = float.Parse(CmtScore);
                                            for (int j = 0; j < CmtScor; j++) 
                                            { 
                                         %>     
                                                <img src="../imagesH/star-3.png" />
                                         <%    
                                            }
                                            if (int.Parse(CmtScore) - CmtScor > 0.2)
                                            { 
                                         %>
                                                <img src="../imagesH/star-3hui1.png"/>
                                         <%
                                           }
                                           for (int k = 0; k < 5 - Math.Ceiling(CmtScor);k++ )
                                           {                                          
                                         %>
                                                <img src="../imagesH/star-3hui2.png"/>
                                         <%
                                           }                                                                                     
                                         %>            
                               </a>
                            </h2>
                          <p><%=CmtContent %></p>
                          <div id="p-time"><%=CmtTime %></div>                      
                   </div>
                   </div>
                 
                  <%
                 }
             }
             else {     
                   %>
                      <center>
                      <div id="notext" style=" "><img src="../imagesZ/notie.png" />对不起，暂时无评论！</div>
                    </center>
                    
                  <%
             
              }   
                  %>     
                   <div id="l-page">
                     <div class="black2"><span class="disabled"> < </span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a>...<a href="#?page=7">7</a><a href="#?page=8">8</a><a href="#?page=2"> > </a></div></p>
                   </div>
                </div>
               <!--end-->   
                 
                   
                  <!--发表评论--->
                   <div id="r-v">
                      <asp:hiddenfield id="CmtValue" runat="server" value=""></asp:hiddenfield>
                      <a href="#"><img src="../imagesZ/chat2.png" />
                      我来评论：</a>
                   </div>
                   <div id="r-v-v">
                      <div id="star">
                          <span>评分</span>
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
                   </div>
                    <textarea id="r-tex" name="textarea" cols="35" rows="5" ></textarea>
                    <div id="r-warn">还可以输入120个字<span id="r-bottom"><button></button></span></div>
                    <asp:Button ID="Button1" runat="server" Text="发&nbsp;布" OnClick="Button1_Click" /> <!--点击发布响应事件 -->  
                   
                 
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
               <input type="button" id="input2" onClick="noneedHelp()"/>
        </div>
        <div id="diabox2"  style="display:none;"><!-- -->

               
                        



                <div id="diabox2-child">
                   <input type="button" id="input3" onClick="noAnswer()" />
               <!--不回答问题-->

                        <p class="questionTitle">先r()" />
               <!--不回答问题-->

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
                        
                <input  id="input4" value=" " onClick="Answer()" /><!--回答问题-->
                
                        
                </div>
        </div>
        <div id="diabox3" style="display:none;">
                
               <!--链接到推荐页面--> <a href="Recommend.aspx" target="_blank"><input  id="input5" value=" " onClick="goToSee()"/></a>
                <input  id="input6" value=" " onClick="nogoToSee()"/>
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
</body>
</html>

