package com.example.example.AdminServlet;

import com.example.example.DataBase.TutanakDurum;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.io.IOException;

@WebServlet(name= "durumTanimlama", value="/adminpanel/durumTanimlama")
public class durumTanimlama extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String durumAdi = req.getParameter("DurumAdi");
        String aktif = req.getParameter("Aktif");

        try{
            Configuration configuration = new Configuration().configure();
            SessionFactory sessionFactory = configuration.buildSessionFactory();
            Session session = sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();

            TutanakDurum durum = new TutanakDurum();
            durum.setDurumAdi(durumAdi);
            durum.setAktif(aktif);

            session.persist(durum);
            transaction.commit();

            session.close();
            sessionFactory.close();

            resp.sendRedirect("./durumtanim.jsp");

        }catch(Exception e){
            System.err.println("Hata oluştu: " + e);
            e.printStackTrace();
        }

    }
}
