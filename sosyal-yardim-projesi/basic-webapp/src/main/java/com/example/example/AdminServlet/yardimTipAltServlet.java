package com.example.example.AdminServlet;

import com.example.example.DataBase.YardimTipi;
import com.example.example.DataBase.YardimTipiAlt;
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

@WebServlet(name = "yardimTipAltServlet", value = "/adminpanel/yardimTipAltServlet")
public class yardimTipAltServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int ID = Integer.parseInt(request.getParameter("yardimAd"));
        String yardimadalt = request.getParameter("yardimalatAd");
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
            YardimTipiAlt yardim = new YardimTipiAlt();
            yardim.setHelpId(YardimTipi.getbyID(ID));
            yardim.setHelpSubName(yardimadalt);
            yardim.setStatus((byte) 1);
            session.persist(yardim);
            transaction.commit();
            session.close();
            sessionFactory.close();

            response.sendRedirect("./yardimalttip.jsp");
        }catch (Exception e){
            System.out.println(e);
        }
    }
}
 
