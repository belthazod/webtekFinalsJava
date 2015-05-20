<<<<<<< .mine
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
    <nav class="navbar navbar-default">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.jsp"><i class="fa fa-university"></i> SLU Online Enrollment</a>
    </div>
    <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav" id="navigation">
          <li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
          <li><a href="about.jsp"><i class="fa fa-question-circle"></i> About</a></li>
          <li><a href="contact.jsp"><i class="fa fa-home"></i> Contact</a></li>
          <%
              if(session.getAttribute("Type") != null && session.getAttribute("Type").equals("department head")){
                  out.print("<li><a href='manageEnrollment.jsp'><i class='fa fa-book'></i> Manage Enrollment</a></li>");
                  out.print("<li><a href='enrollmentStatus.jsp'><i class='fa fa-cog'></i> View Status</a></li>");
                  out.print("<li><a href='enrollmentRequests.jsp'><i class='fa fa-mail-forward'></i> Enrollment Requests</a></li>");
              }
          %>
        </ul>
        <ul class="nav navbar-nav pull-right">
          <li><a href="LogOut"><i class="fa fa-sign-out"></i> Log out</a></li>
          
        </ul>

      
    </div><!--/.nav-collapse -->
    </nav>
</body>
</html>=======
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
    <nav class="navbar navbar-default">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.jsp">SLU Online Enrollment</a>
    </div>
    <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav" id="navigation">
          <li><a href="index.jsp">Home</a></li>
          <li><a href="about.jsp">About</a></li>
          <li><a href="contact.jsp">Contact</a></li>
          <%
              if(session.getAttribute("Type") != null && session.getAttribute("Type").equals("department head")){
                  out.print("<li><a href='manageEnrollment.jsp'>Manage Enrollment</a></li>");
                  out.print("<li><a href='enrollmentRequests.jsp'>Adding/Changing Requests</a></li>");
              }
          %>
        </ul>
        <ul class="nav navbar-nav pull-right">
          <li><a href="LogOut">Log out</a></li>
          
        </ul>

      
    </div><!--/.nav-collapse -->
    </nav>
</body>
</html>
>>>>>>> .r9
