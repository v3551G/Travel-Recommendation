// 百度地图API功能
var map = new BMap.Map("l-map");
map.centerAndZoom(new BMap.Point(110.305112,25.284055), 10);
map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用图
var pointArr;
var l,t;
function drivingRoute(){
	    var Point;
		var wholep=new Array;
		var driving = new BMap.DrivingRoute(map);
	    for(var i=0;i<pointArr.length;i++)
	    {  //获取数组
	       var Point=pointArr[i];
		   var leftp  = Point.point.split("|")[0];
           var rightp   = Point.point.split("|")[1];
		   var p=new BMap.Point(leftp,rightp);
		   wholep[i]=new BMap.Point(leftp,rightp);
		   createDiv(Point); 
	    }
	for(var k=1;k<pointArr.length;k++)
	{
		if(k>=1&&k<pointArr.length)
	    {
		driving.search(wholep[k-1],wholep[k])
		
		}
	}
	setTimeout(function(){
            map.setViewport(wholep);          //调整到最佳视野
        },1000);
	driving.setSearchCompleteCallback(function(){
		var Point;
        var pts = driving.getResults().getPlan(0).getRoute(0).getPath();    //通过驾车实例，获得一系列点的数组
        var polyline = new BMap.Polyline(pts);     
        map.addOverlay(polyline);
        for(var j=0;j<pointArr.length;j++)
		{
			Point=pointArr[j]
			var whole;
		    var left  = Point.point.split("|")[0];
            var right   = Point.point.split("|")[1];
		    whole  = new BMap.Point(left,right); 
			var iconImg = createIcon(Point.icon);
			var marker=new BMap.Marker(whole,{icon:iconImg});
			map.addOverlay(marker);
			var label= new BMap.Label(Point.title,{position:whole});   
            map.addOverlay(label);
			iw=createInfoWindow(j);
			(function(){
				var index = j;
				var _iw = createInfoWindow(j);
				var _marker = marker;
				_marker.addEventListener("dblclick",function(){
				  //  this.openInfoWindow(_iw);
					window.location.href='http://www.baidu.com/';
			    });
			    _iw.addEventListener("close",function(){
				    _marker.getLabel().show();
			    })
				_marker.addEventListener("click",function(){
				    _marker.openInfoWindow(_iw);
			    })
				var a1=document.getElementById(Point.title).onclick=function(){
				_marker.openInfoWindow(_iw);}
				if(!!Point.isOpen){
					label.hide();
					_marker.openInfoWindow(_iw);
				}
			})()
			
		}
    });
}
//创建一个Icon
    function createIcon(json){
        var icon = new BMap.Icon("../images/百度地图Marker（A）.png",
		           new BMap.Size(json.w,json.h),
				  {imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),
				    offset:new BMap.Size(json.x,json.h)})
        return icon;
    }
	function createInfoWindow(i){
        var json = pointArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
        return iw;
    }
	function createDiv(Arr){
		var div1=document.createElement("div");
		    div1.id="div1";
			div1.style.height="auto";
			div1.style.width="230px";
			div1.style.fontSize="12px";
			div1.style.lineHeight="25px";
			div1.style.paddingTop="5px";
			div1.style.minHeight="110px";
			div1.style.borderBottom="1px dashed #999";
			div1.style.marginLeft="10px";
		var div2=document.createElement("div");
		    div2.id="tex";
			/*----------------*/
	    var img1=document.createElement("img");
			img1.src="../images/house.png";
			img1.style.height="28";
			img1.style.width="21";
			img1.style.cssFloat="left"
			/*----------------*/
		var a2=document.createElement("a");
			a2.id=Arr.title;
			a2.innerHTML=Arr.title;
			 a2.style.marginLeft="30px";
			 a2.style.color="#366c83";
			 a2.style.paddingTop="5px";
			a2.href="#";
			/*----------------*/
		var span2=document.createElement("span");
			span2.id=Arr.title;
			span2.style.marginLeft="30px";
			span2.style.paddingTop="5px";
			span2.innerHTML=Arr.title;
			/*----------------*/
		var a1=document.createElement("a");
			a1.href=Arr.href;
			a1.innerHTML="详情";
			a1.style.textDecoration="none";
			a1.style.font="#366c83";
			a1.onmousemove=function(){this.style.color="#F00"};
			a1.onmouseout =function(){this.style.color="blue"};
			/*----------------*/
		var p1=document.createElement("p");
		    p1.innerHTML="地址："+Arr.address;
			p1.style.paddingLeft="50px";
			/*----------------*/
		var p2=document.createElement("p");
		    p2.innerHTML="电话："+Arr.phoneNumber;
			p1.style.paddingLeft="50px";
			/*----------------*/
		var pDiv=document.getElementById("content_1");
		    pDiv.appendChild(div1);
			div1.appendChild(div2);
			div2.appendChild(img1);
			div2.appendChild(a2);
			div2.appendChild(span2);
			span2.appendChild(a1);
			div2.appendChild(p1);
			div2.appendChild(p2);
		}
function A(){

     pointArr =[{title:"遇龙河",content:"<img style='float:right;margin:4px' id='imgDemo' src='印象刘三姐.png' width='139' height='104' title='印象刘三姐'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>全世界最大的山水实景演出，民族与现代的结合，一场饕餮的视觉盛宴。。。</p>",point:'110.40895000000000000|24.79951000000000000',icon:{w:21,h:34,l:0,t:0,x:6,lb:5},address:"桂林市阳朔县白沙镇遇龙村",phoneNumber:"12345678"},//1:0代表A
	            {title:"蝴蝶泉",content:"<img style='float:right;margin:4px' id='imgDemo' src='王城商厦.png' width='139' height='104' title=王城商厦'/>" + 
             "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>王城商厦是桂林的一个老字号商厦了，仅次于百货大楼的年</br>代，同样地处桂林的市中心，商品也挺齐全的，但一直没能赶超</br>微笑堂的人流量，所以效益次于前茅，不过价格挺实惠的。。。</p>" + 
"</div>",point:'110.49682000000000000|24.74003000000000000',icon:{w:21,h:34,l:21,t:0,x:6,lb:5},address:"桂林市阳朔月亮山风景区",phoneNumber:"12345678"},//参数依次
				{title:"西街",content:"<img style='float:right;margin:4px' id='imgDemo' src='喜马拉雅山大酒店.png' width='139' height='104' title=喜马拉雅山大酒店'/>" + 
"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>桂林喜马拉雅山大酒店位于桂林环城北二路虞山桥头香格里拉大酒店斜对面，集住宿、餐饮、KTV娱乐、旅游于一体的综合性酒店。</p>" + 
"</div>",point:'110.49450000000000000|24.77510000000000000',icon:{w:21,h:34,l:42,t:0,x:6,lb:5},address:"桂林市阳朔县西街",phoneNumber:"12345678"}];//增加21
     var a=drivingRoute();  
                                                                    //的B，C
}
A();   