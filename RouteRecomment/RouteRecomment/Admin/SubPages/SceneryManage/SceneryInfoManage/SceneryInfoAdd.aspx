<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SceneryInfoAdd.aspx.cs" Inherits="RouteRecomment.Admin.SubPages.SceneryManage.SceneryInfoManage.SceneryInfoAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>添加景点</title>
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
            <td background="../../../Images/tab_05.gif"><img src="../../../Images/311.gif" width="16" height="16" /> <span class="STYLE4"><%=CityName%></span></td>
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
                        <div class="divLeft">景点名称:</div>
                        <div class="divRight">
                            <asp:TextBox ID="txtSceneryName" runat="server" Width="166px"></asp:TextBox>*
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtSceneryName" ErrorMessage="标题必须填写" Visible=true></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="divBack">
                        <div class="divLeft">门票价格:</div>
                        <div class="divRight">
                            <asp:TextBox ID="txtSceneryPrice" runat="server" Width="166px"></asp:TextBox>
                        </div>
                    </div>
                    <div class="divBack">
                        <div class="divLeft">景点经度:</div>
                        <div class="divRight">
                            <asp:TextBox ID="txtSceneryLgt" runat="server" 
                                Width="166px"></asp:TextBox></div>
                    </div>
                                        <div class="divBack">
                        <div class="divLeft">景点纬度:</div>
                        <div class="divRight">
                            <asp:TextBox ID="txtSceneryLat" runat="server" 
                                Width="166px"></asp:TextBox></div>
                    </div>
                    <div class="divBack">
                        <div class="divLeft">适游期:</div>
                        <div class="divRight"><asp:TextBox ID="TxtScenerySuitTime" runat="server" Width="166px"></asp:TextBox></div>
                    </div>
                               <div class="divBack">
                        <div class="divLeft">景点类型:</div>
                        <div class="divRight">
      
                            <asp:CheckBoxList ID="CBoxType" runat="server" RepeatDirection="Horizontal">
                            </asp:CheckBoxList>
                                    </div>
                    </div>
                    <div class="divBack">
                        <div class="divLeft">开放时间:</div>
                        <div class="divRight"><asp:TextBox ID="TxtOpenTime" runat="server" Width="166px"></asp:TextBox></div>
                    </div>
                    <div class="divBack">
                        <div class="divLeft">详细地址:</div>
                        <div class="divRight"><asp:TextBox ID="TxtSceneryLoc" runat="server" Width="166px"></asp:TextBox></div>
                    </div>
                    <div class="divBack">
                        <div class="divLeft">景点简介:</div>
                        <div class="divRight">
                            <asp:TextBox ID="TxtSceneryIntroduce" runat="server" Height="346px" Width="446px" 
                                TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="divBack">
                        <div class="divLeft">&nbsp;</div>
                        <div class="divRight">
                            <asp:Button ID="btEdit" runat="server" Text=" 添加 " onclick="btEdit_Click" />
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
