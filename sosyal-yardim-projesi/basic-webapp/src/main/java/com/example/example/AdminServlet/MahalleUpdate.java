package com.example.example.AdminServlet;

import com.example.example.DataBase.Bolge;
import com.example.example.DataBase.District;
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


@WebServlet(name = "MahalleUpdate", value = "/adminpanel/mahalleUpdate")
public class MahalleUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 int mahalleid = Integer.parseInt(request.getParameter("mahalleid"));
        String ilce = request.getParameter("ilce");
        String mahalleAd = request.getParameter("mahalleAd");
        int bolge_id = Integer.parseInt(request.getParameter("bolge_id"));
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
            District mahalle = session.get(District.class,mahalleid);
            mahalle.setDistrictName(mahalleAd);
            mahalle.setIlce(ilce);
            Bolge zone = session.get(Bolge.class, bolge_id);
            mahalle.setBolge(zone);
        

            session.merge(mahalle);
            transaction.commit();

            session.close();
            sessionFactory.close();

            response.sendRedirect("./mahallelist.jsp");
        } catch (Exception e) {
            System.err.println("Hata oluştu: " + e);
            e.printStackTrace();
        }
    }
}
