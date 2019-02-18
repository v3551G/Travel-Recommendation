<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Scenery.aspx.cs" Inherits="RouteRecomment.JuneFifPages.Pages.Scenery" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>景点攻略</title>
<link rel="stylesheet" type="text/css" href="../css/spot.css"/>
<link rel="stylesheet" type="text/css" href="../css/spotLunbo.css"/>

<script type="text/javascript" src="../js/spot.js"></script> <!--评分效果 -->
<script type="text/javascript" src="../js/jquery.1.4.2-min.js"></script>
<script type="text/javascript" src="../js/lunbo.js"></script><!--轮播的特效-->
<script type="text/javascript" src="../js/jingling.js"></script>
<!--详细信息-->


<script type="text/javascript" src="../js/jquery-1.7.2-min.js"></script>
<script type="text/javascript">
$(function(){
        var Bool=false;
        var Scro=$("#scroll");
        var Scrp=$("#p");
        var Scrobd=$("#bd");
        var Scroul=$("#ul");
        var Scrp_Height =Scrp.outerHeight()/2;
        var Num2=Scro.outerHeight()-Scrp.outerHeight();
        var offsetX=0;
        var offsetY=0;
        Scrp.mousedown(function(e){  
                Bool=true;
        });
        $(document).mouseup(function(){
                Bool=false;
        });
        $(document).mousemove(function(e){
                if(Bool){
                        var Num1= e.clientY - Scro.position().top;
                        var y=Num1 - Scrp_Height;
                        if(y<=1){
                                Scrll(0);
                                Scrp.css("top",1);
                        }else if(y>=Num2){
                                Scrp.css("top",Num2);
                                Scrll(Num2);
                        }else{
                                Scrll(y);
                        }
                }
        });
        function Scrll(y){
                Scrp.css("top",y);
                Scroul.css("margin-top",-(y/(Scro.outerHeight()-Scrp.outerHeight()))*(Scroul.outerHeight()-Scrobd.height()));
        }
        if(document.getElementById("scroll_bd").addEventListener) 
        document.getElementById("scroll_bd").addEventListener('DOMMouseScroll',wheel,true);
        document.getElementById("scroll_bd").onmousewheel=wheel;
        var Distance=Num2*0.1;
        function wheel(e){
                var evt = e || window.event;
                var wheelDelta = evt.wheelDelta || evt.detail;
                if(wheelDelta == -120 || wheelDelta == 3){
                        var Distances=Scrp.position().top+Distance;
                        if(Distances>=Num2){
                                Scrp.css("top",Num2);
                                Scrll(Num2);
                        }else{
                                Scrll(Distances);
                        }
                        return false;
                }else if (wheelDelta == 120 || wheelDelta == -3){
                        var Distances=Scrp.position().top-Distance;
                        if(Distances<=1){
                                Scrll(0);
                                Scrp.css("top",1);
                        }else{
                                Scrll(Distances);
                        }
                        return false;
                }   
        }
});
</script>

</head>

<body>
   <form  runat="server">     
<div class="all">
	<!--搜索框-->
	<div id="seek-top">

		<div class="Cen">

		
			<img src="../imagesH/LOGO.png"/>
			<div class="sousuo">
				
			<input type="text" name="text" id="seek-input" node-type="loginname" autocomplete="off" placeholder="桂林漓江">
			
			<div class="seek-button" title="搜索"><a href="#"></a></div>
			</div>
                        
                       
			<ul class="seek-login" id="seek-login">
				<li><a href="<%=person.ToString() %>" target="_blank"><%=login.ToString() %></a></li>
                <!--<li><a href="login1.aspx" target="_blank">登录</a></li>-->
                <li><a href="zhuce.aspx" target="_blank">注册</a></li>
			</ul>
                        <%--<div class="seek-login-after" id="seek-login-after">
                                <ul>
                                <li>Hi,   <a href="" title="天际一线">天际一线</a></li>
                                <li>您好！欢迎来到路线推荐网路线推荐网路线推荐网</li>
                                <li><a href="" style="margin-left:20px;">注销</a></li>
                                </ul>
                        </div>--%>
                        <div id="weather">
                            <iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=12&bdc=%23&icon=1&num=1" width="190" height="80" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="float:left;margin-top:-5px;margin-left:8px;"></iframe>
                       </div>
                                      
            		</div> 

			
	</div>



	<div class="header">
	
	<!--轮播-->
		<div class="lunbo clearfix">

 <div id="focus">
<ul>
    <% 
        if (SceneryPic.Rows.Count > 0)
        {
            for (int i = 0; i < SceneryPic.Rows.Count; i++)
            {
                String PicUrl = SceneryPic.Rows[i]["PicPath"].ToString();
                PicUrl = PicUrl.Substring(PicUrl.IndexOf('U'));
                PicUrl = "../../../" + "Admin/" + PicUrl;
    %>
        <li><a href="" target="_blank" title=""><img alt="" src=<%=PicUrl %> /><div class="place">
               <%=Name%>
        </div></a></li>
    <%
             }
            
        }
        else
        { 
        %>
        <li><a href="" target="_blank" title=""><img alt="" src="../imagesH/01.jpg" /><div class="place">
                 <%=Name%>
        </div></a></li>
    <li><a href="" target="_blank" title=""><img alt="" src="../imagesH/02.jpg" /><div class="place">
                 <%=Name%>
        </div></a></li>
    <li><a href="" target="_blank" title=""><img alt="" src="../imagesH/03.jpg" /><div class="place">
                 <%=Name%>
        </div></a></li>
    <li><a href="" target="_blank" title=""><img alt="" src="../imagesH/04.jpg" /><div class="place">
                 <%=Name%>
        </div></a></li>
    <li><a href="" target="_blank" title=""><img alt="" src="../imagesH/05.jpg" /><div class="place">
                 <%=Name%>
        </div></a></li>
            <%
        }
    %>
</ul>
</div> 


<!--信息介绍，嵌套在轮播里面-->
<div class="message">
		<img src="../imagesH/startss.png" />
			<div class="message-right">
				<div class="m-1" style="position:relative;top:-7px;">等级:  五<span style="color:#FF6600;margin-left:5px;margin-right:5px;font-size:25px;">A</span>景点区</div>

                        
				<div class="m-1 m-2">景点地址：<%=Loc%></div>
				<div class="m-1">景点门票：<%=Price%></div>
				<div class="m-1">开放时间：<%=OpenTime%></div>
		 

                <div id="MapMessage">
  
<div class="bd" id="scroll_bd">
        <div class="top" id="bd">
                <ul id="ul">
              <% 
                String Content;
                Content = Introduce;	     
	    	    
			 %>
                        <p>景点信息：<%=Content%></p>
                </ul>
        </div>
        
        <div class="scroll" id="scroll">
                <p id="p"></p>
        </div>
</div>

         <%--                    <div class="container2">

     <div class="div_scroll">
     <% 
                String Content;
                Content = Introduce;	     
	    	    
			 %>
			<p>景点信息：<%=Content%></p>
		
	</div>
	
	
</div>--%>


<%--<div id="Scroller-1">
    
   <div class="Scroller-Container">
   
   <% 
                String Content;
                Content = Introduce;	     
	    	    
			 %>
      <p>景点信息：<%=Content%></p>
    </div>
  </div>

  <div id="Scrollbar-Container">
    <div class="Scrollbar-Track">
      <div class="Scrollbar-Handle"></div>
    </div>
  </div>--%>

</div>





		</div>
	</div>
</div>
</div> <!-- lunbo End -->


<!--攻略-->

<!--攻略-->
<div style="float:left;">
<div class="gonglve">
	<img src="../imagesH/gonglve.png" />

	<div id="gonglve">
		
			<input type="button" class="TabButton" name="tabbutton" value="马蜂窝" />
			<input class="TabButton" type="button" name="tabbutton" value="同城" />
			<input id="active" type="button" name="tabbutton" value="欣欣" />
			<input class="TabButton" type="button" name="tabbutton" value="携程"/>
			<input class="TabButton" type="button" name="tabbutton" value="本站" />
            <asp:ScriptManager ID="ScriptManager1"   runat="server"  AsyncPostBackTimeout="0"  >
    
            </asp:ScriptManager>
    <!-- 马蜂窝-->
	<div id="spotContent" >
        <asp:UpdatePanel ID="UpdatePanel3" runat="server" RenderMode="Block">
        <ContentTemplate>
              <%   
                  //MaFengWoStrSplit.Rows.Count
	             if (MaFengWoStrSplit == null)
              { 
                     %>
                <center>
                      <div id="notext"><img src="../imagesH/notie.png" />对不起，暂时攻略</div>
                </center>
               <%
                 }
              else
              {
              %>
        <div class="Con" >
        	<ul id="ConUl">
        	
          	    <%
             
                    
                if (MaFengWoStrSplit.Rows.Count > 0)
                {
                    for (int i = 0; i < MaFengWoStrSplit.Rows.Count; i++)
                    {
                        System.Data.DataTable PublishDT = new System.Data.DataTable();
                        if (!Convert.IsDBNull(MaFengWoStrSplit.Rows[i]["PublisherID"]))
                        {
                            PublishDT = _OtherStraBLL.GetPIByPubID(int.Parse(MaFengWoStrSplit.Rows[i]["PublisherID"].ToString()));

                        }
                        String Content;
                        if (MaFengWoStrSplit.Rows[i]["StrategyContent"].ToString().Length > 50)
                            Content = MaFengWoStrSplit.Rows[i]["StrategyContent"].ToString().Substring(0, 50);
                        else
                            Content = MaFengWoStrSplit.Rows[i]["StrategyContent"].ToString();

                        String AuthorUrl = "";
                        if (PublishDT.Rows.Count > 0)
                            if (PublishDT.Rows[0]["PublisherUrl"] != null)
                                AuthorUrl = PublishDT.Rows[0]["PublisherUrl"].ToString();
        	     %>
        		<li>
        			<div class="spot-left"><a href=""><img src="../imagesH/one.jpg" style="width:190px;height:150px;"/></a></div>
        			<div class="spot-right">
        				<h3><%=MaFengWoStrSplit.Rows[i]["StrategyTitle"].ToString()%></h3>
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
        				 %><span id="spotTime"><%=MaFengWoStrSplit.Rows[i]["PublishTime"].ToString()%></span><p><%=Content%>...</p>
        				<span class="gonglveMore"><a href=<%=MaFengWoStrSplit.Rows[i]["StrategyUrl"].ToString() %>><<详细信息</a></span>
        			</div><hr style="border:none;clear:both;"/>
        		</li>
        		       		<%
                        }
                        }
                        
                 %>
        	</ul>

<div id="pages">
	<ul>
		<li>
		  <webdiyer:AspNetPager ID="AspNetPager3" runat="server" Width="100%" 
                               PageSize="3"  CurrentPageIndex="1"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="Prev"   
                                    NextPageText="Next" UrlPaging="false" 
                               onpagechanging="MaFengWoStr_PageChanging" AlwaysShow="True" 
                             >
       </webdiyer:AspNetPager>
		</li>
                 <hr style="border:none;clear:both;"/>
	</ul>
</div>
        </div>
           <%
                 }
   	         %>
        </ContentTemplate>
   	    </asp:UpdatePanel>
   	</div>  <!-- 马蜂窝end-->

    <!-- 同程-->
	<div id="spotContent">
     <asp:UpdatePanel ID="UpdatePanel4" runat="server" RenderMode="Block">
     <ContentTemplate>
              	  <%  
                     
                      if (TongChenStrSplit == null)
                  { %>
               <center>
                     <div id="notext"><img src="../imagesH/notie.png" />对不起，暂时攻略</div>
               </center>
              <%
                  }
                  else
                  {
                   %>
        <div class="Con" >
        	<ul id="ConUl">
        	       <% 
        	        if (TongChenStrSplit.Rows.Count > 0)
                        {
                            for (int i = 0; i < TongChenStrSplit.Rows.Count; i++)
                            {
                                System.Data.DataTable PublishDT = new System.Data.DataTable();
                                if (!Convert.IsDBNull(TongChenStrSplit.Rows[i]["PublisherID"]))
                                {
                                    PublishDT = _OtherStraBLL.GetPIByPubID(int.Parse(TongChenStrSplit.Rows[i]["PublisherID"].ToString()));

                                }
                                String Content;
                                if (TongChenStrSplit.Rows[i]["StrategyContent"].ToString().Length > 100)
                                    Content = TongChenStrSplit.Rows[i]["StrategyContent"].ToString().Substring(0, 100);
                                else
                                    Content = TongChenStrSplit.Rows[i]["StrategyContent"].ToString();

                                String AuthorUrl = "";
                                if (PublishDT.Rows.Count > 0)
                                    if (PublishDT.Rows[0]["PublisherUrl"] != null)
                                        AuthorUrl = PublishDT.Rows[0]["PublisherUrl"].ToString();
                        
        	        %>
        		<li>
        			<div class="spot-left"><a href=""><img src="../imagesH/04.jpg" style="width:190px;height:150px;"/></a></div>
        			<div class="spot-right">
                                        <h3><%=MaFengWoStrSplit.Rows[i]["StrategyTitle"].ToString()%></h3>
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
        				 %><span id="spotTime"><%=TongChenStrSplit.Rows[i]["PublishTime"].ToString()%></span><p><%=Content%>...</p>
                                        <span class="gonglveMore"><a href=<%=TongChenStrSplit.Rows[i]["StrategyUrl"].ToString() %>><<详细信息</a></span>
                                </div><hr style="border:none;clear:both;"/>
        		</li>
        		        		<%
                        }
                        }
                 %>
        	</ul>

<div id="pages">
	<ul>
		<li>
				        <webdiyer:AspNetPager ID="AspNetPager2" runat="server" Width="100%" 
                               PageSize="2"  CurrentPageIndex="1"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="Prev"   
                                    NextPageText="Next" UrlPaging="false" 
                               onpagechanging="TongChenStr_PageChanging" AlwaysShow="false" 
                             >
       </webdiyer:AspNetPager>
		</li>
	</ul>
</div>
        </div>
        <%
                  }
    	               %>
     </ContentTemplate>
     </asp:UpdatePanel>
 </div>  <!-- 同程end-->
    
        <!--欣欣-->
    	<div id="spotContent" style="display:block;">
        <asp:UpdatePanel ID="UpdatePanel6" runat="server" RenderMode="Block">
        <ContentTemplate>
         <%  
             //XinXinStrSplit == null
                     if (XinXinStrSplit == null)
                      { 
         %>
                     <center>
                     <div id="notext"><img src="../imagesH/notie.png" />对不起，暂时攻略</div>
                    </center>
                      <%
                          }
                          else
                          {
                     %>
        <div class="Con" >
        	<ul id="ConUl">
        	        	        	    <%
                if (XinXinStrSplit.Rows.Count > 0)
                {
                    for (int i = 0; i < XinXinStrSplit.Rows.Count; i++)
                    {
                        System.Data.DataTable PublishDT = new System.Data.DataTable();
                        if (!Convert.IsDBNull(XinXinStrSplit.Rows[i]["PublisherID"]))
                        {
                            PublishDT = _OtherStraBLL.GetPIByPubID(int.Parse(XinXinStrSplit.Rows[i]["PublisherID"].ToString()));

                        }
                        String Content;
                        if (XinXinStrSplit.Rows[i]["StrategyContent"].ToString().Length > 100)
                            Content = XinXinStrSplit.Rows[i]["StrategyContent"].ToString().Substring(0, 100);
                        else
                            Content = XinXinStrSplit.Rows[i]["StrategyContent"].ToString();


                      
                        int Minite = DateTime.Now.Millisecond;
                        int RandomNum = Minite % SceneryPic.Rows.Count;
                        String ScePicURL = SceneryPic.Rows[RandomNum]["PicPath"].ToString();
                        ScePicURL = ScePicURL.Substring(ScePicURL.IndexOf('U'));
                        ScePicURL = "../../../" + "Admin/" + ScePicURL;

        	     %>
        		<li>
        			<div class="spot-left"><a href=""><img src=<%=ScePicURL%> style="width:190px;height:150px;"/></a></div>
        			<div class="spot-right">
                                        <h3><%=XinXinStrSplit.Rows[i]["StrategyTitle"].ToString()%></h3>
                                        <span class="Auto"><a href="">作者：<%=PublishDT.Rows[0]["PublisherNickName"].ToString()%></a></span><span id="spotTime"><%=XinXinStrSplit.Rows[i]["PublishTime"].ToString()%></span><p><%=Content%>...</p>
                                        <span class="gonglveMore"><a href=<%=XinXinStrSplit.Rows[i]["StrategyUrl"].ToString() %> target="_blank"><<详细信息</a></span>
                                </div><hr style="border:none;clear:both;"/>
        		</li>
        		 <%
                }
                }
        		 %>
        	</ul>

<div id="pages">
	<ul>
		<li>
	   <webdiyer:AspNetPager ID="AspNetPager6" runat="server" Width="100%" 
                               PageSize="2"  CurrentPageIndex="1"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="Prev"   
                                    NextPageText="Next" UrlPaging="false" 
                               onpagechanging="XinXinStr_PageChanging" AlwaysShow="false" 
                             >
       </webdiyer:AspNetPager>
		</li>
	</ul>
</div>
        </div>
                <%
          }
        %>
        </ContentTemplate>
    	</asp:UpdatePanel>
   </div> <!--欣欣end -->
        <!-- 携程-->
    	<div id="spotContent" >
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Block">
        <ContentTemplate>
                             <%  
                          if (XieChenStrSplit == null)
                          { %>
                             <center>
                             <div id="notext"><img src="../imagesH/notie.png" />对不起，暂时攻略</div>
                             </center>
                     <%
                          }
                          else
                          {
                     %>
       <div class="Con" >
        	<ul id="ConUl">
        	    <%
                if (XieChenStrSplit.Rows.Count > 0)
                {
                    for (int i = 0; i < XieChenStrSplit.Rows.Count; i++)
                    {
                        System.Data.DataTable PublishDT = new System.Data.DataTable();
                        if (!Convert.IsDBNull(XieChenStrSplit.Rows[i]["PublisherID"]))
                        {
                            PublishDT = _OtherStraBLL.GetPIByPubID(int.Parse(XieChenStrSplit.Rows[i]["PublisherID"].ToString()));

                        }
                        String Content1;
                        if (XieChenStrSplit.Rows[i]["StrategyContent"].ToString().Length > 100)
                            Content1 = XieChenStrSplit.Rows[i]["StrategyContent"].ToString().Substring(0, 100);
                        else
                            Content1 = XieChenStrSplit.Rows[i]["StrategyContent"].ToString();

                        String AuthorUrl = "";
                        if (PublishDT.Rows.Count > 0)
                            if (PublishDT.Rows[0]["PublisherUrl"] != null)
                                AuthorUrl = PublishDT.Rows[0]["PublisherUrl"].ToString();

                        int Minite1 = DateTime.Now.Millisecond;
                        int RandomNum1 = Minite1 % SceneryPic.Rows.Count;
                        String ScePicURL1 = SceneryPic.Rows[RandomNum1]["PicPath"].ToString();
                        ScePicURL1 = ScePicURL1.Substring(ScePicURL1.IndexOf('U'));
                        ScePicURL1 = "../../../" + "Admin/" + ScePicURL1;
        	        %>
        		<li>
        			<div class="spot-left"><a href=""><img src=<%=ScePicURL1 %> style="width:190px;height:150px;"/></a></div>
        			<div class="spot-right">
                                        <h3><%=XieChenStrSplit.Rows[i]["StrategyTitle"].ToString()%></h3>
                                        
                                        <% 
                                         if (AuthorUrl != "")
                                        {
                                
                                        %>
                                        <span class="Auto"><a href=<%=AuthorUrl %>>作者：<%=PublishDT.Rows[0]["PublisherNickName"].ToString()%></a></span><%
                                         }

                                        else if (PublishDT.Rows.Count > 0)
                                       {
                                             %><span class="Auto">作者：<%=PublishDT.Rows[0]["PublisherNickName"].ToString()%></span><%
                                        } %><span id="spotTime"><%=XieChenStrSplit.Rows[i]["PublishTime"].ToString()%></span><p><%=Content1%>...</p>
                                        <span class="gonglveMore"><a href=<%=XieChenStrSplit.Rows[i]["StrategyUrl"].ToString() %>><<详细信息</a></span>
                                </div><hr style="border:none;clear:both;"/>
        		</li>
        		    <%
                    
                }
        		}
        		 %>
        	</ul>

<div id="pages">
	<ul>
		<li>
		<webdiyer:AspNetPager ID="AspNetPager5" runat="server" Width="100%" 
                               PageSize="2"  CurrentPageIndex="1"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="Prev"   
                                    NextPageText="Next" UrlPaging="false" 
                               onpagechanging="XieChenStr_PageChanging" AlwaysShow="false" 
                             >
       </webdiyer:AspNetPager>
		</li>
	</ul>
</div>
        </div>
                <%
          }
        %>
        </ContentTemplate>
    	</asp:UpdatePanel>
  </div> <!-- 携程end-->

    	<div id="spotContent">
        
        <div class="Con" >
        	<ul id="ConUl">
        		<li>
        			<div class="spot-left"><a href=""><img src="../imagesH/two.jpg" style="width:190px;height:150px;"/></a></div>
        			<div class="spot-right">
                                        <h3>攻略标题</h3>
                                        <span class="Auto"><a href="">作者：作者很多作者点击</a></span>
                                                <span id="spotTime">2014-4-25</span>
                                        <p>正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略...</p>
                                        <span class="gonglveMore"><a href=""><<详细信息</a></span>
                                </div><hr style="border:none;clear:both;"/>
        		</li>
        		<li>
        			<div class="spot-left"><a href=""><img src="../imagesH/two.jpg" style="width:190px;height:150px;"/></a></div>
        			<div class="spot-right">
                                        <h3>攻略标题</h3>
                                        <span class="Auto"><a href="">作者：作者很多作者点击</a></span>
                                                <span id="spotTime">2014-4-25</span>
                                        <p>正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略...</p>
                                        <span class="gonglveMore"><a href=""><<详细信息</a></span>
                                </div><hr style="border:none;clear:both;"/>
        		</li>
        		<li>
        			<div class="spot-left"><a href=""><img src="../imagesH/two.jpg" style="width:190px;height:150px;"/></a></div>
        			<div class="spot-right">
                                        <h3>攻略标题</h3>
                                        <span class="Auto"><a href="">作者：作者很多作者点击</a></span>
                                                <span id="spotTime">2014-4-25</span>
                                        <p>正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略...</p>
                                        <span class="gonglveMore"><a href=""><<详细信息</a></span>
                                </div><hr style="border:none;clear:both;"/>
        		</li>
                        <li>
                                <div class="spot-left"><a href=""><img src="../imagesH/two.jpg" style="width:190px;height:150px;"/></a></div>
                                <div class="spot-right">
                                        <h3>攻略标题</h3>
                                        <span class="Auto"><a href="">作者：作者很多作者点击</a></span>
                                                <span id="spotTime">2014-4-25</span>
                                        <p>正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略正文攻略...</p>
                                        <span class="gonglveMore"><a href=""><<详细信息</a></span>
                                </div><hr style="border:none;clear:both;"/>
                        </li>
        	</ul>

     <div id="pages">
        <ul>
                <li id="home-page"><a href="" style="padding:2px 10px;text-align:center;">首&nbsp;页</a></li>
                <li class="pre-page"><a href="" ><<</a></li>
                <li  class="current-page">1</li>
                <li><a href="">112</a></li>
                <li><a href="#">113</a></li>
                <li><a href="#">114</a></li>
                <li><a href="#">115</a>...</li>
                <li class="next-page"><a href="">>></a></li>
                <li id="last-page"><a href="" style="padding:2px 2px;text-align:center;">最后一页</a></li>
        </ul>
    </div> 

  </div>
 </div>
</div>
</div>


<!--其他网站的评论-->

<div class="otherComment">
     <img src="../imagesH/voice1.png" />
     <div id="otherDis">
     <input type="button" name="otherbutton" value="同城" />
     <input type="button" id="activ" name="otherbutton" value="驴妈妈" />

     <!--同程 -->
     <div id="disContent1" >
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Block">
        <ContentTemplate>
                    <%
            if (TongChenDT == null)
            {
             %>
             <center>
                      <div id="notext"><img src="../imagesH/notie.png" />对不起，暂时无评论！</div>
                    </center>
            <%
            }
            else
            {
 
            if (TCTotalScore.Rows.Count > 0)
            {
                if ((TCTotalScore.Rows[0]["Satisfaction"] != null) & (TCTotalScore.Rows[0]["Satisfaction"] != ""))
                    _TongChenSatisfaction = TCTotalScore.Rows[0]["Satisfaction"].ToString();

                if ((TCTotalScore.Rows[0]["RecommentRate"] != null) & (TCTotalScore.Rows[0]["RecommentRate"] != ""))
                    _TongChenRecommentRate = TCTotalScore.Rows[0]["RecommentRate"].ToString();

                if ((TCTotalScore.Rows[0]["XingJiaBi"] != null) & (TCTotalScore.Rows[0]["XingJiaBi"] != ""))
                    _TongChenXingJiaBi = TCTotalScore.Rows[0]["XingJiaBi"].ToString();

                if ((TCTotalScore.Rows[0]["Service"] != null) & (TCTotalScore.Rows[0]["Service"] != ""))
                    _TongChenService = TCTotalScore.Rows[0]["Service"].ToString();

                if ((TCTotalScore.Rows[0]["Convenient"] != null) & (TCTotalScore.Rows[0]["Convenient"] != ""))
                    _TongChenConvenient = TCTotalScore.Rows[0]["Convenient"].ToString();
            } %>

                   
     <div id="discussTop">
        <div style="width:645px;height:70px;">
                    <div class="discuss-span1">
                            <h1>5.0</h1>
                            <p style="color:#000;"><%=_TongChenSatisfaction%></p>
                    </div>


                    <div class="discuss-span2">
                            <h1>99.6%</h1>
                            <span class="span2-t"><%=_TongChenRecommentRate%></span>
                    </div>

        </div>
        <hr style="border:1px solid #dddada;"/>

        <div style="width:100%;height:70px;position:relative;">

                <div class="discuss-span3">
                        大家认为
                </div>

                <div class="discuss-span4">
                   
                        <div class="span4-t">
                                <div style="float:left;">性价比：<b><%=_TongChenXingJiaBi%></b></div>
                       
                   </div>
                        <div class="span4-t">服务：<b><%=_TongChenService%>%</b></div>
                        <div class="span4-t">便捷：<b><%=_TongChenService%>%</b></div>
                </div>
        </div>


                <hr style="border:none;clear:both;"/>


        </div>
        <div id="discussBottom">
                <ol>
                                 <%
                for (int i = 0; i < TongChenDT.Rows.Count; i++)
                {
                    
                   // CommentScore = _SIBLL.get
                 %>
                        <li>
                                <div class="DBleft">
                                        <img src="../imagesH/person3.png" style="width:74px;height:74px;"/>
                                </div>
                                <div class="DBright">
                                        <p class="Timee xuxian"><a href=""><%=TongChenDT.Rows[i]["PublisherNickName"].ToString()%></a>评价了<a href=""><%=Name %></a><img src="../imagesH/startSS.jpg"/><img src="../imagesH/startSS.jpg"/><img src="../imagesH/startSS.jpg"/><img src="../imagesH/starhui1.png"/><img src="../imagesH/starhui2.png"/></p>

                                        <p class="contenDiss"><%=TongChenDT.Rows[i]["Assessment_Content"].ToString()%></p>
                                        <p class="Timee">发表于<%=TongChenDT.Rows[i]["Assessment_Time"].ToString() %></p>
                                </div><hr style="border:none;clear:both"/>
                        </li>
               <%
                }
                %>
                </ol>
        </div>


        
        <div id="pages">
        <ul>
                      <li>
        <webdiyer:AspNetPager ID="AspNetPager4" runat="server" Width="100%" 
                               PageSize="2"  CurrentPageIndex="1"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="Prev"   
                                    NextPageText="Next" UrlPaging="false" 
                               onpagechanging="TongChen_PageChanging" AlwaysShow="True" 
                             >
       </webdiyer:AspNetPager>
       </li>
        </ul>
</div> 
        <%
} %>
        </ContentTemplate>
        </asp:UpdatePanel>
     </div>

     <!-- 驴妈妈 -->
     <div id="disContent2" style="display:block;">
       <style>
            .xinxizong{top:-50px;line-height:28px;float:left;margin-left:300px;margin-top:-50px;}
            #disContent2 .Xinxi{font-size:14px;font-family:黑体;position:relative;}
            #disContent2 #discuss .fen{color:#7D7773;padding-left:60px;position:relative;top:35px;}
       </style>     
      	<asp:UpdatePanel ID="UpdatePanel5" runat="server" RenderMode="Block">
        <ContentTemplate> 
                    <%
        if (LvMaMaDT == null)
        { 
          %> 
           <center>
            <div id="notext"><img src="../imagesH/notie.png" />对不起，暂时无评论！</div>
            </center>
        <%
        }
             else
        { 
          %>
        <div id="discuss" >
                <div class="fen">好评率<em style="font-size:48px;color:#FF6600;margin-top:40px;"><%=_LvMaMaTotalScore%>%</em></div>
                <div class="fenXinxi">
                        
                <div class="xinxizong">
                <div class="Xinxi">人气：
                      <%
                          for (int PI = 0; PI < float.Parse(_LvMaMaPopurity); PI++)
                          {          
                      %>
                        <img src="../imagesH/aixin1.png"  style="width:10px;height:10px;"/>
                      <%
                          }
                            
                       %>
                        <em style="color:#ffa63b;margin-left:20px;"><%=_LvMaMaPopurity%>分</em>
                </div>
                <div class="Xinxi">规模：
                    <%
                    for (int SCI = 0; SCI < float.Parse(_LvMaMaScale); SCI++)
                    {
                    %>
                        <img src="../imagesH/aixin1.png"  style="width:10px;height:10px;"/>
                   <%
                    }
                   %>
                        <em style="color:#ffa63b;margin-left:20px;"><%=_LvMaMaScale%>分</em>
                </div>
                <div class="Xinxi">观光：
                        <%
                            for (int SeeI = 0; SeeI < float.Parse(_LvMaMaSightSeeing); SeeI++)
                            {
                        %>
                        <img src="../imagesH/aixin1.png"  style="width:10px;height:10px;"/>
                          <%
                            }
                         %>
                        <em style="color:#ffa63b;margin-left:20px;"><%=_LvMaMaSightSeeing%>分</em>
                </div>
                <div class="Xinxi">服务：
                        <%
                            for (int SI = 0; SI < float.Parse(_LvMaMaService); SI++)
                            {
                        %>
                        <img src="../imagesH/aixin1.png"  style="width:10px;height:10px;"/>
                        <%
                            }
                       %>
                        <em style="color:#ffa63b;margin-left:20px;"><%=_LvMaMaService%>分</em>
                </div>

                </div><hr style="border:none;clear:both;"/>
        </div>
        </div>
        <div class="disBottom">
                <ol>
                <%
                for (int i = 0; i < LvMaMaDT.Rows.Count; i++)
                {
        	    %>
                       <li>
                                <div class="disBLeft">
                                <a href=""><img class="yonghu" src="../imagesH/person2.jpg" style="width:91px;height:83px;"/></a>
                                <p id="user1"><a href="" style=""><%=LvMaMaDT.Rows[i]["PublisherNickName"].ToString() %></a></p>
                                </div>
                                <div class="disBRight">
                                       <!-- <em>总体评价:<img src="../imagesH/aixin1.png"  style="width:10px;height:10px;"/><img src="../imagesH/aixin1.png"  style="width:10px;height:10px;"/><img src="../imagesH/aixin1.png"  style="width:10px;height:10px;"/><img src="../imagesH/aixin1.png"  style="width:10px;height:10px;"/><img src="../imagesH/aixin2.png"  style="width:10px;height:10px;"/></em>-->
                                        <hr style="border:1px dashed #d2d0d0;width:520px;margin-top:5px;margin-bottom:10px;" />
                <% 
                     String LvPopu = "";
                     String LvScal = "";
                     String LvSiSee = "";
                     String LvSer = "";
                     if (LvMaMaDT.Rows[i]["Popurity"].ToString() == "")
                         LvPopu = "--";
                     else
                         LvPopu = LvMaMaDT.Rows[i]["Popurity"].ToString();
                    
                     if (LvMaMaDT.Rows[i]["Scale"].ToString() == "")
                         LvScal = "--";
                     else
                         LvScal = LvMaMaDT.Rows[i]["Scale"].ToString();
                    
                     if (LvMaMaDT.Rows[i]["SightSeeing"].ToString() == "")
                         LvSiSee = "--";
                     else
                         LvSiSee = LvMaMaDT.Rows[i]["SightSeeing"].ToString();
                    
                     if (LvMaMaDT.Rows[i]["Service"].ToString() == "")
                         LvSer = "--";
                     else
                         LvSer = LvMaMaDT.Rows[i]["Service"].ToString();
                       
                 %>
                                        <p><span class="Xinxi">人气：<em style="color:#32b16c;"><%=LvPopu%>分</em></span>
                <span class="Xinxi">规模：<em style="color:#32b16c;"><%=LvScal%>分</em></span>
                <span class="Xinxi">观光：<em style="color:#32b16c;"><%=LvSiSee%>分</em></span>
                <span class="Xinxi">服务：<em style="color:#32b16c;"><%=LvSer%>分</em></span></p>
                <p class="Bdis"><%=LvMaMaDT.Rows[i]["Assessment_Content"].ToString()%></p>
                
                <div class="TimeLove"><span class="LT-1"><%=LvMaMaDT.Rows[i]["Assessment_Time"].ToString()%></span></div>
                                </div><hr style="border:none;clear:both;" />
                        </li>
               <%
                }
                %>

                </ol>
        </div>
        <div id="pages">
            <ul>
            <li >
		    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" Width="100%" 
                                   PageSize="2"  CurrentPageIndex="1"
                                        FirstPageText="首页" LastPageText="尾页" PrevPageText="Prev"   
                                        NextPageText="Next" UrlPaging="false" 
                                   onpagechanging="LvMaMa_PageChanging" AlwaysShow="True">
            </webdiyer:AspNetPager>
		    </li>
            </ul>
       </div>
        <% 
           }
        %>
        </ContentTemplate>
        </asp:UpdatePanel>
     </div>


   </div>               
 </div>
</div>

<div style="float:left;">
<!--大家还看了-->
<div class="AlsoSee">
	<h2><img src="../imagesH/dajia.png" width="28px" height="30px" style="margin-top:5px;"/>&nbsp;大家还看了</h2>
	<ol class="AlsoOL">
		<li>
			<a href="Scenery.aspx?SceneryID=34"><img src="../EleImages/蝴蝶泉.jpg" style=""/></a>
			<div class="also-right">
				<h3>蝴蝶泉</h3>
				<ul class="mess">
				<li>地址：十里画廊旁边</li>
				<li>景点门票：30￥</li>
				<li>开放时间：全天</li>
				</ul>
			</div><hr style="border:none;clear:both;" />
		</li>
		<li style="margin-top:10px;">
			<a href="Scenery.aspx?SceneryID=59"><img src="../EleImages/七星公园.jpg" style=""/></a>
			<div class="also-right">
				<h3>七星公园</h3>
				<ul class="mess">
				<li>地址：七星区七星路1号</li>
				<li>景点门票：75￥</li>
				<li>开放时间：06:00~19:30</li>
				</ul>
			</div><hr style="border:none;clear:both;" />
		</li>
		<li style="margin-top:10px;">
			<a href="Scenery.aspx?SceneryID=115"><img src="../EleImages/龙胜梯田.jpg" style=""/></a>
			<div class="also-right">
				<h3>龙脊梯田</h3>
				<ul class="mess">
				<li>地址：桂林市七星区</li>
				<li>景点门票：80￥</li>
				<li>开放时间：全天</li>
				</ul>
			</div><hr style="border:none;clear:both;" />
		</li>
                
	</ol>
	<a href="" ><img src="../imagesH/refresh1.png" style="float:right;margin-right:10px;"/></a>
 </div>


<!--大家点评-->
     <!--显示已有评论-->
<div class="Discuss">
        <h2>大家点评</h2>
         <%
         //根据SceneryID找到相应的Scenery评论
         if (PublicComment != null && PublicComment.Rows.Count > 0) { 
             
             for (int i = 0; i < PublicComment.Rows.Count; i++ ) {
                 String CmtContent = PublicComment.Rows[i]["CommentContent"].ToString();
                 String CmtTime    = PublicComment.Rows[i]["CommentTime"].ToString();
                 String CmtScore   = PublicComment.Rows[i]["SceneryRate"].ToString();
                 String CmtUserID = PublicComment.Rows[i]["UserID"].ToString();
                 CmtUser= _SIBLL.GetCmtUserAccountByUserID(CmtUserID);
                 String CmtUserName = CmtUser.Rows[0]["UserAccount"].ToString();
         %>     
                <li>
                        <div class="Dis-left">
                                <a href=""><img class="yonghu" src="../imagesH/person.png" style="width:64px;height:79px"/></a>
                                <a href=""><p style="margin-top:5px;width:64px;text-align:center;"><%=CmtUserName %></p></a>
                        </div>
                        <div class="Dis-right">
                                <p style="color:#f30;font-size:14px;font-weight:bold;">评分：<%=CmtScore %>分
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
                                </p>
                                <p class="contenDis"><%=CmtContent%>.</p>
                                 <p style="color:#9da0a0;font-size:14px;position:relative;left:170px;"><%=CmtTime %></p>
                        </div><hr style="border:none;clear:both;" />
                </li>

        <%
             }
         }
         else {     
         %>
            <!--无评论的样式-->   
            <center>
                <div id="notext-1" style=" min-height:300px; padding-top:80px;"><img src="../imagesH/notie.png" />对不起，暂时无评论！</div>
            </center> 
            <!--end-->  

        <ul class="Dis">
         <%
         }   
         %>
              

        </ul>
        <!--  翻页-->
        <ol>
                <li class="pre-page"><a href="" ><<</a></li>
                <li  class="current-pag">1</li>
                <li><a href="">2</a></li>
                <li><a href="#">3</a>...</li>
                
                <li class="next-page"><a href="">>></a></li>
        </ol>
            
       <!-- 当前用户发表评论-->  
    <asp:hiddenfield id="CmtValue" runat="server" value=""></asp:hiddenfield>   
    <img src="../imagesH/me.jpg"/>
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

<!--输入评价区域 -->
<textarea id="TextArea1"  name="textarea"  cols="35" rows="5" >

</textarea>

<p class="tishi">您还可以输入 <span id="textCount">200</span> 个字符</p>

<asp:Button ID="Button1" runat="server" Text="发&nbsp;布" OnClick="Button1_Click" />  <!--点击发布响应事件 -->
 <%--<input type="submit" class="Sum" action="" value="发&nbsp;布" />--%>
<hr style="border:none;clear:both;" />


<script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
    $("#TextArea1").keydown(function(){
    var curLength=$("#TextArea1").val().length;
    if(curLength>=200){
        var num=$("#TextArea1").val().substr(0,200);
        $("#TextArea1").val(num);
        alert("超过字数限制，多出的字将被截断！");
       
    }
    else{
        $("#textCount").text(200-$("#TextArea1").val().length)
    }
    })
    })
</script>
</div> <!-- end Discuss-->


</div>







<hr style="border:none;clear:both;"/>


<div class="seek-foot">
   
        <img src="../imagesH/HR2.png"  />

        
        <ul>
                <li>友情链接：</li>
                <li><a href="" target="_blank" >美团</a> </li>
                <li><a href="" target="_blank" >淘宝旅游</a>   </li>
                <li><a href="" target="_blank" >去哪儿</a>  </li>
                <li><a href="" target="_blank" >马蜂窝</a></li>
                <li><a href="" target="_blank" >携程</a>  </li>
                <li><a href="" target="_blank" >同城</a>   </li>
                <li><a href="" target="_blank" >豆瓣</a>  </li>
                <li><a href="" target="_blank" >百度旅游</a>   </li>
               
        </ul><hr style="border:none;clear:both;"/>


        

        <p>               
网络文化经营许可证：文网文[2010]040号|增值电信业务经营许可证：浙B2-20080224-1|信息网络传播视听节目许可证：1109364号</p>

</div>
</div>
<!--all end-->

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
        bigimg.src="../imagesH/JL1.gif";
        bigimg.onmouseover= function()
        {
                changeImg();
        }
        bigimg.onmouseout= function()
        {
             changeBack();   
        }
       
        bigimg.onclick= function()
        {
                IsNeedHelp();
        }
        
}
function noAnswer()
{
        var dia2=document.getElementById("diabox2");
        var bigimg=document.getElementById("myimg01");
        dia2.style.display="none";
        bigimg.src="../imagesH/JL1.gif";
        bigimg.onmouseover= function()
        {
                changeImg();
        }
        bigimg.onmouseout= function()
        {
             changeBack();   
        }
       
        bigimg.onclick= function()
        {
                IsNeedHelp();
        }
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
        bigimg.src="../imagesH/JL1.gif";
        bigimg.onmouseover= function()
        {
                changeImg();
        }
        bigimg.onmouseout= function()
        {
             changeBack();   
        }
       
        bigimg.onclick= function()
        {
                IsNeedHelp();
        }
}

function nogoToSee()
{
        var dia1=document.getElementById("diabox1");
        var dia3=document.getElementById("diabox3");
        var bigimg=document.getElementById("myimg01");
        dia1.style.display="none";
         dia3.style.display="none";
        bigimg.src="../imagesH/JL1.gif";
        bigimg.onmouseover= function()
        {
                changeImg();
        }
        bigimg.onmouseout= function()
        {
             changeBack();   
        }
       
        bigimg.onclick= function()
        {
                IsNeedHelp();
        }
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
        <div id="diabox1" style="display:none;"> <!---->
                
                <input type="buton" id="input1" onclick="needHelp()"/>
                <input type="button" id="input2" onclick="noneedHelp()"/>
        </div>
        <div id="diabox2"  style="display:none;"><!-- -->

               
                        



                <div id="diabox2-child">
                   <input type="button" id="input3" onclick="noAnswer()" />
                <!--不回答问题-->

                        <p class="questionTitle">先
        <div id="smallJL">
        <div id="floatWindow">
                <img id="myimg01" src="../imagesH/JL1.png" width="126" height="100" onmouseover="changeImg()" onmouseout="changeBack()" onclick="IsNeedHelp()">
        </div>
        <div id="diabox1" style="display:none;"> <!---->
                
                <input type="buton" id="input1" onclick="needHelp()"/>
                <input type="button" id="input2" onclick="noneedHelp()"/>
        </div>
        <div id="diabox2"  style="display:none;"><!-- -->

               
                        



                <div id="diabox2-child">
                   <input type="button" id="input3" onclick="noAnswer()" />
                <!--不回答问题-->

                        <p class="questionTitle">先<span style="color:#2e96c2;font-size:20px;">回答</span>
                                这样几个<span style="color:#2e96c2;font-size:20px;">问题</span>吧</p>
                      <!--  <p class="ques1"><span style="font-size:16px;">1.</span style="margin-left:10px;">您希望旅行几天 ？<input type="text" style="width:62px;height:18px;margin-left:30px;margin-right:10px;"/>天</p>-->
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
                
               <!--链接到推荐页面--> <a href="Recommend.aspx"  target="_blank"><input  id="input5" value=" " onclick="goToSee()"/></a>
                <input  id="input6" value=" " onclick="nogoToSee()"/>
        </div>
</div>
</body>
</html>
