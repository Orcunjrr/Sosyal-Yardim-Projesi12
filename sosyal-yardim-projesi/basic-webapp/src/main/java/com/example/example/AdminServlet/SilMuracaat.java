package com.example.example.AdminServlet;

import com.example.example.DataBase.Muracaat;
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

@WebServlet(name = "SilMuracaat", value = "/adminpanel/SilMuracaat")
public class SilMuracaat extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tc = request.getParameter("TCID");
        if (tc!=null){
            int TcKimlik = Integer.parseInt(tc);
            System.out.println(TcKimlik);

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
            Muracaat mur = session.get(Muracaat.class,TcKimlik);
            mur.setStatus((byte) 0);
            session.merge(mur);
            transaction.commit();
            session.close();
            sessionFactory.close();
            response.sendRedirect("./muracaatliste.jsp");

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
 
