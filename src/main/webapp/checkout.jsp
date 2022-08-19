<%-- 
    Document   : checkout
    Created on : Nov 16, 2021, 8:40:27 PM
    Author     : Bilal
--%>
<%
    User user=(User)session.getAttribute("current-user");
if(user==null)
{
    session.setAttribute("message", "You are not logged  in to checkout");
    response.sendRedirect("login.jsp");
    return;
}
    
    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <%@include  file="components/common_css_js.jsp" %>
       <script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>

         <script src="js/script.js"></script>
    </head>
    
    <body>
         <%@include  file="components/nav_bar.jsp" %>
         <br><!-- comment -->
         
          <%@include file="components/common_modal.jsp"%>
          
          <div class="container">
            <div class="row mt-5">
                <div class="col-md-6" >
                    <!--card-->
                    <div class="card">

                        <div class="card-body">
                            <h3 class="text-center mb-3">Check out items</h3>
                            <div class="cart-body">
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-md-6">
                    <!--form details-->
                    <div class="card" style="margin-left:40px">

                        <div class="card-body" >
                            <form action="#" method="post">
                                <div class="form-group">
                                    <label>Email Address</label>
                                    <input value="<%= user.getUserEmail()  %>" type="text" name="email" class="form-control" placeholder="Enter email">
                                </div>

                                <div " class="form-group">
                                    <label>First Name</label>
                                    <input type="text" value="<%= user.getUserName() %>" name="firstname" class="form-control" placeholder="Enter first name">
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <input type="text"  name="address" class="form-control" placeholder="Enter Address">
                                </div>
                                 <div " class="form-group">
                                    <label>First Name</label>
                                    <input type="text" value="<%= user.getUserName() %>" name="firstname" class="form-control" placeholder="Enter first name">
                                </div>
                                <div class="cotnainer">
                                    <button class="btn btn-outline-success" onclick="paymentStart()"  ="orderNow">Order Now</button>
                                    <button class="btn btn-outline-primary">Continue Shopping</button>
                                    <span id="result1"></span>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
          </div>
          <br><!-- comment -->
          <br>
         <br>
        <%@include file="components/footer.jsp"%>  
    </body>
</html>
