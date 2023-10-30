package com.example.example.AdminServlet;

import com.example.example.DataBase.EgitimBilgileri;
import com.example.example.DataBase.EngelliGiris;
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

@WebServlet(name = "egitimBilgileriServlet" , value = "/adminpanel/egitimBilgileriServlet")
public class egitimBilgileriServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String kullaniciId = req.getParameter("kId");
        KullaniciBilgi kullanici = KullaniciBilgi.getbyID(Integer.parseInt(kullaniciId));
        String devletozel = req.getParameter("devletozel");
        String bastarihi = req.getParameter("bastarihi");
        String ogrenciadi = req.getParameter("ogrenci");
        String bitTarih = req.getParameter("bitTarih");
        String okultip = req.getParameter("okultip");
        String bölüm = req.getParameter("bölüm");
        String okuladi = req.getParameter("okulad");
        String sınıf = req.getParameter("sınıf");
        String bursoranı = req.getParameter("bursoran");
        String aciklama = req.getParameter("acıklama");

        try {
            Configuration configuration = new Configuration().configure();
            SessionFactory sessionFactory = configuration.buildSessionFactory();
            Session session = sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();

            EgitimBilgileri bilgi = new EgitimBilgileri();
            bilgi.setKullaniciId(kullanici);
            bilgi.setDevletozel(devletozel);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            bilgi.setBaslangictarihi(LocalDate.parse(bastarihi, formatter));
            bilgi.setOgrenciadi(ogrenciadi);
            bilgi.setBitistarihi(LocalDate.parse(bitTarih,formatter));
            bilgi.setOkultipi(okultip);
            bilgi.setBolum(bölüm);
            bilgi.setOkuladi(okuladi);
            bilgi.setSinif(sınıf);
            bilgi.setBursorani(Integer.parseInt(bursoranı));
            bilgi.setAciklama(aciklama);

            session.persist(bilgi);
            transaction.commit();

            session.close();
            sessionFactory.close();

            req.setAttribute("message", "Kayıt İşlemi Başarılı.");
            req.getRequestDispatcher("./egitimbilgilerilist.jsp?Id="+kullaniciId).forward(req,resp);

        }catch (Exception e){
            System.err.println("Hata oluştu: " + e);
            e.printStackTrace();
        }

    }
}
