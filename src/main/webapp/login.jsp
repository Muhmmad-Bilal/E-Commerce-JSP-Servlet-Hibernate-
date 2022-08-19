<%-- 
    Document   : login
    Created on : Nov 9, 2021, 8:03:50 PM
    Author     : Bilal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <%@include file="components/common_css_js.jsp" %>
        
    </head>
    <body><%@include  file="components/nav_bar.jsp"%>
        
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-4">
                        <div class="card-header custom-bg text-white">
                            <h3>Login here</h3>
                        </div>
                        <div class="card-body">
                            <%@include  file="components/message.jsp" %>
                            <form action="LoginServlet" method="post">

                                <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
                                
                                <a href="register.jsp" class="text-center d-block mb-2">if not registry click Here</a>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
                                    <button type="reset" class="btn btn-primary border-0">Reset</button>
                                </div>
  
</form>
                        </div>
                            
                    </div>
                </div>
            </div>
        </div>
                            <br>
               
                            <br>
                            <div class="container">
                            <%@include file="components/footer.jsp"%>  
                            </div>
    </body>
</html>
