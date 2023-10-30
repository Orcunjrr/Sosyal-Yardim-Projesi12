package com.example.example.DataBase;

import jakarta.persistence.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import java.util.List;

@Entity
@Table(name = "YakinlikDerecesi")
public class YakinlikDerecesi {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int affinityId;
    private String affinityName;
    private String isActiveAffinity;

    public int getAffinityId() {
        return affinityId;
    }

    public void setAffinityId(int affinityId) {
        this.affinityId = affinityId;
    }

    public String getAffinityName() {
        return affinityName;
    }

    public void setAffinityName(String affinityName) {
        this.affinityName = affinityName;
    }

    public String getIsActiveAffinity() {
        return isActiveAffinity;
    }

    public void setIsActiveAffinity(String isActiveAffinity) {
        this.isActiveAffinity = isActiveAffinity;
    }

    public static List<YakinlikDerecesi> getAllAffinity(){
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        TypedQuery<YakinlikDerecesi> query = session.createQuery("SELECT professions FROM YakinlikDerecesi professions ", YakinlikDerecesi.class);
        List<YakinlikDerecesi>results=query.getResultList();

        session.getTransaction().commit();
        session.close();
        sessionFactory.close();
        return results;

    }

    public static YakinlikDerecesi getinfobyAffinityId(int afId){
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        try (Session session = sessionFactory.openSession()) {
            return session.get(YakinlikDerecesi.class, afId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
