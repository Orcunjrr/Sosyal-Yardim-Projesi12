package com.example.example.AdminServlet;

import com.example.example.DataBase.Engelli;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import jakarta.servlet.annotation.WebServlet;


@WebServlet(name = "disabledType", value = "/adminpanel/disabledType")
public class disabledType extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String DisabledName = request.getParameter("disabledname");
        
        

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

            // Personel örneğini oluşturun
            Engelli disabled = new Engelli();
            disabled.setDisabledName(DisabledName);
            disabled.setStatus((byte) 1);

            // Personel örneğini kay,dedin
            session.persist(disabled);
            transaction.commit();

            session.close();
            sessionFactory.close();

            response.sendRedirect("./engellitiptanim.jsp");
        } catch (Exception e) {
            System.err.println("Hata oluştu: " + e);
            e.printStackTrace();
        }
    }
}
