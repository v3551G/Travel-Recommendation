<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EntertainmentEdi.aspx.cs" Inherits="RouteRecomment.Admin.SubPages.EntertainmentManage.EntertainmentInfoManage.EntertainmentEdi" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>修改娱乐场所</title>
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
<script src="../../../JS/AdminManage/jqueryen.js" type="text/javascript"></script>
<body>
<form id="Form1" runat="server">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15" height="30"><img src="../../../Images/tab_03.gif" height="30" /></td>
            <td background="../../../Images/tab_05.gif"><img src="../../../Images/311.gif" width="16" height="16" /> <span class="STYLE4"><%=OPPTitle%></span></td>
            <td width="14"><img src="../../../Images/tab_07.gif" width="14" height="30" /></td>
          </tr>
        </table>
    </td>
  </tr>
  <tr>
    <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="9" background="../../../Images/tab_12.gif">&nbsp;</td>
            <td bgcolor="#d3e7fc">
                <div class="divMain">
                    <div class="divBack">
                        <div class="divLeft">娱乐场所名称:</div>
                        <div class="divRight">
                            <asp:TextBox ID="txtEntertainName" runat="server" Width="166px"></asp:TextBox>
                             
                        </div>
                    </div>
                    <div class="divBack">
                        <div class="divLeft">电话:</div>
                        <div class="divRight">
                            <asp:TextBox ID="txtPhoneNum" runat="server" Width="166px"></asp:TextBox>
                        </div>
                    </div>
                    <div class="divBack">
                        <div class="divLeft">娱乐场所经度:</div>
                        <div class="divRight">
                            <asp:TextBox ID="txtEntertainLgt" runat="server" 
                                Width="166px"></asp:TextBox></div>
                    </div>
                                        <div class="divBack">
                        <div class="divLeft">娱乐场所纬度:</div>
                        <div class="divRight">
                            <asp:TextBox ID="txtEntertainLat" runat="server" 
                                Width="166px"></asp:TextBox></div>
                    </div>
                    <div class="divBack">
                        <div class="divLeft">开放时间:</div>
                        <div class="divRight"><asp:TextBox ID="TxtOpenTime" runat="server" Width="166px"></asp:TextBox></div>
                    </div>
                    <div class="divBack">
                        <div class="divLeft">详细地址:</div>
                        <div class="divRight"><asp:TextBox ID="TxtLoc" runat="server" Width="166px"></asp:TextBox></div>
                    </div>
                    <div class="divBack">
                        <div class="divLeft">娱乐场所简介:</div>
                        <div class="divRight">
                            <asp:TextBox ID="TxtIntroduce" runat="server" Height="346px" Width="446px" 
                                TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="divBack">
                        <div class="divLeft">&nbsp;</div>
                        <div class="divRight">
                            <asp:Button ID="btEdit" runat="server" Text=" 更新 " onclick="btEdit_Click" />
                        </div>
                    </div>
                </div>
            </td>
            <td width="9" background="../../../Images/tab_16.gif">&nbsp;</td>
          </tr>
        </table>
    </td>
  </tr>
  <tr>
    <td height="29">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15" height="29"><img src="../../../Images/tab_20.gif" width="15" height="29" /></td>
            <td background="../../../Images/tab_21.gif">&nbsp;</td>
            <td width="14"><img src="../../../Images/tab_22.gif" width="14" height="29" /></td>
          </tr>
        </table>
     </td>
  </tr>
</table>
   
</form>
</body>