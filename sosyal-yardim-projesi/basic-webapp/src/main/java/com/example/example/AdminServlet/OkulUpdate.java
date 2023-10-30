package com.example.example.AdminServlet;

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


@WebServlet(name = "OkulUpdate", value = "/adminpanel/OkulUpdate")
public class OkulUpdate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
   	 	int okulid = Integer.parseInt(request.getParameter("okulid"));
    	String stringdurum = request.getParameter("Durum");
    	String Okul = request.getParameter("Okul");
    	String OkulSect = request.getParameter("OkulSect");
    	String OkulName = request.getParameter("OkulName");

        byte Durum = Byte.parseByte(stringdurum);


    
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
           
    com.example.example.DataBase.Okul school = session.get(com.example.example.DataBase.Okul.class,okulid);
    school.setDurum(Durum);
    school.setOkul(Okul);
    school.setOkulTipi(OkulSect);
    school.setOkulName(OkulName);
    
    session.merge(school);
    transaction.commit();

    session.close();
    sessionFactory.close();

   

    response.sendRedirect("./okullist.jsp");
} catch (Exception e) {
    System.err.println("Hata oluştu: " + e);
    e.printStackTrace();
}
}
}

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    


