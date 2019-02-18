<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HotelInfoEdi.aspx.cs" Inherits="RouteRecomment.Admin.SubPages.HotelManage.HotelInfoEdi" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>添加酒店</title>
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
            <td background="../../../Images/tab_05.gif"><img src="../../../Images/311.gif" width="16" height="16" /> <span class="STYLE4"><%=HotelName%></span></td>
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
                        <div class="divLeft">酒店名称:</div>
                        <div class="divRight">
                            <asp:TextBox ID="txtHotelName" runat="server" Width="166px"></asp:TextBox>
                        </div>
                    </div>
                    <div class="divBack">
                        <div class="divLeft">酒店星级:</div>
                        <div class="divRight">
                            <asp:TextBox ID="txtHotelStar" runat="server" Width="166px"></asp:TextBox>填入数字
                        </div>
                    </div>
                    <div class="divBack">
                        <div class="divLeft">酒店经度:</div>
                        <div class="divRight">
                            <asp:TextBox ID="txtHotelLgt" runat="server" 
                                Width="166px"></asp:TextBox></div>
                    </div>
                        <div class="divBack">
                        <div class="divLeft">酒店纬度:</div>
                        <div class="divRight">
                            <asp:TextBox ID="txtHotelLat" runat="server" 
                                Width="166px"></asp:TextBox></div>
                    </div>

                    <div class="divBack">
                        <div class="divLeft">酒店电话:</div>
                        <div class="divRight"><asp:TextBox ID="TxtHotelNum" runat="server" Width="166px"></asp:TextBox></div>
                    </div>
                    <div class="divBack">
                        <div class="divLeft">详细地址:</div>
                        <div class="divRight"><asp:TextBox ID="TxtHotelLoc" runat="server" Width="437px"></asp:TextBox></div>
                    </div>
                    <div class="divBack">
                        <div class="divLeft">酒店服务:</div>
                        <div class="divRight">
                            <asp:TextBox ID="TxtHtlService" runat="server"  Height="101px" Width="446px" 
                                TextMode="MultiLine"></asp:TextBox></div>
                    </div>
                    <div class="divBack">
                    <div class="divLeft">酒店简介:</div>
                        <div class="divRight">
                            <asp:TextBox ID="TxtHotelIntroduce" runat="server" Height="99px" Width="446px" 
                                TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="divBack">
                    <div class="divLeft">餐馆设施:</div>
                        <div class="divRight">
                            <asp:TextBox ID="TxtResScrvice" runat="server" Height="102px" Width="446px" 
                                TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    
                    <div class="divBack">
                    <div class="divLeft">室内设施:</div>
                        <div class="divRight">
                            <asp:TextBox ID="txtIdrService" runat="server" Height="102px" Width="446px" 
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
