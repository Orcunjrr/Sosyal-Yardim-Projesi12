package com.example.example.AdminServlet;

import com.example.example.DataBase.Bolge;
import com.example.example.DataBase.District;
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

@WebServlet(name = "mahallesil", value = "/adminpanel/mahallesil")
public class SilMahalle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String mahalleID = request.getParameter("mahalleID");
        if(mahalleID != null){
            //int userId = Integer.parseInt(request.getParameter("userId"));

            int Id = Integer.parseInt(mahalleID);
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
            District mahalle = session.get(District.class, mahalleID);

            // Update the fields with new values
            mahalle.setStatus((byte) 0);
            session.merge(mahalle);
            transaction.commit();
            session.close();
            sessionFactory.close();
            response.sendRedirect("./mahallelist.jsp");
        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}

