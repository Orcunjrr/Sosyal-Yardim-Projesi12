package com.example.example.AdminServlet;

import com.example.example.DataBase.YonlendirilenKurum;
import com.example.example.DataBase.YonlendirilenAltKurum;
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


@WebServlet(name = "YonlendirmeAltKurumUpdate", value = "/adminpanel/YonlendirmeAltKurumUpdate")
public class YonlendirmeAltKurumUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 int YonlendirenAltKurumid = Integer.parseInt(request.getParameter("YonlendirenAltKurumid"));
        String YonlendirenAltKurumAd = request.getParameter("YonlendirenAltKurumAd");
   	 int YonlendirenKurumId = Integer.parseInt(request.getParameter("durum"));

        
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
            YonlendirilenAltKurum altkurum = session.get(YonlendirilenAltKurum.class,YonlendirenAltKurumid);
            altkurum.setYonlendirilenAltKurumName(YonlendirenAltKurumAd);
            YonlendirilenKurum kurum = session.get(YonlendirilenKurum.class, YonlendirenKurumId);
            altkurum.setYonlendirilenKurum(kurum);
        

            session.merge(altkurum);
            transaction.commit();

            session.close();
            sessionFactory.close();

            response.sendRedirect("./yonaltkurum.jsp");
        } catch (Exception e) {
            System.err.println("Hata oluştu: " + e);
            e.printStackTrace();
        }
    }
}
