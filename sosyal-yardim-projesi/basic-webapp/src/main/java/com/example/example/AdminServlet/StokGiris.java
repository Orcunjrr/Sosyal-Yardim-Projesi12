package com.example.example.AdminServlet;

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
import org.hibernate.cfg.Configuration;

import java.io.IOException;

@WebServlet(name = "Stok", value = "/adminpanel/StokGiris")
public class StokGiris extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String miktar = request.getParameter("guncelMiktar");
        String fiyat = request.getParameter("guncelFiyat");
        String tanim = request.getParameter("stokTanim");
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

            com.example.example.DataBase.Stok stok = new com.example.example.DataBase.Stok();
            stok.setGuncelFiyat(Double.parseDouble(fiyat));
            stok.setGuncelMiktar(Integer.parseInt(miktar));
            stok.setStokTanim(tanim);

            session.persist(stok);
            transaction.commit();

            session.close();
            sessionFactory.close();
            response.sendRedirect("./stokgir.jsp");
        }catch (Exception e){

        }
    }

}