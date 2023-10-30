package com.example.example.DataBase;

import jakarta.persistence.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.List;

@Entity
@Table(name = "YardimTipi")
public class YardimTipi {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int helpId;

    private String helpName;

    public int getHelpId() {
        return helpId;
    }

    public void setHelpId(int helpId) {
        this.helpId = helpId;
    }

    public String getHelpName() {
        return helpName;
    }

    public void setHelpName(String helpName) {
        this.helpName = helpName;
    }

    public static List<YardimTipi> getAll(){
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        TypedQuery<YardimTipi> query = session.createQuery("SELECT h FROM YardimTipi h ", YardimTipi.class);
        List<YardimTipi> results=query.getResultList();

        session.getTransaction().commit();
        session.close();
        sessionFactory.close();
        return results;
    }
    public static YardimTipi getbyID(int id){
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        try (Session session = sessionFactory.openSession()) {
            return session.get(YardimTipi.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
