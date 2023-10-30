package com.example.example.DataBase;

import jakarta.persistence.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.List;

@Entity
public class Stok {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int stokKod;
    private int guncelMiktar;
    private double guncelFiyat;
    private String stokTanim;

    public int getStokKod() {
        return stokKod;
    }

    public void setStokKod(int stokKod) {
        this.stokKod = stokKod;
    }

    public int getGuncelMiktar() {
        return guncelMiktar;
    }

    public void setGuncelMiktar(int guncelMiktar) {
        this.guncelMiktar = guncelMiktar;
    }

    public double getGuncelFiyat() {
        return guncelFiyat;
    }

    public void setGuncelFiyat(double guncelFiyat) {
        this.guncelFiyat = guncelFiyat;
    }

    public String getStokTanim() {
        return stokTanim;
    }

    public void setStokTanim(String stokTanim) {
        this.stokTanim = stokTanim;
    }
    public static List<Stok> getAll(){
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        TypedQuery<Stok> query = session.createQuery("SELECT h FROM Stok h ", Stok.class);
        List<Stok> results=query.getResultList();

        session.getTransaction().commit();
        session.close();
        return results;
    }
}