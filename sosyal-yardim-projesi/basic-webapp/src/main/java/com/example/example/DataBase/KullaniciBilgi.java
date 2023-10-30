package com.example.example.DataBase;

import jakarta.persistence.*;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import java.time.LocalDate;
import java.util.Set;

@Entity
@Table(name = "KullaniciBilgi")
public class KullaniciBilgi {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idInfoId;

    @Column(name = "tc_kimlik_no")
    private String idNo; // Tc Kimlik

    @Column(name = "dogum_tarihi")
    private LocalDate birthDate; // Doğum Tarihi

    private String surname;
    private String appliName;
    private String fatherName;
    private String motherName;
    private String gender;

    @Column(name = "kayit_durumu")
    private String registrationStatus; //Kayıt Durumu

    private String soybis; //NE OLDUĞU BİLİNMİYOR
    private String maritalStatus; //Evlili Durumu

    @Column(name = "Kayitli_oldugu_il")
    private String registrationProvince; // Kayıtlı Olduğun İl

    @Column(name = "Kayitli_oldugu_ilce") // Kayıtlı Olduğu İlçe
    private String registrationDistrict;

    private String ciltNo;
    private String aileSirano;
    private String esAd;
    private String esSoyad;
    private String phone;
    private String addresNo;
 
    // İlişiler

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "address")
    private Address address;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "contact")
    private iletisim contact;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "appId")
    private Muracaat application;

    
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "petId")
    private Dilekce petition;

    @OneToMany(mappedBy = "idInfoId")
    private Set<AileYakinliklari> aileYakinliklariSet;

    @OneToMany(mappedBy = "kullanici")
    private Set<EngelliGiris> engelliId;

    @OneToMany(mappedBy = "kullanici_id")
    private List<YardimKarari> yardimKarariId;
    @OneToOne(mappedBy = "KullaniciId")
    private Tutanak tutanakId;

    @OneToMany(mappedBy = "kullaniciId")
    private List<EgitimBilgileri> egitimId;

    public List<EgitimBilgileri> getEgitimId() {
        return egitimId;
    }

    public void setEgitimBilgiId(List<EgitimBilgileri> egitimId) {
        this.egitimId = egitimId;
    }

    public Tutanak getTutanakId() {
        return tutanakId;
    }

    public void setTutanakId(Tutanak tutanakId) {
        this.tutanakId = tutanakId;
    }

    public List<YardimKarari> getYardimKarariId() {
        return yardimKarariId;
    }

    public void setYardimKarariId(List<YardimKarari> yardimKarariId) {
        this.yardimKarariId = yardimKarariId;
    }
    @OneToMany(mappedBy = "kullanici")
    private Set<EngelliAracHizmet> EngelliHizmetId;

    public String getAileSirano() {
        return aileSirano;
    }

    public void setAileSirano(String aileSirano) {
        this.aileSirano = aileSirano;
    }

    public void setEsAd(String esAd) {
        this.esAd = esAd;
    }

    public void setEsSoyad(String esSoyad) {
        this.esSoyad = esSoyad;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Set<EngelliGiris> getEngelliId() {
        return engelliId;
    }

    public void setEngelliId(Set<EngelliGiris> engelliId) {
        this.engelliId = engelliId;
    }

    public Set<EngelliAracHizmet> getEngelliHizmetId() {
        return EngelliHizmetId;
    }

    public void setEngelliHizmetId(Set<EngelliAracHizmet> engelliHizmetId) {
        EngelliHizmetId = engelliHizmetId;
    }

    public int getIdInfoId() {
        return idInfoId;
    }

    public void setIdInfoId(int idInfoId) {
        this.idInfoId = idInfoId;
    }

    public String getIdNo() {
        return idNo;
    }

    public void setIdNo(String idNo) {
        this.idNo = idNo;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getAppliName() {
        return appliName;
    }

    public void setAppliName(String appliName) {
        this.appliName = appliName;
    }

    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public String getMotherName() {
        return motherName;
    }

    public void setMotherName(String motherName) {
        this.motherName = motherName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getRegistrationStatus() {
        return registrationStatus;
    }

    public void setRegistrationStatus(String registrationStatus) {
        this.registrationStatus = registrationStatus;
    }

    public String getSoybis() {
        return soybis;
    }

    public void setSoybis(String soybis) {
        this.soybis = soybis;
    }

    public String getMaritalStatus() {
        return maritalStatus;
    }

    public void setMaritalStatus(String maritalStatus) {
        this.maritalStatus = maritalStatus;
    }

    public String getRegistrationProvince() {
        return registrationProvince;
    }

    public void setRegistrationProvince(String registrationProvince) {
        this.registrationProvince = registrationProvince;
    }

    public String getRegistrationDistrict() {
        return registrationDistrict;
    }

    public void setRegistrationDistrict(String registrationDistrict) {
        this.registrationDistrict = registrationDistrict;
    }

    public String getCiltNo() {
        return ciltNo;
    }

    public void setCiltNo(String ciltNo) {
        this.ciltNo = ciltNo;
    }
    
    public String getAileSiraNo() {
    	return aileSirano;
    }
    
    public void SetAileSiraNo(String aileSiraNo) {
    	this.aileSirano = aileSiraNo;
    }
    
    public String getEsAd() {
    	return esAd;
    }
    
    public void SetEsAd(String esAd) {
    	this.esAd = esAd;
    }
    
    public String getEsSoyad() {
    	return esSoyad;
    }
    
    public void SetEsSoyad(String esSoyad) {
    	this.esSoyad = esSoyad;
    }
    
    public String getPhone() {
    	return phone;
    }
    
    public void SetPhone(String phone) {
    	this.phone = phone;
    }
    
    public String getAddresNo() {
    	return addresNo;
    }
    
    public void setAddresNo(String addresNo) {
    	this.addresNo = addresNo;
    }
    
    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    
    public iletisim getContact() {
        return contact;
    }

    public void setContact(iletisim contact) {
        this.contact = contact;
    }

    public Muracaat getApplication() {
        return application;
    }

    public void setApplication(Muracaat application) {
        this.application = application;
    }

    
    public Dilekce getPetition() {
        return petition;
    }

    public void setPetition(Dilekce petition) {
        this.petition = petition;
    }

    public Set<AileYakinliklari> getAileYakinliklariSet() {
        return aileYakinliklariSet;
    }

    public void setAileYakinliklariSet(Set<AileYakinliklari> aileYakinliklariSet) {
        this.aileYakinliklariSet = aileYakinliklariSet;
    }

    public static List<KullaniciBilgi> getAll(){
        StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure()
                .build();
        SessionFactory sessionFactory = new MetadataSources(registry)
                .buildMetadata()
                .buildSessionFactory();
// 2. Session oluşturun
        Session session = sessionFactory.openSession();
// İşlemleri gerçekleştirin
        session.beginTransaction();

        TypedQuery<KullaniciBilgi> query = session.createQuery("SELECT h FROM KullaniciBilgi h ", KullaniciBilgi.class);
        List<KullaniciBilgi> results=query.getResultList();

        session.getTransaction().commit();
        session.close();
        sessionFactory.close();
        return results;
    }

    //DOĞRU KULLANIM
    public static KullaniciBilgi getbyID(int id) {

            StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                    .configure()
                    .build();
        try(            SessionFactory sessionFactory = new MetadataSources(registry)
                .buildMetadata()
                .buildSessionFactory();)  {

// 2. Session oluşturun
            Session session = sessionFactory.openSession();
// İşlemleri gerçekleştirin
            return session.get(KullaniciBilgi.class, id);
        }catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static List<KullaniciBilgi> getByAddress(String addressNo) {
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        try (Session session = sessionFactory.openSession()) {
            TypedQuery<KullaniciBilgi> query = session.createQuery("SELECT h FROM KullaniciBilgi h WHERE h.address.addressNo = :address ", KullaniciBilgi.class);
            query.setParameter("address", addressNo);
            List<KullaniciBilgi> results = query.getResultList();
            return results;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            sessionFactory.close();
        }
    }
    
    public static List<KullaniciBilgi> getByIdNoAndNames(String tckimlik, String ad, String soyad, String il) {
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        try (Session session = sessionFactory.openSession()) {
            TypedQuery<KullaniciBilgi> query = session.createQuery("SELECT h FROM KullaniciBilgi h WHERE h.idNo = :tckimlik OR h.appliName = :ad OR h.surname = :soyad OR h.registrationDistrict = :il", KullaniciBilgi.class);
            query.setParameter("tckimlik", tckimlik);
            query.setParameter("ad", ad);
            query.setParameter("soyad", soyad);
            query.setParameter("il", il);
            List<KullaniciBilgi> results = query.getResultList();
            return results;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            sessionFactory.close();
        }
    }


    public static List<KullaniciBilgi> getExperimental(String tckimlik, String ad, String soyad, String sokakid, String ceptel, String evtel, String adresno, String dilekcerefno, String mahalle, String arsivdosyano, String muracaatdurumu, LocalDate mur_baslangic_Tarihi, LocalDate mur_bitis_tarihi, LocalDate dogum_baslangic_tarihi, LocalDate dogum_bitis_tarihi,String murid) {
        StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure()
                .build();

// 2. Session oluşturun
// İşlemleri gerçekleştirin

        try(SessionFactory sessionFactory = new MetadataSources(registry)
                .buildMetadata()
                .buildSessionFactory();){
            Session session = sessionFactory.openSession();
            TypedQuery<KullaniciBilgi> query = session.createQuery("SELECT h FROM KullaniciBilgi h "
                    + "WHERE (:ad IS NULL OR h.appliName = :ad) "
                    + "and (:soyad IS NULL OR h.surname = :soyad) "
                    + "and(  :muracaatid =-1 or  h.idInfoId = :muracaatid) "
        //            + "and (:bolge IS NULL OR h.contact.district = :bolge) "
                    + "and (:sokakid IS NULL OR h.contact.Street = :sokakid) "
                    + "and (:ceptel IS NULL OR h.phone = :ceptel) "
               //     + "and (:kayitDurum IS NULL OR h.registrationStatus = :kayitDurum) "
                    + "and (:muracaatdurum IS NULL OR h.application.Status = :muracaatdurum) "
                    + "and (:evtel IS NULL OR h.contact.homePhone = :evtel) "
                    + "and (:dilekcerefno IS NULL OR h.petition.petitionReferenceNo = :dilekcerefno) "
                    + "and (:arsivdosyano IS NULL OR h.application.archiveFileNo = :arsivdosyano) "
                    + "and (:adresno IS NULL OR h.addresNo = :adresno) "
      //              + "and (:Soybis IS NULL OR h.soybis = :Soybis) "
                    + "and (:TCKimlik IS NULL OR h.idNo = :TCKimlik) "
                    + "and (:sehir IS NULL OR h.contact.neighborhood = :sehir) "
                    + "and ((:tarihAraligiBas IS NULL AND :tarihAraligiBit IS NULL) "
                    + "or (h.birthDate BETWEEN :tarihAraligiBas AND :tarihAraligiBit))"
                    + "and ((:mur_bas_tarih IS NULL AND :mur_bit_tarih IS NULL) "
                    + "or (h.application.applicationDate BETWEEN :mur_bas_tarih AND :mur_bit_tarih))", KullaniciBilgi.class);

            int murid1;
            if (murid.isEmpty()){
                murid1=-1;
                System.out.println("IF ICI "+murid);
                System.out.println("IF ICI11 "+murid1);
            }else{
                murid1 = Integer.parseInt(murid);
                System.out.println("ELSE : "+murid1);
            }
            query.setParameter("ad", ad);
            query.setParameter("soyad", soyad);
            query.setParameter("TCKimlik", tckimlik);
            query.setParameter("sehir", mahalle);
            query.setParameter("tarihAraligiBas", dogum_baslangic_tarihi);
            query.setParameter("tarihAraligiBit", dogum_bitis_tarihi);
            query.setParameter("muracaatid", murid1);
    //        query.setParameter("bolge", bolge);
            query.setParameter("sokakid", sokakid);
            query.setParameter("ceptel", ceptel);
            query.setParameter("evtel", evtel);
    //        query.setParameter("kayitDurum", kayitDurum);
            query.setParameter("muracaatdurum", muracaatdurumu);
            query.setParameter("dilekcerefno", dilekcerefno);
            query.setParameter("arsivdosyano", arsivdosyano);
            query.setParameter("adresno", adresno);
    //        query.setParameter("Soybis", saybis);
            query.setParameter("mur_bas_tarih", mur_baslangic_Tarihi);
            query.setParameter("mur_bit_tarih", mur_bitis_tarihi);



            List<KullaniciBilgi> results=  query.getResultList();
            System.out.println(results);

            return results;


        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    public static List<KullaniciBilgi> getByadsoyad( String ad, String soyad ) {
        Configuration configuration = new Configuration().configure();
        try (SessionFactory sessionFactory = configuration.buildSessionFactory(); Session session = sessionFactory.openSession()) {
            TypedQuery<KullaniciBilgi> query = session.createQuery("SELECT h FROM KullaniciBilgi h WHERE h.appliName = :ad OR h.surname = :soyad ", KullaniciBilgi.class);

            query.setParameter("ad", ad);
            query.setParameter("soyad", soyad);


            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}

