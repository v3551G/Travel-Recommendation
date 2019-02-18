function initMap(){
        createMap();//´´½¨µØÍ¼
        setMapEvent();//ÉèÖÃµØÍ¼ÊÂ¼þ
        addMapControl();//ÏòµØÍ¼Ìí¼Ó¿Ø¼þ
        addMarker();//ÏòµØÍ¼ÖÐÌí¼Ómarker
    }
    
    //´´½¨µØÍ¼º¯Êý£º
    function createMap(){
        var map = new BMap.Map("dituContent");//ÔÚ°Ù¶ÈµØÍ¼ÈÝÆ÷ÖÐ´´½¨Ò»¸öµØÍ¼
        var point = new BMap.Point(108.826882,38);//¶¨ÒåÒ»¸öÖÐÐÄµã×ø±ê
        map.centerAndZoom(point,5);//Éè¶¨µØÍ¼µÄÖÐÐÄµãºÍ×ø±ê²¢½«µØÍ¼ÏÔÊ¾ÔÚµØÍ¼ÈÝÆ÷ÖÐ
        window.map = map;//½«map±äÁ¿´æ´¢ÔÚÈ«¾Ö
    }
    
    //µØÍ¼ÊÂ¼þÉèÖÃº¯Êý£º
    function setMapEvent(){
        map.enableDragging();//ÆôÓÃµØÍ¼ÍÏ×§ÊÂ¼þ£¬Ä¬ÈÏÆôÓÃ(¿É²»Ð´)
        map.enableScrollWheelZoom();//ÆôÓÃµØÍ¼¹öÂÖ·Å´óËõÐ¡
        map.enableDoubleClickZoom();//ÆôÓÃÊó±êË«»÷·Å´ó£¬Ä¬ÈÏÆôÓÃ(¿É²»Ð´)
        map.enableKeyboard();//ÆôÓÃ¼üÅÌÉÏÏÂ×óÓÒ¼üÒÆ¶¯µØÍ¼
    }
    
    //µØÍ¼¿Ø¼þÌí¼Óº¯Êý£º
    function addMapControl(){
        //ÏòµØÍ¼ÖÐÌí¼ÓËõ·Å¿Ø¼þ
	var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
	map.addControl(ctrl_nav);
        //ÏòµØÍ¼ÖÐÌí¼ÓËõÂÔÍ¼¿Ø¼þ
	//var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
	//map.addControl(ctrl_ove);
        //ÏòµØÍ¼ÖÐÌí¼Ó±ÈÀý³ß¿Ø¼þ
	var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
	map.addControl(ctrl_sca);
    }
    
    //±ê×¢µãÊý×é
    var markerArr = [{title:"¹ðÁÖ",content:"¹ðÁÖ",point:"108.702413|26.240106",isOpen:0,icon:{w:23,h:25,l:46,t:21,x:9,lb:12}}
		 ];
    //´´½¨marker
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
            map.addOverlay(marker);
            label.setStyle({
                        borderColor:"#808080",
                        color:"#333",
                        cursor:"pointer"
            });
			
			(function(){
				var index = i;
				var _iw = createInfoWindow(i);
				var _marker = marker;
				_marker.addEventListener("click",function(){
				    this.openInfoWindow(_iw);
					window.location.href='http://www.baidu.com/';
			    });
			    _iw.addEventListener("open",function(){
				    _marker.getLabel().hide();
			    })
			    _iw.addEventListener("close",function(){
				    _marker.getLabel().show();
			    })
				label.addEventListener("click",function(){
				    _marker.openInfoWindow(_iw);
			    })
				if(!!json.isOpen){
					label.hide();
					_marker.openInfoWindow(_iw);
				}
			})()
        }
    }
    //´´½¨InfoWindow
    function createInfoWindow(i){
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
        return iw;
    }
    //´´½¨Ò»¸öIcon
    function createIcon(json){
        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
        return icon;
    }
    
    initMap();//´´½¨ºÍ³õÊ¼»¯µØÍ¼