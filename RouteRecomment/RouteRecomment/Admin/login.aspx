<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="RouteRecomment.Admin.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="CSS/login.css" rel="stylesheet" type="text/css" />
<title>后台登陆</title>
<script>
window.onload=function()
{
	var oDiv=document.getElementById('user');
	
	var oBtn=document.getElementById('button');
	oBtn.onclick=function()
	{
		if ( !oDiv.value )
		{
				document.getElementById("userDiv").style.display="block";
				return false;
		}
		
	}
	
	
	
}
</script>
</head>

<body>
<form runat="server">
<div id="all">
  <div id="top">
     <img src="images/login_1.jpg" width="468" height="23" />
     <img src="images/login_dd.jpg" width="468" height="147" />
  </div>
  
  <div id="middle">
      <div class="first"><img src="images/login_3.jpg" width="16" height="122" /></div>
      <div class="sec">
              <table>
                <tr height="23" ><td align="center">用户名：                    
                <asp:TextBox ID="txtAccount" runat="server"  Text="www1991" style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" 
                   maxLength=30 size=24></asp:TextBox></td>
                  </tr>
                <tr  height="23"><td align="center">密&nbsp;码：
                 <asp:TextBox ID="txtPass" runat="server"  Text="www1991" maxLength=30 size=24 TextMode="Password" style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" ></asp:TextBox>
                </tr>
                <tr height="23"><td align="center"  id="check">验证码：
                 <asp:TextBox ID="txtValidate" runat="server"  maxLength=30 size=24  style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" ></asp:TextBox>
                <span>
                   <img src="ValidateCode.aspx"  height="20" width="56" style="position:relative;top:5px;" onclick="this.src=this.src+'?Math.random()';"/>
                  
                   </span></td></tr>
                <tr height="18">
                <td  align="center">
                <asp:Label ID="errorlbl" runat="server" Text=""></asp:Label>
                </td>
                </tr>
                
                <tr  height="20">
                <td>   <asp:ImageButton ID="ibtnLogin" runat="server" maxLength=30 size=24 
                        ImageUrl="Images/bt_login.gif"  height=18 width=70 
                        onclick="ibtnLogin_Click"  />
                </td></tr>
               </table>
      </div>
      <div class="thr"><img src="images/login_4.jpg" width="16" height="122" /></div>
     
  </div>
  <div id="foot"><img src="images/login_5.jpg" width="468" height="16" /></div>
  
 
</div>
</form>
</body>
</html>

