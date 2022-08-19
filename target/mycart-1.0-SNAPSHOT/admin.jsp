<%-- 
    Document   : admin
    Created on : Nov 10, 2021, 12:19:36 AM
    Author     : Bilal
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.Dao.CategoryDao"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="com.mycompany.mycart.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
User user=(User)session.getAttribute("current-user");
if(user==null)
{
    session.setAttribute("message", "You are not logged  in");
    response.sendRedirect("login.jsp");
    return;
}
else
{
    if(user.getUserType().equals("normal"))
    {
        session.setAttribute("message", "You cannot access this page");
    response.sendRedirect("login.jsp");
    }
}

    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <%@include  file="components/common_css_js.jsp" %>
        <script src="js/script.js"></script>
    </head>
    <body>
        <%@include  file="components/nav_bar.jsp" %>
        <div class="container admin">
            <div class="container-fluid mt-2">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/team.png" alt="alt"/>
                            </div> 
                            <h1 >123</h1>
                            <h1  class="text-uppercase texxt-muted">User</h1>
                        </div>
                    </div>
                    
                </div>
                 <div class="col-md-4">
                    
                    <div class="card">
                        <div class="card-body text-center">
                             <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/list.png" alt="alt"/>
                            </div> 
                            <h1>123</h1>
                             
                            <h1  class="text-uppercase texxt-muted">Category</h1>
                        </div>
                    </div>
                </div>
                 <div class="col-md-4">
                    
                    <div class="card">
                        <div class="card-body text-center">
                             <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/product.png" alt="alt"/>
                            </div> 
                            <h1>123</h1>
                            
                            <h1 class="text-uppercase texxt-muted">Product</h1>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row mt-3">
                
                <div class="col-md-6">
                    
                     <div class="card " data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                             <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/category.png" alt="alt"/>
                            </div> 
                            <p class="mt-2">Click to add Category</p>
                            
                            <h1 class="text-uppercase texxt-muted">Add Category</h1>
                        </div>
                    </div>
            </div>
                  <div class="col-md-6">
                     <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                             <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/plus.png" alt="alt"/>
                            </div> 
                            <p class="mt-2">Click to add Product</p>
                            
                            <h1 class="text-uppercase texxt-muted">Add Product</h1>
                        </div>
                    </div>
                    
            </div>
            
        </div>
            
            <!--- modal-->
            
  

<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">File  Category details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="ProductOperationServlet" method="post">
              <input type="hidden" name="operation" value="addcategory" />
              <div class="form-group">
                  <input type="text" class="form-control" name="catTitle" placeholder="Enter Category " required />
              </div>
              <div class="form-group">
                  <textarea style="height: 200px" class="form-control" name="catDescription" required placeholder="Enter Description"></textarea>
              </div>
              <div class="container text-center">
                  <button class="btn btn-outline-success"> Add Category</button>
                          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
          </form>
          
          
      </div>
     
    </div>
  </div>
</div>


<!--- end modal category -->


<!--- modal product -->
<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
              
              <input type="hidden" name="operation" value="addproduct">
              <div class="form-group">
                  <input type="text" class="form-control" placeholder="Enter Product Name" name="pName" required>
              </div>
              
              <div class="form-group">
                  <textarea style="height: 150px" class="form-control" placeholder="Enter Discription" name="pDesc" required></textarea>
              </div>
              
               <div class="form-group">
                  <input type="number" class="form-control" placeholder="Enter Product Price" name="pPrice" required>
              </div>
              
               <div class="form-group">
                  <input type="number" class="form-control" placeholder="Enter Product Discount" name="pDiscount" required>
              </div>
              
              
               <div class="form-group">
                  <input type="number" class="form-control" placeholder="Enter Product Quantity" name="pQuantity" required>
              </div>
              
              
              <%
                  CategoryDao cDao=new CategoryDao(FactoryProvider.getFactory());
                  List<Category> list=cDao.getCategories();
                  
                  %>
               <div class="form-group">
                   <select class="form-control" name="catId">
                       <%
                           for(Category c:list)
                           {
                               %>
                           
                               <option value="<%= c.getCategoryId() %>"><%= c.getCategoryName() %></option>
                           <%
                               }   
                           %>
                       
                       
                   </select>
              </div>
              
               <div class="form-group">
                   <label for="pPic"> Select Picture</label><br>
                   <input type="file" class="form-control" id="pPic"  name="pPic" required>
              </div>
              
              <div class="container text-center">
                  <button class="btn btn-outline-success">Add Product</button>
              </div>
          </form>
          
          
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>
                           
                           <br><!-- comment -->
                           <br>
<%@include file="components/footer.jsp"%>  
<%@include file="components/common_modal.jsp" %>
    </body>
</html>
