package com.example.example.AdminServlet;


import com.example.example.DataBase.ActivityLogs;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;


import jakarta.servlet.annotation.WebServlet;


@WebServlet(name = "Okul", value = "/adminpanel/okul")
public class Okul extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	String Okul = request.getParameter("Okul");
    	String OkulSect = request.getParameter("OkulTipi");
    	String OkulName = request.getParameter("OkulName");
        try
         {
    // Hibernate session'ı yapılandırma
// 1. SessionFactory'yi oluşturun
StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
    .configure("hibernate.cfg.xml")
    .build();
SessionFactory sessionFactory = new MetadataSources(registry)
     .buildMetadata()
     .buildSessionFactory();
// 2. Session oluşturun
    Session session = sessionFactory.openSession();
// İşlemleri gerçekleştirin
    Transaction transaction = session.beginTransaction();
    com.example.example.DataBase.Okul school = new com.example.example.DataBase.Okul();
    school.setDurum((byte) 1);
    school.setOkul(Okul);
    school.setOkulTipi(OkulSect);
    school.setOkulName(OkulName);

    session.persist(school);
    transaction.commit();
    session.close();

    // 4. SessionFactory'yi kapatın
    sessionFactory.close();

    response.sendRedirect("./okullist.jsp");
} catch (Exception e) {
    System.err.println("Hata oluştu: " + e);
    e.printStackTrace();
}
}
}

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    


