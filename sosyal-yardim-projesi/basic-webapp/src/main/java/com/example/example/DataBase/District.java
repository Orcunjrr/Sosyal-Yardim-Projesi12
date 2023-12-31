//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.example.example.DataBase;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.TypedQuery;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

@Entity
@Table(name = "Mahalle")
public class District {
    @Id
    @GeneratedValue(
            strategy = GenerationType.AUTO
    )
    private int districtID;
    private String ilce;
    private String districtName;
    @ManyToOne
    private Bolge bolge;

    private Byte status;

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public int getDistrictID() {
        return districtID;
    }

    public void setDistrictID(int districtID) {
        this.districtID = districtID;
    }

    public String getIlce() {
        return ilce;
    }

    public void setIlce(String ilce) {
        this.ilce = ilce;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public Bolge getBolge() {
        return bolge;
    }

    public void setBolge(Bolge bolge) {
        this.bolge = bolge;
    }

    public static List<District> getAllDistrict() {
        Configuration configuration = (new Configuration()).configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        TypedQuery<District> query = session.createQuery("SELECT d FROM District d", District.class);
        List<District> District = query.getResultList();
        session.getTransaction().commit();
        sessionFactory.close();
        return District;
    }

    public static District getbyID(int id) {
        Configuration configuration = (new Configuration()).configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();

        try {
            Session session = sessionFactory.openSession();

            District var4;
            try {
                var4 = (District)session.get(District.class, id);
            } catch (Throwable var7) {
                if (session != null) {
                    try {
                        session.close();
                    } catch (Throwable var6) {
                        var7.addSuppressed(var6);
                    }
                }

                throw var7;
            }

            if (session != null) {
                session.close();
            }

            return var4;
        } catch (Exception var8) {
            var8.printStackTrace();
            return null;
        }
    }
}
