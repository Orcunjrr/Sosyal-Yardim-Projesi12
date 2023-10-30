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

@WebServlet(name = "Meslekduzenle", value = "/adminpanel/MeslekDuzenle")
public class MeslekDuzenle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int meslekid = Integer.parseInt(request.getParameter("meslekid"));
        String meslekad = request.getParameter("meslekadi");
        String Durum = request.getParameter("Durum");
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
            Meslek meslek = session.get(Meslek.class,meslekid);
            meslek.setProfessionName(meslekad);
            meslek.setIsActive(Durum);
            session.merge(meslek);
            transaction.commit();
            session.close();
            sessionFactory.close();
            response.sendRedirect("./meslektanimlama.jsp");

        }catch (Exception e){
            System.out.println(e);
        }
    }
}
 
