package com.example.example.DataBase;

import jakarta.persistence.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.List;

@Entity
@Table(name = "Bolge")
public class Bolge {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int zoneId;

    private String zoneCode;
    private String zoneName;
    private String zoneIsActive;

    @OneToMany(mappedBy = "bolge")
    private List<District> mahalle;
    // Getter ve Setter metotları


    public int getZoneId() {
        return zoneId;
    }

    public void setZoneId(int zoneId) {
        this.zoneId = zoneId;
    }

    public String getZoneCode() {
        return zoneCode;
    }

    public void setZoneCode(String zoneCode) {
        this.zoneCode = zoneCode;
    }

    public String getZoneName() {
        return zoneName;
    }

    public void setZoneName(String zoneName) {
        this.zoneName = zoneName;
    }

    public String getZoneIsActive() {
        return zoneIsActive;
    }

    public void setZoneIsActive(String zoneIsActive) {
        this.zoneIsActive = zoneIsActive;
    }

    public List<District> getMahalle() {
        return mahalle;
    }

    public void setMahalle(List<District> mahalle) {
        this.mahalle = mahalle;
    }

    public static List <Bolge> getAllZone(){
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        TypedQuery<Bolge> query= session.createQuery("SELECT z FROM Bolge z ", Bolge.class);
        List<Bolge> zones = query.getResultList();
        session.getTransaction().commit();

        sessionFactory.close();
        return zones;
    }
    public static List <Bolge> getAllAktifZone(){
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        TypedQuery<Bolge> query= session.createQuery("SELECT z FROM Bolge z where z.zoneIsActive='Aktif'", Bolge.class);
        List<Bolge> zones = query.getResultList();
        session.getTransaction().commit();

        sessionFactory.close();
        return zones;
    }
}
