<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Information.aspx.cs" Inherits="RouteRecomment.JuneFifPages.Pages.Information" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" href="../../FrontPages/Test/CSS/sign.css" rel="Stylesheet"  />
    <script type="text/javascript" src="../../FrontPages/Test/JS/jquery.1.4.2-min.js"></script>
    <script type="text/javascript" src="../../FrontPages/Test/JS/checkJS.js"></script>
    <title> 个人信息</title>
</head>
    <script>
        function change()
        {
            var winH = window.innerHeight;
            var divH = document.getElementById("logina").offsetHeight;
            var FH = (winH - divH) / 2;
            if (divH < winH )
            {
                document.getElementById("logina").style.paddingTop = FH + 'px';
            }
            else 
            {
                document.getElementById("logina").style.paddingTop = 50 + 'px';
                document.getElementById("logina").style.paddingBottom = 50 + 'px';
            }
        }
        window.onload = change;
        window.onresize = change;
    </script>


<body>
    <form id="form1" runat="server">
    <div class="sign " id="logina">
        <div id="sign1"></div>    
        <div class="sign2">
            <div id="logo_lone" align="center">
                <img src="../../FrontPages/Test/Images/个人信息.jpg" width="104" height="40" />
            </div>
            <div class="ID">
                <div class="name">
                    <img src="../../FrontPages/Test/Images/ID.jpg" width="52" height="33" />
                </div>
                <asp:TextBox ID="txtAccount" runat="server" Enabled="false" style="position:absolute;top:138px; left:700px; width:241px;height:27px;margin-top:0px; " BackColor="White" BorderColor="White"></asp:TextBox>
            </div>

            <!--姓名 -->
            <div class="ID">
                <div class="name">
                    <img src="../../FrontPages/Test/Images/姓名.png" width="52" height="33" />
                </div>
                <asp:TextBox ID="txtName" name="txtName" runat="server"  style="position:absolute;top:193px; left:700px; width:241px;height:27px;margin-top:0px; " BackColor="White" BorderColor="White" ></asp:TextBox>
                
            </div>

             <!--性别 -->
            <div class="ID">
                <div class="name">
                    <img src="../../FrontPages/Test/Images/性别.png" width="52" height="33"/>
                </div>
                <asp:TextBox ID="txtSex" name="txtSex" runat="server" style="position:absolute;top:243px; left:700px; width:241px;height:27px;margin-top:0px; " BackColor="White" BorderColor="White"></asp:TextBox>
            </div>

            <!--出生日期 -->
            <div class="surepassword">
                <div class="name">
                    <img src="../../FrontPages/Test/Images/出生日期.png" width="104" height="33" />
                </div>
                <asp:TextBox ID="txtBirth" name="txtBirth" runat="server" style="position:absolute;top:298px; left:700px; width:241px;height:27px;margin-top:0px; " BackColor="White" BorderColor="White"></asp:TextBox>
            </div>

            <!--籍贯 -->
            <div class="ID">
                <div class="name">
                    <img src="../../FrontPages/Test/Images/籍贯.png" width="52" height="33"/>
                </div>
                <asp:TextBox ID="txtJiguan" name="txtJiguan" runat="server" style="position:absolute;top:350px; left:700px; width:241px;height:27px;margin-top:0px; " BackColor="White" BorderColor="White"></asp:TextBox>
            </div>

            <!--联系方式 -->
            <div class="surepassword">
                <div class="name">
                    <img src="../../FrontPages/Test/Images/联系方式.png" width="104" height="33" />
                </div>
                <asp:TextBox ID="txtTele" name="txtTele" runat="server" style="position:absolute;top:404px; left:700px; width:241px;height:27px;margin-top:0px; " BackColor="White" BorderColor="White"></asp:TextBox>
            </div>

            
            <br />
            <br />
            <br />
            <br />

            <div align="center">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="修改个人信息" Width="100px" Height="30" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="修改密码" Width="100px" Height="30" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="退出登录" Width="100px" Height="30" />
            </div>
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="false" style="position:absolute;top:550px; left:720px;" BackColor="#CCFFFF" BorderColor="#CCFFFF" ForeColor="#006666" ></asp:Label>
            <%--<div id="but">
                <asp:Button ID="Button1"  runat="server" OnClick="Button1_Click" Text="修改个人信息" Width="100px" Height="30" /><br />
            </div>
            <div id="but">
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="修改密码" Width="100px" Height="30" />

            </div>--%>

        </div>
        <div id="sign3">

        </div>
    </div>
    </form>
</body>
</html>
