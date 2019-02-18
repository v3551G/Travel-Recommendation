<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login2.aspx.cs" Inherits="RouteRecomment.JuneFifPages.Pages.login2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" href="../../FrontPages/Test/CSS/sign.css" rel="Stylesheet"/>
    <script type="text/javascript" src="../../FrontPages/Test/JS/jquery.1.4.2-min.js"></script>
    <title>login 登录</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="sign" id="logina">
        <div id="sign1"></div>
        <div class="sign2">
            <div id="logo_line">
                <img src="../../FrontPages/Test/Images/logo_line.png" width="456" height="57" />
            </div>

            <div class="ID">
                <div class="name">
                    <img src="../../FrontPages/Test/Images/ID.jpg" width="52" height="33" />
                </div>
                <asp:TextBox ID="UserAccount" runat="server" style="position:absolute;top: 102px; left: 700px; width: 241px; height: 27px; margin-top: 0px;" BackColor="White" BorderColor="White" ></asp:TextBox>
                    &nbsp;
             </div>

            <div>
                <div class="password">
                    <img src="../../FrontPages/Test/Images/password.jpg" width="52" height="33" />
                    <asp:TextBox ID="UserPassWord" runat="server" TextMode="Password" style="position:absolute;top: 153px; left: 700px; width: 238px; height: 27px; margin-top: 0px;" BackColor="White" BorderColor="White" ></asp:TextBox>
                </div>
                    &nbsp;</div>

            <div>
                <div class="name">
                   &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../FrontPages/Test/Images/validate.jpg" width="72" height="40" />
                    <asp:TextBox ID="ValidateCode" runat="server" style="position:absolute;top: 204px; left: 700px; width: 243px; height: 27px;" BackColor="White" BorderColor="White" ></asp:TextBox>
                &nbsp;</div>
                &nbsp;<span><img src="ValidateCode.aspx" height="20" width="52" style="position:relative;top:17px; left: 284px;" onclick="this.src=this.src +'?Math.random()';" />
                </span>
            </div>

            <div id="but">
                <asp:Button ID="Button1" runat="server" Text="登录" ForeColor="#CC0000" Width="140px" OnClick="Button1_Click" />
               <!-- <input type="button" value="test" onclick="showchar()">-->
            </div>
            
        </div>
    <div id="sign3"></div>
    </div>
    </form>
</body>
</html>
