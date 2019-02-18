
function changeImg()
{
 var bigimg = document.getElementById("myimg01");
 bigimg.src="../imagesH/JL2.gif";
}
function changeBack()
{
 var bigimg = document.getElementById("myimg01");
 bigimg.src="../imagesH/JL1.gif";
}
function diabox1()
{
        var dia1=document.getElementById("diabox1");
        dia1.style.display="block";
}
function IsNeedHelp()
{
        var bigimg=document.getElementById("myimg01");
        
        bigimg.src="../imagesH/JL3.gif";
        //bigimg.src="../imagesH/JL4.png";
        bigimg.onmouseout="";
        bigimg.onmouseover="";
        bigimg.onclick="";
        setTimeout("diabox1()",1000);
}
function needHelp()
{
        var dia1=document.getElementById("diabox1");
        var dia2=document.getElementById("diabox2");
        var bigimg=document.getElementById("myimg01");
        dia1.style.display="none";
        dia2.style.display="block";
        bigimg.src="../imagesH/JL4.png";
}
function noneedHelp()
{
        var dia1=document.getElementById("diabox1");
        var bigimg=document.getElementById("myimg01");
        dia1.style.display="none";
        bigimg.src="../imagesH/JL1.gif";
        bigimg.onmouseover= function()
        {
                changeImg();
        }
        bigimg.onmouseout= function()
        {
             changeBack();   
        }
       
        bigimg.onclick= function()
        {
                IsNeedHelp();
        }
        
}
function noAnswer()
{
        var dia2=document.getElementById("diabox2");
        var bigimg=document.getElementById("myimg01");
        dia2.style.display="none";
        bigimg.src="../imagesH/JL1.gif";
        bigimg.onmouseover= function()
        {
                changeImg();
        }
        bigimg.onmouseout= function()
        {
             changeBack();   
        }
       
        bigimg.onclick= function()
        {
                IsNeedHelp();
        }
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
        var bigimg=document.getElementById("myimg01");
        bigimg.src="../imagesH/JL1.gif";
        var dia3=document.getElementById("diabox3");
        dia3.style.display="none";
        
        bigimg.onmouseover= function()
        {
                changeImg();
        }
        bigimg.onmouseout= function()
        {
             changeBack();   
        }
       
        bigimg.onclick= function()
        {
                IsNeedHelp();
        }
}

function nogoToSee()
{
        var dia1=document.getElementById("diabox1");
        var dia3=document.getElementById("diabox3");
        var bigimg=document.getElementById("myimg01");
        dia1.style.display="none";
         dia3.style.display="none";
        bigimg.src="../imagesH/JL1.gif";
        bigimg.onmouseover= function()
        {
                changeImg();
        }
        bigimg.onmouseout= function()
        {
             changeBack();   
        }
       
        bigimg.onclick= function()
        {
                IsNeedHelp();
        }
}
