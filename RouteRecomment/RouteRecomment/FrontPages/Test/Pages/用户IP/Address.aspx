<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Address.aspx.cs" Inherits="RouteRecomment.FrontPages.Test.Pages.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <title>MJBlog(mj.588cy.com)</title> 
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js">
 </script>
  <script type="text/javascript">
   $(document).ready(function()
  { //通过调用新浪IP地址库接口查询用户当前所在国家、省份、城市、运营商信息 
  $.getScript('http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js',function()
  { 
          $(".country").html(remote_ip_info.country); 
          $(".province").html(remote_ip_info.province);
           $(".city").html(remote_ip_info.city);
            $(".isp").html(remote_ip_info.isp); 
  }
  );
   //通过调用QQIP地址库接口查询本机当前的IP地址 
   $.getScript('http://fw.qq.com/ipaddress',function()
   { 
   $(".ip").html(IPData[0]); }); 
   }); 
   </script>
    </head>
   
    <body> 
    <div>国家：<span class="country"></span></div> 
    <div>省份：<span class="province"></span></div>
     <div>城市：<span class="city"></span></div> 
     <div>IP地址：<span class="ip"></span></div> 
     <div>运营商：<span class="isp"></span></div> 
     </body>
    </html>
