<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClickLogList.aspx.cs" Inherits="RouteRecomment.Admin.SubPages.LogManage.ClickLogManage.ClickLogList" %>


<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>日志信息</title>
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

    .style1
    {
        width: 498px;
    }

-->
</style>
</head>

<script src="../../../JS/AdminManage/jqueryen.js" type="text/javascript"></script>
<body>
<form id="Form" runat="server">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15" height="30"><img src="../../../Images/tab_03.gif" width="15" height="30" /></td>
            <td background="../../../Images/tab_05.gif" class="style1"><img src="../../../Images/311.gif" width="16" height="16" /> <span class="STYLE4">日志</span></td>
           <td background="../../../Images/tab_05.gif"> <span class="STYLE4" style="  margin-right:0px;">
           选择日志显示类型
                 
           <asp:DropDownList   ID="DropDownType" runat="server" 
                   Width="100px"  AutoPostBack="True" 
                   onselectedindexchanged="DropDownType_SelectedIndexChanged"  >
    
           </asp:DropDownList> </span>

            


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
                    <td width="6%" height="26" background="../../../Images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">选择</div></td>
                   
                    <td width="20%" height="18" background="../../../Images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">类型</div></td>
                    <td width="20%" height="18" background="../../../Images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">时间</div></td>
                    <td width="24%" height="18" background="../../../Images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">内容</div></td>
                    <td width="20%" height="18" background="../../../Images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">IP</div></td>
            

                    <td width="7%" height="18" background="../../../Images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">删除</div></td>
                  </tr>
                  <%
                      try
                      {




                          if (LogDT.Rows.Count > 0)
                          {
                              for (int i = 0; i < LogDT.Rows.Count; i++)
                              {  
                                  String Type = this.DropDownType.SelectedItem.Text;
                       %>
                  <tr>
                    <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
                      <input id="isDelete" type="checkbox" class="STYLE2" value="<%=LogDT.Rows[i]["ID"].ToString()%>" onclick="return isDelete_onclick()" />
                    </div></td>
                   
                    <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><%=LogDT.Rows[i]["ContentType"].ToString()%></div></td>
                    <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><%=LogDT.Rows[i]["ClickTime"].ToString()%></div></td>                   
                    <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><%=LogDT.Rows[i]["ClickContent"].ToString()%></div></td>
                    <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><%=LogDT.Rows[i]["IP"].ToString()%></div></td> 
                    <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../../../Images/010.gif" width="9" height="9" /></span><span class="STYLE2"> </span><span class="STYLE1">[</span><a href="ClickLogDel.aspx?ID=<%=LogDT.Rows[i]["ID"].ToString()%>|&Type=<%=Type %>">删除</a><span class="STYLE1">]</span></div></td>
                  </tr>
                  <%
                              }
                          }
                      }
                      catch(Exception ex) 
                      {
                            Response.Write("<script language='javascript'>");
                            Response.Write("alert('"+ex.Message+"');");
                            Response.Write("</script>");
                      }
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
                            <img id="checkall"  src="../../../Images/q.gif" width="40" height="19" style="cursor:pointer" />
                            <img id="uncheckall" src="../../../Images/q.gif" width="40" height="19" style="cursor:pointer;" />&nbsp; 
                            <img id="deleteThis" src="../../../Images/s.gif" width="40" height="19" style="cursor:pointer;" />
                     </td>
                    <td width="65%" class="STYLE1">
                        <div align="right">
                            <webdiyer:AspNetPager ID="AspNetPager4" runat="server" Width="100%" 
                                PageSize="20" CurrentPageButtonPosition="End" CurrentPageIndex="1"
                                    FirstPageText="首页" LastPageText="尾页" PrevPageText="Prev" 
                                    NextPageText="Next" UrlPaging="false" 
                                onpagechanging="AspNetPager4_PageChanging" AlwaysShow="True">
                            </webdiyer:AspNetPager>
                        </div>
                    </td>
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
            $("#deleteThis").click(function() {
                var delWitch = "";
                $("input[@id='isDelete']").each(function() {
                    if (this.checked == true) {
                        delWitch += this.value + "|";
                    }
                });
                
                var DDL=document.getElementById("DropDownType");
                var index=DDL.selectedIndex;//这里selectedIndex中Index的I一定为大写
                
                var Text=DDL.options[index].text;
                var Value=DDL.options[index].value;
                document.location.href = "ClickLogDel.aspx?ID=" + delWitch+"&Type="+Text;
            });
        </script>


</form>
</body>
</html>