package com.example.example.AdminServlet;

import com.example.example.DataBase.Sokak;
import com.example.example.DataBase.Tutanak;
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

@WebServlet(name = "SilTutanak", value = "/adminpanel/SilTutanak")
public class SilTutanak extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tutanakid = request.getParameter("IDNO");
        if (tutanakid!=null){
            int tutid = Integer.parseInt(tutanakid);
            System.out.println(tutid);

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
            Tutanak tut = Tutanak.getTutanakByID(tutid);
            tut.setAktifpasif("Pasif");
            session.merge(tut);
            transaction.commit();
            session.close();
            sessionFactory.close();
            response.sendRedirect("./tutanaklist.jsp");

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
 
