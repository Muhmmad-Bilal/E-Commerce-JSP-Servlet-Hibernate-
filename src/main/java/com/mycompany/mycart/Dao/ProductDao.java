/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.mycart.Dao;

import com.mycompany.mycart.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Bilal
 */
public class ProductDao {
     private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }
    public boolean saveProduct(Product product)
    {
        boolean f=false;
        try
        {
            Session session=factory.openSession();
            Transaction tx=session.beginTransaction();
            session.save(product);
            
            tx.commit();
            session.close();
            f=true;
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
    public List<Product> getAllProducts()
    {
    Session session= factory.openSession();
    Query query=session.createQuery("from Product");
    List<Product> list=query.list();
    return list;
    
    }
    
    
     public List<Product> getAllProductsById(int catId)
    {
    Session session= factory.openSession();
    Query query=session.createQuery("from Product as p where p.category.categoryId=:id");
    query.setParameter("id", catId);
    List<Product> list=query.list();
    return list;
    
    }
    
}
