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
            
<html>
    <head>
        <title>Webtek Project</title>
        <jsp:include page="WEB-INF/head-elements.jsp" />
    </head>
    <body>
        <div class='container'>
        <jsp:include page="WEB-INF/nav-elements.jsp" />
        <c:forEach var="row" items="${semesterResult.rows}">
            <ol class="breadcrumb">
                <li><a href="manageSubjects.jsp?semester=<c:out value="${row.semester_id}"/>"><c:out value="${row.semester} ${row.schoolYear}"/></a></li>
                <li><a href="viewClass.jsp?code=<c:out value="${param.code}"/>&semester=<c:out value="${row.semester_id}"/>"><c:out value="${param.code}"/></a></li>
            </ol>
            
        </c:forEach>
        
        </div>
        <jsp:include page="WEB-INF/footer-elements.jsp" />
    </body>
</html>
