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
@Table(name = "EgitimBilgileri")
public class EgitimBilgileri {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int egitimId;
    @ManyToOne
    private KullaniciBilgi kullaniciId;
    private String devletozel;
    private LocalDate baslangictarihi;
    private LocalDate bitistarihi;
    private String ogrenciadi;
    private String okultipi;
    private String bolum;
    private String okuladi;
    private String sinif;
    private int bursorani;
    private String aciklama;

    public int getEgitimId() {
        return egitimId;
    }

    public void setEgitimId(int egitimId) {
        this.egitimId = egitimId;
    }

    public KullaniciBilgi getKullaniciId() {
        return kullaniciId;
    }

    public void setKullaniciId(KullaniciBilgi kullaniciId) {
        this.kullaniciId = kullaniciId;
    }

    public String getDevletozel() {
        return devletozel;
    }

    public void setDevletozel(String devletozel) {
        this.devletozel = devletozel;
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

    public String getOgrenciadi() {
        return ogrenciadi;
    }

    public void setOgrenciadi(String ogrenciadi) {
        this.ogrenciadi = ogrenciadi;
    }

    public String getOkultipi() {
        return okultipi;
    }

    public void setOkultipi(String okultipi) {
        this.okultipi = okultipi;
    }

    public String getBolum() {
        return bolum;
    }

    public void setBolum(String bolum) {
        this.bolum = bolum;
    }

    public String getOkuladi() {
        return okuladi;
    }

    public void setOkuladi(String okuladi) {
        this.okuladi = okuladi;
    }

    public String getSinif() {
        return sinif;
    }

    public void setSinif(String sinif) {
        this.sinif = sinif;
    }

    public int getBursorani() {
        return bursorani;
    }

    public void setBursorani(int bursorani) {
        this.bursorani = bursorani;
    }

    public String getAciklama() {
        return aciklama;
    }

    public void setAciklama(String aciklama) {
        this.aciklama = aciklama;
    }
    public static List<EgitimBilgileri> getAll(){
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

        TypedQuery<EgitimBilgileri> query = session.createQuery("SELECT e FROM EgitimBilgileri e ", EgitimBilgileri.class);
        List<EgitimBilgileri> results=query.getResultList();

        session.getTransaction().commit();
        session.close();
        sessionFactory.close();
        return results;
    }
    public static List<EgitimBilgileri> getForSameHousehold(String addressNo) {
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        try (Session session = sessionFactory.openSession()) {
            TypedQuery<EgitimBilgileri> query = session.createQuery("SELECT e FROM EgitimBilgileri e WHERE e.kullaniciId.address.addressNo = :address ", EgitimBilgileri.class);
            query.setParameter("address", addressNo);
            List<EgitimBilgileri> results = query.getResultList();
            return results;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            sessionFactory.close();
        }
    }
}
