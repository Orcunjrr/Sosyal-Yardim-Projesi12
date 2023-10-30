package com.example.example.AdminServlet;

import com.example.example.DataBase.YardimTipi;
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

@WebServlet(name = "yardimTipServlet", value = "/adminpanel/yardimTipServlet")
public class yardimTipServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String yardimad = request.getParameter("yardimAd");
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
            YardimTipi yardim = new YardimTipi();
            yardim.setHelpName(yardimad);
            session.persist(yardim);
            transaction.commit();
            session.close();
            sessionFactory.close();
            response.sendRedirect("./yardimtipi.jsp");
        }catch (Exception e){
            System.out.println(e);
        }
    }
}
 
