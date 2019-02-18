<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HotelSubRmTypeList.aspx.cs" Inherits="RouteRecomment.Admin.SubPages.HotelManage.HotelSubRmTypeList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>资源信息</title>
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
            <td background="../../../Images/tab_05.gif" class="style1"><img src="../../../Images/311.gif" width="16" height="16" /> <span class="STYLE4"><%=OptTitle%></span></td>
           <td background="../../../Images/tab_05.gif"> 
               <a href="HotelRmTypeList.aspx?HotelID=<%=HotelID%>&CityID=<%=CityID %>&HotelName=<%=HotelName%>&PageStart=<%=PageStart%>" style=" margin-left:300px;">回到当前酒店房型</a><span class="STYLE4" style="  margin-right:0px;">
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
                    <td width="5%" height="26" background="../../../Images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">选择</div></td>
                   
                    <td width="8%" height="26" align="center" background="../../../Images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1" style=" width:150px;">房型名</div></td>
                    <td width="8%" height="26" align="center" background="../../../Images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1" style=" width:150px;">床型</div></td>
                    <td width="8%" height="26" align="center" background="../../../Images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1" style=" width:150px;">早餐</div></td>
                    <td width="8%" height="26" align="center" background="../../../Images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1" style=" width:150px;">带宽</div></td>
                    <td width="8%" height="26" align="center" background="../../../Images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1" style=" width:150px;">日均价</div></td>

                    <td width="7%" align="center" height="26" background="../../../Images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">删除</div></td>
                  </tr>
                  <%
                      try
                      {
                          BLL.HotelBLL.HtlTypeDetailBLL _HtlTypeDetailBLL = new BLL.HotelBLL.HtlTypeDetailBLL();
                          System.Data.DataTable DT = _HtlTypeDetailBLL.GetHotelTypeDetail(HtlTypeID);
                                                   
                          if (DT.Rows.Count>0)
                          {
                              for (int i = 0; i < DT.Rows.Count; i++)
                              {   
                                 /* String Price = "";
                                  if(int.Parse(DT.Rows[i]["Price"].ToString())!=0)
                                      Price = DT.Rows[i]["Price"].ToString();*/

                       %>
                  <tr>
                    <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
                      <input id="isDelete" type="checkbox" class="STYLE2" value="<%=DT.Rows[i]["ID"].ToString()%>" onclick="return isDelete_onclick()" />
                    </div></td>
                   
                    <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><%=DT.Rows[i]["HouseType"].ToString()%></div></td>
                    <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><%=DT.Rows[i]["BedType"].ToString()%></div></td>
                    <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><%=DT.Rows[i]["HaveBreakfast"].ToString()%></div></td>
                    <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><%=DT.Rows[i]["Broadband"].ToString()%></div></td>
                    <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><%=DT.Rows[i]["Price"].ToString()%></div></td>
                    <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../../../Images/010.gif" width="9" height="9" /></span><span class="STYLE2"> </span><span class="STYLE1">[</span><a href="HotelSubRmTypeDel.aspx?HotelID=<%=HotelID%>&HotelName=<%=HotelName%>&CityID=<%=CityID%>&PageStart=<%=PageStart%>&HtlTypeID=<%=HtlTypeID%>&HtlTypeName=<%=HtlTypeName%>&TypeDetailID=<%=DT.Rows[i]["ID"].ToString()%>|">删除</a><span class="STYLE1">]</span></div></td>
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
            $("#deleteThis").click(function() {
                var delWitch = "";
                $("input[@id='isDelete']").each(function() {
                    if (this.checked == true)
                     {
                        delWitch += this.value + "|";
                    }
                });
                document.location.href = "HotelSubRmTypeDel.aspx?TypeDetailID=" + delWitch;
            });
            $("#addNew").click(function()
            { 
                
            document.location.href = "HotelSubRmTypeAdd.aspx?HotelID=<%=HotelID%>&HotelName=<%=HotelName%>&CityID=<%=CityID%>&PageStart=<%=PageStart%>&HtlTypeID=<%=HtlTypeID%>&HtlTypeName=<%=HtlTypeName%>";
            });
        </script>


</form>
</body>
</html>
