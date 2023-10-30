package com.example.example.AdminServlet;

import com.example.example.DataBase.YardimKarari;
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

@WebServlet(name = "SilYardimKarari", value = "/adminpanel/SilYardimKarari")
public class SilYardimKarari extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String getId = request.getParameter("Id");
        if(getId==null){
            response.sendRedirect("yardimkararlist.jsp?hataliId");
        }

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
        YardimKarari yardim = session.get(YardimKarari.class,getId);
        yardim.setYardimStatu("Pasif");
        session.merge(yardim);
        transaction.commit();
        session.close();
        response.sendRedirect("yardimkararlist.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
 
