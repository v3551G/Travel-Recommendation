// JavaScript Document
window.onload=function()
{

	var oDiv = document.getElementById('input');
	
	var aIn = oDiv.getElementsByTagName('input');
	
	var oDbt  = document.getElementById('loginfirst');

  	var oDbtd = document.getElementById('logined');

 	var aliLogin   = oDbt.getElementsByTagName('li');

	// alert(aLi.length);
	for( var i=0;i<aliLogin.length;i++)
 	{
		 aliLogin[i].onclick=function()
	  	 {	

			oDbtd.style.display = "block";
			oDbt.style.display  = "none";
			
	 	 };
   	 
	}
		
   for(var i=0; i<aIn.length; i++)
   
    {
	   aIn[i].onclick=function()
	   {
		 
			for( var j = 0; j < aIn.length; j++)
			{
				if(j!=i)
				{
		          aIn[j].className='';
		           
				}
		    }
			
			   this.className='';
		       this.className='active';
		   
	   }
	  
	  this.className='active';
	  
	   
	   
	 }
		
		

		
		
};


	

