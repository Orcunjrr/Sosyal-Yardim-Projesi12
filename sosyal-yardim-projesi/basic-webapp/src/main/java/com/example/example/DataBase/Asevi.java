package com.example.example.DataBase;

import jakarta.persistence.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.time.LocalDate;
import java.util.List;

@Entity
public class Asevi {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int aseviID;
    private LocalDate menuTarih;
    private String menuIcerik;

    public int getAseviID() {
        return aseviID;
    }

    public void setAseviID(int aseviID) {
        this.aseviID = aseviID;
    }

    public LocalDate getMenuTarih() {
        return menuTarih;
    }

    public void setMenuTarih(LocalDate menuTarih) {
        this.menuTarih = menuTarih;
    }

    public String getMenuIcerik() {
        return menuIcerik;
    }

    public void setMenuIcerik(String menuIcerik) {
        this.menuIcerik = menuIcerik;
    }

    public static List<Asevi> getAll(){
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        TypedQuery<Asevi> query = session.createQuery("SELECT u FROM Asevi u ", Asevi.class);
        List<Asevi> results=query.getResultList();

        session.getTransaction().commit();
        session.close();
        return results;
    }
}
