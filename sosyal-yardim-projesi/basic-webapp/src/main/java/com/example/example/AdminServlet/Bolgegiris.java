package com.example.example.AdminServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.example.example.DataBase.*;
import java.io.IOException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import jakarta.servlet.annotation.WebServlet;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name="Bolge Giriş", value="/adminpanel/saveBolge")
public class Bolgegiris extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            // Kullanıcı tarafından gönderilen verileri al
            String district = request.getParameter("bolgekod");
            String neighborhood = request.getParameter("durum");
            String street = request.getParameter("name");

            // Yeni Bolge nesnesi oluştur ve verileri set et
            Bolge bolge = new Bolge();
            bolge.setZoneCode(district);
            bolge.setZoneIsActive(neighborhood);
            bolge.setZoneName(street);




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

            session.persist(bolge);
            transaction.commit();
            session.close();

            sessionFactory.close();
            // Kullanıcıya geri bildirim sağla
            response.sendRedirect("bolgegiris.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Bir hata oluştu.");
        }
    }
    
}