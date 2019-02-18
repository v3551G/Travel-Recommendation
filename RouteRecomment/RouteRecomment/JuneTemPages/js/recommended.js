// JavaScript Document
window.onload=function()
{

	
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
		
		
		

		
		
};


	

