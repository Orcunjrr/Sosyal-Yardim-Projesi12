package com.example.example.DataBase;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

@Entity
@Table(name = "Muracaat")
public class Muracaat {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int appId;

    @Column(name = "arsiv_dosya_no")
    private String archiveFileNo;

    @Column(name = "muracaat_tarihi")
    private LocalDate applicationDate;

    @Column(name = "muracaat_tipi")
    private String applicationType;

    private String region; // Bölge
    private String description;

    private Byte Status ;

    @OneToOne(mappedBy = "application")
    private KullaniciBilgi idInfoId;



    // Constructor, if needed (not shown in this example).

    // Getters and Setters


    public Byte getStatus() {
        return Status;
    }

    public void setStatus(Byte status) {
        Status = status;
    }

    public int getAppId() {
        return appId;
    }

    public void setAppId(int appId) {
        this.appId = appId;
    }

    public String getArchiveFileNo() {
        return archiveFileNo;
    }

    public void setArchiveFileNo(String archiveFileNo) {
        this.archiveFileNo = archiveFileNo;
    }

    public LocalDate getApplicationDate() {
        return applicationDate;
    }

    public void setApplicationDate(LocalDate applicationDate) {
        this.applicationDate = applicationDate;
    }

    public String getApplicationType() {
        return applicationType;
    }

    public void setApplicationType(String applicationType) {
        this.applicationType = applicationType;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public KullaniciBilgi getIdInfoId() {
        return idInfoId;
    }

    public void setIdInfoId(KullaniciBilgi idInfoId) {
        this.idInfoId = idInfoId;
    }

    public static Muracaat getbyID(int id) {
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        try (Session session = sessionFactory.openSession()) {
            return session.get(Muracaat.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
