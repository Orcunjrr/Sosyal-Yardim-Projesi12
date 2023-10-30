package com.example.example.DataBase;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.TypedQuery;

@Entity
public class TalepYardimTip {
	 @Id
	 @GeneratedValue(strategy = GenerationType.AUTO)
	private int TalepYardimId;
    private String TalepYardimAdi;
    private String TalepYardimdurum;
    
    public int getTalepYardimId() {
        return TalepYardimId;
    }

    public void setTalepYardimId(int TalepYardimId) {
        this.TalepYardimId = TalepYardimId;
    }

    
    public String getTalepYardimAdi() {
        return TalepYardimAdi;
    }

    public void setTalepYardimAdi(String TalepYardimAdi) {
        this.TalepYardimAdi = TalepYardimAdi;
    }

    public String getTalepYardimdurum() {
        return TalepYardimdurum;
    }

    public void setTalepYardimdurum(String TalepYardimdurum) {
        this.TalepYardimdurum = TalepYardimdurum;
    }
    
    public static List<TalepYardimTip> getAll() {
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();

        Session session = sessionFactory.openSession();
        session.beginTransaction();

        TypedQuery<TalepYardimTip> query = session.createQuery("SELECT p FROM TalepYardimTip p", TalepYardimTip.class);
        List<TalepYardimTip> results = query.getResultList();


        session.getTransaction().commit();
        session.close();
        sessionFactory.close();

        return results;
    }
    
    public static TalepYardimTip getById(int userId) {
    	Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        try (Session session = sessionFactory.openSession()) {
            return session.get(TalepYardimTip.class, userId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
}
