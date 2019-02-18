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