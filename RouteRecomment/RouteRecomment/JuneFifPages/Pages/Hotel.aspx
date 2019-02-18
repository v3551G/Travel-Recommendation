<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hotel.aspx.cs" Inherits="RouteRecomment.JuneFifPages.Pages.Hotel" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/hotel.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="../js/jquery.1.4.2-min.js" ></script>
<script type="text/javascript" src="../js/jqhotel.js"></script>
<script type="text/javascript" src="../js/hotel.js"></script>
<script src="../js-global/FancyZoom.js" language="javascript" type="text/javascript"></script>
<script src="../js-global/FancyZoomHTML.js" language="javascript" type="text/jscript"></script>
<script src="../js/jingling.js"></script>
<title>hotel</title>
<script src="../js/jquery.js"  type="text/javascript" ></script>
<script src="../js/mousewheel.js" type="text/javascript" ></script>
<script src="../js/easyscroll.js" type="text/javascript" ></script>

<script type="text/javascript">$(function(){$('.div_scroll').scroll_absolute({arrows:true})});</script>

<!-- .container2 arrows: false -->
<script type="text/javascript">$(function(){$('.container2 .div_scroll').scroll_absolute({arrows:false})});</script>



 
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
    height: 16px;
}

</style>

</head>

<body>
<form runat="server">
<div id="all-body">

<img src="../imagesZ/ht-bg.jpg"/>


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
         <div id="h-title"><h2><%=Name%></h2></div>
         <div class="photo clearfix">
                    
            
           
              <div id="focus">
              <ul>
               <%
                   for (int n = 0; n < HtlPicDT.Rows.Count; n++)
                      {
                         String  PicUrlHtl = HtlPicDT.Rows[n]["PicPath"].ToString();
                          PicUrlHtl = PicUrlHtl.Substring(PicUrlHtl.IndexOf('U'));
                          PicUrlHtl = "../../../" + "Admin/" + PicUrlHtl;
                          //String test = "";
                                
               %>
               <li><a href="#" target="_blank" title=""><img alt="" src=<%=PicUrlHtl %> /></a></li>
                    <%
                      } %>
                   <%
                  if (HtlPicDT.Rows.Count == 0)
                  {
               %>
                  <li><a href="#" target="_blank" title=""><img alt="" src="../imagesZ/tp-1.jpg"/></a></li>
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

          <div class="messages">
                <div id="m-1">
                     <div class="h-lev"><img src="../imagesZ/m-1.png" /></div>
                     <div id="m-t"><p><span id="star-lev">星级：<%=StarNum%></span></p>
                     </div>
                 </div><!--m-1 end-->
                 <div style="clear:both"></div>
                 
                    <div id="m-2">
                         <div class="h-lev"><img src="../imagesZ/m-2.png" /></div>
                         <div id="m-t"> 
                             <p>联系方式：<%=PhoneNum%><br /></p>
                            
                         </div>
                    </div><!--m-1 end-->
                    
                    <div id="m-3">
                         <div class="h-lev"><img  src="../imagesZ/m-3.png" /></div>
                         <div id="m-t"> 
                             <p>酒店地址：<%=Address%>      </p>
                             
                         </div>
                    </div><!--m-1 end-->
                    <div style="clear:both"></div>
                    
                    
                     <div id="m-4">
                         <div class="h-lev"><img src="../imagesZ/m-4.png" /></div>
                        <div class="container2">

     <div class="div_scroll">
			<p><%=Introduce.ToString()%></p>
	</div>
	
</div>
                         
                    </div><!--m-1 end-->
                 
          </div>
             
          </div>
          
      </div><!--header end-->
        
      <div id="content">
          <div id="c-left">
             <div id="c-banner">
               <p>房型</p>
             </div>
             
           
             <div id="c-bed">
                <div id="bed-type">
                     <ul>
                          <li style="width:20%;"><img src="../imagesZ/m-6.png"/ ><span class="home">房型</span></li>
                          <li style="width:16%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="home">子房型</span></li>
                         <li style="width:16%;"><img src="../imagesZ/m-7.png" /><span class="home">床型</span></li>
                         <li style="width:16%;"><img src="../imagesZ/m-8.png" /><span class="home">宽带</span></li>
                         <li style="width:16%;"><img src="../imagesZ/m-9.png" /><span class="home">早餐</span></li>
                        
                         <li style="width:16%;"><img src="../imagesZ/m-10.png" /><span class="home">日均价</span></li>
                     </ul>
                </div>
                    
                 <!--bed start-->
                  <div style="clear:both"></div>
                 <div id="c-myDiv">
                 
                                             <%  
                                 BLL.HotelBLL.HtlTypeBLL htlTypeBLL = new BLL.HotelBLL.HtlTypeBLL();
                                 BLL.HotelBLL.HtlTypeDetailBLL htlTypeDetailBLL = new BLL.HotelBLL.HtlTypeDetailBLL();
                                 System.Data.DataTable HotelType = htlTypeBLL.GetHtlTypeByID(HotelID);
                                 for (int TypeNum = 0; TypeNum < HotelType.Rows.Count; TypeNum++)
                                 {
                                      System.Data.DataTable HotelTypeDetail = htlTypeDetailBLL.GetHotelTypeDetail(int.Parse(HotelType.Rows[TypeNum]["ID"].ToString()));
                                      String HotelTypeName="";
                                      HotelTypeName = HotelType.Rows[TypeNum]["HouseType"].ToString();
                                      if (HotelTypeName.Length < 5)
                                          HotelTypeName += "  ";
                                     
                                      String PicUrL="";
                                      try
                                      {
                                          PicUrL = HtlPicDT.Rows[0]["PicPath"].ToString();
                                          PicUrL = PicUrL.Substring(PicUrL.IndexOf('U'));
                                          PicUrL = "../../../" + "Admin/" + PicUrL;
                                      }
                                      catch
                                      {
                                          PicUrL = "../imagesZ/ht-2.jpg";
                                      }
                          %> 
                 <div id="bed">  

                          <div id="bed-1">
                             <ul>
                                   <li style="width:19.5%;" id="list-1"><img src=<%=PicUrL %> /><br /><a><%=HotelTypeName%></a><br /></li>
                                   <li style="width:80%;" id="bed-list" >
                                                                      <%
                              for (int DetailNum = 0; DetailNum < HotelTypeDetail.Rows.Count; DetailNum++)
                              {
                                   %> 
                                     <ul class="bed-2">
                                             <li style="width:20%;"><a href=""><%=HotelTypeDetail.Rows[DetailNum]["HouseType"]%></a></li>
                                             <li style="width:20%;"><a href=""><%=HotelTypeDetail.Rows[DetailNum]["BedType"]%></a></li>
                                             <li style="width:20%;"  class="free"><a href=""><%=HotelTypeDetail.Rows[DetailNum]["HaveBreakfast"]%></a></li>
                                             <li style="width:20%;" class="qixiao"><a href=""><%=HotelTypeDetail.Rows[DetailNum]["Broadband"]%></a></li>
                                             <li style="width:20%;" class="money"><a href="">￥<%=HotelTypeDetail.Rows[DetailNum]["Price"]%></a></li>
                                             <div style="clear:both"></div>
                                     </ul>
                                      <%
                                   }
                                   %>
                                   </li>
                                   
                             </ul>
                             
                          	<div></div>
                          </div>                    
                         <div id="bed-detail" >
                      
                          <%
                              String PicUrl ;
                              if (HtlPicDT.Rows.Count > 0)
                              {   int tempPicID = TypeNum;
                                  if(tempPicID>HtlPicDT.Rows.Count-1)
                                      tempPicID = HtlPicDT.Rows.Count-1;
                                      
                                  if (HtlPicDT.Rows[tempPicID]["PicPath"] != "" && HtlPicDT.Rows[tempPicID]["PicPath"] != null)
                                  {
                                      PicUrl = HtlPicDT.Rows[tempPicID]["PicPath"].ToString();
                                      PicUrl = PicUrl.Substring(PicUrl.IndexOf('U'));
                                      PicUrl = "../../../" + "Admin/" + PicUrl;
                                  }
                                  else
                                      PicUrl = "../imagesZ/ht-2.jpg";
                              }                
                                  else
                                  PicUrl = "../imagesZ/ht-2.jpg";
                              
                           %>
                          <div class="photoblock-many" id="bed-detail-img">
                             <a href="../imagesZ/ht-2-1.jpg" title=""><img src=<%=PicUrl %> alt="酒店图片" height="82" width="80" id="img-mwsf-2" class="photo" /></a>
 
                          <script>
                            setupZoom();
                         </script> 
                           </div>
                       
                           <div id="d-close"><img src="../imagesZ/close.jpg" /></div>
                                  <div id="bed-detail-1">
                                     <ul>
                                        <li>
                                             <ul>
                                                 <li style="width:33%">建筑面积：<%=HotelType.Rows[TypeNum]["Squre"]%></li>
                                                 <li style="width:33%">楼层：<%=HotelType.Rows[TypeNum]["Floor"]%></li>
                                                 <li style="width:34%">床型：<%=HotelType.Rows[TypeNum]["BedType"]%></li>
                                             </ul>
                                        </li>
                                        <li>
                                              <ul>
                                                 <li style="width:33%">宽带:<%=HotelType.Rows[TypeNum]["Internet"]%></li>
                                                 <li style="width:33%"></li>
                                                 <li style="width:34%"></li>
                                             </ul>
                                        </li>
                                     </ul>         
                                   </div>
                         </div>
		        </div>          
               
                 <%
                                  }
                          %>
                <div style="clear:both;"></div>
                   
                   
                 </div>
             
             </div>
             
             
             
            
             <!--end c-btn-->
             <!--设施服务开始-->
             <div id="c-sevice">
               <p>设施服务</p>
             </div>
             <div style="clear:both"></div>
             <div id="list">
              
               <div id="c-list"><div id="c-tit">酒店政策：</div> <div class="c-list-t"><%=HotelService%></div></div><div style="clear:both"></div>
               <div id="c-list"><div id="c-tit">休闲娱乐：</div><div class="c-list-t"><%=EnterDevice%></div></div><div style="clear:both"></div>
               <div id="c-list"><div id="c-tit">餐饮设施：</div><div class="c-list-t"><%=RestaurantDevice%></div></div><div style="clear:both"></div>
             </div>
             <div style="clear:both"></div>
             <div id="c-btn">
               <p>其他网站的评论</p>
             </div><!--end c-btn-->
             
             
              <!--其他网站评论开始-->
             <div id="div1">
                  <input type="button" class="active" value="艺龙" />
                  <input type="button" value="携程" />
                  <input type="button" value="欣欣" />
                        <asp:ScriptManager ID="ScriptManager1"  runat="server"  AsyncPostBackTimeout="0"  >
                  </asp:ScriptManager>
                 <!--艺龙开始-->
                  <div id="miao" style="display:block;">
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Block">
                    <ContentTemplate>
                       <%
                           if (YiLongDT.Rows.Count == 0)
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
                        好评率: <img src="../imagesZ/value.png" width="48" height="43" id="c-img" />
                        <p id="percent"><%=YiLongTotalRate%>%</p>
                      </div>
                        <%
                        for (int i = 0; i < YiLongDT.Rows.Count; i++)
                        { 
                        %>
                      <div id="temp-1">
                        <div id="c-portrait">
                           <a href="#"><img src="../imagesZ/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#"><%=YiLongDT.Rows[i]["PublisherNickName"]%></a></p>
                        </div>
                        <div id="c-btn-txt-d">
                            <p id="c-value"><%=YiLongDT.Rows[i]["Contend"]%></p>
                            <p id="c-time"><%=YiLongDT.Rows[i]["PublishTime"]%><a href="#"><%=YiLongDT.Rows[i]["RecommendDetail"]%></a></p>
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
                               onpagechanging="YiLong_PageChanging" AlwaysShow="false" 
                             >
                            </webdiyer:AspNetPager>
                       </div>
                     </div> 
                     <%
                           } %>
                      </ContentTemplate>
                    </asp:UpdatePanel>
                  </div>
              <!--艺龙  end-->
              
                 <!--携程开始-->
                  <div id="miao">
                     <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Block">
                    <ContentTemplate>
                       <%
                            if (TongChenDT.Rows.Count == 0)
                            {
                        %>
                        <center>
                       <div id="notext"><img src="../imagesZ/notie.png" />对不起，同程网暂无该酒店的评论！</div>
                        </center>
                        <%
                            }
                            else
                            {
                         %>
                      <div id="temp">
                        <p id="p1">89%用户推荐</p>
                      </div>
                         <% 
                           try
                           {
                               for (int j = 0; j < TongChenDT.Rows.Count; j++)
                               {
                         %>

                          <div id="temp-1">
                        <div id="c-portrait">
                           <a href="#"><img src="../imagesZ/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#"><%=TongChenDT.Rows[j]["PublisherNickName"]%></a></p>
                        </div>
                        <div id="c-btn-txt">
                            <p id="c-value"><%=TongChenDT.Rows[j]["Contend"]%></p>
                            <p id="c-time"><%=TongChenDT.Rows[j]["PublishTime"]%><a href="#"><%=TongChenDT.Rows[j]["RecommendDetail"]%></a></p>
                        </div>
                      <!--  <div id="c-btn-value">
                           <div id="c-star">
                              <img src="../imagesZ/c-st.png" width="14" height="13" alt="pingfen" />
                          
                              <span id="c-star-l">5.0分</span>
                           </div>
                        </div>-->
                      </div>
                       <div style="clear:both"></div>
                       <% 
                               }
                            }
                           catch (Exception ex)
                           {

                           }
                           

                     %>
                      <div id="r-page">
                        <div class="black2">
                                             <webdiyer:AspNetPager ID="AspNetPager1" runat="server" Width="100%" 
                               PageSize="2"  CurrentPageIndex="1"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="Prev"   
                                    NextPageText="Next" UrlPaging="false" 
                               onpagechanging="TongChen_PageChanging" AlwaysShow="false">
                            </webdiyer:AspNetPager>
                     
                  
                        </div>
                       </div>  
                      <%
                            }
                           %>
                    </ContentTemplate>
                    </asp:UpdatePanel> 
                  </div>
                  <!--携程 end-->
                  
                      <!--欣欣开始-->
                     <div id="miao">
                     <asp:UpdatePanel ID="UpdatePanel3" runat="server" RenderMode="Block" >
                    <ContentTemplate>
                    <%
                        if (XinXinDT.Rows.Count == 0)
                        {
                         %>
                         <center>
                       <div id="notext"><img src="../imagesZ/notie.png" />对不起，欣欣网暂无该酒店的评论！</div>
                        </center>
                         <%
                        }
                        else
                        {
                         %>
                      <div id="temp">
                         
                        <!-- <img src="../imagesZ/m-12 (2).png" width="28" height="24" id="c-img-1" />
                         <img src="../imagesZ/m-12 (2).png" width="28" height="24" id="c-img-1" />
                         <img src="../imagesZ/m-12 (2).png" width="28" height="24" id="c-img-1" />
                         <img src="../imagesZ/m-12 (2).png" width="28" height="24" id="c-img-1" />
                         <img src="../imagesZ/m-12 (2).png" width="28" height="24" id="c-img-1" />
                        5/5
                        <p id="percent-1">89%用户推荐</p>-->
                      </div>
                         <%
                            for (int m = 0; m < XinXinDT.Rows.Count; m++)
                            { 
                        %>
                      <div id="temp-1">
                        <div id="c-portrait">
                           <a href="#"><img src="../imagesZ/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#"><%=XinXinDT.Rows[m]["PublisherNickName"]%></a></p>
                        </div>
                        <div id="c-btn-txt-d" style="width:490px;">
                            <p id="c-value"><%=XinXinDT.Rows[m]["Contend"]%></p>
                            <p id="c-time"><%=XinXinDT.Rows[m]["PublishTime"]%></p>
                        </div>
                      
                      </div>
                       <div style="clear:both"></div> 
                         <%
                            
                        } %>
                    <div id="r-page">
                    <div class="black2">
                      <webdiyer:AspNetPager ID="AspNetPager2" runat="server" Width="100%" 
                               PageSize="3"  CurrentPageIndex="1"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="Prev"   
                                    NextPageText="Next" UrlPaging="false" 
                               onpagechanging="XinXin_PageChanging" AlwaysShow="false">
                            </webdiyer:AspNetPager>
                      </div>
                    </div> 
                    <!-- 欣欣 end-->
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
                   <div id="r-img"><a href="Hotel.aspx?HotelID=36"><img src="../EleImages/山乐宾馆.jpg" width="152" height="103" alt="酒店图片链接"/></a></div>
                   <div id="r-ms">
                      <h3><a href="#">山乐宾馆</a></h3>
                      <p>地址：人民路33号</p>
                      <p>联系电话：0773-5598159</p>
                      <p>营业时间：24小时营业</p>
                      
                   </div>
                 </div>
                 <div style="clear:both"></div>              <!--end r-list-->

       
    
                 <div id="r-list">
                   <div id="r-img"><a href="Hotel.aspx?HotelID=49"><img src="../EleImages/气象大酒店.jpg" width="152" height="103" alt="酒店图片链接"/></a></div>
                   <div id="r-ms">
                      <h3><a href="#">气象大酒店</a></h3>
                      <p>地址：叠彩区中山北路188号(桂林市气象局正对面)</p>
                      <p>联系电话：0773-8994455</p>
                      <p>营业时间：24小时营业</p>
                      
                   </div>
                 </div>
                 <div style="clear:both"></div>
                 
                 
                 <div id="r-list">
                   <div id="r-img"><a href="Hotel.aspx?HotelID=27"><img src="../EleImages/桂林中兴宾馆.jpg" width="152" height="103" alt="酒店图片链接"/></a></div>
                   <div id="r-ms">
                      <h3><a href="#">桂林中兴宾馆</a></h3>
                      <p>地址：红星街888号康的加</p>
                      <p>联系电话：0773-2152668</p>
                      <p>营业时间：24小时营业</p>  
                   </div>
                 </div>
                 
                 <div style="clear:both"></div>
                 
                
                  <div id="r-change">
                   <p><a href="#">换一批</a></p>
                 
                 </div>
                <div style="clear:both"></div>
             </div>  <!--end r-up-->
             
             
 <div id="r-but">

                   <!--start r-but-->
                    <h2>大家点评</h2>
                                              
                <!--有评论的样式-->      
                   <!--start r-but-->
                   
                   <div class="vll"> 
                         <%
                      //根据
           if (PublicComment != null && PublicComment.Rows.Count > 0) { 
             
             for (int i = 0; i < PublicComment.Rows.Count; i++ ) {
                 String CmtContent = PublicComment.Rows[i]["Contend"].ToString();
                 String CmtTime    = PublicComment.Rows[i]["PublishTime"].ToString();
                 String CmtScore   = PublicComment.Rows[i]["Rate"].ToString();
                 String CmtUserID = PublicComment.Rows[i]["UserID"].ToString();
                 CmtUser= HtlBLL.GetCmtUserAccountByUserID(CmtUserID);
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
             else
             {        
              %>
                <!--无评论的样式-->   
                <center>
                    <div id="notext" style=" min-height:300px; padding-top:80px;"><img src="../imagesH/notie.png" />对不起，暂时无评论！</div>
                </center> 
                <!--end-->  
              <%
              }
              %>  
                                       
                   <div id="l-page">
                     <div class="black2"><span class="disabled"> < </span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a>...<a href="#?page=7">7</a><a href="#?page=8">8</a><a href="#?page=2"> > </a></div>
                   </div>
                 </div>  
                <!--end-->  
                   
                   
                   
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
                    <!--end r-but--->   
                   </div>
                    <textarea id="TextArea1"  name="textarea" cols="35" rows="5" >

                    </textarea>

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
<script>InitScrollBar('scroll_1','content_1','scrollbar_1','handle_1',300);</script>
</body>
</html>

