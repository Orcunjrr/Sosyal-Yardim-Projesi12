package com.example.example.DataBase;

import jakarta.persistence.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.annotations.CollectionId;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.mapping.Set;

import java.time.LocalDate;
import java.util.*;

@Entity
public class Tutanak {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String bilgiler;
    private String evdurumu;
    private String evDurumaciklama;
    private double kiramiktar;
    private String evtipi;
    private String yakacaktipi;
    private String kiradaMi;
    private int kacev;
    private double topkiragelir;
    private String arabavarmi;
    private String arabamodel;
    private String gayrivarmi;
    private String gayritur;
    private String askerMi;
    private String sehitMi;
    private String soybisMi;
    private String gaziMi;
    private int haneKisi;
    private int yetimSayi;
    private int toplamCocuk;
    private String saglikBilgiler;
    private String engelliVarMi;
    private String evEsyalari;
    private String borcDurumu;
    private String basvuruBeyan;
    private String gorusKanaati;
    private String sosyalguvence;
    private String sosyalguvencesi;
    private String yonlendirenBirim;
    private String yonKurumAciklama;
    private String talepEdilenYardimlar;
    private LocalDate incelemeTarihi;
    private String inceleme;
    private String inceleme1;
    private String basvuruKisi;
    private String durum;
    private String cekmece;
    private int ToplamDuzenliGelir;
    private int ToplamDuzensizGelir;
    private String aktifpasif;


    @OneToOne
    @JoinColumn(name = "KullaniciId")
    private KullaniciBilgi KullaniciId;


    public String getAktifpasif() {
        return aktifpasif;
    }

    public void setAktifpasif(String aktifpasif) {
        this.aktifpasif = aktifpasif;
    }

    public int getToplamDuzenliGelir() {
        return ToplamDuzenliGelir;
    }

    public void setToplamDuzenliGelir(int toplamDuzenliGelir) {
        ToplamDuzenliGelir = toplamDuzenliGelir;
    }

    public int getToplamDuzensizGelir() {
        return ToplamDuzensizGelir;
    }

    public void setToplamDuzensizGelir(int toplamDuzensizGelir) {
        ToplamDuzensizGelir = toplamDuzensizGelir;
    }

    public KullaniciBilgi getKullaniciId() {
        return KullaniciId;
    }

    public void setKullaniciId(KullaniciBilgi kullaniciId) {
        KullaniciId = kullaniciId;
    }

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getBilgiler() {
        return bilgiler;
    }
    public void setBilgiler(String bilgiler) {
        this.bilgiler = bilgiler;
    }
    public String getAskerMi() {
        return askerMi;
    }
    public void setAskerMi(String askerMi) {
        this.askerMi = askerMi;
    }
    public String getSehitMi() {
        return sehitMi;
    }
    public void setSehitMi(String sehitMi) {
        this.sehitMi = sehitMi;
    }
    public String getSoybisMi() {
        return soybisMi;
    }
    public void setSoybisMi(String soybisMi) {
        this.soybisMi = soybisMi;
    }
    public String getGaziMi() {
        return gaziMi;
    }
    public void setGaziMi(String gaziMi) {
        this.gaziMi = gaziMi;
    }
    public String getSaglikBilgiler() {
        return saglikBilgiler;
    }
    public void setSaglikBilgiler(String saglikBilgiler) {
        this.saglikBilgiler = saglikBilgiler;
    }
    public int getHaneKisi() {
        return haneKisi;
    }
    public void setHaneKisi(int haneKisi) {
        this.haneKisi = haneKisi;
    }
    public int getYetimSayi() {
        return yetimSayi;
    }
    public void setYetimSayi(int yetimSayi) {
        this.yetimSayi = yetimSayi;
    }
    public int getToplamCocuk() {
        return toplamCocuk;
    }
    public void setToplamCocuk(int toplamCocuk) {
        this.toplamCocuk = toplamCocuk;
    }
    public String getEngelliVarMi() {
        return engelliVarMi;
    }
    public void setEngelliVarMi(String engelliVarMi) {
        this.engelliVarMi = engelliVarMi;
    }
    public String getEvEsyalari() {
        return evEsyalari;
    }
    public void setEvEsyalari(String evEsyalari) {
        this.evEsyalari = evEsyalari;
    }
    public String getEvdurumu() {
        return evdurumu;
    }
    public void setEvdurumu(String evdurumu) {
        this.evdurumu = evdurumu;
    }
    public String getEvDurumaciklama() {
        return evDurumaciklama;
    }
    public void setEvDurumaciklama(String evDurumaciklama) {
        this.evDurumaciklama = evDurumaciklama;
    }
    public double getKiramiktar() {
        return kiramiktar;
    }
    public void setKiramiktar(double kiramiktar) {
        this.kiramiktar = kiramiktar;
    }
    public String getEvtipi() {
        return evtipi;
    }
    public void setEvtipi(String evtipi) {
        this.evtipi = evtipi;
    }
    public String getYakacaktipi() {
        return yakacaktipi;
    }
    public void setYakacaktipi(String yakacaktipi) {
        this.yakacaktipi = yakacaktipi;
    }
    public String getKiradaMi() {
        return kiradaMi;
    }
    public void setKiradaMi(String kiradaMi) {
        this.kiradaMi = kiradaMi;
    }
    public int getKacev() {
        return kacev;
    }
    public void setKacev(int kacev) {
        this.kacev = kacev;
    }
    public double getTopkiragelir() {
        return topkiragelir;
    }
    public void setTopkiragelir(double topkiragelir) {
        this.topkiragelir = topkiragelir;
    }
    public String getArabavarmi() {
        return arabavarmi;
    }
    public void setArabavarmi(String arabavarmi) {
        this.arabavarmi = arabavarmi;
    }
    public String getArabamodel() {
        return arabamodel;
    }
    public void setArabamodel(String arabamodel) {
        this.arabamodel = arabamodel;
    }
    public String getGayrivarmi() {
        return gayrivarmi;
    }
    public void setGayrivarmi(String gayrivarmi) {
        this.gayrivarmi = gayrivarmi;
    }
    public String getGayritur() {
        return gayritur;
    }
    public void setGayritur(String gayritur) {
        this.gayritur = gayritur;
    }
    public String getBorcDurumu() {
        return borcDurumu;
    }
    public void setBorcDurumu(String borcDurumu) {
        this.borcDurumu = borcDurumu;
    }

    public String getBasvuruBeyan() {
        return basvuruBeyan;
    }

    public void setBasvuruBeyan(String basvuruBeyan) {
        this.basvuruBeyan = basvuruBeyan;
    }

    public String getGorusKanaati() {
        return gorusKanaati;
    }

    public void setGorusKanaati(String gorusKanaati) {
        this.gorusKanaati = gorusKanaati;
    }

    public String getSosyalguvence() {
        return sosyalguvence;
    }

    public void setSosyalguvence(String sosyalguvence) {
        this.sosyalguvence = sosyalguvence;
    }

    public String getSosyalguvencesi() {
        return sosyalguvencesi;
    }

    public void setSosyalguvencesi(String sosyalguvencesi) {
        this.sosyalguvencesi = sosyalguvencesi;
    }

    public String getYonlendirenBirim() {
        return yonlendirenBirim;
    }

    public void setYonlendirenBirim(String yonlendirenBirim) {
        this.yonlendirenBirim = yonlendirenBirim;
    }

    public String getYonKurumAciklama() {
        return yonKurumAciklama;
    }

    public void setYonKurumAciklama(String yonKurumAciklama) {
        this.yonKurumAciklama = yonKurumAciklama;
    }

    public String getTalepEdilenYardimlar() {
        return talepEdilenYardimlar;
    }

    public void setTalepEdilenYardimlar(String talepEdilenYardimlar) {
        this.talepEdilenYardimlar = talepEdilenYardimlar;
    }

    public LocalDate getIncelemeTarihi() {
        return incelemeTarihi;
    }

    public void setIncelemeTarihi(LocalDate incelemeTarihi) {
        this.incelemeTarihi = incelemeTarihi;
    }

    public String getInceleme() {
        return inceleme;
    }

    public void setInceleme(String inceleme) {
        this.inceleme = inceleme;
    }

    public String getInceleme1() {
        return inceleme1;
    }

    public void setInceleme1(String inceleme1) {
        this.inceleme1 = inceleme1;
    }

    public String getBasvuruKisi() {
        return basvuruKisi;
    }

    public void setBasvuruKisi(String basvuruKisi) {
        this.basvuruKisi = basvuruKisi;
    }

    public String getDurum() {
        return durum;
    }

    public void setDurum(String durum) {
        this.durum = durum;
    }

    public String getCekmece() {
        return cekmece;
    }

    public void setCekmece(String cekmece) {
        this.cekmece = cekmece;
    }

    public static Tutanak getTutanakByID(int TutanakID) {
        Configuration configuration = new Configuration().configure();
        try (SessionFactory sessionFactory = configuration.buildSessionFactory(); Session session = sessionFactory.openSession()) {
            TypedQuery<Tutanak> query = session.createQuery("SELECT t FROM Tutanak t WHERE t.id= :TUTID", Tutanak.class);
            query.setParameter("TUTID", TutanakID);
            Tutanak results = query.getSingleResult();
            System.out.println("Dönülen Değerler: " + results);
            return results;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static List<Tutanak> getTutanakByIdNoAndNames2(String tckimlik) {
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        try (Session session = sessionFactory.openSession()) {
            TypedQuery<Tutanak> query = session.createQuery("SELECT t FROM Tutanak t WHERE t.KullaniciId.idNo= :tckimlik", Tutanak.class);
            query.setParameter("tckimlik", tckimlik);
            List<Tutanak> results = query.getResultList();
            System.out.println("func: " + results);
            return results;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            sessionFactory.close();
        }
    }
    public static List<Tutanak> getBySearch(String tckimlik, String ad, String soyad, String muracatnosu, String MahalleNosu ) {
        StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure()
                .build();

// 2. Session oluşturun
        if(muracatnosu.isEmpty()){muracatnosu="0"; }
            int murNo = Integer.parseInt(muracatnosu);
        try(SessionFactory sessionFactory = new MetadataSources(registry)
                .buildMetadata()
                .buildSessionFactory();){
            Session session = sessionFactory.openSession();
            TypedQuery<Tutanak> query = session.createQuery("SELECT t FROM Tutanak t "
                    + "where (:ad IS NULL OR t.KullaniciId.appliName = :ad) "
                    + "and (:soyad IS NULL OR t.KullaniciId.surname = :soyad) "
                    + "and (:tckimlik IS NULL OR t.KullaniciId.idNo = :tckimlik) "
                    + "and (:murNo = 0  OR t.KullaniciId.application.appId = :murNo) "
                    + "and (:mahalle = -1 OR t.KullaniciId.contact.neighborhood = :mahalle) and t.aktifpasif = 'Aktif' ", Tutanak.class);


            query.setParameter("ad", ad.toUpperCase());
            query.setParameter("soyad", soyad.toUpperCase());
            query.setParameter("tckimlik", tckimlik);
            query.setParameter("murNo", murNo);
            query.setParameter("mahalle", MahalleNosu);

            List<Tutanak> results=  query.getResultList();
            System.out.println(results);

            return results;


        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
