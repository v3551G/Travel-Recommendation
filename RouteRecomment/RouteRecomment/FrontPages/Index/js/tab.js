window.onload=function()
{
	var oDiv = document.getElementById('div1');
	var aBtn = oDiv.getElementsByTagName('input');
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

		

		aBtn[i].onmouseover=function()
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
};