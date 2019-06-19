<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>


<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
	<link rel="stylesheet" href="css/colorpicker.css">
	<link rel="stylesheet" href="css/datepicker.css">
	<link rel="stylesheet" href="css/uniform.css">
	<link rel="stylesheet" href="css/select2.css">
	<link rel="stylesheet" href="css/unicorn.main.css">

	<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color">
	<link rel="stylesheet" href="css/mycss.css">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	
	
<title>托儿所</title>
</head>
<body>
    <%

		HttpSession sess = request.getSession();

		String message = (String)sess.getAttribute("message");

	

	if(message == ""||message == null){

		%>

 

		<%

	}else{

		%>

			 <script type="text/javascript">

					alert("<%=message %>");

			 </script>

		<%

		sess.setAttribute("message", "");

	}

 %>
	<div id="header">
			<img src="image/logo.png"/>
	</div>
	<!-- <div id="search">
		<input type="text" placeholder="请输入搜索内容...">
		<button type="submit" class="tip-right" title="Search">
			<i class="icon-search icon-white"></i>
		</button>
	</div> -->
	<div id="sidebar">
		<ul>
			<li class="active"><a href="index.jsp"> <i
					class="icon icon-home"></i> <span>首页</span>
			</a></li>
			<li class="submenu"><a href=""> <i class="icon icon-th-list"></i>
				<span>校园信息</span>
			</a>
				<ul>
					<li><a href="SchoolServlet/select">校园设置</a></li>
					<li>
						<a href="CertificateServlet/select?wx=0">校园荣誉</a>
					</li>
					<li><a href="TeacherServlet1/select?wx=0">教师风采</a></li>
					<li><a href="HomeworkServlet/select?wx=0">幼儿作品</a></li>
					<li><a href="readyServlet/select">预约报名</a></li>
				</ul></li>
			<li class="submenu"><a href=""> <i class="icon icon-th-list"></i>
				<span>考勤管理</span>
			</a>
				<ul>
					<li><a href="testimport.html">教师考勤</a></li>
					<li><a href="MorningCheck">学生考勤</a></li>
				</ul></li>
			<li class="submenu"><a href=""> <i class="icon icon-th-list"></i>
				<span>课表管理</span>
			</a>
				<ul>
					<li><a href="lessons.jsp">课程安排</a></li>
					<li><a href="teacherlesson.jsp">课表搜索</a></li>
				</ul></li>
			<li class="submenu"><a href=""> <i class="icon icon-th-list"></i>
				<span>教务管理</span>
			</a>
				<ul>
					<li><a href="grade.jsp">年级信息管理</a></li>
					<li><a href="class.jsp">班级信息管理</a></li>
					<li><a href="stuinformation">幼儿管理</a></li>
					<li><a href="teacherpage.jsp">教师信息管理</a></li>
				</ul></li>

			<li class="submenu"><a href=""> <i class="icon icon-th-list"></i>
				<span>收费管理</span>
			</a>
				<ul>
					<li><a href="charging.jsp">收费项目</a></li>
					<li><a href="record.jsp">收费记录</a></li>
				</ul></li>
			<li class="submenu">
				<a href="">
					<i class="icon icon-th-list"></i>
					<span>校车管理</span>
				</a>
				<ul>
					<li><a href="schoolBusMap.jsp">校车路线</a></li>
				</ul>
			</li>
			<li class="submenu"><a href=""> <i class="icon icon-th-list"></i>
				<span>日常事务管理</span>
			</a>
				<ul>
					<li><a href="activity.jsp">活动</a></li>
					<li><a href="recipe.jsp">食谱</a></li>
					<li><a href="accident.jsp">事故记录</a></li>
				</ul></li>

		</ul>
	</div>
	<div id="content">
		<div id="breadcrumb">
			<a href="" title="Go to Home" class="tip-bottom">
				<i class="icon-home"></i> 首页</a>
			<a href="" class="current">校园信息</a>
			<a href="" class="current">校园设置</a>
		</div>
		<p>
		<form class="form-horizontal" action="SchoolServlet/addtext" method="get" onsubmit="return checkAll()">

				<div id="legend">
					<legend>&nbsp;&nbsp;&nbsp;&nbsp;校园设置：</legend>
				</div>
				<div class="control-group">
					<!-- Text input-->
					<label class="control-label" >托儿所名称：</label>
					<div class="controls">
						<input class="input-xlarge" type="text" name="name" required="required" value="${school.name}" >
					</div>
				</div>
				<div class="control-group">
					<!-- Text input-->
					<label class="control-label" >一句话简介：</label>
					<div class="controls">
						<input class="input-xlarge" type="text" name="minidec" required="required" value="${school.minidec}">
					</div>
				</div>
				<div class="control-group">
					<!-- Text input-->
					<label class="control-label">详情：</label>
					<div class="controls">
						<div class="textarea">
							<textarea type="" name="bigdec" required="required">${school.bigdec}</textarea>
						</div>
					</div>
				</div>
				<div class="control-group">
					<!-- Text input-->
					<label class="control-label" >院长姓名：</label>
					<div class="controls">
						<input class="input-xlarge" type="text" name="leader" required="required" value="${school.leader}">

					</div>
				</div>
				<div class="control-group">
					<!-- Text input-->
					<label class="control-label" >联系电话：</label>
					<div class="controls">
						<input class="input-xlarge" type="text" name="tel" required="required" value="${school.tel}" id="Tel" onblur="checkTel()">
						<span id="passTel"></span>
					</div>
					
				</div>
				
				<div class="control-group">
					<!-- Text input-->
					<label class="control-label" >园区地址：</label>
					<div class="controls">
						<input class="input-xlarge" type="text" name="address" required="required" value="${school.address}">
					</div>
				</div>
				<div class="control-group">
					<!-- Button -->
					<div class="controls">
						<input type="submit" class="btn btn-success" value="修改">
					</div>
				</div>
				<input type="hidden" value="${school.id}" name="id">
		</form>
		</p>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.ui.custom.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrap-colorpicker.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.uniform.js"></script>
	<script src="js/select2.min.js"></script>
	<script src="js/unicorn.js"></script>
	<script src="js/unicorn.form_common.js"></script>
	<script type="text/javascript">
	function checkTel(){

		var tel = document.getElementById("Tel").value;

		var spanNode = document.getElementById("passTel");

		

		//编写邮箱的正则 123@qq.com  123@qq.net  123@qq.com.cn

		var reg = /^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\d{8}$/;  //\w表示单词字符 .表示任意一个字符，\.表示.

		if(reg.test(tel)){

			spanNode.innerHTML = "正确".fontcolor("green");

			return true;

		}else{

			spanNode.innerHTML = "错误,请输入11位手机号".fontcolor("red");

			return false;

		}

	} 
	function checkAll(){

		var tel = checkTel();


		if(tel){

			return true;

		}else{

			return false;

		}

	}
	
	</script>
</body>
</html>