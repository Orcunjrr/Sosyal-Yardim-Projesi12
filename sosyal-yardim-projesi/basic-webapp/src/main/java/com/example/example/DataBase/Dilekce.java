package com.example.example.DataBase;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Column;
import java.time.LocalDate;

import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

@Entity
@Table(name = "Dilekce")
public class Dilekce {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int petId;

    @Column(name = "itraz_dilekce_ref_no")
    private String objectionPetitionRefNo;

    @Column(name = "itraz_dilekce_konu")
    private String objectionPetitionSubject;

    @Column(name = "itraz_dilekce_sonuc")
    private String objectionPetitionResult;

    @Column(name = "yonlendiren_birim")
    private String forwardingUnit;

    @Column(name = "yonlendirme_tarihi")
    private LocalDate forwardingDate;

    @Column(name = "dilekce_referans_no")
    private String petitionReferenceNo;

    @Column(name = "dilekce_konu")
    private String petitionSubject;

    @Column(name = "dilekce_sonuc")
    private String petitionResult;
    
    @Column(name = "yonlendiren_birim_Dilekce")
    private String forwardingDilekce;

    @Column(name = "yonlendirme_tarihi_Dilekce")
    private LocalDate forwardingDate2;

    // İlişki
    @OneToOne(mappedBy = "petition")
    private KullaniciBilgi idInfoId;

    // GET SETLER

    public int getPetId() {
        return petId;
    }

    public void setPetId(int petId) {
        this.petId = petId;
    }

    public String getObjectionPetitionRefNo() {
        return objectionPetitionRefNo;
    }

    public void setObjectionPetitionRefNo(String objectionPetitionRefNo) {
        this.objectionPetitionRefNo = objectionPetitionRefNo;
    }

    public String getObjectionPetitionSubject() {
        return objectionPetitionSubject;
    }

    public void setObjectionPetitionSubject(String objectionPetitionSubject) {
        this.objectionPetitionSubject = objectionPetitionSubject;
    }

    public String getObjectionPetitionResult() {
        return objectionPetitionResult;
    }

    public void setObjectionPetitionResult(String objectionPetitionResult) {
        this.objectionPetitionResult = objectionPetitionResult;
    }

    public String getForwardingUnit() {
        return forwardingUnit;
    }

    public void setForwardingUnit(String forwardingUnit) {
        this.forwardingUnit = forwardingUnit;
    }

    public LocalDate getForwardingDate() {
        return forwardingDate;
    }

    public void setForwardingDate(LocalDate forwardingDate) {
        this.forwardingDate = forwardingDate;
    }

    public String getPetitionReferenceNo() {
        return petitionReferenceNo;
    }

    public void setPetitionReferenceNo(String petitionReferenceNo) {
        this.petitionReferenceNo = petitionReferenceNo;
    }

    public String getPetitionSubject() {
        return petitionSubject;
    }

    public void setPetitionSubject(String petitionSubject) {
        this.petitionSubject = petitionSubject;
    }

    public String getPetitionResult() {
        return petitionResult;
    }

    public void setPetitionResult(String petitionResult) {
        this.petitionResult = petitionResult;
    }

    public String getForwardingDilekce() {
    	return forwardingDilekce;
    }
    
    public void setForwardingDilekce(String forwardingDilekce) {
    	this.forwardingDilekce = forwardingDilekce;
    }
    
    public LocalDate getForwardingDate2() {
        return forwardingDate2;
    }
    
    public void setForwardingDate2(LocalDate forwardingDate2) {
        this.forwardingDate2 = forwardingDate2;
    }

    public KullaniciBilgi getIdInfoId() {
        return idInfoId;
    }

    public void setIdInfoId(KullaniciBilgi idInfoId) {
        this.idInfoId = idInfoId;
    }
    public static Dilekce getbyID(int id) {
        Configuration configuration = new Configuration().configure();
        try (SessionFactory sessionFactory = configuration.buildSessionFactory()) {
            Session session = sessionFactory.openSession();
            return session.get(Dilekce.class, id);
        }catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
