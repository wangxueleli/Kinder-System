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
<title>教师详情</title>
</head>
<body>
<div class="cl pd-20" style=" background-color:#5bacb6">
	<a href="updatephoto.jsp"><img class="avatar size-XL l" src="${teacher.img}"></a>
	<dl style="margin-left:80px; color:#fff">
		<dt>
			<span class="f-18">${teacher.name}</span>
		</dt>
	</dl>
</div>
<div class="pd-20">
	<table class="table">
		<tbody>
			<tr>
				<th class="text-r" width="80">性别：</th>
				<td>${teacher.sex}</td>
			</tr>
			<tr>
				<th class="text-r">年龄：</th>
				<td>${teacher.age}</td>
			</tr>
			<tr>
				<th class="text-r">手机：</th>
				<td>${teacher.phone}</td>
			</tr>
			<tr>
				<th class="text-r">科目：</th>
				<td>${teacher.course}</td>
			</tr>
			<tr>
				<th class="text-r">简介：</th>
				<td>${teacher.descri}</td>
			</tr>			
			<tr>
				<th class="text-r">入职时间：</th>
				<td>${teacher.intime}</td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>