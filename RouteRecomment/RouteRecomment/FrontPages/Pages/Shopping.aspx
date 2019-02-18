<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shopping.aspx.cs" Inherits="RouteRecomment.FrontPages.Pages.Shopping" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/shopping.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../js/jquery.1.4.2-min.js" ></script>
<script src="../js/shopping.js"></script>
<script src="../js/jqshopping.js"></script>


<title>shopping</title>
<script type="text/javascript">
$(function(){
	var slideHeight = 75; // px
	var defHeight = $('#wrap').height();
	if(defHeight >= slideHeight){
		$('#wrap').css('height' , slideHeight + 'px');
		$('#read-more').append('<a href="#">详细信息</a>');
		$('#read-more a').click(function(){
			var curHeight = $('#wrap').height();
			if(curHeight == slideHeight){
				$('#wrap').animate({
				  height: defHeight
				}, "normal");
				$('#read-more a').html('收起');
				$('#gradient').fadeOut();
			}else{
				$('#wrap').animate({
				  height: slideHeight
				}, "normal");
				$('#read-more a').html('详细信息');
				$('#gradient').fadeIn();
			}
			return false;
		});		
	}
});
</script>

</head>

<body>
<form runat="server">
<div id="all-body">

<img src="../images/ht-bg.jpg"/>


<div id="all">
      
      <div id="header" >

         <div id="nav">
         
            	<div id="seek-top">
		
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
         <div class="photo clearfix">
                    
            
             <div id="right-girl"><img  src="../images/girlright.png" width="201" height="608" /></div>
              <div id="focus">
              <ul>
              
              <%
                  for (int i = 0; i < MallPicDT.Rows.Count; i++)
                  {
                      String PicUrl = MallPicDT.Rows[i]["PicPath"].ToString();
                      PicUrl = PicUrl.Substring(PicUrl.IndexOf('U'));
                      PicUrl = "../../../" + "Admin/" + PicUrl;
              %>
                  <li><a href="#" target="_blank" title=""><img alt="" src=<%=PicUrl%>/></a></li>
              <%
                 } 
              %>
              <%
                  if (MallPicDT.Rows.Count == 0)
                  {
                      string MoRenPic = "../../../Admin/UpLoadPics/201404191250270thumb(1).jpg";
              %>
              <li><a href="#" target="_blank" title=""><img alt="" src=<%=MoRenPic%>/></a></li>
              <%
                  } 
              %>
                <!-- <li><a href="#" target="_blank" title=""><img alt="" src="../images/tp-2.jpg" /></a></li>
                  <li><a href="#" target="_blank" title=""><img alt="" src="../images/tp-3.jpg" /></a></li>
                  <li><a href="#" target="_blank" title=""><img alt="" src="../images/tp-4.jpg" /></a></li>
                  <li><a href="#" target="_blank" title=""><img alt="" src="../images/tp-5.jpg" /></a></li>
                  <li><a href="#" target="_blank" title=""><img alt="" src="../images/tp-6.jpg" /></a></li>-->
              </ul>
              </div>
             <div id="left-girl"><img src="../images/girlleft.png" width="183" height="622" /></div>
          </div>
          <div class="txt"><a href="#"><img src="../images/txt-01.png" width="188" height="52" alt="广场" /></a></div>
          <div class="messages">
                <div id="m-1">
                     <div class="h-lev"><img src="../images/m-1.png" /></div>
                     <div id="m-t"> 星级：
                        <%=Local %>
                     </div>
                 </div><!--m-1 end-->
                 <div style="clear:both"></div>
                 
                    <div id="m-2">
                         <div class="h-lev"><img src="../images/m-2.png" /></div>
                         <div id="m-t"> 
                             联系方式：<%=PhoneNum%><br />
                             <!--传    真：0213-223232323-->
                         </div>
                    </div><!--m-1 end-->
                    
                    <div id="m-3">
                         <div class="h-lev"><img  src="../images/m-3.png" /></div>
                         <div id="m-t"> 
                             营业时间：<%=OpenTime%>
                         </div>
                    </div><!--m-1 end-->
                    
                    
                     <div id="m-4">
                         <div class="h-lev"><img src="../images/m-4.png" /></div>
                         <div id="m-t"> 
                         
                            
                            
                                              
                          <div id="container">
                          <div id="wrap">
                              <div>
                                  <p>  商城介绍：<%=Introduction%></p>
                              </div>
                              <div id="gradient"></div>
                          </div>
                          <div id="read-more"></div>
                      </div>
                                              
                            
                            
                            
                         </div>
                    </div><!--m-1 end-->
                 
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
                  <input type="button" value="大众点评" />
                  <input type="button" value="爱帮" />
             <asp:ScriptManager ID="ScriptManager1"  runat="server"  AsyncPostBackTimeout="0"  >
             </asp:ScriptManager>
              
                 <!--大众点评开始-->
                  <div id="miao" style="display:block;">
                   <div id="temp">
                         综合评价:
                         <div id="d-img">
                         <% 
                             float StarNum;
                             
                             String AvgPrice;
                             String Product;
                             String Environment;
                             String Service;
                             if (DZTotalRate.Rows.Count > 0)
                             {
                                 if (DZTotalRate.Rows[0]["AvgRate"] != null && DZTotalRate.Rows[0]["AvgRate"] != "")
                                 {
                                     StarNum = float.Parse(DZTotalRate.Rows[0]["AvgRate"].ToString());
                                 }
                                 else
                                     StarNum = 0;

                                 if (DZTotalRate.Rows[0]["AvgPrice"] != "" & DZTotalRate.Rows[0]["AvgPrice"] != null)
                                     AvgPrice = DZTotalRate.Rows[0]["AvgPrice"].ToString();
                                 else AvgPrice = "--";
                                 if (DZTotalRate.Rows[0]["Product"] != "" & DZTotalRate.Rows[0]["Product"] != null)
                                     Product = DZTotalRate.Rows[0]["Product"].ToString();
                                 else Product = "--";
                                 if (DZTotalRate.Rows[0]["Environment"] != "" & DZTotalRate.Rows[0]["Environment"] != null)
                                     Environment = DZTotalRate.Rows[0]["Environment"].ToString();
                                 else Environment = "--";
                                 if (DZTotalRate.Rows[0]["Service"] != "" & DZTotalRate.Rows[0]["Service"] != null)
                                     Service = DZTotalRate.Rows[0]["Service"].ToString();
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
                         <img src="../images/star-1.png" height="21" width="21" alt="星星" id="c-img-1" />
                         <%
                             }   
                         %>
                        <!-- <img src="../images/star-1.png" height="21" width="21" alt="星星" id="c-img-1" />
                         <img src="../images/star-1.png" height="21" width="21" alt="星星" id="c-img-1" />
                         <img src="../images/star-1.png" height="21" width="21" alt="星星" id="c-img-1" />
                         <img src="../images/star-1.png" height="21" width="21" alt="星星" id="c-img-1" />-->
                        <a href="#"><!--(936人)--></a>
                         <span id="c-star-l">人均 <%=AvgPrice%></span>
                         <span id="c-star-l">产品 <%=Product%></span>
                         <span id="c-star-l">环境 <%=Environment%></span>
                         <span id="c-star-l">服务 <%=Service%></span>
                         </div>
                       </div>
                    
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Block">
                    <ContentTemplate>
                    <%
                        for (int i = 0; i < DZhongDT.Rows.Count; i++)
                        {
                            int StarNum = int.Parse(DZhongDT.Rows[i]["Rate"].ToString());
                         %>
                       <div id="temp-1">
                       
                        <div id="c-portrait">
                           <a href="#"><img src="../images/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#"><%=DZhongDT.Rows[i]["PublisherNickName"]%></a></p>
                        </div>
                        <div id="c-btn-value">
                           <div id="c-star"> 
                           <%
                               for (int j = 0; j < StarNum; j++)
                               {
                            %>                            
                              <img src="../images/star-2.png" width="14" height="14" alt="pingfen" />
                            <%
                               }
                            %>
                            <!--  <img src="../images/star-2.png" width="14" height="14" alt="pingfen" />
                              <img src="../images/star-2.png" width="14" height="14" alt="pingfen" />
                              <img src="../images/star-2.png" width="14" height="14" alt="pingfen" />
                              <img src="../images/star-2.png" width="14" height="14" alt="pingfen" />-->
                              <span id="c-star-l"><%=StarNum %>分</span>
                               <span id="c-star-l">人均 <%=DZhongDT.Rows[i]["AvgPrice"].ToString()%></span>
                               <span id="c-star-l">产品 <%=DZhongDT.Rows[i]["Product"].ToString()%></span>
                               <span id="c-star-l">环境 <%=DZhongDT.Rows[i]["Environment"].ToString()%></span>
                               <span id="c-star-l">服务 <%=DZhongDT.Rows[i]["Service"].ToString()%></span>
                           </div>
                        </div>
                        <div id="c-btn-txt">
                            <p id="c-value"><%=DZhongDT.Rows[i]["Content"].ToString()%></p>
                            <p id="c-time"><%=DZhongDT.Rows[i]["PublishTime"].ToString()%></p>
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
                               onpagechanging="DZhong_PageChanging" AlwaysShow="True" 
                        >
                       </webdiyer:AspNetPager>
                       </div>
                       </div>  
                    </ContentTemplate>
                    </asp:UpdatePanel>
                     
                  </div>
                  <!--大众点评 end-->
                  
                      <!--爱帮开始-->
                      <div id="miao">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Block">
                    <ContentTemplate>
                    
                     <div id="temp">
                         综合评价:
                         <div id="d-img">
                         <%  
                             float ABTotal = 0.0f;
                             if (ABTotalRate.Rows.Count > 0)
                             {
                                 if (ABTotalRate.Rows[0]["AvgRate"] != null && ABTotalRate.Rows[0]["AvgRate"] != "")
                                     ABTotal = float.Parse(ABTotalRate.Rows[0]["AvgRate"].ToString());
                             }
                             for (int i = 0; i <ABTotal ; i++)
                             {
                              %>
                         <img src="../images/star-1.png" height="21" width="21" alt="星星" id="c-img-1" />
                         <%
                             }
                          %>
                        <!--<a href="#">(936人)</a>-->
                         </div>
                       </div>
                       <%
                           for (int j = 0; j < AiBangDT.Rows.Count; j++)
                           {
                               float StarNum = float.Parse(AiBangDT.Rows[j]["Rate"].ToString());
                            %>
                       <div id="temp-1">
                        <div id="c-portrait">
                           <a href="#"><img src="../images/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#"><%=AiBangDT.Rows[j]["PublisherNickName"]%> </a></p>
                        </div>
                        <div id="c-btn-value">
                           <div id="c-star">
                           <%
                               for (int k = 0; k < StarNum; k++)
                               {
                           %>
                              <img src="../images/star-2.png" width="14" height="14" alt="pingfen" />
                              <%
                               }
                                    %>
                              <span id="c-star-l"><%=StarNum%>分</span>
                           </div>
                        </div>
                        <div id="c-btn-txt">
                            <p id="c-value"><%=AiBangDT.Rows[j]["Content"].ToString() %></p>
                            <p id="c-time"><%=AiBangDT.Rows[j]["PublishTime"].ToString() %></p>
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
                               onpagechanging="AiBang_PageChanging" AlwaysShow="True">
                            </webdiyer:AspNetPager>
                      </div></p>
                    </div> 
                    <!-- 爱帮 end-->
                    </ContentTemplate>
                    </asp:UpdatePanel>
                    </div>

            </div> 
             
             
          </div><!--end c-left-->
          
          
          <!--end c-right start-->
          <div id="c-right">
              <div id="r-up">
                 <h2>大家还看了</h2>
                 <div id="r-list">
                   <div id="r-img"><a href="#"><img src="../images/小香港7.jpg" width="152" height="103" alt="酒店图片链接"/></a></div>
                   <div id="r-ms">
                      <h3><a href="Shopping.aspx?ShopID=7">小香港</a></h3>
                      <p>地址：桂林市秀峰区中心广场(近正阳步行街)</p>
                      <p>联系电话：0773-2852725</p>
                      <p>营业时间：24小时营业</p>
                      
                   </div>
                 </div>
                 <div style="clear:both"></div>
                 <!--end r-list-->
                 <div id="r-list">
                   <div id="r-img"><a href="#"><img src="../images/一家人超31.jpg" width="152" height="103" alt="酒店图片链接"/></a></div>
                   <div id="r-ms">
                      <h3><a href="Shopping.aspx?ShopID=31">一家人超</a></h3>
                      <p>地址：红星街888号</p>
                      <p>联系电话：--</p>
                      <p>营业时间：8: 00 -- 22: 00</p>
                      
                   </div>
                 </div><!--end r-list-->
                   <div style="clear:both"></div>
                 <div id="r-list">
                    <div id="r-img"><a href="#"><img src="../images/桂林商贸城9.jpg" width="152" height="103" alt="酒店图片链接"/></a></div>
                   <div id="r-ms">
                      <h3><a href="Shopping.aspx?ShopID=9">商贸城</a></h3>
                      <p>地址：中山北路133号附近</p>
                      <p>联系电话：--</p>
                      <p>营业时间：9:00-18:00</p>
                      
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
                   <!--start r-but-->
                    <h2>大家点评</h2>
                  <div id="r-list-b">
                        <div id="r-img-b">    
                            <a href="#"><img src="../images/m-hp2.png" width="68" height="80" alt="用户头像链接"/></a>
                            <p id="r-user"><a href="#">叶蓓子</a></p>
                         </div>
                           <div id="r-ms-b">
                            <h2>
                              <a href="#">
                                评分:5分
                                <img src="../images/star-3.png" />
                                <img src="../images/star-3.png" />
                                <img src="../images/star-3.png" />
                                <img src="../images/star-3.png" />
                                <img src="../images/star-3.png" />
                               </a>
                            </h2>
                          <p>还行呀，很不错，一下还会来的，继续来支持，来了还行来！还行呀，很不错，一下还会来的，继续来支持，来了还行来还行呀，很不错，一下还会来的，继续来支持，来dkldldjkdjfkdljfjs款到即发肯德基款到即发的健康的健康飞机都快疯了的健康了街道口了还行来</p>
                           <div id="p-time">2014-01-20</div>
                             
                      
                   </div>
                   </div> <!--end r-list-b--->
                   <div id="r-list-b">
                        <div id="r-img-b">    
                            <a href="#"><img src="../images/m-hp2.png" width="68" height="80" alt="用户头像链接"/></a>
                            <p id="r-user"><a href="#">叶蓓子</a></p>
                         </div>
                           <div id="r-ms-b">
                            <h2>
                              <a href="#">
                                评分:5分
                                <img src="../images/star-3.png" />
                                <img src="../images/star-3.png" />
                                <img src="../images/star-3.png" />
                                <img src="../images/star-3.png" />
                                <img src="../images/star-3.png" />
                               </a>
                            </h2>
                          <p>还行呀，很不错，一下还会来的，继续来支持，来了还行来！！还行呀，很不错，一下还会来的，继续来支持，来！还行呀，很不错，一下还会来的，继续来支持，来</p>
                          <div id="p-time">2014-01-20</div>
                      
                   </div>
                   </div><!--end r-list-b--->
                   
                  <div id="r-list-b">
                        <div id="r-img-b">    
                            <a href="#"><img src="../images/m-hp2.png" width="68" height="80" alt="用户头像链接"/></a>
                            <p id="r-user"><a href="#">叶蓓子</a></p>
                         </div>
                           <div id="r-ms-b">
                            <h2>
                              <a href="#">
                                评分:5分
                                <img src="../images/star-3.png" />
                                <img src="../images/star-3.png" />
                                <img src="../images/star-3.png" />
                                <img src="../images/star-3.png" />
                                <img src="../images/star-3.png" />
                               </a>
                            </h2>
                          <p>还行呀，很不错，一下还会来的，继续来支持，来了还行来！</p>
                          <div id="p-time">2014-01-20</div>
                      
                   </div>
                   </div><!--end r-list-b--->
                   <div id="l-page">
                     <div class="black2"><span class="disabled"> < </span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a>...<a href="#?page=7">7</a><a href="#?page=8">8</a><a href="#?page=2"> > </a></div></p>
                   </div>
                   <div id="r-v">
                      <a href="#"><img src="../images/chat2.png" />
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
      <div id="blue-line"></div>
      <div id="footer" >
         <p>友情链接：美团 |  淘宝旅游  | 去哪儿  |  马蜂窝  |  携程  |  同城  |  豆瓣  |  百度旅游  |</p><br />
         <p>网络文化经营许可证：文网文[2010]040号|增值电信业务经营许可证：浙B2-20080224-1|信息网络传播视听节目许可证：1109364号</p>
      
      </div>
  
   
</div>
</div>
</form>
</body>
</html>

