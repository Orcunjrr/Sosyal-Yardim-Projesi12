package com.example.example.AdminServlet;

import com.example.example.DataBase.Personel;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import java.io.IOException;

@WebServlet(name = "SilKullanici", value = "/adminpanel/SilKullanici")
public class SilKullanici extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userId = request.getParameter("userId");
        if(userId != null){
            //int userId = Integer.parseInt(request.getParameter("userId"));

            int Id = Integer.parseInt(userId);
            System.out.println(Id);

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

            // Get the existing Personel object from the database
            Personel personel = session.get(Personel.class, userId);

            // Update the fields with new values
            personel.setStatus(0);
            session.merge(personel);
            transaction.commit();
            session.close();
            sessionFactory.close();
            response.sendRedirect("./kullaniciliste.jsp");
        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
 
