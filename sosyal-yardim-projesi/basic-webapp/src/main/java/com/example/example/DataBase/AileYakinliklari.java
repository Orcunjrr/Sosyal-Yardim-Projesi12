package com.example.example.DataBase;

import com.example.example.AdminServlet.Aileyakinliklist;
import jakarta.persistence.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import java.time.LocalDate;
import java.util.List;
@Entity
@Table(name = "AileYakinliklari")
public class AileYakinliklari {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int Id;
    private String TcKimlik;
    @Column(name = "dogum_tarihi")
    private LocalDate birthDate;

    @Column(name = "ad")
    private String name;
    @Column(name = "soyad")
    private String surname;

    @Column(name = "yakinlik")
    private String yakinlik;

    @Column(name = "cinsiyet")
    private String gender;
    @Column(name = "medeni_hal")
    private String medeni_hal;
    @Column(name = "egitim_durumu")
    private String egitim_durumu;

    @Column(name = "meslek")
    private String meslek;
    @Column(name = "gelir")
    private double gelir;
    @Column(name ="death_day")
    private LocalDate dd;
    @ManyToOne
    @JoinColumn(name = "Kullanici_Id")
    private KullaniciBilgi idInfoId;

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getYakinlik() {
        return yakinlik;
    }

    public void setYakinlik(String yakinlik) {
        this.yakinlik = yakinlik;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getMedeni_hal() {
        return medeni_hal;
    }

    public void setMedeni_hal(String medeni_hal) {
        this.medeni_hal = medeni_hal;
    }

    public String getEgitim_durumu() {
        return egitim_durumu;
    }

    public void setEgitim_durumu(String egitim_durumu) {
        this.egitim_durumu = egitim_durumu;
    }

    public String getMeslek() {
        return meslek;
    }

    public void setMeslek(String meslek) {
        this.meslek = meslek;
    }

    public double getGelir() {
        return gelir;
    }

    public void setGelir(double gelir) {
        this.gelir = gelir;
    }

    public LocalDate getDd() {
        return dd;
    }

    public void setDd(LocalDate dd) {
        this.dd = dd;
    }

    public KullaniciBilgi getIdInfoId() {
        return idInfoId;
    }

    public void setIdInfoId(KullaniciBilgi idInfoId) {
        this.idInfoId = idInfoId;
    }

    public String getTcKimlik() {
        return TcKimlik;
    }

    public void setTcKimlik(String tcKimlik) {
        TcKimlik = tcKimlik;
    }

    public static AileYakinliklari getbyID(int id) {
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
        try {


            return session.get(AileYakinliklari.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }
    public static List<AileYakinliklari> getAllAffinity(){
        StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure()
                .build();
        SessionFactory sessionFactory = new MetadataSources(registry)
                .buildMetadata()
                .buildSessionFactory();

// 2. Session oluşturun
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        TypedQuery<AileYakinliklari> query = session.createQuery("SELECT professions FROM AileYakinliklari professions ", AileYakinliklari.class);
        List<AileYakinliklari>results=query.getResultList();

        session.getTransaction().commit();
        session.close();
        sessionFactory.close();
        return  results;

    }
    public static List<AileYakinliklari> getByIdNoAndNames(String tckimlik, String ad, String soyad) {
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        try (Session session = sessionFactory.openSession()) {
            TypedQuery<AileYakinliklari> query = session.createQuery("SELECT y FROM AileYakinliklari y WHERE y.TcKimlik= :tckimlik or y.name= :ad or y.surname= :soyad" , AileYakinliklari.class);
            query.setParameter("tckimlik", tckimlik);
            query.setParameter("ad", ad);
            query.setParameter("soyad", soyad);
            List<AileYakinliklari> results = query.getResultList();
            return results;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            sessionFactory.close();
        }
    }

    public static List<AileYakinliklari> getByIdbyAileList(String tckimlik) {
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        try (Session session = sessionFactory.openSession()) {
            TypedQuery<AileYakinliklari> query = session.createQuery("SELECT y FROM AileYakinliklari y WHERE y.TcKimlik= :tckimlik" , AileYakinliklari.class);
            query.setParameter("tckimlik", tckimlik);
            List<AileYakinliklari> results = query.getResultList();
            return results;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            sessionFactory.close();
        }
    }
    public static List<AileYakinliklari> getExperimental(String tckimlik, String ad, String soyad, String medenihal, String yakinlik) {
        StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure()
                .build();

// 2. Session oluşturun

// İşlemleri gerçekleştirin

        try(SessionFactory sessionFactory = new MetadataSources(registry)
                .buildMetadata()
                .buildSessionFactory();){
            Session session = sessionFactory.openSession();
            TypedQuery<AileYakinliklari> query = session.createQuery("SELECT a FROM AileYakinliklari a "
                    + "where (:ad IS NULL OR a.name = :ad) "
                    + "and (:soyad IS NULL OR a.surname= :soyad) "
                    + "and (:tckimlik IS NULL OR a.idInfoId.idNo = :tckimlik) "
                    + "or (:medenihal IS NULL OR a.medeni_hal = :medenihal) "
                    + "or (:yakinlik IS NULL OR a.yakinlik = :yakinlik)", AileYakinliklari.class);


            query.setParameter("ad", ad);
            query.setParameter("soyad", soyad);
            query.setParameter("tckimlik", tckimlik);
            query.setParameter("medenihal", medenihal);
            query.setParameter("yakinlik", yakinlik);

            List<AileYakinliklari> results=  query.getResultList();
            System.out.println(results);

            return results;


        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
