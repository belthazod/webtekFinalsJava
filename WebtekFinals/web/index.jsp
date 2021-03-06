<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<% 
    
    session = request.getSession();
    if(session.getAttribute("UserName")!=null){
        response.sendRedirect("main.jsp");
    }

%>
<html>
    <head>
        <title>SLU Online | Home</title>
        
        <jsp:include page="WEB-INF/head-elements.jsp"/>
        
    </head>
    <body>
        <div class="container">
        <nav class="navbar navbar-default">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><i class="fa fa-university"></i> SLU Online Enrollment</a>
          </div>
          <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="#"><i class="fa fa-home"></i> Home</a></li>
              <li><a href="about.jsp"><i class="fa fa-question-question"></i> About</a></li>
              <li><a href="contact.jsp"><i class="fa fa-phone"></i> Contact</a></li>
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
            
            <form id="loginForm"  class="navbar-form navbar-left pull-right" role="login" action="Login" method="POST">
                <div class="form-group">
                  <input type="text" class="form-control" placeholder="Username" name="username" autocomplete="off">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control" placeholder="Password" name="password">
                </div>
                <button type="submit" class="btn btn-default">Log in</button>
            </form>
          </div><!--/.nav-collapse -->
          </nav>
          <%
              String loginStatus = request.getParameter("loginfailed");
              String logoutStatus = request.getParameter("logout");
              if(loginStatus!=null && loginStatus.equals("user")){
                out.print("<div class='alert alert-danger' role='alert'>"+
                "<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true'></span>"+
                "<span class='sr-only'>Incorrect Employee Id:</span>"+
                "The employee ID you entered does not belong to any employee. " + 
                "Make sure that it is typed correctly."+
              "</div>");
            }else if(loginStatus!=null && loginStatus.equals("password")){
                out.print("<div class='alert alert-danger' role='alert'>"+
                "<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true'></span>"+
                "<span class='sr-only'>Incorrect Password:</span>"+
                "The password you have entered for that account is invalid. " + 
                "Make sure that it is typed correctly."+
              "</div>");
            }else if(loginStatus!=null && loginStatus.equals("login")){
                out.print("<div class='alert alert-danger' role='alert'>"+
                "<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true'></span>"+
                "<span class='sr-only'>Invalid access</span>"+
                "You are not currently logged in. Please log in first."+
              "</div>");
            }else if(logoutStatus!=null && logoutStatus.equals("success")){
                out.print("<div class='alert alert-success' role='alert'>"+
                "<span class='glyphicon glyphicon-check' aria-hidden='true'></span>"+
                "<span class='sr-only'>Log out success</span>"+
                "You have successfully logged out of the system."+
              "</div>");
            }
          %>
          
          <h1 class="page-header">
             Welcome to Saint Louis University Online Enrollment
          </h1>
          <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
              <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
              <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="item active">
                <img data-src="holder.js/1140x500/auto/#777:#555/text:First slide" alt="" src="img/main_converted.jpg" >
              </div>
              <div class="item">
                <img data-src="holder.js/1140x500/auto/#666:#444/text:Second slide" alt="" src="img/maryheights.jpg" data-holder-rendered="true">
              </div>
              <div class="item">
                <img data-src="holder.js/1140x500/auto/#555:#333/text:Third slide" alt="Third slide [1140x500]" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTE0MCIgaGVpZ2h0PSI1MDAiIHZpZXdCb3g9IjAgMCAxMTQwIDUwMCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PGRlZnM+PC9kZWZzPjxyZWN0IHdpZHRoPSIxMTQwIiBoZWlnaHQ9IjUwMCIgZmlsbD0iIzU1NSI+PC9yZWN0PjxnPjx0ZXh0IHg9IjM5MC41IiB5PSIyNTAiIHN0eWxlPSJmaWxsOiMzMzM7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6NTNwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj5UaGlyZCBzbGlkZTwvdGV4dD48L2c+PC9zdmc+" data-holder-rendered="true">
              </div>
            </div>
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
          
          <hr />
        </div>
          <!-- Page Content -->
    <div class="container">

        <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-flag"></i> Announcement 1</h4>
                    </div>
                    <div class="panel-body">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus eveniet incidunt dicta nostrum quod?</p>
                        <a href="#" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-flag"></i> Announcement 2</h4>
                    </div>
                    <div class="panel-body">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus eveniet incidunt dicta nostrum quod?</p>
                        <a href="#" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-flag"></i> Announcement 3</h4>
                    </div>
                    <div class="panel-body">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus eveniet incidunt dicta nostrum quod?</p>
                        <a href="#" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->

        

        

        <hr>

        <!-- Call to Action Section -->
        <div class="well">
            <div class="row">
                <div class="col-md-8">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
                </div>
                <div class="col-md-4">
                    <a href="subjects.php" class="btn btn-lg btn-default btn-block" href="#">Enroll now</a>
                </div>
            </div>
        </div>

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>WEBTEK 2015</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
     <!-- Bootstrap Core JavaScript -->


    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>
          
          
       
        <script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/script.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrap.min_1.js"></script>
    </body>
</html>
