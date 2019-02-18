<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Food.aspx.cs" Inherits="RouteRecomment.FrontPages.Pages.Food" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/food.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../js/jquery.1.4.2-min.js" ></script>
<script src="../js/food.js"></script>
<script src="../js/jqfood.js"></script>


<title>food</title>
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

<img src="../images/bg-4.png"/>


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
             <%
                  }
             %>
             <%
                 if (ResPicDT.Rows.Count == 0)
                  {
                      string MoRenPic = "../../../Admin/UpLoadPics/201404190157570thumb%20(1).jpg";
              %>
              <li><a href="#" target="_blank" title=""><img alt="" src=<%=MoRenPic%>/></a></li>
              <%
                  } 
              %>
              </ul>
              </div>
<!--             
             <div class="txt"><a href="#"><img src="../images/txt-01.png" width="188" height="52" alt="广场" /></a></div>-->
          <div class="messages">
                <div id="m-1">
                     <div class="h-lev"><img src="../images/m-1.png" /></div>
                     <div id="m-t"> 地址：<%=Address%>
                        
                     </div>
                 </div><!--m-1 end-->
                 <div style="clear:both"></div>
                 
                    <div id="m-2">
                         <div class="h-lev"><img src="../images/m-2.png" /></div>
                         <div id="m-t"> 
                             联系方式：<%=PhoneNum%><br />
                             <!--传    真：0213-223232323-->
                             </br>
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
                                  <p>  介绍：<%=Introduce%></p>
                              </div>
                              <div id="gradient"></div>
                          </div>
                          <div id="read-more"></div>
                      </div>
                                              
                            
                            
                            
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
                 <li><a href="#"><%=FoodNoPic.Rows[i]["FoodName"].ToString() %></a><span id="number"><!--(25)--></span></li>
                 <%
                    }
                         %>
                <!-- <li><a href="#">酸菜鱼</a><span id="number">(25)</span></li>
                 <li><a href="#">清蒸菜</a><span id="number">(25)</span></li>
                 <li><a href="#">鱼香煎蛋</a><span id="number">(25)</span></li>
                 <li><a href="#">香葱煎蛋</a><span id="number">(25)</span></li>
                 <li><a href="#">锅包肉</a><span id="number">(25)</span></li>
                 <li><a href="#">泉水鸡</a><span id="number">(25)</span></li>
                 <li><a href="#">洋葱煎蛋</a><span id="number">(25)</span></li>
                 <li><a href="#">北京烤鸭</a><span id="number">(25)</span></li>
                 <li><a href="#">泉水鸡</a><span id="number">(25)</span></li>
                 <li><a href="#">洋葱煎蛋</a><span id="number">(25)</span></li>
                 <li><a href="#">北京烤鸭</a><span id="number">(25)</span></li>-->
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
                      <a href="#"><p><%=FoodWithPic.Rows[i]["FoodName"].ToString() %> ￥<%=FoodWithPic.Rows[i]["FoodPrice"].ToString() %></p></a>
              </div> 
              <%
                  }         
               %>
              
           <!--   <div id="picture-1">
                      <a href="#"><img src="../images/food.jpg" width="205" height="137" alt="菜" /></a>
                      <a href="#"><p>香脆鸡 ￥65</p></a>
              </div> 
              
              <div id="picture-1">
                      <a href="#"><img src="../images/food.jpg" width="205" height="137" alt="菜" /></a>
                      <a href="#"><p>香脆鸡 ￥65</p></a>
              </div> 
               <div id="picture-1">
                      <a href="#"><img src="../images/food.jpg" width="205" height="137" alt="菜" /></a>
                      <a href="#"><p>香脆鸡 ￥65</p></a>
              </div> 
              
              <div id="picture-1">
                      <a href="#"><img src="../images/food.jpg" width="205" height="137" alt="菜" /></a>
                      <a href="#"><p>香脆鸡 ￥65</p></a>
              </div> 
              
              <div id="picture-1">
                      <a href="#"><img src="../images/food.jpg" width="205" height="137" alt="菜" /></a>
                      <a href="#"><p>香脆鸡 ￥65</p></a>
              </div> 
              <div id="c-change-1"><a href="#">换一批</a></div>-->
           
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
                         <img src="../images/star-1.png" height="21" width="21" alt="星星" id="c-img-1" />
                        <%
                             }
                         %>
                        <a href="#"><!--(936人)--></a>
                         <span id="up-value">人均 <%=XCAvgPrice%></span>
                         <span id="up-value">口味 <%=XCTaste%></span>
                         <span id="up-value">环境 <%=XCatmosphere%></span>
                         <span id="up-value">服务 <%=XCService%></span>
                         </div>
                       </div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Block">
                    <ContentTemplate>
                      <div id="temp-1">
                      <%
                          for (int k = 0; k < XieChenDT.Rows.Count; k++)
                          {
                              int Score = int.Parse(XieChenDT.Rows[k]["Rate"].ToString());

                           %>
                        <div id="c-portrait">
                           <a href="#"><img src="../images/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#"><%=XieChenDT.Rows[k]["PublisherNickName"].ToString()%></a></p>
                        </div>
                        <div id="c-btn-value">
                           <div id="c-star">   
                               <% 
                          for (int j = 0; j < Score; j++)
                          {
                                %>                         
                              <img src="../images/star-2.png" width="14" height="14" alt="pingfen" />
                              <%
                          }
                               
                              %>
                              
                               <span id="u-value">人均 <%=XieChenDT.Rows[k]["AvgPrice"].ToString()%></span>
                               <span id="u-value">口味 <%=XieChenDT.Rows[k]["Taste"].ToString()%></span>
                               <span id="u-value">环境 <%=XieChenDT.Rows[k]["Environment"].ToString()%></span>
                               <span id="u-value">服务 <%=XieChenDT.Rows[k]["Service"].ToString()%></span>
                           </div>
                        </div>
                        <div id="c-btn-txt">
                            <p id="c-value"><%=XieChenDT.Rows[k]["Content"].ToString()%></p>
                            <p id="c-time"><%=XieChenDT.Rows[k]["PublishTime"].ToString()%></p>
                        </div>
                        <%
                          }
                                %>
                      </div>
                      <div style="clear:both"></div>
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
                    </ContentTemplate>
                    </asp:UpdatePanel>
                  </div>
                 <!--携程  end-->
              
                 <!--大众点评开始-->
                  <div id="miao"> 

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
                         <img src="../images/star-1.png" height="21" width="21" alt="星星" id="c-img-1" />
                         <%
                             }
                              %>
                        <a href="#"><!--(936人)--></a>
                        <span id="up-value">人均 <%=DZAvgPrice%></span>
                         <span id="up-value">口味 <%=DZTaste%></span>
                         <span id="up-value">环境 <%=DZEnvironment%></span>
                         <span id="up-value">服务 <%=DZService%></span>
                         </div>
                       </div>
                   <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Block">
                   <ContentTemplate>
                       <%
                           for (int j = 0; j < DaZhongDT.Rows.Count; j++)
                           {     
                       %>
                       <div id="temp-1">
                        <div id="c-portrait">
                           <a href="#"><img src="../images/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#"><%=DaZhongDT.Rows[j]["PublisherNickName"].ToString()%></a></p>
                        </div>
                        <div id="c-btn-value">
                           <div id="c-star">  
                            <%
                                for (int i = 0; i < int.Parse(DaZhongDT.Rows[j]["Rate"].ToString()); i++)
                                {
                            %>                            
                              <img src="../images/star-2.png" width="14" height="14" alt="pingfen" />
                            <%
                                } 
                            %>
                              <span id="c-star-l"><%=int.Parse(DaZhongDT.Rows[j]["Rate"].ToString()) %>分</span>
                              <span id="u-value">人均 <%=DaZhongDT.Rows[j]["AvgPrice"].ToString() %></span>
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
                      
                    </ContentTemplate>
                    </asp:UpdatePanel>
                  </div>
                 <!--大众点评 end-->
                  
                 <!--爱帮开始-->
                  <div id="miao">
                  <asp:UpdatePanel ID="UpdatePanel3" runat="server" RenderMode="Block" >
                  <ContentTemplate>
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
                         <img src="../images/star-1.png" height="21" width="21" alt="星星" id="c-img-1" />
                         <%
                            }
                         %>
                        <a href="#"><!--(936人)--></a>
                        <span id="up-value">人均 <%=ABAvgRate%></span>
                         </div>
                       </div>
                           <%
                           for (int k = 0; k < AiBangDT.Rows.Count; k++)
                           {
                               float StarNum = float.Parse(AiBangDT.Rows[k]["Rate"].ToString());
                            %>
                       <div id="temp-1">
                        <div id="c-portrait">
                           <a href="#"><img src="../images/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#"><%=AiBangDT.Rows[k]["PublisherNickName"].ToString()%></a></p>
                        </div>
                        <div id="c-btn-value">
                           <div id="c-star">       
                           <%
                               for (int m = 0; m < StarNum-1; m++)
                               {
                                %>                       
                              <img src="../images/star-2.png" width="14" height="14" alt="pingfen" />
                              <%
                               }
                                   %>
                              <span id="c-star-l"><%=AiBangDT.Rows[k]["Rate"].ToString()%>分</span>
                              <span id="u-value">人均 <%=AiBangDT.Rows[k]["AvgPrice"].ToString()%></span>
                               <span id="u-value">口味 <%=AiBangDT.Rows[k]["Taste"].ToString()%></span>
                               <span id="u-value">环境 <%=AiBangDT.Rows[k]["Environment"].ToString()%></span>
                               <span id="u-value">服务 <%=AiBangDT.Rows[k]["Service"].ToString()%></span>
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
                   <div id="r-img"><a href="#"><img src="../images/大师傅金奖啤酒鱼8.jpg" width="152" height="103" alt="酒店图片链接"/></a></div>
                   <div id="r-ms">
                      <h3><a href="Food.aspx?ResID=8">大师傅金奖啤酒鱼</a></h3>
                      <p>地址：阳朔县 西街1-7号</p>
                      <p>联系电话：0773-8816826</p>
                      <p>营业时间：夜宵</p>
                      
                   </div>
                 </div>
                 <div style="clear:both"></div>
                 <!--end r-list-->
                 <div id="r-list">
                   <div id="r-img"><a href="#"><img src="../images/明园咖啡14.jpg" width="152" height="103" alt="酒店图片链接"/></a></div>
                   <div id="r-ms">
                      <h3><a href="Food.aspx?ResID=14">明园咖啡</a></h3>
                      <p>地址：阳朔县 滨江路23号</p>
                      <p>联系电话：--</p>
                      <p>营业时间：7:00--18:00</p>
                      
                   </div>
                 </div><!--end r-list-->
                   <div style="clear:both"></div>
                 <div id="r-list">
                    <div id="r-img"><a href="#"><img src="../images/万景楼22.jpg" width="152" height="103" alt="酒店图片链接"/></a></div>
                   <div id="r-ms">
                      <h3><a href="Food.aspx?ResID=22">万景楼</a></h3>
                      <p>地址：龙胜各族自治县 龙胜县和平乡大寨村龙脊梯田景区</p>
                      <p>联系电话：13877352218 13878353950</p>
                      <p>营业时间：--</p>
                      
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
                      <a href="#"><img src="../images/chat3.png" />
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

