// JavaScript Document

window.onload=function()
{
	// var other = document.getElementById('otherDis');
	// var aO = other.getElementsByTagName('input');
	// var aT = other.getElementsByTagName('div');
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
				"非常满意|非常满意"
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
		}
	}
	//评分处理
	function fnPoint(iArg)
	{
		//分数赋值
		iScore = iArg || iStar;
		for (i = 0; i < aLi.length; i++) aLi[i].className = i < iScore ? "on" : "";	
	}
};


	

