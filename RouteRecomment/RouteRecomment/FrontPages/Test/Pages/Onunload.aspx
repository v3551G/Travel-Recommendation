﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Onunload.aspx.cs" Inherits="RouteRecomment.FrontPages.Test.Pages.Onunload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
</head>
<body onunload="alert('执行 onunload');">
请手工关闭当前浏览器窗口。<br/>
请手工在地址栏输入其他页面地址或从收藏夹、历史记录中将页面导航其他站点。<br/>
请手工单击后退，前进，刷新，或主页按钮。<br/>
<a href="http://www.google.com" id="A">点击一个链接到新页面</a><br />
<button onclick="document.getElementById('A').click()">调用 anchor.click 方法</button><br />
<button onclick="document.write('A')">调用 document.write 方法</button><br />
<button onclick="document.open()">调用 document.open 方法</button><br />
<button onclick="document.close()">调用 document.close 方法</button><br />
<button onclick="window.open('http://www.google.com','_self')">调用 window.open方法，窗口名称设置值为 _self</button><br />
<button onclick="try{window.navigate('http://www.google.com')}catch(e){alert('不支持此方法')}">调用 window.navigate 方法</button><br />
<button onclick="try{window.external.NavigateAndFind('http://www.google.com','','')}catch(e){alert('不支持此方法')}">调用 NavigateAndFind 方法</button><br />
<button onclick="location.replace('http://www.google.com')">调用 location.replace 方法</button><br />
<button onclick="location.reload()">调用 location.reload 方法</button><br />
<button onclick="location.href='http://www.google.com'">指定一个 location.href 属性的新值</button><br />
<form action="http://www.google.com" id="B">
<input type="submit" value="提交具有 action 属性的一个表单">
</form>
<button onclick="document.getElementById('B').submit()">调用 form.submit 方法</button><br />
<a href="javascript:">调用 javascipt: 伪协议</a><br />
<a href="mailto:">调用 mailto: 伪协议</a><br />
<a href="custom:">调用自定义伪协议</a>
</body>
</html>
