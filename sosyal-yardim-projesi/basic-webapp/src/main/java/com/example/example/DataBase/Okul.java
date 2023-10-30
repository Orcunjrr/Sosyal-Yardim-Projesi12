package com.example.example.DataBase;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.TypedQuery;

@Entity
@Table(name = "Okul")
public class Okul {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int SchoolID;
    
    private Byte Durum;
    
    private String Okul;
    
    private String OkulTipi;
    
    private String OkulName;

    // GET SETLER
	public int getSchoolID() {
		return SchoolID;
	}

	public void setSchoolID(int schoolID) {
		SchoolID = schoolID;
	}

	public Byte getDurum() {
		return Durum;
	}

	public void setDurum(Byte durum) {
		Durum = durum;
	}

	public String getOkul() {
		return Okul;
	}

	public void setOkul(String okul) {
		Okul = okul;
	}

	public String getOkulTipi() {
		return OkulTipi;
	}

	public void setOkulTipi(String okulTipi) {
		OkulTipi = okulTipi;
	}

	public String getOkulName() {
		return OkulName;
	}

	public void setOkulName(String okulName) {
		OkulName = okulName;
	}
    
    public static List<com.example.example.DataBase.Okul> getAllSchool() {
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();

        Session session = sessionFactory.openSession();
        session.beginTransaction();

        TypedQuery<com.example.example.DataBase.Okul> query = session.createQuery("SELECT r FROM Okul r", com.example.example.DataBase.Okul.class);
        @SuppressWarnings("unused")
		List<com.example.example.DataBase.Okul> roles = query.getResultList();

        session.getTransaction().commit();
        sessionFactory.close();

        return roles;
    }

    public static com.example.example.DataBase.Okul getById(int userId) {
    	Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        try (Session session = sessionFactory.openSession()) {
            return session.get(com.example.example.DataBase.Okul.class, userId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
}
