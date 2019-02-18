<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zhuce.aspx.cs" Inherits="RouteRecomment.JuneFifPages.Pages.zhuce" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" href="../../FrontPages/Test/CSS/sign.css" rel="Stylesheet"  />
    <script type="text/javascript" src="../../FrontPages/Test/JS/jquery.1.4.2-min.js"></script>
    <script type="text/javascript" src="../../FrontPages/Test/JS/checkJS.js"></script>
    <title>Regist 注册</title>
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
    <div class="sign" id="logina">
        <div id="sign1"></div>
        <div class="sign2">
            <div id="logo_lone">
                <img src="../../FrontPages/Test/Images/logo_line.png" width="456" height="57" />
            </div>
            <div class="ID">
                <div class="name">
                    <img src="../../FrontPages/Test/Images/ID.jpg" width="52" height="33" />
                </div>
                <asp:TextBox ID="txtAccount" runat="server" style="position:absolute;top:150px; left:695px; width:241px;height:27px;margin-top:0px; " BackColor="White" BorderColor="White"></asp:TextBox>
            </div>

            <!--姓名 -->
            <div class="ID">
                <div class="name">
                    <img src="../../FrontPages/Test/Images/姓名1.png" width="52" height="33" />
                </div>
                <asp:TextBox ID="txtName" runat="server" style="position:absolute;top:210px; left:695px; width:241px;height:27px;margin-top:0px; " BackColor="White" BorderColor="White"></asp:TextBox>
            </div>

            <!--性别 -->
            <div class="ID">
                <div class="name">
                    <img src="../../FrontPages/Test/Images/性别.png" width="52" height="33"/>
                </div>
                <asp:TextBox ID="txtSex" runat="server" style="position:absolute;top:265px; left:695px; width:241px;height:27px;margin-top:0px; " BackColor="White" BorderColor="White"></asp:TextBox>
            </div>

            <!--出生日期 -->
            <div class="surepassword">
                <div class="name">
                    <img src="../../FrontPages/Test/Images/出生日期.png" width="104" height="33" />
                </div>
                <asp:TextBox ID="txtBirth" runat="server" style="position:absolute;top:315px; left:695px; width:241px;height:27px;margin-top:0px; " BackColor="White" BorderColor="White"></asp:TextBox>
            </div>

            <!--籍贯 -->
            <div class="ID">
                <div class="name">
                    <img src="../../FrontPages/Test/Images/籍贯.png" width="52" height="33"/>
                </div>
                <asp:TextBox ID="txtJiguan" runat="server" style="position:absolute;top:370px; left:695px; width:241px;height:27px;margin-top:0px; " BackColor="White" BorderColor="White"></asp:TextBox>
            </div>

            <!--联系方式 -->
            <div class="surepassword">
                <div class="name">
                    <img src="../../FrontPages/Test/Images/联系方式.png" width="104" height="33" />
                </div>
                <asp:TextBox ID="txtTele" runat="server" style="position:absolute;top:420px; left:695px; width:241px;height:27px;margin-top:0px; " BackColor="White" BorderColor="White"></asp:TextBox>
            </div>

            <div  class="password ">
                <div class="name">
                    <img src="../../FrontPages/Test/Images/password.jpg" width="52" height="33" />
                </div>
                <asp:TextBox ID="txtPassWord" runat="server" TextMode="Password" style="position:absolute;top:470px; left:695px; width:241px;height:27px;margin-top:0px; " BackColor="White" BorderColor="White" ></asp:TextBox>
            </div>

            <div class="surepassword">
                <div class="name">
                    <img src="../../FrontPages/Test/Images/surepassword.jpg" width="104" height="33" />
                </div>
                <asp:TextBox ID="txtSurePassWord" runat="server" TextMode="Password" style="position:absolute;top:520px; left:695px; width:241px;height:27px;margin-top:0px; " BackColor="White" BorderColor="White"></asp:TextBox>
            </div>

            <div class="notic Validform_checktip">
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次密码不一致！" ControlToCompare="txtPassWord" ControlToValidate="txtSurePassWord"></asp:CompareValidator>
            </div>

           <%-- <div class="password">
                <div class="name">
                    <img src="../../FrontPages/Test/Images/validate.jpg" width="72" height="33" />
                </div>
                <asp:TextBox ID="ValidateCode" runat="server" style="position:absolute;top:590px; left:695px; width:241px;height:27px;margin-top:0px; " BackColor="White" BorderColor="White"></asp:TextBox>
                <span ><img src="ValidateCode.aspx" height="20" width="52" style="position:relative;top:9px; left: 315px;" onclick="this.src=this.src +'?Math.random()';" /></span>
            </div>--%>

            <div class="choose">
                <input name="choose" type="checkbox" class="ch"/>
                <span>我已经阅读并同意本网站的《隐私声明》《用户协议》</span>
            </div>

            <div id="but">
                <asp:Button ID="Button1" class="button1" runat="server" OnClick="Button1_Click" Text="注册" Width="150px" />

            </div>
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"  style="position:absolute;top:650px; left: 720px;" BackColor="#CCFFFF" BorderColor="#CCFFFF" ForeColor="#006666"></asp:Label>

        </div>
        <div id="sign3">
            
        </div>
    
    </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    </form>
</body>
</html>
