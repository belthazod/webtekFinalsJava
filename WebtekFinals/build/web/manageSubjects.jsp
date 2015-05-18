<%-- 
    Document   : manageSubjects
    Author     : Belthazod
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

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
            SELECT semester, schoolYear, enrolleeCount, status FROM semester WHERE semester_id = ?;
            <sql:param value="${param.semester}" />
        </sql:query>
            
        <sql:query dataSource="${database}"  var="subjectsResult" >
            SELECT classcode, days, time, room, slots, reserved, enrolled, status, schoolid, courseno FROM class WHERE semester_id = ?;
            <sql:param value="${param.semester}" />
        </sql:query>
        <div class="example col-xs-12">
            <h2 class="example_head"> <c:forEach var="row" items="${semesterResult.rows}"><c:out value="${row.semester}"/> <c:out value="${row.schoolYear}"/></c:forEach></h2>
            <div class="example_result notranslate">
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
                <tbody>
                <c:forEach var="classesRow" items="${subjectsResult.rows}">
                    <tr>
                        <td><a href="viewClassStudents"><c:out value="${classesRow.classcode}"/></a></td>
                        <td><c:out value="${classesRow.courseno}"/></td>
                        <td><c:out value="${classesRow.days}"/></td>
                        <td><c:out value="${classesRow.time}"/></td>
                        <td><c:out value="${classesRow.room}"/></td>
                        <td><c:out value="${classesRow.slots}"/></td>
                        <td><c:out value="${classesRow.reserved}"/></td>
                        <td><c:out value="${classesRow.enrolled}"/></td>
                        <td><c:out value="${classesRow.status}"/></td>
                    </tr>
                </c:forEach>
                </tbody>
                </table>
            </div>
            </div>
        </div>
        <jsp:include page="WEB-INF/footer-elements.jsp" />
        <script>
            $(document).ready(function() 
                { 
                    $("#subjectsTable").tablesorter();
                    
                } 
            ); 
        </script>
    </body>
</html>
