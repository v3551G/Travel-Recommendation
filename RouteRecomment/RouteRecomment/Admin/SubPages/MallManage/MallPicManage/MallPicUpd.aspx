<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MallPicUpd.aspx.cs" Inherits="RouteRecomment.Admin.SubPages.MallManage.MallPicManage.MallPicUpd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>商场图片添加</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE4 {
	font-size: 12px;
	color: #1F4A65;
	font-weight: bold;
}

a:link {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;

}
a:visited {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;
}
a:hover {
	font-size: 12px;
	color: #FF0000;
	text-decoration: underline;
}
a:active {
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}

-->
</style>
</head>
<link href="../../../CSS/Right.css" rel="stylesheet" type="text/css" />
<body>
<form id="Form1" runat="server">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  </tr>
  <tr>
    <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="9" background="../../../images/tab_12.gif">&nbsp;</td>
            <td bgcolor="#d3e7fc">
                <div class="divMain">
                    <div class="divBack">
                        <div class="divLeft">图片名称:</div>
                        <div class="divRight">
                            <asp:TextBox ID="txtPicName" runat="server" Width="200px"></asp:TextBox>*
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPicName" ErrorMessage="标题必须填写"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="divBack">
                        <div class="divLeft">图片:</div>
                        <div class="divRight">
                            <asp:FileUpload ID="txtImgUrl" runat="server" />宣传它的一些图片
                        </div>
                    </div>


                    <div class="divBack">
                        <div class="divLeft">&nbsp;</div>
                        <div class="divRight">
                            <asp:Button ID="btAdd" runat="server" Text=" 添加 " onclick="btAdd_Click"/>
                        </div>
                    </div>
                </div>
            </td>
            <td width="9" background="../../../images/tab_16.gif">&nbsp;</td>
          </tr>
        </table>
    </td>
  </tr>
  <tr>
    <td height="29">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15" height="29"><img src="../../../images/tab_20.gif" width="15" height="29" /></td>
            <td background="../../../images/tab_21.gif">&nbsp;</td>
            <td width="14"><img src="../../../images/tab_22.gif" width="14" height="29" /></td>
          </tr>
        </table>
     </td>
  </tr>
</table>
</form>
</body>
</html>


