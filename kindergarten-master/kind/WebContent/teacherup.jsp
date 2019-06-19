<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title></title>
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
    <link rel="stylesheet" href="css/teachercss.css">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="css/mycss.css">
</head>

<body>
<div id="header">

    <img class="img1" src="image/logo.png"/>

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
        <a href="" class="current">教师风采</a>
    </div>

	
	<div>
	            <form class="form-horizontal" style="margin-top: 50px" action="TeacherServlet1/update" method="post">
	          <legend>&nbsp;&nbsp;&nbsp;&nbsp;教师风采：</legend>
	          <div class="teacher_image" style="margin-left: 80px;"><img src="${teacher.imgurl}"></div>
	         <input name="id" type="hidden" value="${teacher.id}">
	        <div class="control-group">
	        
	            <!-- Text input-->
	            
	            <div class="controls">
	                <div class="textarea">
	                    <textarea style="height:80px" type="" name="bigdec" required="required">${teacher.bigdec} </textarea>
	                </div>
	            </div>
	        </div>
	        <div class="control-group">
	            <label class="control-label">是否推送微信：</label>
	            <div class="controls">
	                <!-- Inline Radios -->
	                <label class="radio inline">
	                    <input name="wx" type="radio" <c:if test="${teacher.wx eq'1'}">checked</c:if>  value="1">
	                    是
	                </label>
	                &nbsp;
	                <label class="radio inline">
	                    <input name="wx" type="radio" <c:if test="${teacher.wx eq'2'}">checked</c:if> value="2">
	                    否
	                </label>
	            </div>
	        </div>
	        <div class="control-group">
	            <!-- Button -->
	            <div class="controls">
	                <input type="submit" class="btn"value="修改">
	                <a class="btn" href="teacher.jsp">取消</a>
	            </div>
	        </div>
	    </form>
	</div>      
	
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
<script type="text/javascript" src="js/jquery-1.8.2.js" ></script>

</body>

</html>