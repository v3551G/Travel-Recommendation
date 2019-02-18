<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jingling.aspx.cs" Inherits="RouteRecomment.FrontPages.Pages.jingling" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
        <script>
function changeImg()
{
 var bigimg = document.getElementById("myimg01");
 bigimg.src="../images/JL2.gif";
}
function changeBack()
{
 var bigimg = document.getElementById("myimg01");
 bigimg.src="../images/JL1.gif";
}
function IsNeedHelp()
{
        var bigimg=document.getElementById("myimg01");
        var dia1=document.getElementById("diabox1");
        dia1.style.display="block";
        bigimg.src="../images/JL3.gif";
        //bigimg.src="../images/JL4.png";
        bigimg.onmouseout="";
        bigimg.onmouseover="";
        bigimg.onclick="";
}
function needHelp()
{
        var dia1=document.getElementById("diabox1");
        var dia2=document.getElementById("diabox2");
        var bigimg=document.getElementById("myimg01");
        dia1.style.display="none";
        dia2.style.display="block";
        bigimg.src="../images/JL4.png";
}
function noneedHelp()
{
        var dia1=document.getElementById("diabox1");
        var bigimg=document.getElementById("myimg01");
        dia1.style.display="none";
        bigimg.src="../images/JL1.png";
        bigimg.onmouseover="changeImg()";
        bigimg.onmouseout="changeBack()";
        bigimg.onclick="IsNeedHelp()";
}
function noAnswer()
{
        var dia2=document.getElementById("diabox2");
        var bigimg=document.getElementById("myimg01");
        dia2.style.display="none";
        bigimg.src="../images/JL1.png";
}
function Answer()
{
        var dia2=document.getElementById("diabox2");
        var dia3=document.getElementById("diabox3");
        dia2.style.display="none";
        dia3.style.display="block";
}
function goToSee()
{
        var dia3=document.getElementById("diabox3");
        dia3.style.display="none";
        var bigimg=document.getElementById("myimg01");
        bigimg.src="../images/JL1.png";
}
</script>
        <style>
                #floatWindow{position:fixed;right:0;top:30%;}
                #diabox1{width:123px;height:105px;position:fixed;right:13px;top:17%;
                        background:url(../images/diabox1.png) no-repeat;}
                #diabox01{display:block;}
                #diabox1 #input1{width:17px;height:7px;background:url(../images/go.png) no-repeat;
                        border:none;cursor:pointer;margin-top:52px;margin-left:40px;}
                #diabox1 #input2{width:13px;height:7px;background:url(../images/no.png) no-repeat;
                        border:none;cursor:pointer;margin-left:10px;}
                #diabox2{width:468px;height:530px;background:#c2bfbd;border-radius:10px;
                        position:fixed;top:18%;right:120px;opacity:0.95;filter:alpha(opacity=95);-moz-opacity:0.95;}
                #diabox2 #diabox2-child{width:390px;height:460px;background:#fff;border-radius:10px;
                        position:fixed;top:22%;right:137px;
                        font-size:13px;font-family:微软雅黑;color:#000;padding-top:20px;padding-left:40px;}
                #diabox2 #diabox2-child p+p{text-align:left;margin:15px;}
                #diabox2 #diabox2-child .questionTitle{font-size:15px;font-family:微软雅黑;color:#000;text-align:center;}
                #diabox2 #diabox2-child .ques1{width:320px;}
                #diabox2 #input4{width:101px;height:37px;background:url(../images/submit.png) no-repeat;
                        border:none;cursor:pointer;margin-left:130px;}
                #diabox2 #input3{width:50px;height:52px;background:url(../images/nosee.png) no-repeat;
                        border:none;cursor:pointer;position:fixed;margin-left:355px;margin-top:-35px;}
                #diabox3{width:123px; height:105px;position:fixed;right:13px;top:17%;
                        background:url(../images/diabox3.png) no-repeat;}
                #smallJL a,#smallJL a:visited,#smallJL a:hover,#smallJL a:link{text-decoration:none;color:none;}
                #diabox3 #input5{width:17px;height:7px;background:url(../images/go.png) no-repeat;
                        border:none;cursor:pointer;margin-top:52px;margin-left:40px;}
                #diabox3 #input6{width:13px;height:7px;background:url(../images/no.png) no-repeat;
                        border:none;cursor:pointer;margin-left:10px;}
#smallJL input[type=checkbox],
#smallJL input[type=radio]{
-webkit-appearance: none;
appearance: none;
width: 13px;
height: 13px;
margin: 0;
cursor: pointer;
vertical-align: bottom;
background: #fff;
border: 1px solid B9BBBE;
-webkit-border-radius: 1px;
-moz-border-radius: 1px;
border-radius: 1px;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
box-sizing: border-box;
position: relative;


}


#smallJL input[type=checkbox]:active,
#smallJL input[type=radio]:active {
border-color: #c6c6c6;
background: #ebebeb;
}


#smallJL input[type=checkbox]:hover {
border-color: #c6c6c6;
-webkit-box-shadow: inset 0 2px 2px rgba(0,0,0,0.1);
-moz-box-shadow: inset 0 2px 2px rgba(0,0,0,0.1);
box-shadow: inset 0 2px 2px rgba(0,0,0,0.1);
}


#smallJL input[type=checkbox]:checked,
#smallJL input[type=radio]:checked {
background: #fff;
}


#smallJL input[type=checkbox]:checked::after,
#smallJL input[type=radio]:checked::after {
content: url(../images/checkmark1.png);
display: block;
position: absolute;
top: -7px;
right: 0px;
left: -5px
}


#smallJL input[type=checkbox]:focus {
outline: none;
border-color:#4d90fe;
 
}
        </style>
        <div id="smallJL">
        <div id="floatWindow">
                <img id="myimg01" src="../images/JL1.png" width="126" height="100" onMouseOver="changeImg()" onMouseOut="changeBack()" onClick="IsNeedHelp()">
        </div>
        <div id="diabox1" style="display:none;">
                
                <input type="buton" id="input1" onClick="needHelp()"/>
                <a href=""><input type="button" id="input2" onClick="noneedHelp()"/></a>
        </div>
        <div id="diabox2"  style="display:none;"><!-- -->

               
                        



                <div id="diabox2-child"><a href="">
                   <input type="button" id="input3" onClick="noAnswer()" />
                </a><!--不回答问题-->

                        <p class="questionTitle">先<span style="color:#2e96c2;font-size:20px;">回答</span>
                                这样几个<span style="color:#2e96c2;font-size:20px;">问题</span>吧</p>
                        <p class="ques1"><span style="font-size:16px;">1.</span style="margin-left:10px;">您希望旅行几天 ？<input type="text" style="width:62px;height:18px;margin-left:30px;margin-right:10px;"/>天</p>


                        <p class="ques1"><span style="font-size:16px;">2.</span style="margin-left:10px;">您预期的消费 ？
                                <input type="text" style="width:62px;height:18px;margin-left:40px;margin-right:10px;"/>元</p>
                        
                        <p class="ques1"><span style="font-size:16px;">3.</span style="margin-left:10px;">      您的陪同人员？（可多选）
                                       
                        </p>
                        <p>
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;&nbsp;爱人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;&nbsp;朋友
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;&nbsp;儿子或女儿&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;&nbsp;父母
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </p>

                        <p class="ques1"><span style="font-size:16px;">3.</span style="margin-left:10px;">      您喜欢的景点类型？（可多选）
                                       
                        </p>
                        <p><!--若改变复选框的内容字体的多少，可能形式会有点不同，可调整一下&nbsp;数量这个代表一个空格-->
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;
                                地质地貌景观旅游资源等
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;
                                水体景观旅游资源
                                <br/>
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;
                                生物旅游资源&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;
                                文物古迹&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;
                                园林
                                <br/>
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;
                                宗教文化&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;
                                城乡风貌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;
                                现代设施
                               <br/>
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;
                                民俗风情
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="check1" style="position:relative;top:-2px;"/>&nbsp;
                                饮食与购物类
                        </p>
                        <p class="ques1"><span style="font-size:16px;">3.</span style="margin-left:10px;"> 
                                您的年龄段？
                                       
                        </p>
                        <p>
                                <input type="radio" name="age" style="position:relative;top:-2px;"/>&nbsp;10岁以下
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="age" style="position:relative;top:-2px;"/>&nbsp;10岁到18岁
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="age" style="position:relative;top:-2px;"/>&nbsp;19岁到30岁
                                <br/>
                                <input type="radio" name="age" style="position:relative;top:-2px;"/>&nbsp;31岁到45岁
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="age" style="position:relative;top:-2px;"/>&nbsp;46岁到60岁
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="age" style="position:relative;top:-2px;"/>&nbsp;60岁以上
                        </p>
                        
                <input type="submit" id="input4" value=" " onClick="Answer()" /><!--回答问题-->
                
                        
                </div>
        </div>
        <div id="diabox3" style="display:none;">
                
               <!--链接到推荐页面--> <a href="recommend.html"><input type="submit" id="input5" value=" " onClick="goToSee()"/></a>
                <a href=""><input type="submit" id="input6" value=" " onClick="nogoToSee()"/></a>
        </div>
</div>
</body>
</html>