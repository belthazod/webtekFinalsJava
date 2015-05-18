<%-- 
    Document   : nav-elements
    Created on : May 9, 2015, 4:46:29 AM
    Author     : Belthazod
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        %>
<!DOCTYPE html>
<html>
<head>
</head>
<%
    session = request.getSession();
    if(session.getAttribute("UserName")==null){
        response.sendRedirect("index.jsp?loginfailed=login");
    }
%>
<body>
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">Webtek Project</a>
    </div>
    <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
          <li class="active"><a href="#">Home</a></li>
          <li><a href="#about">About</a></li>
          <%
              if(session.getAttribute("Type") != null && session.getAttribute("Type").equals("department head")){
                  out.print("<li><a href='manageEnrollment.jsp'>Manage Enrollment</a></li>");
                  out.print("<li><a href='enrollmentStatus.jsp'>View Status</a></li>");
                  out.print("<li><a href='enrollmentRequests.jsp'>Enrollment Requests</a></li>");
              }
          %>
          <li><a href="LogOut">Log out</a></li>
          
         <!-- <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <li><a href="#">Action</a></li>
              <li><a href="#">Another action</a></li>
              <li><a href="#">Something else here</a></li>
              <li class="divider"></li>
              <li class="dropdown-header">Nav header</li>
              <li><a href="#">Separated link</a></li>
              <li><a href="#">One more separated link</a></li>
            </ul>
          </li> -->
        </ul>


    </div><!--/.nav-collapse -->
</body>
</html>