<%-- 
    Document   : viewClass
    Created on : 05 18, 15, 7:43:35 PM
    Author     : Belthazod
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<%
    String semester = request.getParameter("semester");
    String code = request.getParameter("code");
        if(semester == null && code == null){
          response.sendRedirect("manageEnrollment.jsp");
    }
%>
<sql:setDataSource var="database" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/enrollment"
     user="root"  password=""/>

<sql:query dataSource="${database}"  var="semesterResult" >
    SELECT semester, schoolYear, enrolleeCount, status, semester_id FROM semester WHERE semester_id = ?;
    <sql:param value="${param.semester}" />
</sql:query>
<sql:query dataSource="${database}"  var="classResult" >
    SELECT classcode, days, time, room, slots, reserved, enrolled, status, schoolid, courseno, description, units FROM class JOIN course USING(courseno) WHERE classcode = ?;
    <sql:param value="${param.code}" />
</sql:query>
    
<sql:query dataSource="${database}"  var="classStudentsResult" >
    SELECT idno, lastname, firstname, year, status FROM (student JOIN enrollment USING(idno)) JOIN enrollmentdetails USING(enrolid) WHERE classcode = ?;
    <sql:param value="${param.code}" />
</sql:query>
            
<html>
    <head>
        <title>Webtek Project</title>
        <jsp:include page="WEB-INF/head-elements.jsp" />
    </head>
    <body>
        <div class='container'>
        <jsp:include page="WEB-INF/nav-elements.jsp" />
        <c:if test="${!empty param.update}">
            
            <div class="alert alert-success" role="alert">
                <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                <span class="sr-only">Success:</span>
                You have successfully updated the class status
            </div> 
        </c:if>
        <c:forEach var="row" items="${semesterResult.rows}">
            <ol class="breadcrumb">
                <li><a href="manageSubjects.jsp?semester=<c:out value="${row.semester_id}"/>"><c:out value="${row.semester} ${row.schoolYear}"/></a></li>
                <li><a href="viewClass.jsp?code=<c:out value="${param.code}"/>&semester=<c:out value="${row.semester_id}"/>"><c:out value="${param.code}"/></a></li>
            </ol>
            
        
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><c:out value="${param.code}"/> Subject details</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                <c:forEach var="classResultRows" items="${classResult.rows}">
                <h4 class="col-md-7"><c:out value="${param.code}"/> 
                    <span class="label label-default popover-hide" 
                  title="<c:out value="${classResultRows.courseno}"/>" data-container="body" data-html="true"
                  data-toggle="popover" data-placement="right" 
                  data-content="<c:out value="${classResultRows.description}"/><hr><c:out value="${classResultRows.units}"/> units"  data-trigger="hover"><c:out value="${classResultRows.courseno}"/></span>
                    <span class="label label-default"><c:out value="${classResultRows.time}"/> <c:out value="${classResultRows.days}"/></span>
                    <span class="label label-default"><c:out value="${classResultRows.room}"/></span>
                    <span class="label label-default"><c:out value="${classResultRows.status}"/></span>
                </h4>
                </div>
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <h5 onclick="revealChangeStatus()" id="changeStatusText">Change class status</h5>
                    </div>
                    <div class="panel-body changeStatusClosed" id="changeStatusBody">
                        <form action="UpdateClassStatus" method="POST">
                            <input name="classCode" type="hidden" value="<c:out value="${classResultRows.classcode}"/>">
                            <input name="semester" type="hidden" value="<c:out value="${row.semester_id}"/>">
                            <div class="radio col-md-3">
                              <label><input type="radio" name="optradio" <c:if test="${classResultRows.status == 'OPEN TO SCHOOL'}">checked</c:if> value="OPEN TO SCHOOL">Open to School</label>
                            </div>
                            <div class="radio col-md-3">
                              <label><input type="radio" name="optradio" <c:if test="${classResultRows.status == 'OPEN TO ALL'}">checked</c:if> value="OPEN TO ALL">Open to all</label>
                            </div>
                            <div class="radio col-md-3">
                              <label><input type="radio" name="optradio" <c:if test="${classResultRows.status == 'CLOSED'}">checked</c:if> value="CLOSED">Closed</label>
                            </div>
                            <div class="radio col-md-3">
                              <label><input type="radio" name="optradio" <c:if test="${classResultRows.status == 'DISSOLVED'}">checked</c:if> value="DISSOLVED">Dissolved</label>
                            </div>
                            <button type="submit" class="btn btn-default col-md-2 col-md-offset-10">Update</button>
                        </form>
                    </div>
                </div>
                            </c:forEach>
                
                <table class="table table-bordered table-striped" id="classTable">
                    <thead>
                        <tr>
                          <th title="Click this to sort this table by ID number">ID number</th>
                          <th title="Click this to sort this table by Name">Name</th>
                          <th title="Click this to sort this table by Year">Year</th>
                          <th title="Click this to sort this table by Schedule status">Sched status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${classStudentsResult.rows}" var="classStudentsRows">
                            <tr>
                                <td><c:out value="${classStudentsRows.idno}"/></td>
                                <td><c:out value="${classStudentsRows.lastname}" />, <c:out value="${classStudentsRows.firstname}" /></td>
                                <td><c:out value="${classStudentsRows.year}" /></td>
                                <td><c:out value="${classStudentsRows.status}" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="panel-footer">
                School of Computing and Information Sciences - <c:out value="${row.semester}"/> <c:out value="${row.schoolYear}"/>
            </div>
            </c:forEach>
        </div>
        </div>
        <jsp:include page="WEB-INF/footer-elements.jsp" />
        <script>
            $(document).ready(function() 
                { 
                    $("#classTable").tablesorter();
                    $(function () { $('.popover-show').popover('show');});
                    $(function () { $('.popover-show').popover('show');});
                    $(function () { $('.popover-toggle').popover('toggle');});
                    $(function () { $('.popover-hide').popover('hide');});
                } 
            );
            function revealChangeStatus(){
                $("#changeStatusBody").toggleClass("changeStatusClosed");
            }
        </script>
    </body>
</html>
