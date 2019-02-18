window.onload=function() 
{
	var ma=document.getElementById("Map");
 	var map = ma.getElementsByTagName("li");
  

	for(var i=0;i<map.length;i++)
	{
		map[i].flag=3;
		map[i].index=i;
   		map[i].onclick=function()
		{	
			var str="back-";

			if(this.flag == 1)
			{
				this.className=str.concat(this.index);

				this.flag = 2;

			}else
			{

				this.className=str.concat(this.index+10);
				this.flag = 1;
			}

		}
	}
	
}