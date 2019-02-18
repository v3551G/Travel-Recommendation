<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hotel.aspx.cs" Inherits="RouteRecomment.FrontPages.Test.Pages.Hotel" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/hotel.css" type="text/css" rel="stylesheet" />

<script src="../JS/jquery-1.7.2.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/js.js"></script>
<script type="text/javascript" src="../js/hotel.js"></script>

<script src="../JS/ajax.js" type="text/javascript"></script>


 <script type="text/javascript" language="javascript">
       $(document).mouseup(function()
      {
          var value = getSelectText();
          alert(value);
          // PageMethods.DragLogAdd(ip,value);
       });
       
                function getSelectText()
                  {
                    var txt = null;
                    if (window.getSelection)
                       {  // mozilla FF
                        txt = window.getSelection();
                       }
                    else if (document.getSelection)
                       {
                        txt = document.getSelection();
                       }
                    else if (document.selection)
                       {  //IE
                        txt = document.selection.createRange().text;
                       }
                       alert("执行getSelectText");
                    return txt;
                  }
 </script>
 <script type="text/javascript" language="javascript">
        var start ;
        var end;
        var state;
        start = new Date();
        //var ip = '<%=GetIP() %>';
        
        
        $(document).ready(function()
        {  
           var test = '<%=Test()%>';
           alert(test);
         
        });


       $(window).unload( 
       function () 
       { 
          end = new Date(); 
          state = end.getTime()-start.getTime(); //以毫秒为单位 1s = 1000毫秒
          alert(state);
        } 
       );


</script>




<title>hotel</title>

</head>

<body >
<form id="Form"  runat="server" >
<div id="all-body">

<img src="../images/ht-bg.jpg"/>


<div id="all">
      
      <div id="header" >
         <div id="nav">
            <div id="logo">
              <img  src="../images/LOGO (1).png" width="300" height="100" alt="logo"/>
            </div>
            <div id="logo-txt"> 
            畅游天下，欢迎来到智慧旅游推荐网！<span class="bogo-but"><button>登陆</button><button>注册</button></span>
            </div>
         </div>
         
         <div class="photo clearfix">
              <div id="focus">
              <ul>
              <!--
                  <li><a href="#" target="_blank" title=""><img alt="" src="../images/tp-1.jpg"/></a></li>
                  <li><a href="#" target="_blank" title=""><img alt="" src="../images/tp-2.jpg" /></a></li>
                  <li><a href="#" target="_blank" title=""><img alt="" src="../images/tp-3.jpg" /></a></li>
                  <li><a href="#" target="_blank" title=""><img alt="" src="../images/tp-1.jpg" /></a></li>
                  <li><a href="#" target="_blank" title=""><img alt="" src="../images/tp-2.jpg" /></a></li>
                  
                  -->
                  <%
for (int n = 0; n < HtlPicDT.Rows.Count; n++)
{
    String PicUrl = HtlPicDT.Rows[n]["PicPath"].ToString();
    PicUrl = PicUrl.Substring(PicUrl.IndexOf('U'));
    PicUrl = "../../../" + "Admin/" + PicUrl;
    String test = "";
                      %>
                      <li><a href="#" target="_blank" title=""><img alt="" src=<%=PicUrl %> /></a></li>
                      <%
}    
                  %>
              </ul>
              </div>
          </div>
          <div class="txt"><img src="../images/txt-02.png" width="274" height="51" alt="酒店" /></div>
          <div class="messages">
                 <p class="h-lev"><img src="../images/m-5.png"><span>星级：
                 </span>
                 <%
for (int i = 0; i < StarNum; i++)
{%>
                  <img src="../images/star.png" />
                  <%

}
                  %>
                 </p>
                 <p class="tel"><img src="../images/m-2.png" /><span>联系方式：<%=PhoneNum%><br /><br /></span><span style="padding-left:50px;"></span></p>
                 <p class="time"><img src="../images/m-1.png"/><span style="margin-left:0px;">详细地址：<%=Address%></span></p>
                 <p class="introduction"><img src="../images/m-4.png"/><span><%=Introduce.Substring(0, 100)%><a href="#">详细信息</a></span></p>
          </div>
      
      </div><!--header end-->
        
      <div id="content">
          <div id="c-left">
             <div id="c-banner">
               <p>房型</p>
             </div>
             <div  id="c-table">
                 <table id="tab" width="702" align="center" border="0" cellpadding="0" cellspacing="0">
                   <thead>
                     <tr width="702" height="50" style="font-size:14px; line-height:50px; color:#333;">
                       <th width="30%" align="left" style="padding-left:20px;"><img src="../images/m-6.png" />&nbsp;&nbsp;房型</th>
                       <th width=""><img src="../images/m-7.png" />&nbsp;&nbsp;床型</th>
                       <th width=""><img src="../images/m-8.png" />&nbsp;&nbsp;宽带</th>
                       <th width=""><img src="../images/m-9.png" />&nbsp;&nbsp;早餐</th>
                       <th width=""><img src="../images/m-10.png" />&nbsp;日均价</th>
                     </tr>
                      <tr width="702" height="40" style="background:url(../images/line-3.png) no-repeat bottom;">
                       <th width="30%" align="left" style="padding-left:40px; padding-bottom:15px; color:#F93;"><a href="#">标准间</a></th>
                       <th width="">双人床</th>
                       <th width="">免费</th>
                       <th width="">无</th>
                       <th width="" style="color:red; font-size:14px; font-weight:bold;">￥668</th>
                     </tr>
                   </thead>
                   
                   <tbody align="center" style="font-size:12px; line-height:40px; color:#666; font-weight:bold;">
                     <tr>
                        <td colspan="5" align="left"  height="77" style="padding-left:20px;"><img src="../images/house.jpg" /></td>
                     </tr>
                     
                     <tr width="702" height="40">
                        <td style="color:#F93; font-weight:bold;"><a href="#">江景双人间</a></td>
                        <td>双人房</td>
                        <td>面免费</td>
                        <td>有</td>
                        <td style="color:red; font-size:14px; font-weight:bold;">￥800</td>
                     </tr>
                     
                     <tr height="30" width="702">
                        <td colspan="5" align="left" style="color:#F90; font-weight:bold; padding-left:85px;"><a href="#">高级间</a></td>
                     </tr>
                     
                     <tr>
                       <td>不含早餐</td>
                       <td>双人床</td>
                       <td>免费</td>
                       <td>无</td>
                       <td style="color:red; font-size:14px; font-weight:bold;">￥800</td>
                     </tr>
                     
                     <tr>
                       <td>含早餐</td>
                       <td>双人床</td>
                       <td>免费</td>
                       <td>无</td>
                       <td style="color:red; font-size:14px; font-weight:bold;">￥800</td>
                     </tr>
                     
                     <tr>
                       <td style="color:#F93; font-weight:bold;"><a href="#">江景单人间</</td>
                       <td>双人床</td>
                       <td>免费</td>
                       <td>无</td>
                       <td style="color:red; font-size:14px; font-weight:bold;">￥800</td>
                     </tr>
                     
                   </tbody>
                   <tfoot >
                     <tr height="20" width="702"></tr>
                   </tfoot>
                 </table>
             </div>
             <!--end c-btn-->
             <!--设施服务开始-->
             <div id="c-sevice">
               <p>设施服务</p>
             </div>
             <div id="list">
               <div id="c-list">酒店服务：<span class="c-list-t"><%=HotelService%></span></div>
               <div id="c-list">餐饮设施：<span class="c-list-t"><%=RestaurantDevice%></span></div>
               <div id="c-list">休闲娱乐：<span class="c-list-t"><%=EnterDevice%></span></div>
             </div>
             <div id="c-btn">
               <p>其他网站的评论</p>
             </div><!--end c-btn-->

              <!--其他网站评论开始-->
             <div id="div1">
                  <input type="button" class="active" value="艺龙" />
                  <input type="button" value="携程" />
                  <input type="button" value="欣欣" />

                 <!--艺龙开始-->
                  <asp:ScriptManager ID="ScriptManager1"  runat="server"  AsyncPostBackTimeout="0"  >
                  </asp:ScriptManager>

                  <div id="miao" style="display:block; top: 0px; left: 0px;">
                      <div id="temp">
                        好评率: <img src="../images/value.png" width="48" height="43" id="c-img" />
                        <p id="percent"><%=YiLongTotalRate%></p>
                      </div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Block">
                    <ContentTemplate>
                      <%
                        for (int i = 0; i < YiLongDT.Rows.Count; i++)
                        { 
                                                  %>

                                              <div id="temp-1">
                                                <div id="c-portrait">
                                                   <a href="#"><img src="../images/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                                                   <p id="user"><a href="#"><%=YiLongDT.Rows[i]["PublisherNickName"]%></a></p>
                                                </div>
                                                <div id="c-btn-txt">
                                                    <p id="c-value"><%=YiLongDT.Rows[i]["Contend"]%></p>
                                                    <p id="c-time"><%=YiLongDT.Rows[i]["PublishTime"]%><a href="#"><%=YiLongDT.Rows[i]["RecommendDetail"]%></a></p>
                                                </div>
                                              </div>                                        
                                              
                                                   <%
                        }
                           %>
                     <div id="r-page">
                       <div class="black2">
                       <span class="disabled"> 
                           <webdiyer:AspNetPager ID="AspNetPager4" runat="server" Width="100%" 
                               PageSize="2"  CurrentPageIndex="1"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="Prev"   
                                    NextPageText="Next" UrlPaging="false" 
                               onpagechanging="YiLong_PageChanging" AlwaysShow="True" 
                             >
                            </webdiyer:AspNetPager>
                      
                        </a></div>
                       
                     </div> 
                    </ContentTemplate>
                    </asp:UpdatePanel>
                  </div>

                 <!--艺龙  end-->
              
                 <!--同程开始-->

                       <div id="miao">
                      <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Block">
                    <ContentTemplate>
                       <div id="temp">
                        好评率: <img src="../images/value.png" width="48" height="43" id="Img1" />
                        <p id="percent">89%</p>
                       </div>

                       <% 
                           try
                           {
                               for (int j = 0; j < TongChenDT.Rows.Count; j++)
                               {
                               %>

                       <div id="temp-1">
                        <div id="c-portrait">
                           <a href="#"><img src="../images/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#"><%=TongChenDT.Rows[j]["PublisherNickName"]%></a></p>
                        </div>
                        <div id="c-btn-txt">
                            <p id="c-value"><%=TongChenDT.Rows[j]["Contend"]%></p>
                            <p id="c-time"><%=TongChenDT.Rows[j]["PublishTime"]%><a href="#">标准房</a></p>
                        </div>
                                               </div>
                        <% 
                           }
                           }
                          catch(Exception ex)
                           {
                                                          
                           }
                           %>

                      
                           
                      <div id="r-page"> <div class="black2"><span class="disabled"> 
                            <webdiyer:AspNetPager ID="AspNetPager1" runat="server" Width="100%" 
                               PageSize="2"  CurrentPageIndex="1"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="Prev"   
                                    NextPageText="Next" UrlPaging="false" 
                               onpagechanging="TongChen_PageChanging" AlwaysShow="True">
                            </webdiyer:AspNetPager>
                      </div></p></div>  
                      </ContentTemplate>
                    </asp:UpdatePanel>                     

                  </div>

                 <!--携程 end-->
                  
                 <!--欣欣开始-->

                      <div id="miao">
                       <asp:UpdatePanel ID="UpdatePanel3" runat="server" RenderMode="Block" >
                    <ContentTemplate>
                      <div id="temp">
                         
                         <img src="../images/m-12 (2).png" width="28" height="24" id="c-img-1" />
                         <img src="../images/m-12 (2).png" width="28" height="24" id="c-img-1" />
                         <img src="../images/m-12 (2).png" width="28" height="24" id="c-img-1" />
                         <img src="../images/m-12 (2).png" width="28" height="24" id="c-img-1" />
                         <img src="../images/m-12 (2).png" width="28" height="24" id="c-img-1" />
                        5/5
                        <p id="percent-1">89%用户推荐</p>
                      </div>

                    <%
                        for (int m = 0; m < XinXinDT.Rows.Count; m++)
                        { %>

                                            
                                              <div id="temp-1">
                                                <div id="c-portrait">
                                                   <a href="#"><img src="../images/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                                                   <p id="user"><a href="#"><%=XinXinDT.Rows[m]["PublisherNickName"]%></a></p>
                                                </div>
                                                <div id="c-btn-txt">
                                                    <p id="c-value"><%=XinXinDT.Rows[m]["Contend"]%></p>
                                                    <p id="c-time"><%=XinXinDT.Rows[m]["PublishTime"]%><a href="#">标准房</a></p>
                                                </div>
                                                
                                              </div>
                        <%
                        }
                         %>
                     
                    <div id="r-page">
                      <div class="black2"><span class="disabled"> 
                               <webdiyer:AspNetPager ID="AspNetPager2" runat="server" Width="100%" 
                               PageSize="3"  CurrentPageIndex="1"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="Prev"   
                                    NextPageText="Next" UrlPaging="false" 
                               onpagechanging="XinXin_PageChanging" AlwaysShow="True">
                            </webdiyer:AspNetPager>
                      </div></p>
                    </div> 

                    </ContentTemplate>
                    </asp:UpdatePanel>

                    </div>

                 <!-- 欣欣 end-->
            </div> 
              <!--其他网站评论结束-->
             
          </div><!--end c-left-->
          
          
          <!--end c-right start-->
          <div id="c-right">
              <div id="r-up">
                 <h2>大家还看了</h2>
                 <div id="r-list">
                   <div id="r-img"><a href="#"><img src="../images/img-1.jpg" width="152" height="103" alt="酒店图片链接"/></a></div>
                   <div id="r-ms">
                      <h2><a href="#">红星街酒店</a></h2>
                      <p>地址：红星街888号</p>
                      <p>联系电话：4545464</p>
                      <p>营业时间：24小时营业</p>
                      
                   </div>
                 </div>
                 <!--end r-list-->
                 <div id="r-list">
                   <div id="r-img"><a href="#"><img src="../images/img-1.jpg" width="152" height="103" alt="酒店图片链接"/></a></div>
                   <div id="r-ms">
                      <h2><a href="#">红星街酒店</a></h2>
                      <p>地址：红星街888号</p>
                      <p>联系电话：4545464</p>
                      <p>营业时间：24小时营业</p>
                      
                   </div>
                 </div><!--end r-list-->
                 <div id="r-list">
                    <div id="r-img"><a href="#"><img src="../images/img-1.jpg" width="152" height="103" alt="酒店图片链接"/></a></div>
                   <div id="r-ms">
                      <h2><a href="#">红星街酒店</a></h2>
                      <p>地址：红星街888号</p>
                      <p>联系电话：4545464</p>
                      <p>营业时间：24小时营业</p>
                      
                   </div>
                 </div><!--end r-list-->
                
                 <div id="r-change">
                   <p><a href="Hotel.aspx">换一批</a></p>
                     
                 
                 </div>
   
             </div>  <!--end r-up-->
             
             
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
                          <p>还行呀，很不错，一下还会来的，继续来支持，来了还行来！</p>

                      
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
                          <p>还行呀，很不错，一下还会来的，继续来支持，来了还行来！</p>

                      
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

