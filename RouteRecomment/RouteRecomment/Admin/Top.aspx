<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Top.aspx.cs" Inherits="RouteRecomment.Admin.Top" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
    <link href="CSS/main.css" rel="Stylesheet" type="text/css" />
</head>
<body>
      <div id="top">
           <div id="top_up">
                <div id="top_up_left"></div>
                <div id="top_up_center">
                     <li><a href="#"><a href="Right.aspx" target="playFrame"><img src="images/main_06.gif" border=0 /></a></a></li>
                     <li><a href="#"><img src="images/main_08.gif" border=0 onclick="goSrc(-1)"/></a></li>
                     <li><a href="#"><img src="images/main_10.gif" border=0 onclick="goSrc(1)"/></a></li>
                     <li><a href="#"><img src="images/main_12.gif" border=0 onclick="goSrc(0)"/></a></li>
                     <li><a href="#"><img src="images/main_14.gif" border=0/></a></li>
                </div>
             <div id="top_up_right"></div>
           </div>
           <div id="top_down">
                <div id="top_down_left"></div>
                <div id="top_down_center"></div>
                <div id="top_down_right">
                     <span class="img"><img src="images/user.gif" /></span><span class="fon"> 当前角色：<%=RoleName%></span></div>
        </div>      
      </div>
<script language="javascript">
    var linkArray = new Array();
    linkArray.push(top.playFrame.location.href);
    function linkHistory() {
        this.back = function() {
            //top.playFrame.location.href = 
            if(top.playFrame){
                top.playFrame.history.go(-1);
            }
        };
        this.go = function() {
            if(top.playFrame){
                top.playFrame.history.go(1);
            }
        };
        this.fresh = function() {
            top.playFrame.location.reload();
        };
    }
    function goSrc(i){
        var lh = new linkHistory();
        switch (parseInt(i)) {
            case -1:lh.back(); break;
            case 0:lh.fresh(); break;
            case 1:lh.go(); break;
            default: break;
        }
    }
</script>
</html>