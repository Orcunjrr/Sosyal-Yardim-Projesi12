package com.example.example.AdminServlet;

import com.example.example.DataBase.Okul;
import com.example.example.DataBase.Personel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import java.io.IOException;

@WebServlet(name = "okulsil", value = "/adminpanel/okulsil")
public class SilOkul extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String okulID = req.getParameter("Id");
        if(okulID != null){
            //int userId = Integer.parseInt(request.getParameter("userId"));

            int Id = Integer.parseInt(okulID);
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

            // Get the existing Okul object from the database
            Okul okul = session.get(Okul.class, okulID);

            // Update the fields with new values
            okul.setDurum((byte) 0);
            session.merge(okul);
            transaction.commit();
            session.close();
            sessionFactory.close();
            resp.sendRedirect("./okullist.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
