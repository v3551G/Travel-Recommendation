<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IP.aspx.cs" Inherits="RouteRecomment.FrontPages.Test.Pages.用户IP.IP" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <script type="text/javascript" language="javascript">
     function ()
      {       
            var a = "<%=GetIP()%>";
            alert(a);
            
     
    
        }      
      

    </script>
</head>
<body>
    <form id="form1" runat="server">
                     <asp:ScriptManager ID="ScriptManager1"  EnablePageMethods="true" runat="server">
                  </asp:ScriptManager>
    <div>
     
    </div>
    </form>
</body>
</html>
