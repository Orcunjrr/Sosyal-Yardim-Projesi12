package com.example.example.DataBase;

import jakarta.persistence.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "EngelliGiris")
public class EngelliGiris {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int engelliId;

    @ManyToOne
    @JoinColumn(name = "Kullanıcı Id")
    private KullaniciBilgi kullanici;

    @Column(name = "Tc Kimlik No")
    private String tc_kimlik_no;

    @Column(name = "Engelli Tip")
    private String engelli_tip;

    @Column(name = "Engelli Alt Tip")
    private String engelli_alt_tip;

    @Column(name = "Engel Derece")
    private int derece;

    @Column(name = "Eğitim Durumu")
    private String egitim_durum;

    @Column(name = "Engel Başlangıç Tarihi")
    private String engel_baslangic;

    @Column(name = "Ad")
    private String ad;

    @Column(name = "Soyad")
    private String soyad;

    @Column(name = "Cinsiyet")
    private String cinsiyet;

    @Column(name = "Genel Açıklama")
    private String aciklama;

    public int getEngelliId() {
        return engelliId;
    }

    public void setEngelliId(int engelliId) {
        this.engelliId = engelliId;
    }

    public KullaniciBilgi getKullanici() {
        return kullanici;
    }

    public void setKullanici(KullaniciBilgi kullanici) {
        this.kullanici = kullanici;
    }

    public String getTc_kimlik_no() {
        return tc_kimlik_no;
    }

    public void setTc_kimlik_no(String tc_kimlik_no) {
        this.tc_kimlik_no = tc_kimlik_no;
    }

    public String getEngelli_tip() {
        return engelli_tip;
    }

    public void setEngelli_tip(String engelli_tip) {
        this.engelli_tip = engelli_tip;
    }

    public String getEngelli_alt_tip() {
        return engelli_alt_tip;
    }

    public void setEngelli_alt_tip(String engelli_alt_tip) {
        this.engelli_alt_tip = engelli_alt_tip;
    }

    public int getDerece() {
        return derece;
    }

    public void setDerece(int derece) {
        this.derece = derece;
    }

    public String getEgitim_durum() {
        return egitim_durum;
    }

    public void setEgitim_durum(String egitim_durum) {
        this.egitim_durum = egitim_durum;
    }

    public String getEngel_baslangic() {
        return engel_baslangic;
    }

    public void setEngel_baslangic(String engel_baslangic) {
        this.engel_baslangic = engel_baslangic;
    }

    public String getAd() {
        return ad;
    }

    public void setAd(String ad) {
        this.ad = ad;
    }

    public String getSoyad() {
        return soyad;
    }

    public void setSoyad(String soyad) {
        this.soyad = soyad;
    }

    public String getCinsiyet() {
        return cinsiyet;
    }

    public void setCinsiyet(String cinsiyet) {
        this.cinsiyet = cinsiyet;
    }

    public String getAciklama() {
        return aciklama;
    }

    public void setAciklama(String aciklama) {
        this.aciklama = aciklama;
    }
    public static List<EngelliGiris> getAll() {
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        TypedQuery<EngelliGiris> query = session.createQuery("SELECT e FROM EngelliGiris e ", EngelliGiris.class);
        List<EngelliGiris> results = query.getResultList();

        session.getTransaction().commit();
        session.close();
        sessionFactory.close();
        return results;
    }
    public static List<EngelliGiris> getbyTcNameSurnameGender(String tc, String gender, String name, String surname){
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        try (Session session = sessionFactory.openSession()) {
            TypedQuery<EngelliGiris> query = session.createQuery("SELECT e FROM EngelliGiris e WHERE e.tc_kimlik_no= :tckimlik or e.cinsiyet= :cinsiyet or e.ad= :ad or e.soyad= :soyad", EngelliGiris.class);
            query.setParameter("tckimlik", tc);
            query.setParameter("cinsiyet", gender);
            query.setParameter("ad", name);
            query.setParameter("soyad", surname);
            List<EngelliGiris> results = query.getResultList();
            return results;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static List<EngelliGiris> getExperimental(String tckimlik, String ad, String soyad, String engelliAltTip, String engelliTip) {
        StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure()
                .build();

// 2. Session oluşturun

// İşlemleri gerçekleştirin

        try(SessionFactory sessionFactory = new MetadataSources(registry)
                .buildMetadata()
                .buildSessionFactory();){
            Session session = sessionFactory.openSession();
            TypedQuery<EngelliGiris> query = session.createQuery("SELECT e FROM EngelliGiris e "
                    + "where (:ad IS NULL OR e.ad = :ad) "
                    + "and (:soyad IS NULL OR e.soyad = :soyad) "
                    + "and (:tckimlik IS NULL OR e.tc_kimlik_no = :tckimlik) "
                    + "or (:engelliAltTip IS NULL OR e.engelli_alt_tip = :engelliAltTip) "
                    + "or (:engelliTip IS NULL OR e.engelli_tip = :engelliTip)", EngelliGiris.class);


            query.setParameter("ad", ad);
            query.setParameter("soyad", soyad);
            query.setParameter("tckimlik", tckimlik);
            query.setParameter("engelliAltTip", engelliAltTip);
            query.setParameter("engelliTip", engelliTip);
            System.out.println(ad);
            System.out.println(soyad);
            System.out.println(tckimlik);
            System.out.println(engelliAltTip);
            System.out.println(engelliTip);

            List<EngelliGiris> results=  query.getResultList();
            System.out.println(results);

            return results;


        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
