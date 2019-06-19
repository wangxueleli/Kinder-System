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
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
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
<!--/meta 作为公共模版分离出去-->

<title>添加课程</title>
<meta name="keywords" content="H-ui.admin 3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin 3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body onload="getGrade();getTeacher();">
<article class="page-container">
	<form  method="post" class="form form-horizontal" id="form-member-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>周几：</label>
			<div class="formControls col-xs-8 col-sm-6">
				<select type="text" class="input-text" onchange="weektime(this)" id="week" name="week">
				<option>${lesson.weekTime}</option>
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>第几节</label>
			<div class="formControls col-xs-8 col-sm-6">
				<select type="text" class="input-text"  onchange="pootime(this)" id="potime" name="potime">>
				<option>${lesson.poTime}</option>
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>年级：</label>
			<div class="formControls col-xs-8 col-sm-6">
				<select type="text" class="input-text" onchange="getClass(this)" name="classType" id="grade">
				<option>${lesson.classType}</option>
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>班级：</label>
			<div class="formControls col-xs-8 col-sm-6">
				<select type="text" class="input-text"  name="className" id="class">
				<option>${lesson.className}</option>
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>老师：</label>
			<div class="formControls col-xs-8 col-sm-6">
				<select type="text" class="input-text" onchange="getCourse(this)"  name="teacher" id="teacher">
				<option>${lesson.teacherName}</option>			
				</select>				
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>课程：</label>
			<div class="formControls col-xs-8 col-sm-6">			
				<select type="text" class="input-text"  name="course" id="course">
				<option>${lesson.courseName}</option>
				</select>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" id="sub" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
function weektime(elem){
	var  valueName=elem.value;
	 //请求Ajax
		$.get("LessonServlet/selectweek", { weektime: valueName }
			 );
}
function pootime(elem){
	var  valueName=elem.value;
	 //请求Ajax
		$.get("LessonServlet/selectpoo", { pootime: valueName }
			 );
}
function getGrade() {
	$.getJSON("LessonServlet/getgrade",function(Provinces) {
						//获得所有部门
						var Province = document.getElementById("grade");
						//Province.innerHTML = "<option>请选择</option>";
						for (i = 0; i < Provinces.length; i++) {//arryProvince[i]=1:java部门
							Province.innerHTML += "<option>"
									+ Provinces[i].classType + "</option>";
						}
					});
}
function getClass(name) {
	var id=name.value;
	$.getJSON("LessonServlet/getclass",{id:id},function(Provinces) {
						//获得所有部门
						var Province = document.getElementById("class");
						Province.innerHTML = "<option>请选择</option>";
						for (i = 0; i < Provinces.length; i++) {//arryProvince[i]=1:java部门
							Province.innerHTML += "<option>"
									+ Provinces[i].name + "</option>";
						}
					});
}
function getTeacher() {
	$.getJSON("LessonServlet/getteacher",function(Provinces) {
						//获得所有部门
						var Province = document.getElementById("teacher");
						//Province.innerHTML = "<option>请选择</option>";
						for (i = 0; i < Provinces.length; i++) {//arryProvince[i]=1:java部门
							Province.innerHTML += "<option>"
									+ Provinces[i].name + "</option>";
						}
					});
}

function getCourse(name) {
	var id=name.value;
	$.getJSON("LessonServlet/getthcourse",{id:id},function(Provinces) {
						//获得所有部门
						var Province = document.getElementById("course");
						Province.innerHTML = "";
						for (i = 0; i < Provinces.length; i++) {//arryProvince[i]=1:java部门
							Province.innerHTML += "<option>"
									+ Provinces[i].course + "</option>";
						}
					});
}

$(function() {
	$("#sub").click(function(){
	var week=$("#week").val();
	var potime=$("#potime").val();
	var classType=$("#grade").val();
	var className=$("#class").val();
	var teacher=$("#teacher").val();
	var course=$("#course").val()
	$.ajax({
		type: 'get',
		url: 'LessonServlet/updatelesson',
		dataType:'text',
		data:{ "week":week,"potime":potime,"classType":classType,"className":className,"teacher":teacher,"course":course},
		success: function() {
		window.parent.location.reload();
		}
	  });
   });
})
/* $(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	/* $("#form-member-add").validate({
		rules:{
			username:{
				required:true,
				minlength:2,
				maxlength:16
			},
			sex:{
				required:true,
			},
			mobile:{
				required:true,
				isMobile:true,
			},
			email:{
				required:true,
				email:true,
			},
			uploadfile:{
				required:true,
			},
			
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			//$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			//parent.$('.btn-refresh').click();
			parent.layer.close(index);
		}
	}); 
}); */
</script> 
</body>
</html>