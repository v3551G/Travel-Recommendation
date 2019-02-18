// JavaScript Document
 //标注点数组
	var sContent;
    var markerArr;
	var hlight;
    //创建marker
    function addMarker(){
            for(var i=0;i<markerArr.length;i++){
            var json = markerArr[i];
            var p0 = json.point.split("|")[0];
            var p1 = json.point.split("|")[1];
            var point = new BMap.Point(p0,p1);
			var iconImg = createIcon(json.icon);
            var marker = new BMap.Marker(point,{icon:iconImg});
			var iw = createInfoWindow(i);
			var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
			marker.setLabel(label);
			label.hide();
            map.addOverlay(marker);
            label.setStyle({
                       /* borderColor:"#808080",
                        color:"#333",
                        cursor:"pointer"*/
						position:"absolute",
						background:"#EE5D5B",
						border:"1px solid #BC3B3A",
						color:"white",
						height:"18px",
						padding:"2px",
						lineHeight:"18px",
						whiteSpace:"nowrap",
						MozUserSelert:"none",
						fontSize:"12px"
            });
			(function(){
				var index = i;
				var _iw = createInfoWindow(i);
				var _marker = marker;
				_marker.addEventListener("dblclick",function(){
				  //  this.openInfoWindow(_iw);
					window.location.href='http://www.baidu.com/';
			    });
				_marker.addEventListener("mouseout",function(){
				 _marker.getLabel().hide();
			    });
				_marker.addEventListener("mouseover",function(){
				  _marker.getLabel().show();
			    });
				
				 _iw.addEventListener("mouseover",function(){
				    _marker.getLabel().show();
			    })
			    _iw.addEventListener("open",function(){
				    _marker.getLabel().hide();
			    })
			    _iw.addEventListener("close",function(){
				    _marker.getLabel().show();
			    })
				_marker.addEventListener("click",function(){
				    _marker.openInfoWindow(_iw);
			    })
				if(!!json.isOpen){
					label.hide();
					_marker.openInfoWindow(_iw);
				}
			})()
        }
		return marker;
    }
    //创建InfoWindow
    function createInfoWindow(i){
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
        return iw;
    }
    //创建一个Icon
    function createIcon(json){
        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
        return icon;
    }