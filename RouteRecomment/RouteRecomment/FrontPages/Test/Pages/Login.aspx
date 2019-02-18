<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RouteRecomment.FrontPages.Test.Pages.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" href="../CSS/sign.css" rel="stylesheet"/>
<script type="text/javascript" src="../JS/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="../JS/Validform.js"></script>
<title>login</title>
</head>
<script>
function change(){
	var winH=window.innerHeight;
	var divH=document.getElementById("logina").offsetHeight;
	var FH=(winH-divH)/2;
	if(divH < winH){
		document.getElementById("logina").style.paddingTop=FH+'px';
		}
	else
	{
		document.getElementById("logina").style.paddingTop=50+'px';
		document.getElementById("logina").style.paddingBottom=50+'px';
	}
}
window.onload=change;
window.onresize=change;
</script>

<body>
<form id="Form1" runat="server">
<div class="sign" id="logina">
  <div id="sign1"></div>
  <div class="sign2">
  	<div id="logo_line"><img src="../images/image/logo_line.png" width="456" height="57" /></div>
    
    <div class="ID">
   	  <div class="name"><img src="../images/image/ID.jpg" width="52" height="33" /></div>
      <input type="text" class="input1" id="txtAccount" runat="server" datatype="mz"  nullmsg="请输入账号！" errormsg="账号至少3个字符,最多10个字符！" />
    </div>
	
    <div class="password">
    <div class="name"><img src="../images/image/password.jpg" width="52" height="33" /></div>
        <input type="password" class="input1" id="txtPass" runat="server" datatype="*6-16" nullmsg="请输入密码！" errormsg="密码范围在6~16位之间,不能使用空格！"/>
    </div>
    <div id="but">
    
    &nbsp;<asp:Button ID="Button1"  runat="server"  Text="登录" 
            ForeColor="#CC0000" Width="140px" onclick="Button1_Click" />
    </div>
    
  </div>
  <div id="sign3"></div>
  </div>
</body>
</form>
</html>
