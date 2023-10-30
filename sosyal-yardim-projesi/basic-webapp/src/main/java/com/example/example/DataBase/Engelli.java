package com.example.example.DataBase;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import jakarta.persistence.Table;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.OneToMany;


@Entity
@Table(name = "Engelli")
public class Engelli {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int disabledID;

    private String disabledName;
    private byte Status;



    @OneToMany(mappedBy = "disabled")
    private List<EngelliAlt> disabledSubList;

    public byte getStatus() {
        return Status;
    }

    public void setStatus(byte status) {
        Status = status;
    }
    public int getDisabledID() {
        return disabledID;
    }

    public void setDisabledID(int disabledID) {
        this.disabledID = disabledID;
    }

    public String getDisabledName() {
        return disabledName;
    }

    public void setDisabledName(String disabledName) {
        this.disabledName = disabledName;
    }
    
    public List<EngelliAlt> getDisabledSubList() {
        return disabledSubList;
    }

    public void setDisabledSubList(List<EngelliAlt> disabledSubList) {
        this.disabledSubList = disabledSubList;
    }
    
    public static List<Engelli> getAll(){
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        TypedQuery<Engelli> query = session.createQuery("SELECT d FROM Engelli d ", Engelli.class);
        List<Engelli> results = query.getResultList();

        session.getTransaction().commit();
        session.close();
        sessionFactory.close();
        return results;
    }
    
    public static Engelli getbyID(int id){
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        try (Session session = sessionFactory.openSession()) {
            return session.get(Engelli.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}