package com.example.example.AdminServlet;

import com.example.example.DataBase.Meslek;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import java.io.IOException;

@WebServlet(name = "meslekServlet", value = "/adminpanel/meslektanimlama")
public class MeslekEkleListele extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String MeslekAdi = request.getParameter("meslekAd");
        String aktiflik = request.getParameter("Durum");
        try{
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
            Meslek meslek = new Meslek();
            meslek.setProfessionName(MeslekAdi);
            meslek.setIsActive(aktiflik);

            session.persist(meslek);
            transaction.commit();

            session.close();
            sessionFactory.close();
            response.sendRedirect("./meslektanimlama.jsp");


        }catch (Exception e){
            System.out.println(e);
        }
    }
}
 
