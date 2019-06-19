<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=gdiGhuVmyMP5r09wFbG1aAnFPxbrgEli"></script>
	<title>校车线路 &nbsp</title>
</head>
<body>
	<div id="allmap"></div>
</body>
</html>
<script type="text/javascript" >
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	map.centerAndZoom(new BMap.Point(109.22 ,34.37), 16);
	var bounds = null;
	var linesPoints = null;
	 var spoi1 = new BMap.Point(109.220397,34.371649);    // 起点1临潼汽车站
	// var spoi2 = new BMap.Point(104.082356,30.516824);    // 起点2广都
	// var spoi3 = new BMap.Point(104.035887,30.528319);   //起点3西蜀人家
	 var epoi  = new BMap.Point(109.200131,34.373079);    // 终点西安科技大学
	var myIcon = new BMap.Icon("http://lbsyun.baidu.com/jsdemo/img/Mario.png", new BMap.Size(32, 70), {imageOffset: new BMap.Size(0, 0)});
	function initLine(){
		bounds = new Array();
		linesPoints = new Array();
		map.clearOverlays();                                                    // 清空覆盖物
		var driving3 = new BMap.DrivingRoute(map,{onSearchComplete:drawLine});  // 驾车实例,并设置回调
			driving3.search(spoi1, epoi);                                       // 搜索一条线路 &nbsp
		var driving4 = new BMap.DrivingRoute(map,{onSearchComplete:drawLine});  // 驾车实例,并设置回调
			driving4.search(spoi2, epoi);                                       // 搜索一条线路 &nbsp	
		var driving5 = new BMap.DrivingRoute(map,{onSearchComplete:drawLine});  // 驾车实例,并设置回调?
			driving5.search(spoi3, epoi);     									// 搜索一条线路 &nbsp	
	}
	function run(){
		for(var m = 0;m < linesPoints.length; m++){
			var pts = linesPoints[m];
			var len = pts.length;
			var carMk = new BMap.Marker(pts[0],{icon:myIcon});
			map.addOverlay(carMk);
			resetMkPoint(1,len,pts,carMk)
		}
		
		function resetMkPoint(i,len,pts,carMk){
			carMk.setPosition(pts[i]);
			if(i < len){
				setTimeout(function(){
					i++;
					resetMkPoint(i,len,pts,carMk);
				},100);
			}
		}
		
	}
	function drawLine(results){
		var opacity = 0.45;
		var planObj = results.getPlan(0);
		var b = new Array();
		var addMarkerFun = function(point,imgType,index,title){
			var url;
			var width;
			var height
			var myIcon;
			// imgType:1的场合，为起点和终点的图；2的场合为车的图形
			if(imgType == 1){
				url = "http://lbsyun.baidu.com/jsdemo/img/dest_markers.png";
				width = 42;
				height = 34;
				myIcon = new BMap.Icon(url,new BMap.Size(width, height),{offset: new BMap.Size(14, 32),imageOffset: new BMap.Size(0, 0 - index * height)});
			}else{
				url = "http://lbsyun.baidu.com/jsdemo/img/trans_icons.png";
				width = 22;
				height = 25;
				var d = 25;
				var cha = 0;
				var jia = 0
				if(index == 2){
					d = 21;
					cha = 5;
					jia = 1;
				}
				myIcon = new BMap.Icon(url,new BMap.Size(width, d),{offset: new BMap.Size(10, (11 + jia)),imageOffset: new BMap.Size(0, 0 - index * height - cha)});
			}
			
			var marker = new BMap.Marker(point, {icon: myIcon});
			if(title != null && title != ""){
				marker.setTitle(title);
			}
			// 起点和终点放在最上面
			if(imgType == 1){
				marker.setTop(true);
			}
			map.addOverlay(marker);
		}
		var addPoints = function(points){
			for(var i = 0; i < points.length; i++){
				bounds.push(points[i]);
				b.push(points[i]);
			}
		}	
		// 绘制驾车步行线路 &nbsp
		for (var i = 0; i < planObj.getNumRoutes(); i ++){
			var route = planObj.getRoute(i);
			if (route.getDistance(false) <= 0){continue;}
			addPoints(route.getPath());
			// 驾车线路 &nbsp
			if(route.getRouteType() == BMAP_ROUTE_TYPE_DRIVING){
				map.addOverlay(new BMap.Polyline(route.getPath(), {strokeColor: "#0030ff",strokeOpacity:opacity,strokeWeight:6,enableMassClear:true}));
			}else{
			// 步行线路 &nbsp有可能为0
				map.addOverlay(new BMap.Polyline(route.getPath(), {strokeColor: "#30a208",strokeOpacity:0.75,strokeWeight:4,enableMassClear:true}));
			}
		}	
		map.setViewport(bounds);	
		// 终点
		addMarkerFun(results.getEnd().point,1,1);
		// 开始点
		addMarkerFun(results.getStart().point,1,0);
		linesPoints[linesPoints.length] = b;
	}
	initLine();
	setTimeout(function(){
		run();
	},5000);//延迟
	map.enableScrollWheelZoom(true);	
</script>





/* -------------------------------添加站点------------------------------------- */
<!-- <script type="text/javascript">

// 编写自定义函数,创建标注
 function addMarker(point){
  var marker = new BMap.Marker(point);
  map.addOverlay(marker);
}
 /*-----------------------------地图标注站点位置-------------------------------- */
var point1 = new BMap.Point(104.065464,30.577336);addMarker(point1);/* 锦城公园 */
var point2 = new BMap.Point(104.064179,30.572124);addMarker(point2);/* 三圣乡 */
var point3 = new BMap.Point(104.063169,30.567188);addMarker(point3);/* 天府一街 */
var point4 = new BMap.Point(104.063205,30.562609);addMarker(point4);/* 航天城上城 */
var point5 = new BMap.Point(104.064521,30.557377);addMarker(point5);/* 天府二街 */
/* var point6 = new BMap.Point(104.066596,30.555737);addMarker(point6); *//* 国信安经纬度 */
var point7 = new BMap.Point(104.082356,30.516824);addMarker(point7);/* 广都 */
var point8 = new BMap.Point(104.076068,30.523544);addMarker(point8);/* 四河 */
var point9 = new BMap.Point(104.075853,30.531943);addMarker(point9);/* 华府大道 */
var point10 = new BMap.Point(104.075462,30.542861);addMarker(point10);/* 天府五街 */
var point11 = new BMap.Point(104.075166,30.552638);addMarker(point11);/* 天府三街 */	
var point12 = new BMap.Point(104.04297,30.531628);addMarker(point12);/* 西蜀人家 */
var point13 = new BMap.Point(104.05216,30.532289);addMarker(point13);/* 光明城市 */
var point14 = new BMap.Point(104.059894,30.53288);addMarker(point14);/* 益州国际 */
var point15 = new BMap.Point(104.063788,30.541341);addMarker(point15);/* 伏龙小区 */
var point16 = new BMap.Point(104.063344,30.549303);addMarker(point16);/* 银泰城 */
/* ----------------------------------------------- */ 
</script>
 -->







/* -------------------------------添加站点------------------------------------- */
<script type="text/javascript">
	// 百度地图API功能	
	map = new BMap.Map("allmap");
	map.centerAndZoom(new BMap.Point(109.22 ,34.37), 18);
	var data_info = [[109.213714,34.380945,"一号线路 &nbsp  巨王家居 车牌:川-A00001  司机:王远  随车老师:张成  上车4人" ],
	                 [109.211126,34.377429,"一号线路 &nbsp 西铁社区    <br> 上车:3人"],
	                 [109.201856,34.373138,"一号线路 &nbsp 西安科技大学    <br> 上车:2人"],

	                 [109.219391,34.377786,"二号线路 &nbsp  盛唐大厦 车牌:川-A00002  司机:王大力  随车老师:张成  上车4人"],
	                 [109.219319,34.375641,"二号线路 &nbsp 骊山大厦    <br> 上车:2人"],
	                 [109.1997,34.370934,"二号线路 &nbsp 西科大体育馆    <br> 上车:6人"],
	                 ]


	var opts = {
				width : 75,     // 信息窗口宽度
				height: 40,     // 信息窗口高度
				title : "" , // 信息窗口标题
				enableMessage:true//设置允许信息窗发送短息
			   };
	for(var i=0;i<data_info.length;i++){
		var marker = new BMap.Marker(new BMap.Point(data_info[i][0],data_info[i][1]));  // 创建标注
		var content = data_info[i][2];
		map.addOverlay(marker);               // 将标注添加到地图中
		addClickHandler(content,marker);
	}
	function addClickHandler(content,marker){
		marker.addEventListener("click",function(e){
			openInfo(content,e)}
		);
	}
	function openInfo(content,e){
		var p = e.target;
		var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
		var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
		map.openInfoWindow(infoWindow,point); //开启信息窗口
	}
	map.enableScrollWheelZoom(true);	
</script>
