package com.example.example.AdminServlet;

import com.example.example.DataBase.EngelliAlt;
import com.example.example.DataBase.Engelli;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import jakarta.servlet.annotation.WebServlet;


//... (import statements)

@WebServlet(name = "DisabledSubType", value = "/adminpanel/disabledSubType")
public class DisabledSubType extends HttpServlet {
 private static final long serialVersionUID = 1L;

 protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     String disabledSubName = request.getParameter("disabledSunName");
     int disabledID = Integer.parseInt(request.getParameter("disableID")); 

     try {
         StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                 .configure()
                 .build();
         SessionFactory sessionFactory = new MetadataSources(registry)
                 .buildMetadata()
                 .buildSessionFactory();
// 2. Session oluşturun
         Session session = sessionFactory.openSession();
// İşlemleri gerçekleştirin
         Transaction transaction = session.beginTransaction();

         EngelliAlt disabledSub = new EngelliAlt();
         disabledSub.setDisabledSubName(disabledSubName);

         // Retrieve the Disabled object based on disabledID
         Engelli disabled = session.get(Engelli.class, disabledID);
         disabledSub.setDisabled(disabled);


         // Personel örneğini kaydet
         session.persist(disabledSub);
         transaction.commit();

         session.close();
         sessionFactory.close();

         response.sendRedirect("./engellialttip.jsp");
     } catch (Exception e) {
         System.err.println("Hata oluştu: " + e);
         e.printStackTrace();
     }
 }
}

