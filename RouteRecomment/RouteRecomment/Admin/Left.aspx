<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Left.aspx.cs" Inherits="RouteRecomment.Admin.Left" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="css/left.css" type="text/css" rel="stylesheet">
<SCRIPT language=javascript>
	function expand(el)
	{
		childObj = document.getElementById("child" + el);

		if (childObj.style.display == 'none')
		{
			childObj.style.display = 'block';
		}
		else
		{
			childObj.style.display = 'none';
		}
		return;
	}
</SCRIPT>
</HEAD>
<BODY>
<TABLE height="100%" cellSpacing=0 cellPadding=0 width=170 
background=images/menu_bg.jpg border=0>
  <TR>
    <TD vAlign=top align=middle>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TR>
          <TD height=10></TD>
          </TR>
      </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><A 
            class=menuParent onclick=expand(1) 
            href="javascript:void(0);">景点管理</A></TD></TR>
        <TR height=4>
          <TD></TD></TR>
        </TABLE>
      <TABLE id=child1 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/SceneryManage/SceneryInfoManage/SceneryInfoList.aspx" 
            target=playFrame>景点信息管理</A></TD></TR>
          <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/Anl.aspx" 
            target=main>景点评论管理</A></TD></TR>
            
             <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/SceneryManage/SceneryPicManage/SceneryPicList.aspx" 
            target=playFrame>景点图片管理</A></TD></TR>
            
             <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/SceneryManage/STypeManage/STypeList.aspx" 
            target=playFrame>类型管理</A></TD></TR>
      </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><A 
            class=menuParent onclick=expand(2) 
            href="javascript:void(0);">攻略管理</A></TD></TR>
        <TR height=4>
          <TD></TD></TR>
       </TABLE>
      <TABLE id=child2 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/userList.aspx" 
            target=playFrame>攻略管理</A></TD>
        </TR>

       </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><A 
            class=menuParent onclick=expand(3) 
            href="javascript:void(0);">酒店管理</A></TD></TR>
        <TR height=4>
          <TD></TD></TR>
      </TABLE>
      <TABLE id=child3 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
        
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/HotelManage/HotelInfoManage/HotelInfoList.aspx" 
            target=playFrame>酒店信息管理</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/userList.aspx" 
            target=playFrame>酒店评论管理</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/HotelManage/HotelPicManage/HotelPicList.aspx" 
            target=playFrame>酒店图片管理</A></TD>
        </TR>

      </TABLE>
      
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><A 
            class=menuParent onclick=expand(4) 
            href="javascript:void(0);">娱乐场所管理</A></TD></TR>
        <TR height=4>
          <TD></TD></TR>
      </TABLE>
      <TABLE id=child4 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
        
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/EntertainmentManage/EntertainmentInfoManage/EntertainmentList.aspx" 
            target=playFrame>娱乐场所信息管理</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/userList.aspx" 
            target=playFrame>娱乐场所评论管理</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/EntertainmentManage/EntertainmentPicManage/EntertainmentPicList.aspx" 
            target=playFrame>娱乐场所图片管理</A></TD>
        </TR>

      </TABLE>
      
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><A 
            class=menuParent onclick=expand(5) 
            href="javascript:void(0);">购物场所管理</A></TD></TR>
        <TR height=4>
          <TD></TD></TR>
      </TABLE>
      <TABLE id=child5 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
        
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/MallManage/MallInfoManage/MallInfoList.aspx" 
            target=playFrame>购物场所信息管理</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/userList.aspx" 
            target=playFrame>购物场所评论管理</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/MallManage/MallPicManage/MallPicList.aspx" 
            target=playFrame>购物场所图片管理</A></TD>
        </TR>

      </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><A 
            class=menuParent onclick=expand(6) 
            href="javascript:void(0);">餐馆管理</A></TD></TR>
        <TR height=4>
          <TD></TD></TR>
      </TABLE>
      <TABLE id=child6 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
        
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/RestaurantManage/RestaurantInfoManage/ResInfoList.aspx" 
            target=playFrame>餐馆信息管理</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/RestaurantManage/RestaurantInfoManage/ResInfoList.aspx" 
            target=playFrame>餐馆评论管理</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/RestaurantManage/RestaurantPicManage/RestaurantPicList.aspx" 
            target=playFrame>餐馆图片管理</A></TD>
        </TR>
          <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/RestaurantManage/RestaurantFoodPicManage/ResFoodPicList.aspx" 
            target=playFrame>菜图片管理</A></TD>
        </TR>

      </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><A 
            class=menuParent onclick=expand(7) 
            href="javascript:void(0);">市管理</A></TD></TR>
        <TR height=4>
          <TD></TD></TR>
      </TABLE>
      <TABLE id=child7 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
        
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/City/CityManage/CityInfoList.aspx" 
            target=playFrame>市信息管理</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/City/CityPicManage/CityPicList.aspx" 
            target=playFrame>市图片管理</A></TD>
        </TR>
      </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><A 
            class=menuParent onclick=expand(8) 
            href="javascript:void(0);">热门挖掘管理</A></TD></TR>
        <TR height=4>
          <TD></TD></TR>
      </TABLE>
      <TABLE id=child8 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
        
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/userList.aspx" 
            target=main>热门市管理</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/userList.aspx" 
            target=main>热门景点管理</A></TD>
        </TR>
                <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/userList.aspx" 
            target=main>热门路线管理</A></TD>
        </TR>
      </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><A 
            class=menuParent onclick=expand(9) 
            href="javascript:void(0);">日志管理</A></TD></TR>
        <TR height=4>
          <TD></TD></TR>
      </TABLE>
      <TABLE id=child9 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
        
                <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/userList.aspx" 
            target=main>查询日志管理</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/userList.aspx" 
            target=main>点击日志管理</A></TD>
        </TR>
                <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/userList.aspx" 
            target=main>拖选日志管理</A></TD>
        </TR>
                        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/userList.aspx" 
            target=main>浏览视角日志管理</A></TD>
        </TR>
      </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><A 
            class=menuParent onclick=expand(10) 
            href="javascript:void(0);">权限管理</A></TD></TR>
        <TR height=4>
          <TD></TD></TR>
      </TABLE>
      <TABLE id=child10 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
        
        
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/Authority/AdminManage/AdminList.aspx" 
            target=playFrame>管理员管理</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/Authority/RoleManage/RoleList.aspx"
                
            target=playFrame>角色管理</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/Authority/ResourceManage/ResourceList.aspx" 
            target=playFrame>资源管理</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/Authority/RoleResManage/RoleResList.aspx" 
            target=playFrame>角色资源管理</A></TD>
        </TR>
       </TABLE>
      </TABLE>
      
    </BODY>
    </HTML>
