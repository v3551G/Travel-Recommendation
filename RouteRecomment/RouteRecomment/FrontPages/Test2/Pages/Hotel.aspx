<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hotel.aspx.cs" Inherits="RouteRecomment.FrontPages.Test2.Pages.Hotel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/hotel.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../js/jquery.1.4.2-min.js" ></script>
<script type="text/javascript" src="../js/jqhotel.js"></script>
<script type="text/javascript" src="../js/hotel.js"></script>

<title>hotel</title>

<script src="../js/jquery.1.4.2-min.js"></script>
<script type="text/javascript">
$(function(){
	var slideHeight = 75; // px
	var defHeight = $('#wrap').height();
	if(defHeight >= slideHeight){
		$('#wrap').css('height' , slideHeight + 'px');
		$('#read-more').append('<a href="#"> 详细信息</a>');
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
              <div id="focus">
              <ul>
                  <li><a href="#" target="_blank" title=""><img alt="" src="../images/tp-1.jpg"/></a></li>
                  <li><a href="#" target="_blank" title=""><img alt="" src="../images/tp-2.jpg" /></a></li>
                  <li><a href="#" target="_blank" title=""><img alt="" src="../images/tp-3.jpg" /></a></li>
                  <li><a href="#" target="_blank" title=""><img alt="" src="../images/tp-4.jpg" /></a></li>
                  <li><a href="#" target="_blank" title=""><img alt="" src="../images/tp-5.jpg" /></a></li>
                  <li><a href="#" target="_blank" title=""><img alt="" src="../images/tp-6.jpg" /></a></li>
              </ul>
              </div>
          </div>
          <div class="txt"><a href="#"><img src="../images/txt-02.png" width="274" height="51" alt="酒店" /></a></div>
          <div class="messages">
                <div id="m-1">
                     <div class="h-lev"><img src="../images/m-5.png" /></div>
                     <div id="m-t"> 星级：
                     <img src="../images/star.png" />
                     <img src="../images/star.png" />
                     <img src="../images/star.png" />
                     <img src="../images/star.png" />
                     <img src="../images/star.png" />
                     </div>
                 </div><!--m-1 end-->
                 <div style="clear:both"></div>
                 
                    <div id="m-2">
                         <div class="h-lev"><img src="../images/m-2.png" /></div>
                         <div id="m-t"> 
                             联系方式：15200352241<br />
                             传    真：0213-223232323
                         </div>
                    </div><!--m-1 end-->
                    
                    <div id="m-3">
                         <div class="h-lev"><img src="../images/m-1.png" /></div>
                         <div id="m-t"> 
                             香港街旺旺街167号
                         </div>
                    </div><!--m-1 end-->
                    
                    
                     <div id="m-4">
                         <div class="h-lev"><img src="../images/m-4.png" /></div>
                         <div id="m-t"> 
                         
                            
                            
                                              
                                                  <div id="container">
                          <div id="wrap">
                              <div>
                                  <p>  酒店介绍：位于香港最繁华的旺角区，矗立于港铁旺角东站上及邻近旺角站。网友评价说"交通方便，房间很大，性价比很高，服性价比很高，服务很好，位置好性价比很高，服务很好，位置好..性价比很高，服务很好，位置好..性价比很高，服务很好，位置好....</p>
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
             <div id="c-banner">
               <p>房型</p>
             </div>
             
           
             <div id="c-bed">
                <div id="bed-type">
                     <ul>
                         <li style="width:30%;"><img src="../images/m-6.png" />房型</li>
                         <li style="width:17.5%;"><img src="../images/m-9.png" />床型</li>
                         <li style="width:17.5%;"><img src="../images/m-7.png" />宽带</li>
                         <li style="width:17.5%;"><img src="../images/m-8.png" />早餐</li>
                         <li style="width:17.5%;"><img src="../images/m-10.png" />日均价</li>
                     </ul>
                </div>
                    
                 <!--bed start-->
                 <div id="c-myDiv">

                  
                   
                    <div id="bed">  

                          <div id="bed-1">
                             <ul>
                                   <li style="width:30%;" ><a>标准间</a></li>
                                   <li style="width:17.5%;"><a href="#">双人床</a></li>
                                   <li style="width:17.5%;"><a href="#">免费</a></li>
                                   <li style="width:17.5%;"><a href="#">无</a></li>
                                   <li style="width:17.5%;"><a href="#"  id="money">￥668</a></li>
                             </ul>
                             
                          	<div></div>
                          </div>                    
                         <div id="bed-detail">
                         
                           <ul>
                               <li style="width:30%;"><a href="#"><img src="../images/ho-1.jpg" /></a></li>
                                <li style="width:20%;"><a href="#">床型1.8m</a></li>
                               <li style="width:25%;"><a href="#">楼层：3楼两个</a></li>
                               <li style="width:25%;"><a href="#">宽带免费</a></li>
                           </ul>
                           <div id="d-close"><img src="../images/close.jpg" /></div>
                                         <div></div>
                         </div>
		        </div>
                <div id="bed">  

                          <div id="bed-1">
                             <ul>
                                   <li style="width:30%;" ><a>标准间</a></li>
                                   <li style="width:17.5%;"><a href="#">双人床</a></li>
                                   <li style="width:17.5%;"><a href="#">免费</a></li>
                                   <li style="width:17.5%;"><a href="#">无</a></li>
                                   <li style="width:17.5%;"><a href="#"  id="money">￥668</a></li>
                             </ul>
                             
                          	<div></div>
                          </div>                    
                         <div id="bed-detail">
                         
                           <ul>
                               <li style="width:30%;"><a href="#"><img src="../images/ho-1.jpg" /></a></li>
                                <li style="width:20%;"><a href="#">床型1.8m</a></li>
                               <li style="width:25%;"><a href="#">楼层：3楼两个</a></li>
                               <li style="width:25%;"><a href="#">宽带免费</a></li>
                           </ul>
                           <div id="d-close"><img src="../images/close.jpg" /></div>
                                         <div></div>
                         </div>
		        </div>
                 <div id="bed">  

                          <div id="bed-1">
                             <ul>
                                   <li style="width:30%;" ><a>标准间</a></li>
                                   <li style="width:17.5%;"><a href="#">双人床</a></li>
                                   <li style="width:17.5%;"><a href="#">免费</a></li>
                                   <li style="width:17.5%;"><a href="#">无</a></li>
                                   <li style="width:17.5%;"><a href="#"  id="money">￥668</a></li>
                             </ul>
                             
                          	<div></div>
                          </div>                    
                         <div id="bed-detail">
                         
                           <ul>
                               <li style="width:30%;"><a href="#"><img src="../images/ho-1.jpg" /></a></li>
                                <li style="width:20%;"><a href="#">床型1.8m</a></li>
                               <li style="width:25%;"><a href="#">楼层：3楼两个</a></li>
                               <li style="width:25%;"><a href="#">宽带免费</a></li>
                           </ul>
                           <div id="d-close"><img src="../images/close.jpg" /></div>
                                         <div></div>
                         </div>
		        </div>
                 <div id="bed">  

                          <div id="bed-1">
                             <ul>
                                   <li style="width:30%;" ><a>标准间</a></li>
                                   <li style="width:17.5%;"><a href="#">双人床</a></li>
                                   <li style="width:17.5%;"><a href="#">免费</a></li>
                                   <li style="width:17.5%;"><a href="#">无</a></li>
                                   <li style="width:17.5%;"><a href="#"  id="money">￥668</a></li>
                             </ul>
                             
                          	<div></div>
                          </div>                    
                         <div id="bed-detail">
                         
                           <ul>
                               <li style="width:30%;"><a href="#"><img src="../images/ho-1.jpg" /></a></li>
                                <li style="width:20%;"><a href="#">床型1.8m</a></li>
                               <li style="width:25%;"><a href="#">楼层：3楼两个</a></li>
                               <li style="width:25%;"><a href="#">宽带免费</a></li>
                           </ul>
                           <div id="d-close"><img src="../images/close.jpg" /></div>
                                         <div></div>
                         </div>
		        </div>
                 <div id="bed">  

                          <div id="bed-1">
                             <ul>
                                   <li style="width:30%;" ><a>标准间</a></li>
                                   <li style="width:17.5%;"><a href="#">双人床</a></li>
                                   <li style="width:17.5%;"><a href="#">免费</a></li>
                                   <li style="width:17.5%;"><a href="#">无</a></li>
                                   <li style="width:17.5%;"><a href="#"  id="money">￥668</a></li>
                             </ul>
                             
                          	<div></div>
                          </div>                    
                         <div id="bed-detail">
                         
                           <ul>
                               <li style="width:30%;"><a href="#"><img src="../images/ho-1.jpg" /></a></li>
                                <li style="width:20%;"><a href="#">床型1.8m</a></li>
                               <li style="width:25%;"><a href="#">楼层：3楼两个</a></li>
                               <li style="width:25%;"><a href="#">宽带免费</a></li>
                           </ul>
                           <div id="d-close"><img src="../images/close.jpg" /></div>
                                         <div></div>
                         </div>
		        </div>
                 <div id="bed">  

                          <div id="bed-1">
                             <ul>
                                   <li style="width:30%;" ><a>标准间</a></li>
                                   <li style="width:17.5%;"><a href="#">双人床</a></li>
                                   <li style="width:17.5%;"><a href="#">免费</a></li>
                                   <li style="width:17.5%;"><a href="#">无</a></li>
                                   <li style="width:17.5%;"><a href="#"  id="money">￥668</a></li>
                             </ul>
                             
                          	<div></div>
                          </div>                    
                         <div id="bed-detail">
                         
                           <ul>
                               <li style="width:30%;"><a href="#"><img src="../images/ho-1.jpg" /></a></li>
                                <li style="width:20%;"><a href="#">床型1.8m</a></li>
                               <li style="width:25%;"><a href="#">楼层：3楼两个</a></li>
                               <li style="width:25%;"><a href="#">宽带免费</a></li>
                           </ul>
                           <div id="d-close"><img src="../images/close.jpg" /></div>
                                         <div></div>
                         </div>
		        </div>
                <div id="bed">  

                          <div id="bed-1">
                             <ul>
                                    <li style="width:30%;" ><a>标准间</a></li>
                                   <li style="width:17.5%;"><a href="#">双人床</a></li>
                                   <li style="width:17.5%;"><a href="#">免费</a></li>
                                   <li style="width:17.5%;"><a href="#">无</a></li>
                                   <li style="width:17.5%;"><a href="#"  id="money">￥668</a></li>
                             </ul>
                             
                          	<div></div>
                          </div>                    
                         <div id="bed-detail">
                         
                           <ul>
                               <li style="width:30%;"><a href="#"><img src="../images/ho-1.jpg" /></a></li>
                                <li style="width:20%;"><a href="#">床型1.8m</a></li>
                               <li style="width:25%;"><a href="#">楼层：3楼两个</a></li>
                               <li style="width:25%;"><a href="#">宽带免费</a></li>
                           </ul>
                           <div id="d-close"><img src="../images/close.jpg" /></div>
                                         <div></div>
                         </div>
		        </div>
                <div style="clear:both;"></div>
                   
                   
                 </div>
             
             </div>
             
             
             
            
             <!--end c-btn-->
             <!--设施服务开始-->
             <div id="c-sevice">
               <p>设施服务</p>
             </div>
             <div id="list">
               <div id="c-list"><div id="c-tit">基本信息：</div> <div class="c-list-t">开业信息：2013年12月23日  邮编：541004  最近装修：2014年01月05日</div></div><div style="clear:both"></div>
               <div id="c-list"><div id="c-tit">酒店政策：</div> <div class="c-list-t">最早到点时间：14:00  最晚离电时间：12:00</div></div><div style="clear:both"></div>
               <div id="c-list"><div id="c-tit">酒店服务：</div> <div class="c-list-t">商业中心、免费大巴、停车场</div></div><div style="clear:both"></div>
               <div id="c-list"><div id="c-tit">休闲娱乐：</div><div class="c-list-t">健身房、游泳池、棋牌室</div></div><div style="clear:both"></div>
               <div id="c-list"><div id="c-tit">会议设施：</div><div class="c-list-t">设有容纳400人到500人开会的会议厅，内配六声道同声传译系统，另配有五间不用类型的会议室，供给不同类型的会议使用。</div></div><div style="clear:both"></div>
               <div id="c-list"><div id="c-tit">休闲娱乐：</div><div class="c-list-t">健身房、游泳池、棋牌室</div></div>
             </div>
             <div style="clear:both"></div>
             <div id="c-btn">
               <p>其他网站的评论</p>
             </div><!--end c-btn-->
             
             
              <!--其他网站评论开始-->
             <div id="div1">
                  <input type="button" class="active" value="艺龙" />
                  <input type="button" value="豆豆" />
                  <input type="button" value="欣欣" />
      
                 <!--艺龙开始-->
                  <div id="miao" style="display:block;">
                      <div id="temp">
                        好评率: <img src="../images/value.png" width="48" height="43" id="c-img" />
                        <p id="percent">89%</p>
                      </div>
                      <div id="temp-1">
                        <div id="c-portrait">
                           <a href="#"><img src="../images/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#">海信</a></p>
                        </div>
                        <div id="c-btn-txt">
                            <p id="c-value">这个酒店非常好呀，下次还来，值得推荐！！！</p>
                            <p id="c-time">2013-12-01<a href="#">标准房</a></p>
                        </div>
                        <div id="c-btn-value">
                           <div id="c-star">
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <span id="c-star-l">5.0分</span>
                           </div>
                        </div>
                      </div>
                     <div style="clear:both"></div>
                      
                       <div id="temp-1">
                        <div id="c-portrait">
                           <a href="#"><img src="../images/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#">海信</a></p>
                        </div>
                        <div id="c-btn-txt">
                            <p id="c-value">这个酒店非常好呀，下次还来，值得推荐！！！</p>
                            <p id="c-time">2013-12-01<a href="#">标准房</a></p>
                        </div>
                        <div id="c-btn-value">
                           <div id="c-star">
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <span id="c-star-l">5.0分</span>
                           </div>
                        </div>
                      </div>
                      <div style="clear:both"></div>
                      <div id="temp-1">
                        <div id="c-portrait">
                           <a href="#"><img src="../images/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#">海信</a></p>
                        </div>
                        <div id="c-btn-txt">
                            <p id="c-value">这个酒店非常好呀，下次还来，值得推荐！！！</p>
                            <p id="c-time">2013-12-01<a href="#">标准房</a></p>
                        </div>
                        <div id="c-btn-value">
                           <div id="c-star">
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <span id="c-star-l">5.0分</span>
                           </div>
                        </div>
                      </div>
                     <div style="clear:both"></div>
                     <div id="r-page">
                       <div class="black2"><span class="disabled"> < </span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">200</a><a href="#?page=2"> > </a></div></p>
                     </div> 
                  </div>
              <!--艺龙  end-->
              
                 <!--携程开始-->
                  <div id="miao">
                     
                       <div id="temp">
                        好评率: <img src="../images/value.png" width="48" height="43" id="c-img" />
                        <p id="percent">89%</p>
                       </div>
                          <div id="temp-1">
                        <div id="c-portrait">
                           <a href="#"><img src="../images/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#">海信</a></p>
                        </div>
                        <div id="c-btn-txt">
                            <p id="c-value">这个酒店非常好呀，下次还来，值得推荐的大口大口了飞机肯德基！！！</p>
                            <p id="c-time">2013-12-01<a href="#">标准房</a></p>
                        </div>
                        <div id="c-btn-value">
                           <div id="c-star">
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <span id="c-star-l">5.0分</span>
                           </div>
                        </div>
                      </div>
                       <div style="clear:both"></div>
                      
                      <div id="temp-1">
                        <DIV style="LINE-HEIGHT: 1px; WIDTH: 100px; HEIGHT: 1px; CLEAR: both"></DIV>
                        <div id="c-portrait">
                           <a href="#"><img src="../images/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#">海信</a></p>
                        </div>
                        <div id="c-btn-txt">
                            <p id="c-value">这个酒店非常好呀，下次还来，值得推荐了看功夫离开了付款了考虑考虑开个房来看的空间数据库到几十块的健康神！！！看了看功夫离开了付款了考虑考虑开个房来看的空间数据库到几十块的健康神盾局的健康了设计费绿色空间放得开了深刻的健康了释放节点</p>
                            <p id="c-time">2013-12-01<a href="#">标准房</a></p>
                        </div>
                        <div id="c-btn-value">
                           <div id="c-star">
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <span id="c-star-l">5.0分</span>
                           </div>
                        </div>
                      </div>
                        <div style="clear:both"></div>
                           <div id="temp-1">
                        <div id="c-portrait">
                           <a href="#"><img src="../images/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#">海信</a></p>
                        </div>
                        <div id="c-btn-txt">
                            <p id="c-value">这个酒店非常好呀，下次还来，值得推荐！！！！！！的空电动机的空间看了快乐大脚刻录机间数据库到几十块的健康神盾局的健康了设计费绿色空间放得！！！的空间数据库到几十块的健康神盾局的健康了设计费绿色空间放得</p>
                            <p id="c-time">2013-12-01<a href="#">标准房</a></p>
                        </div>
                        <div id="c-btn-value">
                           <div id="c-star">
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <span id="c-star-l">5.0分</span>
                           </div>
                        </div>
                      </div>
                       <div style="clear:both"></div>
                      <div id="r-page"> <div class="black2"><span class="disabled"> < </span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">200</a><a href="#?page=2"> > </a></div></p></div>  
                      
                     
                  </div>
                  <!--携程 end-->
                  
                      <!--欣欣开始-->
                     <div id="miao">
                     
                      <div id="temp">
                         
                         <img src="../images/m-12 (2).png" width="28" height="24" id="c-img-1" />
                         <img src="../images/m-12 (2).png" width="28" height="24" id="c-img-1" />
                         <img src="../images/m-12 (2).png" width="28" height="24" id="c-img-1" />
                         <img src="../images/m-12 (2).png" width="28" height="24" id="c-img-1" />
                         <img src="../images/m-12 (2).png" width="28" height="24" id="c-img-1" />
                        5/5
                        <p id="percent-1">89%用户推荐</p>
                      </div>
                      <div id="temp-1">
                        <div id="c-portrait">
                           <a href="#"><img src="../images/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#">海信</a></p>
                        </div>
                        <div id="c-btn-txt">
                            <p id="c-value">这个酒店非常好呀，下次还来，值得推荐！！！</p>
                            <p id="c-time">2013-12-01<a href="#">标准房</a></p>
                        </div>
                        <div id="c-btn-value">
                           <div id="c-star">
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <span id="c-star-l">5.0分</span>
                           </div>
                        </div>
                      </div>
                       <div style="clear:both"></div> 
                      <div id="temp-1">
                        <div id="c-portrait">
                           <a href="#"><img src="../images/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#">海信</a></p>
                        </div>
                        <div id="c-btn-txt">
                            <p id="c-value">这个酒店非常好呀，下次还来，值得推荐！！！</p>
                            <p id="c-time">2013-12-01<a href="#">标准房</a></p>
                        </div>
                        <div id="c-btn-value">
                           <div id="c-star">
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <span id="c-star-l">5.0分</span>
                           </div>
                        </div>
                      </div>
                       <div style="clear:both"></div> 
                       <div id="temp-1">
                        <div id="c-portrait">
                           <a href="#"><img src="../images/m-hp1.png" height="47" width="47"  alt=" 用户头像"/></a>
                           <p id="user"><a href="#">海信</a></p>
                        </div>
                        <div id="c-btn-txt">
                            <p id="c-value">这个酒店非常好呀，下次还来，值得推荐！！！</p>
                            <p id="c-time">2013-12-01<a href="#">标准房</a></p>
                        </div>
                        <div id="c-btn-value">
                           <div id="c-star">
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <img src="../images/c-st.png" width="14" height="13" alt="pingfen" />
                              <span id="c-star-l">5.0分</span>
                           </div>
                        </div>
                       <div style="clear:both"></div> 
                    </div>
                     <div style="clear:both"></div>
                    <div id="r-page">
                      <div class="black2"><span class="disabled"> < </span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">200</a><a href="#?page=2"> > </a></div></p>
                    </div> 
                    <!-- 欣欣 end-->
                     
                    </div>

            </div> 
             
             
          </div><!--end c-left-->
          
          
          <!--end c-right start-->
          <div id="c-right">
              <div id="r-up">
                 <h2>大家还看了</h2>
               
                 <div id="r-list">
                   <div id="r-img"><a href="#"><img src="../images/img-1.jpg" width="152" height="103" alt="酒店图片链接"/></a></div>
                   <div id="r-ms">
                      <h3><a href="#">红星街酒好的就看得见店</a></h3>
                      <p>地址：红星街888号后的空间的健康看到了款到即发肯德基</p>
                      <p>联系电话：4545464</p>
                      <p>营业时间：24小时营业</p>
                      
                   </div>
                 </div>
                 <div style="clear:both"></div>              <!--end r-list-->

       
    
                 <div id="r-list">
                   <div id="r-img"><a href="#"><img src="../images/img-1.jpg" width="152" height="103" alt="酒店图片链接"/></a></div>
                   <div id="r-ms">
                      <h3><a href="#">红星街酒好的就看得见店</a></h3>
                      <p>地址：红星街888号后的空间的健德基看到了款到即发肯德基</p>
                      <p>联系电话：4545464</p>
                      <p>营业时间：24小时营业</p>
                      
                   </div>
                 </div>
                 <div style="clear:both"></div>
                 
                 
                 <div id="r-list">
                   <div id="r-img"><a href="#"><img src="../images/img-1.jpg" width="152" height="103" alt="酒店图片链接"/></a></div>
                   <div id="r-ms">
                      <h3><a href="#">红星街酒好的就看得见店</a></h3>
                      <p>地址：红星街888号后的健康的加</p>
                      <p>联系电话：4545464</p>
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
                          <p>还行呀，很不错，一下还会来的，继续来支持，来了还行来！还行呀，很不错，一下还会来的，继续来支持，来了还行来还行呀，很不错，一下还会来的，继续来支持，来了还行来</p>
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

</body>
</html>

