<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResFoodPicList.aspx.cs" Inherits="RouteRecomment.Admin.SubPages.RestaurantManage.RestaurantFoodPicManage.ResFoodPicList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>餐馆图片信息</title>
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
        width: 276px;
    }

    .style2
    {
        width: 376px;
    }

-->
</style>
</head>
<script src="../../../JS/AdminManage/jqueryen.js" language="javascript" type="text/javascript" charset="gb2312"></script>
<link href="../../../CSS/Right.css" rel="stylesheet" type="text/css" />
<body>
<form id="Form" runat="server">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15" height="30"><img src="../../../Images/tab_03.gif" width="15" height="30" /></td>
            <td background="../../../Images/tab_05.gif" class="style1"><img src="../../../Images/311.gif" width="16" height="16" /> 
                <span class="STYLE4">餐馆图片</span></td>
           <td background="../../../Images/tab_05.gif" class="style2" style=" width:auto;">
            <span class="STYLE4" style="  margin-right:0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           选择市

           <asp:DropDownList   ID="DrpDownCity" runat="server"  Width="90px" 
                   AutoPostBack="True" onselectedindexchanged="DrpDownCity_SelectedIndexChanged" >
    
           </asp:DropDownList> 
           </span>
           
           </td>
           <td background="../../../Images/tab_05.gif"  style=" width:auto;">
            <span class="STYLE4" style="  margin-right:0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 选择餐馆

           <asp:DropDownList   ID="DropDownRes" runat="server"  Width="90px" AutoPostBack="True" 
                              onselectedindexchanged="DropDownRes_SelectedIndexChanged" >
    
           </asp:DropDownList> 
           </span>
           
           </td>
                      <td background="../../../Images/tab_05.gif" style=" width:auto;">
            <span class="STYLE4" style="  margin-right:0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 选择菜

           <asp:DropDownList   ID="DrpDownFood" runat="server"  Width="100px" AutoPostBack="True" 
                              onselectedindexchanged="DrpDownFood_SelectedIndexChanged" >
    
           </asp:DropDownList> 
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
                    <td width="6%" height="26" background="../../../Images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">选择</div></td>
                   
                    <td width="24%" height="18" background="../../../Images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">
                        图片名称</div></td>
            
                    <td width="7%" height="18" background="../../../Images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">编辑</div></td>
                    <td width="7%" height="18" background="../../../Images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">删除</div></td>
                  </tr>
                  <%
                      try
                      {   
                         

                          BLL.PicBLL.PicInfoBLL _PicInfoBLL = new BLL.PicBLL.PicInfoBLL();
                          System.Data.DataTable DT = _PicInfoBLL.GetFoodPicByFID(FoodID);
                     
                          if (DT.Rows.Count>0)
                          {
                              for (int i = 0; i < DT.Rows.Count; i++)
                              {
                                  string PicPath = DT.Rows[i]["PicPath"].ToString().Replace(@"\", "/");
                                  PicPath = PicPath.Substring(PicPath.IndexOf('U'));
                                  PicPath = "../../../" + PicPath;
                       %>
                  <tr>
                    <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
                      <input id="isDelete" type="checkbox" class="STYLE2" value="<%=DT.Rows[i]["PicID"].ToString()%>" onclick="return isDelete_onclick()" />
                    </div></td>
                   
                    <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><%=DT.Rows[i]["PicName"].ToString()%></div></td>
                   
                    <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"> &nbsp;</span><a href="<%=PicPath %>" target=_blank>查看图片</a><span class="STYLE1"></span></div></td>
                    <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../../../Images/010.gif" width="9" height="9" /></span><span class="STYLE2"> </span><span class="STYLE1">[</span><a href="ResFoodPicDel.aspx?CityID=<%=CityID %>&RestaurantID=<%=RestaurantID %>&FoodID=<%=FoodID%>&PicID=<%=DT.Rows[i]["PicID"].ToString()%>|">删除</a><span class="STYLE1">]</span></div></td>
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
                            <img id="checkall"  src="../../../Images/q.gif" width="40" height="19" style="cursor:pointer" />
                            <img id="uncheckall" src="../../../Images/q.gif" width="40" height="19" style="cursor:pointer;" />
                            <img id="addNew" src="../../../Images/x.gif" width="40" height="19"  style="cursor:pointer;"/> 
                            <img id="deleteThis" src="../../../Images/s.gif" width="40" height="19" style="cursor:pointer;" />
                     </td>
                    <td width="65%" class="STYLE1">

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
                document.location.href = "ResFoodPicDel.aspx?PicID=" + delWitch+"&RestaurantID=<%= RestaurantID%>&CityID=<%=CityID%>&FoodID=<%=FoodID%>";
            });
            $("#addNew").click(function() 
            {
                var DDL=document.getElementById("DropDownRes");
                var index=DDL.selectedIndex;//这里selectedIndex中Index的I一定为大写
                
                var Text=DDL.options[index].text;
                var Value=DDL.options[index].value;

               document.location.href = "ResFoodPicUpd.aspx?FoodID=<%=FoodID%>&RestaurantID=<%=RestaurantID%>&CityID=<%=CityID%>";
            });
        </script>


</form>
</body>
</html>
