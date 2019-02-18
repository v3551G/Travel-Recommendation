<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MouseSelect.aspx.cs" Inherits="RouteRecomment.FrontPages.Test.Pages.鼠标选中.MouseSelect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
        <script type="text/javascript">
                function getSelectText()
                  {
                    var txt = null;
                    if (window.getSelection)
                       {  // mozilla FF
                        txt = window.getSelection();
                       }
                    else if (document.getSelection)
                       {
                        txt = document.getSelection();
                       }
                    else if (document.selection)
                       {  //IE
                        txt = document.selection.createRange().text;
                       }
                    return txt;
                  }
                var obj=document.getElementById("test");
                document.onmouseup=function()
                   {
                    var value = getSelectText();
                    
                    }
        </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    鼠标拖选测试
    </div>
    </form>
</body>
</html>
