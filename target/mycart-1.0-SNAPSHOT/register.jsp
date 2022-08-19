<%-- 
    Document   : register
    Created on : Nov 9, 2021, 2:38:55 PM
    Author     : Bilal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include  file="components/nav_bar.jsp" %>
        <div class="container-fluid">
              <div class="row mt-4">
            <div class="col-md-4 offset-md-4">
                
                <div class="card">
                    
                    <%@include file="components/message.jsp" %>
                    
                    <div class="card-body px-5">
                         <h3 class="text-center my-3">Sign up Here</h3>
                         <form action="Register" method="Post">
                    
                    <div class="form-group">
    <label for="name">User Name</label>
    <input type="text" name="user_name" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter here">
    
  </div>
                                    <div class="form-group">
    <label for="name">User Email</label>
    <input type="email" name="user_email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter here">
    
                                    </div><!-- comment -->
                                    
 <div class="form-group">
    <label for="password">User Password</label>
    <input type="password" name="user_password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter here">
    
 </div>
 <div class="form-group">
    <label for="phone">User Phone</label>
    <input type="number" name="user_phone" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter here">
    
 </div>
     <div class="form-group">
    <label for="address">User Address</label>
    <textarea style="height:100px" name="user_address" class="form-control" placeholder="Enter here" ></textarea>    
     </div>
                                    <div class="container text-center">
                                        <input type="submit"  class="btn btn-outline-success" value="Register">
                                        <button class="btn btn-outline-warning">Reset</button> 
                                        
                                    </div>
                                    
                </form>
                    </div>
                </div>
            </div>
            
        </div>
        </div>  
      
    </body>
</html>
