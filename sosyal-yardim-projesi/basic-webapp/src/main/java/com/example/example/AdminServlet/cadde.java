package com.example.example.AdminServlet;

import com.example.example.DataBase.District;
import com.example.example.DataBase.Sokak;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import java.io.IOException;

@WebServlet(name = "CaddeGir", value = "/adminpanel/caddegir")
public class cadde extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Kullanıcı tarafından gönderilen verileri al
            String Cadde = request.getParameter("caddeAd");
            int ID = Integer.parseInt(request.getParameter("mahalleAd"));

            // Yeni Bolge nesnesi oluştur ve verileri set et
            Sokak sokak = new Sokak();
            District mah = new District();
            sokak.setDistrict(mah.getbyID(ID));
            sokak.setStatus((byte) 1);
            sokak.setSokakname(Cadde);
            // Hibernate ile veritabanına kaydet
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

            session.persist(sokak);
            transaction.commit();
            session.close();

            sessionFactory.close();
            // Kullanıcıya geri bildirim sağla
            response.sendRedirect("caddegir.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Bir hata oluştu.");
        }
    }


}
 
