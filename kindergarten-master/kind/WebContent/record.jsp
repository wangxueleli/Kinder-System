<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<c:if test="${pageBean==null}">
    <c:redirect url="recordServlet"></c:redirect>
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
    <link rel="stylesheet" href="css/datepicker.css">
    <link rel="stylesheet" href="css/mycss.css">
    <link rel="stylesheet" href="css/hc.record.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
<div id="header">
    <h1>
        <a href="javascript:window.open('dashboard.html');">平安托儿所</a>
    </h1>
</div>

<div id="user-nav" class="navbar navbar-inverse">
    <ul class="nav btn-group">
        <li>
            <a title="" href="">
                <i class="icon icon-user"></i>
                <span class="text">管理员</span>
            </a>
        </li>
        <li>
            <a title="" href="login.jsp">
                <i class="icon icon-share-alt"></i>
                <span class="text">退出</span>
            </a>
        </li>
    </ul>
</div>

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
        <a href="" class="current">收费管理</a>
        <a href="" class="current">收费记录</a>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <br>
            <p>&nbsp;按条件查询>></p>
            <form action="recordServlet" class="selectfrom">
                &nbsp;流水号:<input type="text" name="id" value="" >&nbsp;
                学号:<input type="text" name="studentId" value="" style="width: 130px">&nbsp;
                学生姓名:<input type="text" name="studentName" value="">&nbsp;
                班级:<input type="text" name="clas" value="">
                <br>
                &nbsp;交费类型:<select name="priceType" multiple style="width: 130px">
                <option value="学费">学费</option>
                <option value="生活费">生活费</option>
                <option value="车费">车费</option>
            </select>&nbsp;
                是否交费:<select name="state">
                <option value="%">全 部</option>
                <option value="已缴费">已缴费</option>
                <option value="未缴费">未缴费</option>
            </select>
                记录人:<input type="text" name="person" value="" style="width: 130px">&nbsp;
                交费时间:<input type="text" name="time" data-date-format="yyyy-mm-dd" class="datepicker" value="" style="width: 130px">&nbsp;
                备注:<input type="text" name="description" value="" >
                <br>
                &nbsp;&nbsp;<input type="submit" class="btn btn-info" value="查询">&nbsp;&nbsp;<input type="button" class="btn btn-info" value="重置">
            </form>
            <div class="widget-box">
                <div class="widget-title">
                    <button class="btn btn-success btn-mini allsave" style="margin: 6px 6px">保存</button>
                </div>
                <div class="widget-content nopadding">
                    <table id="tabb" class="table table-bordered data-tablee">
                        <thead>
                        <tr>
                            <th width="5%">流水号</th>
                            <th width="5%">学号</th>
                            <th width="10%">学生姓名</th>
                            <th width="10%">班级</th>
                            <th width="10%">交费类型</th>
                            <th width="10%">是否交费</th>
                            <th width="10%">记录人</th>
                            <th width="15%">更新时间</th>
                            <th width="15%">备注</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${pageBean.recordList!=null}">
                            <c:if test="${fn:length(pageBean.recordList)==0}">
                                <tr><td colspan="3">没有符合条件的数据!</td></tr>
                            </c:if>
                            <c:forEach items="${pageBean.recordList}" var="record">
                                <tr>
                                    <td class="aaa">${record.id}</td>
                                    <td>${record.studentId}</td>
                                    <td>${record.studentName}</td>
                                    <td>${record.clas}</td>
                                    <td>${record.priceType}</td>
                                    <td class="Utdstate">${record.state}</td>
                                    <td class="Utdperson">${record.person}</td>
                                    <td class="Utdtime">${record.time}</td>
                                    <td class="Utddescription">${record.description}</td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        </tbody>
                    </table>
                </div>
                <div class="page-a" style="margin: 10px 10px">
                    <span>第${pageBean.currentPage}页/共${pageBean.pageCount}页</span>
                    &nbsp;&nbsp;&nbsp;
                    <a href="recordServlet?pageNum=${pageBean.currentPage-1}">上一页</a>

                    <c:forEach begin="${pageBean.beginPageIndex}" end="${pageBean.endPageIndex}" var="pageIndex">
                        <button><a href="recordServlet?pageNum=${pageIndex}">${pageIndex}</a></button>
                    </c:forEach>

                    <a href="recordServlet?pageNum=${pageBean.currentPage+1}">下一页</a>
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
<script src="js/bootstrap-colorpicker.js"></script>
<script src="js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/unicorn.form_common.js"></script>
<script src="js/hc.record.js"></script>
</body>

</html>