package com.example.example.AdminServlet;

import com.example.example.DataBase.YonlendirilenKurum;
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

@WebServlet(name = "YonlendirenKurumUpdate", value = "/adminpanel/YonlendirenKurumUpdate")
public class YonlendirenKurumUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Diğer form verilerini alın
        String KurumIdParam = request.getParameter("YonlendirenID");
        if (KurumIdParam != null) {
            int KurumId = Integer.parseInt(KurumIdParam);
            String KurumAdi = request.getParameter("YonlendirenKurumAd");
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
                
                YonlendirilenKurum kurum = session.get(YonlendirilenKurum.class, KurumId);

                // Update the fields with new values
                kurum.setYonlendirilenKurumName(KurumAdi);
                
                // Update the existing record with the new data
                session.merge(kurum);
                transaction.commit();

                session.close();
                sessionFactory.close();

                response.sendRedirect("./yonkurum.jsp");
            } catch (Exception e) {
                System.err.println("Hata oluştu: " + e);
                e.printStackTrace();
                response.sendRedirect("./error.jsp");
            }
        } else {
        	response.sendRedirect("./error.jsp");
           
        }
    }
}
