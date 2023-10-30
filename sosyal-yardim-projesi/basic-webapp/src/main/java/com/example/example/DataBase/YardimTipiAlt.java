package com.example.example.DataBase;

import jakarta.persistence.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


import java.util.List;

@Entity
@Table(name = "YardimAltTipi")

public class YardimTipiAlt {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int helpSubId;
    private String helpSubName;
    private byte Status;


    public byte getStatus() {
        return Status;
    }

    public void setStatus(byte status) {
        Status = status;
    }

    @ManyToOne
    @JoinColumn(name = "HelpId")
    private YardimTipi helpId;



    public int getHelpSubId() {
        return helpSubId;
    }

    public void setHelpSubId(int helpSubId) {
        this.helpSubId = helpSubId;
    }


    public String getHelpSubName() {
        return helpSubName;
    }

    public void setHelpSubName(String helpSubName) {
        this.helpSubName = helpSubName;
    }

    public YardimTipi getHelpId() {
        return helpId;
    }

    public void setHelpId(YardimTipi helpId) {
        this.helpId = helpId;
    }

    public static List<YardimTipiAlt> getAll(){
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        TypedQuery<YardimTipiAlt> query = session.createQuery("SELECT h FROM YardimTipiAlt h ", YardimTipiAlt.class);
        List<YardimTipiAlt> results=query.getResultList();

        session.getTransaction().commit();
        session.close();
        sessionFactory.close();
        return results;
    }
    public static YardimTipiAlt getbyID(int id){
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        try (Session session = sessionFactory.openSession()) {
            return session.get(YardimTipiAlt.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


}
