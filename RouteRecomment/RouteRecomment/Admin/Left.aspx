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
            href="javascript:void(0);">�������</A></TD></TR>
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
            target=playFrame>������Ϣ����</A></TD></TR>
          <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/Anl.aspx" 
            target=main>�������۹���</A></TD></TR>
            
             <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/SceneryManage/SceneryPicManage/SceneryPicList.aspx" 
            target=playFrame>����ͼƬ����</A></TD></TR>
            
             <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/SceneryManage/STypeManage/STypeList.aspx" 
            target=playFrame>���͹���</A></TD></TR>
      </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><A 
            class=menuParent onclick=expand(2) 
            href="javascript:void(0);">���Թ���</A></TD></TR>
        <TR height=4>
          <TD></TD></TR>
       </TABLE>
      <TABLE id=child2 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/userList.aspx" 
            target=playFrame>���Թ���</A></TD>
        </TR>

       </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><A 
            class=menuParent onclick=expand(3) 
            href="javascript:void(0);">�Ƶ����</A></TD></TR>
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
            target=playFrame>�Ƶ���Ϣ����</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/userList.aspx" 
            target=playFrame>�Ƶ����۹���</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/HotelManage/HotelPicManage/HotelPicList.aspx" 
            target=playFrame>�Ƶ�ͼƬ����</A></TD>
        </TR>

      </TABLE>
      
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><A 
            class=menuParent onclick=expand(4) 
            href="javascript:void(0);">���ֳ�������</A></TD></TR>
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
            target=playFrame>���ֳ�����Ϣ����</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/userList.aspx" 
            target=playFrame>���ֳ������۹���</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/EntertainmentManage/EntertainmentPicManage/EntertainmentPicList.aspx" 
            target=playFrame>���ֳ���ͼƬ����</A></TD>
        </TR>

      </TABLE>
      
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><A 
            class=menuParent onclick=expand(5) 
            href="javascript:void(0);">���ﳡ������</A></TD></TR>
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
            target=playFrame>���ﳡ����Ϣ����</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/userList.aspx" 
            target=playFrame>���ﳡ�����۹���</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/MallManage/MallPicManage/MallPicList.aspx" 
            target=playFrame>���ﳡ��ͼƬ����</A></TD>
        </TR>

      </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><A 
            class=menuParent onclick=expand(6) 
            href="javascript:void(0);">�͹ݹ���</A></TD></TR>
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
            target=playFrame>�͹���Ϣ����</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/RestaurantManage/RestaurantInfoManage/ResInfoList.aspx" 
            target=playFrame>�͹����۹���</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/RestaurantManage/RestaurantPicManage/RestaurantPicList.aspx" 
            target=playFrame>�͹�ͼƬ����</A></TD>
        </TR>
          <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/RestaurantManage/RestaurantFoodPicManage/ResFoodPicList.aspx" 
            target=playFrame>��ͼƬ����</A></TD>
        </TR>

      </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><A 
            class=menuParent onclick=expand(7) 
            href="javascript:void(0);">�й���</A></TD></TR>
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
            target=playFrame>����Ϣ����</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/City/CityPicManage/CityPicList.aspx" 
            target=playFrame>��ͼƬ����</A></TD>
        </TR>
      </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><A 
            class=menuParent onclick=expand(8) 
            href="javascript:void(0);">�����ھ����</A></TD></TR>
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
            target=main>�����й���</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/userList.aspx" 
            target=main>���ž������</A></TD>
        </TR>
                <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/userList.aspx" 
            target=main>����·�߹���</A></TD>
        </TR>
      </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><A 
            class=menuParent onclick=expand(9) 
            href="javascript:void(0);">��־����</A></TD></TR>
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
            target=main>��ѯ��־����</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/userList.aspx" 
            target=main>�����־����</A></TD>
        </TR>
                <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/userList.aspx" 
            target=main>��ѡ��־����</A></TD>
        </TR>
                        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="manager/userList.aspx" 
            target=main>����ӽ���־����</A></TD>
        </TR>
      </TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><A 
            class=menuParent onclick=expand(10) 
            href="javascript:void(0);">Ȩ�޹���</A></TD></TR>
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
            target=playFrame>����Ա����</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/Authority/RoleManage/RoleList.aspx"
                
            target=playFrame>��ɫ����</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/Authority/ResourceManage/ResourceList.aspx" 
            target=playFrame>��Դ����</A></TD>
        </TR>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild 
            href="SubPages/Authority/RoleResManage/RoleResList.aspx" 
            target=playFrame>��ɫ��Դ����</A></TD>
        </TR>
       </TABLE>
      </TABLE>
      
    </BODY>
    </HTML>
