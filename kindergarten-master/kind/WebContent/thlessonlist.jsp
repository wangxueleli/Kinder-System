<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>课表搜索</title>
<script type="text/javascript" src="js/jquery-1.8.2.js" language="javaScript"></script>
		<script src="js/jquery.table2excel.js"></script>
<style type="text/css">
    table tr th{text-align:center;}
    .table td{text-align:center;}
</style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 课表管理 <span class="c-gray en">&gt;</span> 课表搜索<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">	
		<input type="text" value="" class="input-text" style="width:250px" placeholder="输入老师名字" id="teachername">
		<button  onclick="getKecheng()" type="button" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜老师</button>
		<input type="text" value="" class="input-text" style="width:250px" placeholder="输入年级" id="type">
		<input type="text" value="" class="input-text" style="width:250px" placeholder="输入班级" id="name">
		<button  onclick="getclass()" type="button" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜班级</button>
		<button type="button" class="btn btn-success radius" id="export"> 导出</button>
	</div>
	<div>
	<!-- 课程表对话框 -->
                      <h2 style="text-align: center;">课程表</h2>
                    <table  class="table table-bordered table-striped table-hover" style="height: 450px">                
                        <thead>
                            <tr style="text-align:center;">
                                <th scope="col" id="aaa"></th>
                                <th scope="col">星期一</th>
                                <th scope="col">星期二</th>
                                <th scope="col">星期三</th>
                                <th scope="col">星期四</th>
                                <th scope="col">星期五</th>
                            </tr>
                        </thead>

                        <tbody style="text-align: center;">
                            <tr style="height: 80px">
                                <th scope="row">上午第一节</th>
                                <td id="table_1_1"></td>
                                <td id="table_2_1"></td>
                                <td id="table_3_1"></td>
                                <td id="table_4_1"></td>
                                <td id="table_5_1"></td>

                            </tr>
                            <tr style="height: 80px">
                                <th scope="row">上午第二节 </th>
                                <td id="table_1_2"></td>
                                <td id="table_2_2"></td>
                                <td id="table_3_2"></td>
                                <td id="table_4_2"></td>
                                <td id="table_5_2"></td>
                            </tr>
                            <tr style="height: 80px">
                                <th scope="row">下午第一节</th>
                                <td id="table_1_3"></td>
                                <td id="table_2_3"></td>
                                <td id="table_3_3"></td>
                                <td id="table_4_3"></td>
                                <td id="table_5_3"></td>
                            </tr>
                            <tr style="height: 80px">
                                <th scope="row">下午第二节</th>
                                <td id="table_1_4"></td>
                                <td id="table_2_4"></td>
                                <td id="table_3_4"></td>
                                <td id="table_4_4"></td>
                                <td id="table_5_4"></td>
                            </tr>
                        </tbody>
                    </table>
	</div>
</div>
</body>
<script type="text/javascript">
$("#export").click(function() {
	$(".table").table2excel({
		type: "excel",
		escape: "false"
		//exclude: ".noExl",
		//name: "Excel Document Name",
		//filename: "myFileName",
		//exclude_img: true,
		//exclude_links: true,
		//exclude_inputs: true
	});
});

function getKecheng() {
	var name=$("#teachername").val();
	$.getJSON("LessonServlet/thlesson",{name:name},function(data) {
            //清空课程表
            for(var i=1;i<6;i++){
                for(var j=1;j<5;j++){
                    $("#table_"+j+"_"+i).html("");
                }
            }
            $("#aaa").html(name)
            //遍历课程表
            for (var i=0;i<data.length;i++) {
                $("#table_"+data[i].weekTime+"_"+data[i].poTime).html(data[i].courseName+"<br>"+data[i].classType+"<br>"+data[i].className);        
        }
    })
}

function getclass() {
	var type=$("#type").val();
	var name=$("#name").val();
	$.getJSON("LessonServlet/clalesson",{type:type,name:name},function(data) {
            //清空课程表
            for(var i=1;i<6;i++){
                for(var j=1;j<5;j++){
                    $("#table_"+j+"_"+i).html("");
                }
            }
            $("#aaa").html(type+"&emsp;"+name)
            //遍历课程表
            for (var i=0;i<data.length;i++) {
                $("#table_"+data[i].weekTime+"_"+data[i].poTime).html(data[i].courseName+"<br>"+data[i].teacherName);        
        }
    })
}
</script>
</html>