package com.example.example.AdminServlet;

import com.example.example.DataBase.Askerhükümlügiris;
import com.example.example.DataBase.KullaniciBilgi;
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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "askerhukumlugiris" , value = "/adminpanel/askerhukumlugiris")
public class askerhukumlugiris extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String kullaniciId = req.getParameter("kId");
        KullaniciBilgi kullanici = KullaniciBilgi.getbyID(Integer.parseInt(kullaniciId));
        String bastarihi = req.getParameter("baslangictarih");
        String Askerhükümlüadi = req.getParameter("Askerhükümlüadi");
        String bitTarih = req.getParameter("bitistarih");
        String Askerlilikhükümlülüksüresi = req.getParameter("süre");;
        String askerhükümlü = req.getParameter("askerhükümlü");
        String aciklama = req.getParameter("acıklama");

        try {
            Configuration configuration = new Configuration().configure();
            SessionFactory sessionFactory = configuration.buildSessionFactory();
            Session session = sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();

            Askerhükümlügiris bilgi = new Askerhükümlügiris();
            bilgi.setKullaniciId(kullanici);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            bilgi.setBaslangictarihi(LocalDate.parse(bastarihi, formatter));
            bilgi.setAskerhükümlüadi(Askerhükümlüadi);
            bilgi.setBitistarihi(LocalDate.parse(bitTarih,formatter));
            bilgi.setAskerlilikhükümlülüksüresi(Askerlilikhükümlülüksüresi);
            bilgi.setAskerhükümlü(askerhükümlü);
            bilgi.setAciklama(aciklama);

            session.persist(bilgi);
            transaction.commit();

            session.close();
            sessionFactory.close();

            req.setAttribute("message", "Kayıt İşlemi Başarılı.");
            req.getRequestDispatcher("./Askerhükümlügiris.jsp?Id="+kullaniciId).forward(req,resp);

        }catch (Exception e){
            System.err.println("Hata oluştu: " + e);
            e.printStackTrace();
        }

    }
}
