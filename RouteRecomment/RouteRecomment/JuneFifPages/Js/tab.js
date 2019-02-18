window.onload=function()
{
	// var oDiv = document.getElementById('div1');
	// var aBtn = oDiv.getElementsByTagName('input');
	// var aDiv = oDiv.getElementsByTagName('div');



	
	// nodeLength  = 0;
	
	// for(var i = 0 ; i<aBtn.length;i++)
	// {
		
	// 	if(i==0)
	// 	{
	// 		aBtn[i].index=i;

	// 	}else
	// 	{
	// 		nodeLength=nodeLength+1;
	// 		count = ((aDiv[aBtn[i-1].index].getElementsByTagName('div')).length);
	// 		nodeLength=nodeLength+count;
	// 		aBtn[i].index=nodeLength;
	// 	}

		

	// 	aBtn[i].onclick=function()
	// 	{
	// 		for(var i=0;i<aBtn.length;i++)
	// 		{
	// 			aBtn[i].className='';
	// 			aDiv[aBtn[i].index].style.display='none';					
	// 		}
	// 		this.className='active';
	// 		aDiv[this.index].style.display='block';
	// 	};
	// }
	
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
         
         


var oDiv = document.getElementById('gonglve');
	var aBtn = document.getElementsByName('navbar');
	var aDiv = oDiv.getElementsByTagName('div');
	nodeLength  = 0;
	
	for(var i = 0 ; i<aBtn.length;i++)
	{
		
		if(i==0)
		{
			aBtn[i].index=i;

		}else
		{
			nodeLength=nodeLength+1;
			count = ((aDiv[aBtn[i-1].index].getElementsByTagName('div')).length);
			nodeLength=nodeLength+count;
			aBtn[i].index=nodeLength;
		}

		

	
		aBtn[i].onclick=function()
		{
			for(var i=0;i<aBtn.length;i++)
			{
				aBtn[i].id='';
				aDiv[aBtn[i].index].style.display='none';					
			}
			this.id='active';
			aDiv[this.index].style.display='block';
		};
		

	}



};