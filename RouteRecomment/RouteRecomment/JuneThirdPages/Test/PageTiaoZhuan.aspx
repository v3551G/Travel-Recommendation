<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageTiaoZhuan.aspx.cs" Inherits="RouteRecomment.JuneThirdPages.Test.PageTiaoZhuan" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
        <a id="test"  >测试</a>
        <a > ceshi</a>
    </div>
    </form>
    
    <script type="text/javascript">
         
      /*   function ceshi()
         {
           document.getElementById("test").onclick=Yibool();
           
         }*/
         $("#test").onclick = Yibool;
         function Yibool()
             { 
                
                window.open("http://app.baidu.com","_blank");
               // alert(result);
              //  window.location.href=result; //原始
                
             //  window.open(result,'_blank');
              //alert(result);
             // window.navigate(result);

             }
    
    </script>
</body>
</html>
