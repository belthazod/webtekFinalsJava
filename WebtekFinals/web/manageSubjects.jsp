<%-- 
    Document   : manageSubjects
    Author     : Belthazod
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><%@ page import="java.io.*,java.util.*,java.sql.*"%>
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
<html>
    <head>
        <title>Webtek Project Finals</title>
        <jsp:include page="WEB-INF/head-elements.jsp" />
    </head>
    <body>
        <div class='container'>
        <jsp:include page="WEB-INF/nav-elements.jsp" />
        
        <sql:setDataSource var="database" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/enrollment"
     user="root"  password=""/>
        
        <sql:query dataSource="${database}"  var="semesterResult" >
            SELECT semester, schoolYear, enrolleeCount, status, semester_id FROM semester WHERE semester_id = ?;
            <sql:param value="${param.semester}" />
        </sql:query>
            
        <sql:query dataSource="${database}"  var="subjectsResult" >
            SELECT classcode, days, time, room, slots, reserved, enrolled, status, schoolid, courseno, description, units FROM class JOIN course USING(courseno) WHERE semester_id = ?;
            <sql:param value="${param.semester}" />
        </sql:query>
        <sql:query dataSource="${database}"  var="dissolvedSubjectsResult" >
            SELECT classcode FROM class WHERE semester_id = ? AND status = 'DISSOLVED';
            <sql:param value="${param.semester}" />
        </sql:query>
            <sql:query dataSource="${database}"  var="closedSubjectsResult" >
            SELECT classcode FROM class WHERE semester_id = ? AND status = 'CLOSED';
            <sql:param value="${param.semester}" />
        </sql:query>
            <c:forEach var="row" items="${semesterResult.rows}">
        <ol class="breadcrumb">
            <li><a href="manageSubjects.jsp?semester=<c:out value="${row.semester_id}"/>"><c:out value="${row.semester}"/> <c:out value="${row.schoolYear}"/></a></li>
        </ol>
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Subjects for this semester</h3>
            </div>
            <div class="example_result notranslate panel-body">

                 <ul class="list-group col-md-2">
                    <li class="list-group-item">
                      <span class="badge"><c:out value="${row.enrolleeCount}"/></span>
                      Total enrollees
                    </li>
                </ul>
                <ul class="list-group col-md-2">
                    <li class="list-group-item">
                      <span class="badge" id="totalSubjects">${subjectsResult.rowCount}</span>
                      Total subjects
                    </li>
                </ul>
                <ul class="list-group col-md-2">
                    <li class="list-group-item">
                      <span class="badge" id="totalSubjects">${dissolvedSubjectsResult.rowCount}</span>
                      Dissolved
                    </li>
                </ul>
                <ul class="list-group col-md-2">
                    <li class="list-group-item">
                      <span class="badge" id="totalSubjects">${closedSubjectsResult.rowCount}</span>
                      Closed
                    </li>
                </ul>
                      <div class="row">
                <div class="col-md-4">
                    <div class="input-group">

                      <input type="text" class="form-control" placeholder="Search for...">
                      <span class="input-group-btn">
                        <button class="btn btn-default" type="button">Go!</button>
                      </span>
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->
                <div class="dropdown btn-toolbar col-md-1">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                      Filter subjects
                      <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="manageSubjects.jsp?semester=<c:out value="${row.semester_id}&filter=OPEN"/>">Open</a></li>
                      <li class="divider"></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="manageSubjects.jsp?semester=<c:out value="${row.semester_id}&filter=OPEN TO SCHOOL"/>">Open to school</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="manageSubjects.jsp?semester=<c:out value="${row.semester_id}&filter=OPEN TO ALL"/>">Open to all schools</a></li>
                      <li class="divider"></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="manageSubjects.jsp?semester=<c:out value="${row.semester_id}&filter=DISSOLVED"/>">Dissolved</a></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="manageSubjects.jsp?semester=<c:out value="${row.semester_id}&filter=CLOSED"/>">Closed</a></li>
                      <li class="divider"></li>
                      <li role="presentation"><a role="menuitem" tabindex="-1" href="manageSubjects.jsp?semester=<c:out value="${row.semester_id}"/>">All</a></li>
                    </ul>
                </div>
                  </div>
                <table class="table table-bordered table-striped" id="subjectsTable">
                <thead>
                    <tr>
                      <th title="Click this to sort this table by Classcode">Classcode</th>
                      <th title="Click this to sort this table by Course Number">Course No</th>
                      <th title="Click this to sort this table by Days">Days</th>
                      <th title="Click this to sort this table by Schedule">Time</th>
                      <th title="Click this to sort this table by Classroom">Room</th>
                      <th title="Click this to sort this table by Slots">Slots</th>
                      <th title="Click this to sort this table by the number of reserved slots">Reserved</th>
                      <th title="Click this to sort this table by the number of enrolled students">Enrolled</th>
                      <th title="Click this to sort this table by subject status">Status</th>
                    </tr>
                </thead>
                <tbody id="subjectsTBody">
                <c:forEach var="classesRow" items="${subjectsResult.rows}">
                    <c:choose>
                    <c:when test="${param.filter == null}">
                    <tr>
                        
                        <td><a href='viewClass.jsp?code=<c:out value="${classesRow.classcode}"/>&semester=<c:out value="${param.semester}"/>'><c:out value="${classesRow.classcode}"/></a></td>
                        <td type="text" class="popover-hide" 
      title="<c:out value="${classesRow.courseno}"/>" data-container="body" data-html="true"
      data-toggle="popover" data-placement="right" 
      data-content="<c:out value="${classesRow.description}"/><hr><c:out value="${classesRow.units}"/> units"  data-trigger="hover"><c:out value="${classesRow.courseno}"/></td>
                        <td><c:out value="${classesRow.days}"/></td>
                        <td><c:out value="${classesRow.time}"/></td>
                        <td><c:out value="${classesRow.room}"/></td>
                        <td><c:out value="${classesRow.slots}"/></td>
                        <td><c:out value="${classesRow.reserved}"/></td>
                        <td><c:out value="${classesRow.enrolled}"/></td>
                        
                        <td><c:out value="${classesRow.status}"/></td>
                        
                    </tr>
                    </c:when>
                    <c:when test="${param.filter != null && param.filter == 'OPEN' && (classesRow.status == 'OPEN TO SCHOOL' || classesRow.status == 'OPEN TO ALL')}">
                    <tr>
                        
                        <td><a href='viewClass.jsp?code=<c:out value="${classesRow.classcode}"/>&semester=<c:out value="${param.semester}"/>'><c:out value="${classesRow.classcode}"/></a></td>
                        <td><c:out value="${classesRow.courseno}"/></td>
                        <td><c:out value="${classesRow.days}"/></td>
                        <td><c:out value="${classesRow.time}"/></td>
                        <td><c:out value="${classesRow.room}"/></td>
                        <td><c:out value="${classesRow.slots}"/></td>
                        <td><c:out value="${classesRow.reserved}"/></td>
                        <td><c:out value="${classesRow.enrolled}"/></td>
                        <td><c:out value="${classesRow.status}"/></td>
                        
                    </tr>
                    </c:when>
                    <c:when test="${param.filter != null && param.filter == classesRow.status}">
                    <tr>
                        
                        <td><a href='viewClass.jsp?code=<c:out value="${classesRow.classcode}"/>&semester=<c:out value="${param.semester}"/>'><c:out value="${classesRow.classcode}"/></a></td>
                        <td><c:out value="${classesRow.courseno}"/></td>
                        <td><c:out value="${classesRow.days}"/></td>
                        <td><c:out value="${classesRow.time}"/></td>
                        <td><c:out value="${classesRow.room}"/></td>
                        <td><c:out value="${classesRow.slots}"/></td>
                        <td><c:out value="${classesRow.reserved}"/></td>
                        <td><c:out value="${classesRow.enrolled}"/></td>
                        <td><c:out value="${classesRow.status}"/></td>
                        
                    </tr>
                    </c:when>

                    </c:choose>
                </c:forEach>
                </tbody>
                    
                   
                </table>
                
            </div>
                <div class="panel-footer">School of Computing & Information Sciences - <c:out value="${row.semester}"/> <c:out value="${row.schoolYear}"/></div>
                </c:forEach>
            </div>
                    
            </div>
        </div>
        <jsp:include page="WEB-INF/footer-elements.jsp" />
        <script>
            $(document).ready(function() 
                { 
                    $("#subjectsTable").tablesorter();
                    $(function () { $('.popover-show').popover('show');});
                    $(function () { $('.popover-show').popover('show');});
                    $(function () { $('.popover-toggle').popover('toggle');});
                    $(function () { $('.popover-hide').popover('hide');});
                } 
            );

            var nav = document.getElementById("navigation");
            nav.getElementsByTagName("li")[2].className += "active";
            
            /*var tbody = document.getElementById("subjectsTBody");
            var count = tbody.getElementsByTagName("tr").length;
            document.getElementById("totalSubjects").innerHTML=count;
            tbody.getElements*/
        </script>
    </body>
</html>
