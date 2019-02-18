// JavaScript Document
window.onload=function()
{
	var oDiv = document.getElementById('div1');
	
	var aBtn = oDiv.getElementsByTagName('input');
	
	var aDiv = oDiv.getElementsByTagName('div');
	
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
	
	
	
	var oStar = document.getElementById("star");
	var aLi = oStar.getElementsByTagName("li");
	var oUl = oStar.getElementsByTagName("ul")[0];
	var oSpan = oStar.getElementsByTagName("span")[1];
	var oP = oStar.getElementsByTagName("p")[0];
	var i = iScore = iStar = 0;
	var aMsg = [
				"很不满意|非常不满",
				"不满意|不符，不满意",
				"一般|质量一般",
				"满意|是挺满意的",
				"非常满意|非常满意哦"
				]
	
	for (i = 1; i <= aLi.length; i++)
	{
		aLi[i - 1].index = i;
		//鼠标移过显示分数
		aLi[i - 1].onmouseover = function ()
		{
			fnPoint(this.index);
			//浮动层显示
			oP.style.display = "block";
			//计算浮动层位置
			oP.style.left = oUl.offsetLeft + this.index * this.offsetWidth - 104 + "px";
			//匹配浮动层文字内容
			oP.innerHTML = "<em><b>" + this.index + "</b> 分 " + aMsg[this.index - 1].match(/(.+)\|/)[1] + "</em>" + aMsg[this.index - 1].match(/\|(.+)/)[1]
		};
		//鼠标离开后恢复上次评分
		aLi[i - 1].onmouseout = function ()
		{
			fnPoint();
			//关闭浮动层
			oP.style.display = "none"
		};
		//点击后进行评分处理
		aLi[i - 1].onclick = function ()
		{
			iStar = this.index;
			oP.style.display = "none";
			oSpan.innerHTML = "<strong>" + (this.index) + " 分</strong> (" + aMsg[this.index - 1].match(/\|(.+)/)[1] + ")"

			CmtVal = this.index;//+
		    //CmtVal = oSpan.innerHTML;
		    //alert("CmtVal:" + CmtVal);
		    //
			document.getElementById("CmtValue").value = CmtVal;//+
		}
	}
	//评分处理
	function fnPoint(iArg)
	{
		//分数赋值
		iScore = iArg || iStar;
		for (i = 0; i < aLi.length; i++) aLi[i].className = i < iScore ? "on" : "";	
	}
	
	
	
	var oDe = document.getElementById('c-myDiv');

	/*alert(oDe.children.length);*/

	for(var i=0; i<oDe.children.length;i++)
	{
		dealDiv(oDe.children[i]);
	}
	
};
function dealDiv( obj )
{
 
	var aDe = obj.children;

	var oLu = aDe[0].children;

	var oLi = oLu[0].children;

	var mvDiv = aDe[1].children;

	oLi[0].index=1;

	oLi[0].onclick=function(){actionMove(aDe[1],this);};

	mvDiv[1].onclick=function(){upMove(aDe[1],oLi[0]);};

}
function upMove(obj,count)
{
	startMove(obj, {height:0,fontSize:0,lineHeight:0,opacity:0});
	count.index = 1;
	fnEnd(obj);

	
}
function actionMove(obj, count)
{

	if(count.index==2)
	{

		startMove(obj, {height:0,fontSize:0,lineHeight:0,opacity:0});

		count.index = 1;
		fnEnd(obj);

	
	}else
	{	


		obj.style.display="block";

		startMove(obj, {height:330,fontSize:20,lineHeight:22,opacity:100});

		count.index = 2;
	}
}
function fnEnd(obj)
{
	obj.style.display="none";
}

function getStyle(objHandle, styleName)
{

	if(objHandle.currentStyle)
	{
		return objHandle.currentStyle[styleName];

	}else
	{
		return getComputedStyle(objHandle, false)[styleName];
	}
}

function startMove(objHandle, json, fnEnd)
{

	
	clearInterval(objHandle.timer);
		 
	objHandle.timer=setInterval(function()
	{
		var shutClose=true;

		for(var styleName in json)
		{
			if(styleName=='opacity')
			{
				var curValue=Math.round(parseFloat(getStyle(objHandle,styleName))*100);

			}else
			{
				var curValue=parseInt(getStyle(objHandle,styleName));
			}
			
			var speed=(json[styleName]-curValue)/6;
			
			speed=speed>0?Math.ceil(speed):Math.floor(speed);

			if(curValue!=json[styleName])
			{
				shutClose=false;

			}
			if(styleName=='opacity')
			{
				objHandle.style.filter='alpha(opacity:'+(curValue+speed)+')';
				objHandle.style.opacity=(curValue+speed)/100;

			}else
			{
				objHandle.style[styleName]=curValue+speed+'px';
			}
		}
		if(shutClose)
		{
			clearInterval(objHandle.timer);
			if(fnEnd)fnEnd();
		}
	}, 30);	
	
	
	
		 
 	
		
		
		
		
};


	

