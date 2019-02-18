<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePSW.aspx.cs" Inherits="RouteRecomment.JuneFifPages.Pages.UpdataPSW" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" href="../../FrontPages/Test/CSS/sign.css" rel="Stylesheet"  />
    <script type="text/javascript" src="../../FrontPages/Test/JS/jquery.1.4.2-min.js"></script>
    <script type="text/javascript" src="../../FrontPages/Test/JS/checkJS.js"></script>
    <title>修改密码</title>
</head>
    <script>
        function change()
        {
            var winH = window.innerHeight;
            var divH = document.getElementById("logina").offsetHeight;
            var FH = (winH - divH) / 2;
            if(divH < winH )
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
                <img src="../../FrontPages/Test/Images/修改密码.jpg" width="104" height="40" />
            </div>

            <div class="ID">
                <div class="name">
                    <img src="../../FrontPages/Test/Images/ID.jpg" width="52" height="33" />
                </div>
                <asp:TextBox ID="txtAccount" runat="server" Enabled="false" style="position:absolute;top:135px; left:700px; width:241px;height:27px;margin-top:0px;" BackColor="White" BorderColor="White"></asp:TextBox>
            </div>
            
            <div class="surepassword">
                <div class="name">
                    <img src="../../FrontPages/Test/Images/原密码.jpg" width="104" height="33"  />
                </div>
                <asp:TextBox ID="txtPassWord" runat="server" TextMode="Password" style="position:absolute;top:177px; left:700px; width:241px;height:27px;margin-top:0px;" BackColor="White" BorderColor="White" ></asp:TextBox>
                
            </div>
            
            <asp:Label ID="Label1" runat="server" Text="请输入原密码" ForeColor="Red" style="position:absolute;top:188px; left:955px; width:100px;height:15px; margin-top:0px;"></asp:Label>
           
            <div class="surepassword">
                <div class="name">
                    <img src="../../FrontPages/Test/Images/新密码.jpg" width="104" height="33" />
                </div>
                <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" style="position:absolute;top:218px; left:700px; width:241px;height:27px;margin-top:0px;" BackColor="White" BorderColor="White"></asp:TextBox>
            </div>
            
            <div class="surepassword">
                <div class="name ">
                    <img src="../../FrontPages/Test/Images/surepassword.jpg" width="104" height="33" />
                </div>
                <asp:TextBox ID="txtSurePassWord" runat="server" TextMode="Password" style="position:absolute;top:276px; left:700px; width:241px; height:27px;margin-top:0px;" BackColor="White" BorderColor="White" ></asp:TextBox>
            
            <asp:Label ID="Label2" runat="server" Text="请输入新密码" ForeColor="Red" style="position:absolute;top:230px; left:955px; width:100px; height:15px; margin-top:0px;"></asp:Label>

            </div>

            <div class="notic Validform_checktip">
                <asp:CompareValidator ID="CompareValidator" runat="server" ErrorMessage="两次输入的密码不一致！" ControlToCompare="txtNewPass" ControlToValidate="txtSurePassWord"></asp:CompareValidator>
            </div>

            <br />
            <br />
           
            <div align="center">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确认修改" Width="100px" Height="30" />
            </div>
            <asp:Label ID="Label3" runat="server" Text="Label" Visible="false" style="position:absolute;top:369px; left:800px;" BackColor="#CCFFFF" BorderColor="#CCFFFF" ForeColor="#006666"></asp:Label>
        </div>

        <div id="sign3">

        </div>
    
    </div>
    </form>
</body>
</html>
