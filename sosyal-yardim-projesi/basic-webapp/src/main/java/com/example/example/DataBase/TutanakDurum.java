package com.example.example.DataBase;

import jakarta.persistence.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import java.util.List;

@Entity
public class TutanakDurum {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int durumID;

    private String durumAdi;

    private String aktif;

    public int getDurumID() {
        return durumID;
    }

    public void setDurumID(int durumID) {
        this.durumID = durumID;
    }

    public String getDurumAdi() {
        return durumAdi;
    }

    public void setDurumAdi(String durumAdi) {
        this.durumAdi = durumAdi;
    }

    public String getAktif() {
        return aktif;
    }

    public void setAktif(String aktif) {
        this.aktif = aktif;
    }

    public static List<TutanakDurum> getAll(){
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

        TypedQuery<TutanakDurum> query = session.createQuery("SELECT t FROM TutanakDurum t ", TutanakDurum.class);
        List<TutanakDurum> results=query.getResultList();

        session.getTransaction().commit();
        session.close();
        sessionFactory.close();
        return results;
    }
}
