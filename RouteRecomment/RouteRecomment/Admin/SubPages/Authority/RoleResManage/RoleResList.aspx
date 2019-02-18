<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoleResList.aspx.cs" Inherits="RouteRecomment.Admin.SubPages.Authority.RoleResManage.RoleResList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>角色资源分配</title>
<style type="text/css">
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

    .style1
    {
        width: 498px;
    }
    .style2
    {
        font-size: 12px;
        height: 20px;
    }
</style>
</head>
<script src="../../../JS/AdminManage/jqueryen.js" language="javascript" type="text/javascript" charset="gb2312"></script>
<body>
<form id="Form" runat="server">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15" height="30"><img src="../../../Images/tab_03.gif" width="15" height="30" /></td>
            <td background="../../../Images/tab_05.gif" class="style1"><img src="../../../Images/311.gif" width="16" height="16" /> <span class="STYLE4">角色资源分配</span></td>
           <td background="../../../Images/tab_05.gif"> <span class="STYLE4" style="  margin-right:0px;">
               </span>

            


           </td>
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
                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CECECE">
                  <tr>
                    
                   
                    <td width="24%" background="../../../Images/tab_14.gif" class="style2"><div align="center" class="STYLE2 STYLE1">角色名</div></td>
                    <td width="24%" background="../../../Images/tab_14.gif" class="style2"><div align="center" class="STYLE2 STYLE1">角色资源</div></td>
            
                    <td width="7%" background="../../../Images/tab_14.gif" class="style2"><div align="center" class="STYLE2">编辑</div></td>
                    
                  </tr>
                  <%
                      try
                      {

                          BLL.AuthorityBLL.RoleResourceBLL _RoleResourceBLL = new BLL.AuthorityBLL.RoleResourceBLL();
                          BLL.AuthorityBLL.RoleBLL _RoleBLL = new BLL.AuthorityBLL.RoleBLL();

                          System.Data.DataTable DT = _RoleBLL.GetAllRoleInfo();
                                                   
                          if (DT.Rows.Count>0)
                          {
                              for (int i = 0; i < DT.Rows.Count; i++)
                              {
                                  String RoleResName = _RoleResourceBLL.GetResNameByRoleID(int.Parse(DT.Rows[i]["RoleID"].ToString()));
                       %>
                  <tr>

                   
                    <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><%=DT.Rows[i]["RoleName"].ToString()%></div></td>
                    <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><%=RoleResName%></div></td>
                    <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../../../Images/037.gif" width="9" height="9" /></span><span class="STYLE1"> [</span><a href="RoleResEdit.aspx?RoleID=<%=DT.Rows[i]["RoleID"].ToString()%>&RoleResName=<%= RoleResName %>">编辑</a><span class="STYLE1">]</span></div></td>
                  </tr>
                  <%
                              }
                          }
                      }
                      catch { }
                           %>
                </table>
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
            <td background="../../../Images/tab_21.gif">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="35%">
                           
                     </td>
                    <td width="65%" class="STYLE1">
                        &nbsp;</td>
                  </tr>
                </table>
            </td>
            <td width="14"><img src="../../../Images/tab_22.gif" width="14" height="29" /></td>
          </tr>
        </table>
     </td>
  </tr>
</table>

        <script>
            $("#checkall").click(function() {
                $("input[@id='isDelete']").each(function() {
                    $(this).attr("checked", "checked");
                });
            });
            $("#uncheckall").click(function() {
                $("input[@id='isDelete']").each(function() {
                    $(this).removeAttr("checked");
                });
            });
            $("#addNew").click(function()
            {
                document.location.href = "AdminAdd.aspx";
            });
        </script>


</form>
</body>
</html>

