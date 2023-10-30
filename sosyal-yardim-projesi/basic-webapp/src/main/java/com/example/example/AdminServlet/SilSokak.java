package com.example.example.AdminServlet;

import com.example.example.DataBase.Muracaat;
import com.example.example.DataBase.Sokak;
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

@WebServlet(name = "SilSokak", value = "/adminpanel/SilSokak")
public class SilSokak extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tc = request.getParameter("sokakId");
        if (tc!=null){
            int Sokak = Integer.parseInt(tc);
            System.out.println(Sokak);

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
            com.example.example.DataBase.Sokak mur = session.get(Sokak.class,Sokak);
            mur.setStatus((byte) 0);
            session.merge(mur);
            transaction.commit();
            session.close();
            sessionFactory.close();
            response.sendRedirect("./caddelist.jsp");

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}

