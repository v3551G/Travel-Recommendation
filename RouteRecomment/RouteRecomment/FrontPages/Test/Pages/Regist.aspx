<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Regist.aspx.cs" Inherits="RouteRecomment.FrontPages.Test.Pages.Regist" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" href="../CSS/sign.css" rel="stylesheet"/>
<script type="text/javascript" src="../JS/jquery-1.4.2.min.js"></script>
<!--<script type="text/javascript" src="../JS/Validform.js"></script>-->
<script type="text/javascript" src="../JS/checkJS.js"></script>
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

<body >
    <form id="form1" runat="server">
<div class="sign" id="logina">
  <div id="sign1"></div>
  <div class="sign2">
  	<div id="logo_line"><img src="../images/image/logo_line.png" width="456" height="57" /></div>
    
    <div class="ID">
   	  <div class="name"><img src="../images/image/ID.jpg" width="52" height="33" /></div>
      <input  id="Account" name="txtAccount" type="text" class="input1" runat="server"  onblur="CheckAccount()"  />
      <!--<span id="CheckUserAccount" style="margin-right:0px"></span>-->
    </div>
 <div class="notic Validform_checktip" id="CheckUserAccount">3-10个字符</div>

    <div class="email">
    	<div class="name"><img src="../images/image/email.jpg" width="52" height="33" /></div>
        <input  id="Email" name="txtEmail" runat="server" class="input1" onblur="CheckEmail()" datatype="e" ignore="ignore" nullmsg="请输入您常用的邮箱！" errormsg="请输入您常用的邮箱！"/>
        <!--<span id="EmailCheck" style="margin-right:0px"></span>-->
    </div>
    <div class="notic Validform_checktip" id="EmailCheck">常用邮箱，以便找回密码</div>
        <div class="nickname">
    	<div class="name"><img src="../images/image/nickname.jpg" width="52" height="33" /></div>
        <input type="text" class="input1" runat="server" id="NickName" name="txtNickName" datatype="mz" onblur="CheckNickName()"  nullmsg="请输入昵称！" errormsg="账号至少3个字符,最多10个字符！" />
        <!--<span id="NickNameCheck" style="margin-right:0px"></span>-->
    </div>
    <div class="notic Validform_checktip" id="NickNameCheck">3-10位中英文、数字、下划线组合</div>

	
    <div class="password">
    <div class="name"><img src="../images/image/password.jpg" width="52" height="33" /></div>
        <input  type="password" class="input1"  id="PassWord" runat="server" name="PassWord"  onblur="CheckPassword()" datatype="*6-16" nullmsg="请设置密码！" errormsg="密码范围在6~16位之间,不能使用空格！"/>
    </div>
    <div class="notic Validform_checktip" id="CheckPassWord">6-16个字符组成</div>
    <div class="surepassword">
    <div class="name"><img src="../images/image/surepassword.jpg" width="104" height="33" /></div>
        <input  type="password" class="input2" id="PassWord2" runat="server" datatype="*" recheck="userpassword" nullmsg="请再输入一次密码！" errormsg="您两次输入的账号密码不一致！"  />
    </div>
    <div class="notic Validform_checktip">
    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次密码不一致" 
            ControlToCompare="PassWord" ControlToValidate="PassWord2"></asp:CompareValidator>
    </div>
    
    <div class="choose">
    	<input name="choose" type="checkbox"  class="ch"  />
		<span>我已经阅读并同意XXXX的《隐私声明》《用户协议》</span>
    </div>
    <div id="but">
    <!--<input name="button1" runat="server" type="button" class="button1" />-->
    <asp:Button ID="Button1" class="button1" runat="server" onclick="Button1_Click" 
            Text="注册" Width="150px" ></asp:Button>
    </div>
    
  </div>
  <div id="sign3"></div>
  </div>
          	<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </form>

</body>
</html>

