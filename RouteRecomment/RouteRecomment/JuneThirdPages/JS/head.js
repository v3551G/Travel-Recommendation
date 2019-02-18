   $(document).ready(function(){
                
                var nav=$(".seek-top");
                var HR=$(".in").height()+10;
                $(window).scroll(function(){
                    if ($(window).scrollTop()>HR){

                        nav.addClass("nav_scroll");
                         //index_body.addClass("index-body1");
                    }
                    else
                    {
                        nav.removeClass("nav_scroll");
                         //index_body.removeClass("index-body1");
                    }
                });
     
        })
window.onload=function()
{

    var lo=document.getElementById("seek-login");
    var loLi=lo.getElementsByTagName("li");
    var loO=document.getElementById("seek-login-after");

    for(var i=0;i<loLi.length;i++)
    {

        loLi[i].onclick=function()
        {

          loO.style.display="block";//显示注销
          lo.style.display="none";//登陆前的样式

           };
         }
}
