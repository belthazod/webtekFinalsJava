<%-- 
    Document   : manageEnrollment
    Created on : May 9, 2015, 4:36:24 AM
    Author     : Belthazod
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Webtek Project Finals</title>
        <jsp:include page="WEB-INF/head-elements.jsp" />
    </head>
    <body>
        <div class='container'>
        <jsp:include page="WEB-INF/nav-elements.jsp" />

        <div class="example">
            <h2 class="example_head">Manage Enrollment</h2>
            <div class="example_result notranslate">
                <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                      <th>Semester</th>
                      <th>Total Enrollees</th>
                      <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        Util.DatabaseConnector dbConnector = Util.DatabaseConnector.getInstance();
                        java.sql.ResultSet rs = dbConnector.query("SELECT  semester, schoolYear, enrolleeCount, status, semester_id FROM semester");
                        
                        while(rs.next()){
                            String semester = rs.getString(1);
                            String year = rs.getString(2);
                            String enrollees = rs.getString(3);
                            String status = rs.getString(4);
                            String semesterID = rs.getString(5);
                            
                            out.print("<tr>");
                            out.print("<td><a href='manageSubjects.jsp?semester=" + semesterID + "'>" + semester + " " + year + "</a></td>");
                            out.print("<td>"+ enrollees+"</td>");
                            out.print("<td>");
                            if(status.equals("ended")){
                                out.print("Ended");
                            }else{
                                out.print("<div class='input-group'><select class='input-large'>");
                                if(status.equals("open")){
                                        out.print("<option selected>Open</option>");
                                        out.print("<option>Closed</option>");
                                        out.print("<option>Ended</option>");
                                }else{
                                        out.print("<option>Open</option>");
                                        out.print("<option selected>Closed</option>");
                                        out.print("<option>Ended</option>");
                                }
                            }
                            out.print("</select></div");
                            out.print("</td");
                            out.print("</tr>");
                            
                        }
                    %>
                </tbody>
                </table>
            </div>
            </div>
        </div>
        <jsp:include page="WEB-INF/footer-elements.jsp" />
    </body>
</html>
