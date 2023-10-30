package com.example.example.AdminServlet;

import com.example.example.DataBase.Asevi;
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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "AseviGiris", value = "/adminpanel/AseviGiris")
public class AseviGiris extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String menuTarih = req.getParameter("menu-tarih");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate tarih = LocalDate.parse(menuTarih, formatter);
        String icerik = req.getParameter("menu-icerik");

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

            Asevi asevi = new Asevi();
            asevi.setMenuTarih(tarih);
            asevi.setMenuIcerik(icerik);

            session.persist(asevi);
            transaction.commit();

            session.close();
            sessionFactory.close();
            resp.sendRedirect("./asevigir.jsp");
        }catch (Exception e) {
            e.printStackTrace();  // Hata durumlarında hatayı logla
        }
    }
}
