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


	var oDiv = document.getElementById('gonglve');
	var aBtn = oDiv.getElementsByTagName('input');
	var aDiv = oDiv.getElementsByTagName('div');

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
				aBtn[i].className='';
				aDiv[aBtn[i].index].style.display='none';					
			}
			this.className='active';
			aDiv[this.index].style.display='block';
		};

	}


var oDi = document.getElementById('otherDis');
	var aBt = oDi.getElementsByTagName('input');
	var aDi = oDi.getElementsByTagName('div');

	nodeLengt  = 0;
	
	for(var i = 0 ; i<aBt.length;i++)
	{
		
		if(i==0)
		{
			aBt[i].index=i;

		}else
		{
			nodeLengt=nodeLengt+1;
			count = ((aDi[aBt[i-1].index].getElementsByTagName('div')).length);
			nodeLengt=nodeLengt+count;
			aBt[i].index=nodeLengt;
		}

		

		aBt[i].onclick=function()
		{
			for(var i=0;i<aBt.length;i++)
			{
				aBt[i].className='';
				aDi[aBt[i].index].style.display='none';					
			}
			this.className='activ';
			aDi[this.index].style.display='block';
		};
	}
};