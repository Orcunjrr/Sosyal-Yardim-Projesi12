package com.example.example.DataBase;

import jakarta.persistence.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Entity
public class EngelliAracHizmet {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int EngelliHizmetId;

    @ManyToOne
    @JoinColumn(name = "Kullanıcı Id")
    private KullaniciBilgi kullanici;

    private String EngelliHizmetTip;

    private String EngelliHizmetAltTip;
    
    private String EngelliAraç;
    
    private String EngelliAracAciklama;
    
    private LocalDate HizmetKayitTarih;
    
    private String Status;
    
    private LocalDateTime RandevuTarih;

    // Getter ve Setter Metodları

    public int getEngelliHizmetId() {
        return EngelliHizmetId;
    }

    public void setEngelliHizmetId(int engelliHizmetId) {
        EngelliHizmetId = engelliHizmetId;
    }

    public String getEngelliHizmetTip() {
        return EngelliHizmetTip;
    }

    public void setEngelliHizmetTip(String engelliHizmetTip) {
        EngelliHizmetTip = engelliHizmetTip;
    }

    public String getEngelliHizmetAltTip() {
        return EngelliHizmetAltTip;
    }

    public void setEngelliHizmetAltTip(String engelliHizmetAltTip) {
        EngelliHizmetAltTip = engelliHizmetAltTip;
    }

    public String getEngelliAraç() {
        return EngelliAraç;
    }

    public void setEngelliAraç(String engelliAraç) {
        EngelliAraç = engelliAraç;
    }

    public String getEngelliAracAciklama() {
        return EngelliAracAciklama;
    }

    public void setEngelliAracAciklama(String engelliAracAciklama) {
        EngelliAracAciklama = engelliAracAciklama;
    }

    public LocalDate getHizmetKayitTarih() {
        return HizmetKayitTarih;
    }

    public void setHizmetKayitTarih(LocalDate hizmetKayitTarih) {
        HizmetKayitTarih = hizmetKayitTarih;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }

    public LocalDateTime getRandevuTarih() {
        return RandevuTarih;
    }

    public void setRandevuTarih(LocalDateTime randevuTarih) {
        RandevuTarih = randevuTarih;
    }

    public static List<EngelliAracHizmet> getAll() {
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        TypedQuery<EngelliAracHizmet> query = session.createQuery("SELECT e FROM EngelliAracHizmet e ", EngelliAracHizmet.class);
        List<EngelliAracHizmet> results = query.getResultList();

        session.getTransaction().commit();
        session.close();
        sessionFactory.close();
        return results;
    }
    public static List<EngelliAracHizmet> getby(int Id, String hizmetTip, String hizmetAltTip, String engelliArac, String status){
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        try (Session session = sessionFactory.openSession()) {
            TypedQuery<EngelliAracHizmet> query = session.createQuery("SELECT e FROM EngelliAracHizmet e WHERE e.id= :engellihizmetıd or e.EngelliHizmetTip= :engellihizmettip or e.EngelliHizmetAltTip= :engellihizmetalttip or e.EngelliAraç= :EngelliAraç or e.Status= :YardımStatüsü", EngelliAracHizmet.class);
            query.setParameter("engellihizmetıd", Id );
            query.setParameter("engellihizmettip", hizmetTip);
            query.setParameter("engellihizmetalttip", hizmetAltTip);
            query.setParameter("EngelliAraç", engelliArac);
            query.setParameter("YardımStatüsü", status);

            List<EngelliAracHizmet> results = query.getResultList();
            return results;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
