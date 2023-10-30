package com.example.example.AdminServlet;

import com.example.example.DataBase.Engelli;
import com.example.example.DataBase.EngelliAlt;
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


@WebServlet(name = "disableSubdUpdate", value = "/adminpanel/disabledSubUpdate")
public class DisabledSubUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 int disabledsubid = Integer.parseInt(request.getParameter("disabledsubid"));
        String disabledsubname = request.getParameter("disabledsubname");
   	 	int disabledid = Integer.parseInt(request.getParameter("disabledid"));

        
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
            EngelliAlt disabledSub = session.get(EngelliAlt.class,disabledsubid);
            disabledSub.setDisabledSubName(disabledsubname);
            Engelli disabled = session.get(Engelli.class, disabledid);
            disabledSub.setDisabled(disabled);
        

            session.merge(disabledSub);
            transaction.commit();

            session.close();
            sessionFactory.close();

            response.sendRedirect("./engellialttip.jsp");
        } catch (Exception e) {
            System.err.println("Hata oluştu: " + e);
            e.printStackTrace();
        }
    }
}
