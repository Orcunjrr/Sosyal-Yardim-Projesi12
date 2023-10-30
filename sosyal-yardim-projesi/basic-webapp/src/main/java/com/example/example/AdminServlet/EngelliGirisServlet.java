package com.example.example.AdminServlet;

import com.example.example.DataBase.Engelli;
import com.example.example.DataBase.EngelliGiris;
import com.example.example.DataBase.KullaniciBilgi;
import jakarta.persistence.TypedQuery;
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
import java.util.List;

@WebServlet(name = "EngelliGirisServlet" , value = "/adminpanel/EngelliGirisServlet")
public class EngelliGirisServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tcKimlikNo = req.getParameter("tcKimlik");
        String engelliTip = req.getParameter("EngelliTip");
        String engelliAltTip = req.getParameter("EngelliAltTip");
        String engelDerece = req.getParameter("derece");
        String egitimDurumu = req.getParameter("egitim_durumu");
        String engelBaslangicTarih = req.getParameter("engel_baslangic");
        String ad = req.getParameter("ad");
        String soyad = req.getParameter("soyad");
        String cinsiyet = req.getParameter("cinsiyet");
        String genelAciklama = req.getParameter("acıklama");

        try {
            Configuration configuration = new Configuration().configure();
            SessionFactory sessionFactory = configuration.buildSessionFactory();
            Session session = sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();

            EngelliGiris engelli = new EngelliGiris();

            if(getbyKullanıcıId(tcKimlikNo)==null){resp.sendRedirect("./engelligiris.jsp?HATA");}
            engelli.setKullanici(getbyKullanıcıId(tcKimlikNo));
            engelli.setTc_kimlik_no(tcKimlikNo);
            engelli.setEngelli_tip(engelliTip);
            engelli.setEngelli_alt_tip(engelliAltTip);
            engelli.setDerece(Integer.parseInt(engelDerece));
            engelli.setEgitim_durum(egitimDurumu);
            engelli.setEngel_baslangic(engelBaslangicTarih);
            engelli.setAd(ad);
            engelli.setSoyad(soyad);
            engelli.setCinsiyet(cinsiyet);
            engelli.setAciklama(genelAciklama);

            session.persist(engelli);
            transaction.commit();

            session.close();
            sessionFactory.close();

            resp.sendRedirect("./engelligiris.jsp");

        }catch (Exception e){
            System.err.println("Hata oluştu: " + e);
            e.printStackTrace();
        }


    }
    public static KullaniciBilgi getbyKullanıcıId(String tcNo){
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        TypedQuery<KullaniciBilgi> query = session.createQuery("SELECT k FROM KullaniciBilgi k where k.idNo= :tcNo", KullaniciBilgi.class);
        query.setParameter("tcNo", tcNo);
        KullaniciBilgi result = query.getSingleResult();

        session.getTransaction().commit();
        session.close();
        sessionFactory.close();
        return result;
    }

}
