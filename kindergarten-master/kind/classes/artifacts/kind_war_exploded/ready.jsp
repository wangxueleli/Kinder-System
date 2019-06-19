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

		String message5 = (String)sess.getAttribute("message5");

	

	if(message5 == ""||message5 == null){

		%>

 

		<%

	}else{

		%>

			 <script type="text/javascript">

					alert("<%=message5 %>");

			 </script>

		<%

		sess.setAttribute("message5", "");

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
        <a href="" class="current">预约报名：</a>
    </div>
    
    <p>
    <div class="bu_01">
        <button type="button" onclick="showLayer(layer)" class="btn btn-success">设置预约人数</button>

        <button type="button" class="btn btn-danger" id="deleteAll">删除记录</button>
       
    </div>
    <div id="legend">
        <legend>&nbsp;&nbsp;&nbsp;&nbsp;预约信息： 
         <c:forEach items="${listlimt}" var="listlimt">
        <span style="font-size: 12px">${listlimt[3]}预约上限：${listlimt[2]}&nbsp;&nbsp;&nbsp;&nbsp;</span>
        </c:forEach>
        </legend>
        
    </div>
    <table id="customer" class="table table-bordered" contenteditable="true">
        <thead>
        <tr>
            <th style="vertical-align: middle" onselectstart="return false" onselect="document.selection.empty()">
                <div class="controls">
                    <!-- Multiple Checkboxes -->
                    <label class="checkbox">
                        <input type="checkbox" id="all">
                        编号
                    </label></div></th>
            <th style="vertical-align: middle" onselectstart="return false" onselect="document.selection.empty()" ><label>预约班级</label></th>
            <th style="vertical-align: middle" onselectstart="return false" onselect="document.selection.empty()"><label>预约时间</label></th>
            <th style="vertical-align: middle" onselectstart="return false" onselect="document.selection.empty()" ><label>家长姓名</label></th>
            <th style="vertical-align: middle" onselectstart="return false" onselect="document.selection.empty()" ><label>联系电话</label></th>
            
        </tr>
        </thead>
        <tbody>
         <c:forEach items="${listready}" var="listready">
        <tr>
            <td onselectstart="return false" onselect="document.selection.empty()" style="text-align: center; vertical-align: middle"><label class="checkbox"><input type="checkbox"  name="id" value="${listready[0]}"/>${listready[0]}</label></td>
            <td onselectstart="return false" onselect="document.selection.empty()"style="text-align: center; vertical-align: middle">${listready[5]}</td>
            <td onselectstart="return false" onselect="document.selection.empty()"style="text-align: center; vertical-align: middle">${listready[3]}</td>
            <td onselectstart="return false" onselect="document.selection.empty()"style="text-align: center; vertical-align: middle">${listready[1]}</td>
            <td onselectstart="return false" onselect="document.selection.empty()" style="text-align: center; vertical-align: middle">${listready[2]}</td>    
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <div id="cover">

    </div>
    <div id="layer" style="width: 950px;height: 450px;background-color: white;overflow:scroll;">
       
  <form class="form-horizontal" action="readyServlet/update" method="get" onsubmit="return checkAll()">
    <fieldset>
      <div id="legend" style="margin-left: 50px;margin-top: 50px">
        <legend>设置预约人数：</legend>
      </div>
      <input type="hidden" name="classid"  value="">
    <div class="control-group">

         <div class="dropdown" style="margin-left: 200px">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    选择年级
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
     <c:forEach items="${bclass}" var="bclass">
    <li><a href="javascript:bclass(${bclass[0]})"> ${bclass[1]}</a></li>
    </c:forEach>
  </ul>
</div>

        </div>

    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">年级：</label>
          <div class="controls">
            <input class="input-xlarge" type="text"  required="required" name="classname" readonly="readonly" value="">
           
          </div>
        </div>

    

    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">设置预约上限：</label>
          <div class="controls">
            <input class="input-xlarge" type="text"  required="required" name="sum" onblur="checkTel()" id="Tel">
           <span id="passTel"></span>
          </div>
        </div>

    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">已预约人数：</label>
          <div class="controls">
            <input class="input-xlarge" type="text" name="num" value="" required="required" readonly="readonly" id="Tle">
            
          </div>
        </div>

    <div class="control-group">
          

          <!-- Button -->
          <div class="controls">
            <input type="submit" class="btn btn-success" value="确定">
             <a class="btn" onclick="hideLayer(layer)">取消</a>
          </div>
        </div>

    </fieldset>
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
                window.location.href="readyServlet/delete?arrId="+arrId;
            }
        });
        $("#customer").dataTable({
        	"aoColumnDefs": [ { "bSortable": false, "aTargets": [ 0 ] }],
        	"aaSorting": [[2,'desc']],
        	bLengthChange: false,
        	"sDom":'<"top"i>rt<"bottom"flp><"clear">',  
        	"autoWidth": false,
			   "iDisplayLength":6,
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
     function bclass(id){
        	
            $.ajax({
                type: "POST",                           
                url: "readyServlet/ajaxselect",                             
                data: {id:id},
                dataType: "json", 
                success: function(result){
                	$("input[name='classid']").val(result[0][0]);
                	$("input[name='num']").val(result[0][3]);
                	$("input[name='classname']").val(result[0][2]);
                	$("input[name='sum']").val(result[0][1]);
                }
            });
           
        }
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
    function checkTel(){

		var tel = document.getElementById("Tel").value;

		var spanNode = document.getElementById("passTel");

		

		//编写邮箱的正则 123@qq.com  123@qq.net  123@qq.com.cn

		var reg = /^[0-9]*$/;  //\w表示单词字符 .表示任意一个字符，\.表示.

		if(reg.test(tel)){

			spanNode.innerHTML = "正确".fontcolor("green");

			return true;

		}else{

			spanNode.innerHTML = "错误,只能输入数字".fontcolor("red");

			return false;

		}

	}
    function checkAll(){

		var tel = checkTel();
		var tel2 = document.getElementById("Tel").value;
		var tel3 = document.getElementById("Tle").value;
		if(tel&&tel3<=tel2){

			return true;

		}else{
			alert("请输入正确数字或预约人数已超过设置人数")
			return false;

		}

	}
</script>
</body>

</html>