<%-- 
    Document   : index
    Created on : Nov 9, 2021, 1:54:41 AM
    Author     : Bilal
--%>

<%@page import="com.mycompany.mycart.helper.Helper"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="com.mycompany.mycart.Dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entities.Product"%>
<%@page import="com.mycompany.mycart.Dao.ProductDao"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Commerce</title>
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">
        <%@include file="components/common_css_js.jsp"%>        
        <script src="js/script.js"></script>   
       
    </head>
    <body>
        <%@include  file="components/nav_bar.jsp" %>
        <div class="container-fluid">
        <div class="row mt-3 mx-2">
            <%
                String catId=request.getParameter("category");
                ProductDao pDao=new ProductDao(FactoryProvider.getFactory());
                List<Product> list=null;
              
                 if( catId==null || catId.trim().equals("all"))
                {
                list=pDao.getAllProducts();        
                }
                else
                {
                    int cId=Integer.parseInt(catId.trim());
                    list=pDao.getAllProductsById(cId);
                }
                
            
                CategoryDao cDao=new CategoryDao(FactoryProvider.getFactory());
                List<Category> cList=cDao.getCategories();
                %>
                
                <!-- Show Category -->
            <div class="col-md-2">
                <div class="list-group mt-4">
  <a href="index.jsp?category=all" class="list-group-item list-group-item-action active custom-bg">
    All Category
  </a>
                    
                
               
                
               
                <%
                    for(Category category:cList)
                    {
                        %>
                        
                        <a href="index.jsp?category=<%= category.getCategoryId() %>" class="list-group-item list-group-item-action"><%= category.getCategoryName() %></a>
                    
                        <%}
                    %>
                     </div>
            </div>
                
                <!-- show Product-->
            <div class="col-md-10">
                
                <div class="row mt-4">
                    <div class=" col-md-12">
                        <div class="card-columns">
                            
                            <%
                                for(Product product:list){
                                %>
                            
                                <div class="card product_card">
                                    <div class="container text-center mt-1">
                                         <img class=" card-img-top " style="max-height:270px;max-width: 100%;width: auto" src="img/<%= product.getpId()%>/<%=product.getpPhoto() %>" alt="">
                                    </div>   
                                   
                                    
                                    
                                    <div class="card-body">
                                        <h5 class="card-title"><%= product.getpName() %></h5>
                                        <p class="card-text"><%= Helper.get10Words(product.getpDesc())  %></p>
                                        
                                    </div>
                                        <div class="card-footer text-center">
                                            <button class="btn custom-bg text-white"  onclick="add_to_cart(<%= product.getpId() %>,'<%= product.getpName() %>',<%= product.getPriceAfterDiscount()%>,<%= product.getpQuantity() %>)">Add to Card</button>
                                            <button class="btn btn-outline-success">&#8377;<%= product.getPriceAfterDiscount() %><span class="text-secondary discount-label">&#8377;<%= product.getpPrice() %>/-<%= product.getpDiscount()%> %of</span></button>
                                        </div>
                                            
                                </div>
                                <%
                                    }
                                if(list.size()==0)
{
out.println("<h2> No Item in this category</h2>");
}
                                %>
                        </div>
                    </div>
                </div>
                
             
                
            </div>
            
        </div>
        </div>
                                <%@include file="components/common_modal.jsp"%>  
                         <%@include file="components/footer.jsp"%>  
                         
    </body>
</html>
