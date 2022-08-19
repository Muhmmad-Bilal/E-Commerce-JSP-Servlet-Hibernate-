/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.mycart.servlets;

import com.mycompany.mycart.Dao.CategoryDao;
import com.mycompany.mycart.Dao.ProductDao;
import com.mycompany.mycart.entities.Category;
import com.mycompany.mycart.entities.Product;
import com.mycompany.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
/**
 *
 * @author Bilal
 */

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            //Fatch Data
            String operation=request.getParameter("operation");
            if(operation.trim().equals("addcategory"))
            {
              
                  String catTitle=request.getParameter("catTitle");
            String catDescription=request.getParameter("catDescription");
            Category category=new Category();
            category.setCategoryName(catTitle);
            category.setCategoryDescription(catDescription);
            CategoryDao catDao=new CategoryDao(FactoryProvider.getFactory());
           int catId =catDao.saveCategory(category);
           out.println("save");
           HttpSession session=request.getSession();
           session.setAttribute("message", "Category Add Successfully");
           response.sendRedirect("admin.jsp");
           return;
     
            }
            else if(operation.trim().equals("addproduct"))
            {
                //product work here 
            String pName=request.getParameter("pName");
            String pDesc=request.getParameter("pDesc");
           int pPrice=Integer.parseInt(request.getParameter("pPrice"));
           int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
           int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
           int catId=Integer.parseInt(request.getParameter("catId"));
           Part part=request.getPart("pPic");
           System.out.println(part);
           //out.println(part);
           Product p=new Product();
           p.setpName(pName);
           p.setpDesc(pDesc);
           p.setpPrice(pPrice);
           p.setpDiscount(pDiscount);
           p.setpQuantity(pQuantity);
           p.setpPhoto(part.getSubmittedFileName());
           CategoryDao cDao=new CategoryDao(FactoryProvider.getFactory());
           Category category=cDao.getCategoryById(catId);
           p.setCategory(category);
           ProductDao pDao=new ProductDao(FactoryProvider.getFactory());    
                   pDao.saveProduct(p);
                   try
                   {
                  String path=request.getRealPath("img")+File.separator+p.getpId();
                 
                  File f=new File(path);
                  if(!(f.exists()))
                  {
                      boolean result=f.mkdirs();
                      String path1=path+File.separator+part.getSubmittedFileName();
                      out.println(result+"   "+path);
                       FileOutputStream fos=new FileOutputStream(path1); 
                  InputStream is=part.getInputStream();
                  byte data[]=new byte[is.available()];
                  is.read(data);
                  fos.write(data);
                  fos.close();
                  }
                  else
                  {
                      
                  }
                 
                   }catch(Exception e)
                       
                   {
                       e.printStackTrace();
                   }
                  out.println("Save Product");
                     HttpSession session=request.getSession();
           session.setAttribute("message", "Product Add Successfully");
           response.sendRedirect("admin.jsp");
            
             }
            }            
        }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
