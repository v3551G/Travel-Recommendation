<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="RouteRecomment.Admin.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
</head>

<frameset rows="55,*,23" cols="*" framespacing="0" frameborder="no" border="0">
  <frame src="Top.aspx" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" />
  <frameset rows="*" cols="171,*">
    <frame  src="Left.aspx" name="mainFrame" id="mainFrame" noresize="noresize"/>
    <frame src="Right.aspx" id="playFrame" name="playFrame" />
  </frameset>
  
  <frame src="Down.aspx" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" />
</frameset>
<noframes><body>
</body>
</noframes>
</html>
