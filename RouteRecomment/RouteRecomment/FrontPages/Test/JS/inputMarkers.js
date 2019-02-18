// JavaScript Document
var a1,a2,a3,a4,a5
    function Auto1()
    {
		if(document.getElementById("button1").value=="添加购物")
		{
	         sContent =
              "<img style='float:right;margin:4px' id='imgDemo' src='王城商厦.png' width='139' height='104' title=王城商厦'/>" + 
             "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>王城商厦是桂林的一个老字号商厦了，仅次于百货大楼的年</br>代，同样地处桂林的市中心，商品也挺齐全的，但一直没能赶超</br>微笑堂的人流量，所以效益次于前茅，不过价格挺实惠的。。。</p>" + 
"</div>";
             markerArr =[{title:"王城商厦",content:sContent,point:"110.305112|25.284055",isOpen:0,icon:{w:23,h:25,l:23,t:21,x:9,lb:12}}
		 ];
		 
		 		 a1=addMarker();
		 document.getElementById("button1").value="取购物消";
		}
		else
		{
			map.removeOverlay(a1);
		    document.getElementById("button1").value="添加购物";
	}
	}
	function Auto2(){
		if(document.getElementById("button2").value=="添加景点")
		{
	sContent =
"<img style='float:right;margin:4px' id='imgDemo' src='印象刘三姐.png' width='139' height='104' title='印象刘三姐'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>全世界最大的山水实景演出，民族与现代的结合，一场饕餮的视觉盛宴。。。</p>" + 
"</div>";
    markerArr = [{title:"印象刘三姐",content:sContent,point:"110.512947|24.771489",isOpen:0,icon:{w:23,h:25,l:46,t:21,x:9,lb:12}}
		 ];
		 a2=addMarker();
		  document.getElementById("button2").value="取购景点";
		}
		else
		{
			map.removeOverlay(a2);
		    document.getElementById("button2").value="添加景点";
	}
	  }
	function Auto3(){
		if(document.getElementById("button3").value=="添加酒店")
		{
	sContent =
"<img style='float:right;margin:4px' id='imgDemo' src='喜马拉雅山大酒店.png' width='139' height='104' title=喜马拉雅山大酒店'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>桂林喜马拉雅山大酒店位于桂林环城北二路虞山桥头香格里拉大酒店斜对面，集住宿、餐饮、KTV娱乐、旅游于一体的综合性酒店。</p>" + 
"</div>";
    markerArr = [{title:"喜马拉雅山大酒店",content:sContent,point:"110.31624|25.300724",isOpen:0,icon:{w:23,h:25,l:69,t:21,x:9,lb:12}}
		 ];
		a3=addMarker();
		document.getElementById("button3").value="取购酒店";
		}
		else
		{
			map.removeOverlay(a3);
		    document.getElementById("button3").value="添加酒店";
	}
	}
	function Auto4(){
		if(document.getElementById("button4").value=="添加美食")
		{
	sContent =
"<img style='float:right;margin:4px' id='imgDemo' src='桂林粥城.png' width='139' height='104' title==桂林粥城'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>桂林粥城－－桂林的消夜中心NO.1，口号是：&quot;美味夜时尚，愈夜愈美丽。。。。&quot;</p>" + 
"</div>";
    markerArr = [{title:"桂林粥城",content:sContent,point:"110.302015|25.279563",isOpen:0,icon:{w:23,h:25,l:92,t:21,x:9,lb:12}}
		 ];
		a4=addMarker();
		document.getElementById("button4").value="取购美食";
		}
		else
		{
			map.removeOverlay(a4);
		    document.getElementById("button4").value="添加美食";
	}
	}
	function Auto5(){
		if(document.getElementById("button5").value=="添加娱乐")
		{
			sContent =
"<img style='float:right;margin:4px' id='imgDemo' src='漓江民俗风情园.png' width='139' height='104' title=漓江民俗风情园'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>广西最大的旅游娱乐场所及最大的少数民族建筑群。。。</p>" + 
"</div>";
    markerArr = [{title:"漓江民俗风情园",content:sContent,point:"110.315481|25.293243",isOpen:0,icon:{w:23,h:25,l:0,t:21,x:9,lb:12}}
		 ];
		a5=addMarker();
		document.getElementById("button5").value="取购娱乐";
		}
		else
		{
			map.removeOverlay(a5);
		    document.getElementById("button5").value="添加娱乐";
	}
			}