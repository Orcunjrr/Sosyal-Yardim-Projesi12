package com.example.example.DataBase;

import jakarta.persistence.*;
import jakarta.servlet.annotation.WebServlet;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "Askerhükümlügiris")
public class Askerhükümlügiris {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int AskerhükümlüId;
    @ManyToOne
    private KullaniciBilgi kullaniciId;
    private LocalDate baslangictarihi;
    private LocalDate bitistarihi;
    private String Askerhükümlüadi;
    private String Askerlilikhükümlülüksüresi;
    private String aciklama;
    private String Askerhükümlü;


    public int getAskerhükümlüId() {
        return AskerhükümlüId;
    }

    public void setAskerhükümlüId(int askerhükümlüId) {
        AskerhükümlüId = askerhükümlüId;
    }

    public KullaniciBilgi getKullaniciId() {
        return kullaniciId;
    }

    public void setKullaniciId(KullaniciBilgi kullaniciId) {
        this.kullaniciId = kullaniciId;
    }

    public LocalDate getBaslangictarihi() {
        return baslangictarihi;
    }

    public void setBaslangictarihi(LocalDate baslangictarihi) {
        this.baslangictarihi = baslangictarihi;
    }

    public LocalDate getBitistarihi() {
        return bitistarihi;
    }

    public void setBitistarihi(LocalDate bitistarihi) {
        this.bitistarihi = bitistarihi;
    }

    public String getAskerhükümlüadi() {
        return Askerhükümlüadi;
    }

    public void setAskerhükümlüadi(String askerhükümlüadi) {
        Askerhükümlüadi = askerhükümlüadi;
    }

    public String getAskerlilikhükümlülüksüresi() {
        return Askerlilikhükümlülüksüresi;
    }

    public void setAskerlilikhükümlülüksüresi(String Askerlilikhükümlülüksüresi) {
        this.Askerlilikhükümlülüksüresi = Askerlilikhükümlülüksüresi;
    }

    public String getAciklama() {
        return aciklama;
    }

    public void setAciklama(String aciklama) {
        this.aciklama = aciklama;
    }

    public String getAskerhükümlü() {
        return Askerhükümlü;
    }

    public void setAskerhükümlü(String Askerhükümlü) {
        this.Askerhükümlü = Askerhükümlü;
    }

    public static List<Askerhükümlügiris> getAll(){
        StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure()
                .build();
        SessionFactory sessionFactory = new MetadataSources(registry)
                .buildMetadata()
                .buildSessionFactory();
// 2. Session oluşturun
        Session session = sessionFactory.openSession();
// İşlemleri gerçekleştirin
        session.beginTransaction();

        TypedQuery<Askerhükümlügiris> query = session.createQuery("SELECT e FROM Askerhükümlügiris e ", Askerhükümlügiris.class);
        List<Askerhükümlügiris> results=query.getResultList();

        session.getTransaction().commit();
        session.close();
        sessionFactory.close();
        return results;
    }
    public static List<Askerhükümlügiris> getForSameHousehold(String addressNo) {
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        try (Session session = sessionFactory.openSession()) {
            TypedQuery<Askerhükümlügiris> query = session.createQuery("SELECT e FROM Askerhükümlügiris e WHERE e.kullaniciId.address.addressNo = :address ", Askerhükümlügiris.class);
            query.setParameter("address", addressNo);
            List<Askerhükümlügiris> results = query.getResultList();
            return results;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            sessionFactory.close();
        }
    }
}
