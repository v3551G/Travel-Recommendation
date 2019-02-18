<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Down.aspx.cs" Inherits="RouteRecomment.Admin.Down" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
    <link href="css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
   <div id="down">
        <div id="down_left">版本20143V1.0</div>
        <div id="down_right">日期：<%=DateTime.Now.ToString("yyyy年M月d日 dddd") %></div>
   </div>
    </form>
</body>
</html>
