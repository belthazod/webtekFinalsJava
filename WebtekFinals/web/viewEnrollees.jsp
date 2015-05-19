<%-- 
    Document   : viewEnrollees
    Created on : 05 19, 15, 8:52:09 PM
    Author     : Belthazod
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    String semester = request.getParameter("semester");
        if(semester == null){
          response.sendRedirect("manageEnrollment.jsp");
    }
     
%> 
<!DOCTYPE html>
<sql:setDataSource var="database" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/enrollment"
     user="root"  password=""/>
        
        <sql:query dataSource="${database}"  var="semesterResult" >
            SELECT semester, schoolYear, enrolleeCount, status, semester_id FROM semester WHERE semester_id = ?;
            <sql:param value="${param.semester}" />
        </sql:query>
        <sql:query dataSource="${database}"  var="enrolleeResult" >
            SELECT enrolid FROM enrollment JOIN enrollmentdetails USING(enrolid) WHERE semester_id = ? AND status = 'enrolled';
            <sql:param value="${param.semester}" />
        </sql:query>
        <sql:query dataSource="${database}"  var="reservedResult" >
            SELECT enrolid FROM enrollment  JOIN enrollmentdetails USING(enrolid) WHERE semester_id = ? AND status = 'reserved';
            <sql:param value="${param.semester}" />
        </sql:query>
        <sql:query dataSource="${database}"  var="semesterEnrolleeResult" >
            SELECT DISTINCT(enrolid), lastname, firstname, totalunits, status, date, idno FROM enrollment LEFT JOIN enrollmentdetails USING(enrolid) JOIN student USING(idno) WHERE semester_id = ?;
            <sql:param value="${param.semester}" />
        </sql:query>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Webtek Project</title>
        <jsp:include page="WEB-INF/head-elements.jsp" />
    </head>
    <body>
        <div class='container'>
            <jsp:include page="WEB-INF/nav-elements.jsp" />
            <c:forEach items="${semesterResult.rows}" var="semester">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Students enrolled in <c:out value="${semester.semester}"/> <c:out value="${semester.schoolYear}"/> </h3>
                </div>
                <div class="panel-body">
                    <div class="col-md-12">
                     <ul class="list-group col-md-2">
                        <li class="list-group-item">
                          <span class="badge"><c:out value="${semester.enrolleeCount}"/></span>
                          Total enrollees
                        </li>
                    </ul>
                    <ul class="list-group col-md-2">
                        <li class="list-group-item">
                          <span class="badge" id="totalSubjects">${reservedResult.rowCount}</span>
                          Total reserved
                        </li>
                    </ul>
                    </div>
                    <table id="enrolleesTable" class='table table-bordered table-striped'>
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Id number</th>
                                <th>Student name</th>
                                <th>Units Enrolled</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${semesterEnrolleeResult.rows}" var="semEnrollee">
                                <tr>
                                    <td><c:out value="${semEnrollee.date}"/></td>
                                    <td><c:out value="${semEnrollee.idno}"/></td>
                                    <td><c:out value="${semEnrollee.lastname}"/>, <c:out value="${semEnrollee.firstname}"/></td>
                                    <td><c:out value="${semEnrollee.totalunits}"/></td>
                                    <td><c:out value="${semEnrollee.status}"/></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            </c:forEach>     
        </div>
            <jsp:include page="WEB-INF/footer-elements.jsp" />
        <script>
            $(document).ready(function() 
                { 
                    $("#enrolleesTable").tablesorter();
                    $(function () { $('.popover-show').popover('show');});
                    $(function () { $('.popover-show').popover('show');});
                    $(function () { $('.popover-toggle').popover('toggle');});
                    $(function () { $('.popover-hide').popover('hide');});
                } 
            );
        </script>
    </body>
</html>
