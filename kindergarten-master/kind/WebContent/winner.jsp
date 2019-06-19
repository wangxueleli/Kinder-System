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
<%

		HttpSession sess = request.getSession();

		String message2 = (String)sess.getAttribute("message2");

	

	if(message2 == ""||message2 == null){

		%>

 

		<%

	}else{

		%>

			 <script type="text/javascript">

					alert("<%=message2 %>");

			 </script>

		<%

		sess.setAttribute("message2", "");

	}

 %>
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
        <a href="" class="current">校园荣誉</a>
    </div>


    <p>
        <div class="bu_01">
            <button type="button" onclick="showLayer(layer)" class="btn btn-success">添加</button>

    <div class="btn-group">
        <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            查询 <span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
            <li><a href="CertificateServlet/select?wx=0">全部</a></li>
            <li><a href="CertificateServlet/select?wx=1">推送</a></li>
            <li><a href="CertificateServlet/select?wx=2">未推送</a></li>
        </ul>
    </div>
            <button type="button" class="btn btn-danger" id="deleteAll">删除</button>
        </div>
    <div id="legend">
        <legend>&nbsp;&nbsp;&nbsp;&nbsp;校园荣誉：</legend>
    </div>
    <table id="customer" class="table table-bordered">
        <thead>
        <tr>
            <th style="vertical-align: middle" onselectstart="return false" onselect="document.selection.empty()">
                <div class="controls">
                    <!-- Multiple Checkboxes -->
                    <label class="checkbox">
                        <input type="checkbox" id="all">
                        编号
                    </label></div></th>
            <th style="vertical-align: middle" onselectstart="return false" onselect="document.selection.empty()" ><label>教师风采</label></th>
            <th style="vertical-align: middle" onselectstart="return false" onselect="document.selection.empty()"><label>最后修改时间</label></th>
            <th style="vertical-align: middle" onselectstart="return false" onselect="document.selection.empty()" ><label>微信推送</label></th>
            <th style="vertical-align: middle" onselectstart="return false" onselect="document.selection.empty()"><label>操作</label></th>
        </tr>
        </thead>
          <tbody>
        <c:forEach items="${cer}" var="cer">
        <tr>
            <td onselectstart="return false" onselect="document.selection.empty()" style="text-align: center; vertical-align: middle"><label class="checkbox"><input type="checkbox"  name="id" value="${cer.id}"/>${cer.id}</label></td>
            <td style="text-align: center; vertical-align: middle"  width="500px"><div class="teacher_image"><img src="${cer.imgurl}"></div><div class="teacher_words"><textarea  style="width:200px;height:90px;" name="bigdec" readonly>    ${cer.bigdec}</textarea></div></td>
            <td onselectstart="return false" onselect="document.selection.empty()"style="text-align: center; vertical-align: middle">${cer.timeing}</td>
            <td onselectstart="return false" onselect="document.selection.empty()" style="text-align: center; vertical-align: middle">
                           <c:if test="${cer.wx eq'1'}">是</c:if> 
                            <c:if test="${cer.wx eq'2'}">否</c:if>
        
            </td>
            <td onselectstart="return false" onselect="document.selection.empty()" style="text-align: center; vertical-align: middle">
                  <a href="CertificateServlet/selectbean?id=${cer.id}" class="btn btn-warning">修改</a>
                            
            </td>
        </tr>
        </c:forEach>
          </tbody>
    </table>
    <div id="cover">

    </div>
    <div id="layer" style="width: 950px;height: 450px;background-color: white">
	    <form class="form-horizontal" style="margin-top: 50px" action="CertificateServlet/addtext" method="post" enctype="multipart/form-data">
	        <legend>&nbsp;&nbsp;&nbsp;&nbsp;添加校园荣誉：</legend>
	        <div class="control-group">
	                <label class="control-label">照片：</label>
	                <!-- File Upload -->
	                <div class="controls">
	                    <input class="input-file" id="fileInput" type="file" name="imgurl" required="required">
	                </div>
	            </div>
	        <div class="control-group">
	            <!-- Text input-->
	            <label class="control-label">简介：</label>
	            <div class="controls">
	                <div class="textarea">
	                    <textarea type="" name="bigdec" required="required"> </textarea>
	                </div>
	            </div>
	        </div>
	        <div class="control-group">
	            <label class="control-label">是否推送微信：</label>
	            <div class="controls">
	                <!-- Inline Radios -->
	                <label class="radio inline">
	                    <input name="wx" type="radio" checked="checked" value="1">
	                    是
	                </label>
	                &nbsp;
	                <label class="radio inline">
	                    <input name="wx" type="radio" value="2">
	                    否
	                </label>
	            </div>
	        </div>
	        <div class="control-group">
	            <!-- Button -->
	            <div class="controls">
	                <input type="submit" class="btn" value="添加">
	                <a class="btn" onclick="hideLayer(layer)">取消</a>
	            </div>
	        </div>
	    </form>
	</div>     
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
<script type="text/javascript" src="js/jquery-1.8.2.js" ></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js" language="JavaScript"></script>
<script>
    $(function() {
        //全选
        $("#all").click(function () {
            //除开第一个所有的checkbox
            $("input:checkbox:not(:first)").prop("checked", this.checked);
        });
        $("#deleteAll").click(function(){
        	
            //除开第一个所有的被选中的checkbox
            var deleteAll=$("input:checkbox:not(:first):checked");
            
            //判断是否有选中的
            if(deleteAll.length==0){
                alert("您没有选中任何数据");
            }else{
            	var arrId="";
                //选中循环id
                $.each(deleteAll, function(i,obj) {
                	arrId+=(obj.value+",");
                    
                });
               	
                //提交
                window.location.href="CertificateServlet/delete?arrId="+arrId;
            }

        });
        $("#customer").dataTable({
        	"aoColumnDefs": [ { "bSortable": false, "aTargets": [ 0 ] }],
        	"aaSorting": [[2,'desc']],
        	bLengthChange: false,
        	"sDom":'<"top"i>rt<"bottom"flp><"clear">',  
        	"autoWidth": false,
			   "iDisplayLength":3,
				"bJQueryUI": false,
				"sPaginationType": "full_numbers",

				 /*语言设置*/  
             "oLanguage": {  
                 "sLengthMenu": "每页显示 _MENU_条",  
                 "sZeroRecords": "没有找到符合条件的数据",  
                 "sInfo": "当前第 _START_ - _END_ 条　共计 _TOTAL_ 条",  
                 "sInfoEmpty": "木有记录",  
                 "sInfoFiltered": "(从 _MAX_ 条记录中过滤)",  
                 "sSearch": "搜索：",  
                 "oPaginate": {  
                     "sFirst": "首页",  
                     "sPrevious": "前一页",  
                     "sNext": "后一页",  
                     "sLast": "尾页"  
                 }  
             }  

			});
     
    })
    function showLayer(id) {
        var left = ($(window).width() - $(id).width())/2-130;
        var top  = ($(window).height() - $(id).height())/2-80;
        $('#cover').css('display','block'); //显示遮罩层
        $('#cover').css('height',$(window).height()+'px'); //设置遮罩层的高度为当前页面高度

        $(id).css({"top": top, "left": left, "display": "block"});
    }
  

    function hideLayer(id) {
        $(id).css({"display": "none"});
        $('#cover').css('display','none');
    }
 
</script>
</body>

</html>