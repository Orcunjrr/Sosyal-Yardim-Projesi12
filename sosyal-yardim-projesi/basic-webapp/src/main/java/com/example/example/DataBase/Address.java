package com.example.example.DataBase;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Column;
import jakarta.persistence.OneToOne;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

@Entity
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int addressID;

    @Column(name = "Public_Address")
    private String publicAddress;

    @Column(name = "addressNo")
    private String addressNo;

    @OneToOne(mappedBy = "address")
    private KullaniciBilgi idinfo;
    // GET SETLER

    public int getAddressID() {
        return addressID;
    }

    public void setAddressID(int addressID) {
        this.addressID = addressID;
    }

    public String getPublicAddress() {
        return publicAddress;
    }

    public void setPublicAddress(String publicAddress) {
        this.publicAddress = publicAddress;
    }

    public String getAddressNo() {
        return addressNo;
    }

    public void setAddressNo(String addressNo) {
        this.addressNo = addressNo;
    }

    public KullaniciBilgi getIdinfo() {
        return idinfo;
    }

    public void setIdinfo(KullaniciBilgi idinfo) {
        this.idinfo = idinfo;
    }
    public static Address getbyID(int id) {
        Configuration configuration = new Configuration().configure();
        try (SessionFactory sessionFactory = configuration.buildSessionFactory()) {
            Session session = sessionFactory.openSession();
            return session.get(Address.class, id);
        }catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}