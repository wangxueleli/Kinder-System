<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<c:if test="${chargingList==null}">
    <c:redirect url="chargingServlet?#"></c:redirect>
</c:if>
<head>
    <title>平安托儿所</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css">
    <link rel="stylesheet" href="css/uniform.css">
    <link rel="stylesheet" href="css/select2.css">
    <link rel="stylesheet" href="css/unicorn.main.css">
    <link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color">
    <link rel="stylesheet" href="css/mycss.css">
    <link rel="stylesheet" href="css/hc.charging.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
<div id="header">
    <h1>
        <a href="javascript:window.open('dashboard.html');">平安托儿所</a>
    </h1>
</div>

<%--<div id="user-nav" class="navbar navbar-inverse">--%>
    <%--<ul class="nav btn-group">--%>
        <%--<li>--%>
            <%--<a title="" href="">--%>
                <%--<i class="icon icon-user"></i>--%>
                <%--<span class="text">管理员</span>--%>
            <%--</a>--%>
        <%--</li>--%>
        <%--<li>--%>
            <%--<a title="" href="login.jsp">--%>
                <%--<i class="icon icon-share-alt"></i>--%>
                <%--<span class="text">退出</span>--%>
            <%--</a>--%>
        <%--</li>--%>
    <%--</ul>--%>
<%--</div>--%>

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
        <a href="index.jsp" title="" class="tip-bottom">
            <i class="icon-home"></i> 首页</a>
        <a href="" class="current">收费管理</a>
        <a href="" class="current">收费项目</a>
    </div>
    <div class="row-fluid">
        <div class="span12" style="position: absolute">
            <button class="btn btn-info btn-mini update" style="margin:15px 0 0 10px;">批量修改</button>
            <div class="widget-box">
                <div class="widget-title">
                    <div style="padding: 8px 0 0 5px"><font style="line-height:20px">请勾选修改>></font></div>
                </div>
                <div class="widget-content nopadding">
                    <table id="tab" class="table table-bordered data-table">
                        <thead>
                        <tr>
                            <th width="10%"><input type="checkbox" name="" id="checkall">全选</th>
                            <th width="20%">编号</th>
                            <th width="20%">收费种类</th>
                            <th width="20%">费用</th>
                            <th width="30%">备注</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${chargingList!=null}">
                            <c:forEach items="${chargingList}" var="charging">
                                <tr>
                                    <td><input type="checkbox" name=""></td>
                                    <td>${charging.id}</td>
                                    <td>${charging.priceType}</td>
                                    <td>${charging.price}</td>
                                    <td>${charging.description}</td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="span12 divhidden" style="position: relative; left:-20px;top: 11px; display: none">
            <div class="widget-box">
                <div class="widget-title">
								<span class="icon">
									<i class="icon-align-justify"></i>
								</span>
                    <h5><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">收费项目 &nbsp;>&nbsp;  修改</font></font>
                    </h5>
                </div>
                <div class="widget-content nopadding">
                    <div class="page-message" style="margin: 20px 0 0 15px"></div>
                    <form action="#" method="get" class="form-horizontal">
                        <br>
                        <div class="control-group">
                            <label class="control-label"><font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">编号</font></font></label>
                            <div class="controls">
                                <input type="text" style="border:none;" readonly="readonly">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"><font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">收费种类</font></font></label>
                            <div class="controls">
                                <input type="text" style="border:none;" readonly="readonly">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"><font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">费用</font></font></label>
                            <div class="controls">
                                <input type="text">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"><font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">备注</font></font></label>
                            <div class="controls">
                                <textarea></textarea>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button  class="btn btn-primary saveall">全部保存</button>
                            <button  class="btn btn-primary pre">上一条</button>
                            <button  class="btn btn-primary next">下一条</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.ui.custom.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.uniform.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/unicorn.js"></script>
<script src="js/unicorn.tables.js"></script>
<script src="js/hc.charging.js"></script>
</body>

</html>