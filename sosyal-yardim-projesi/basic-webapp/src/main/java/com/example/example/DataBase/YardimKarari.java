package com.example.example.DataBase;

import jakarta.persistence.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name="YardimKarari")
public class YardimKarari {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int KararId;

    @ManyToOne
    @JoinColumn(name = "Kullanıcı Id")
    private KullaniciBilgi kullanici_id;

    @Column(name="Yardım Tipi")
    private String yardimTip;

    @Column(name="Yardım Alt Tipi")
    private String yardimAltTip;

    @Column(name = "Yardım Dönemleri")
    private String yardımDönem;

    @Column(name = "Yönlendiren Kurum")
    private String yönlendirenKurum;

    @Column(name = "Açıklama")
    private String acıklama;

    @Column(name = "Kilit")
    private String kilit;

    @Column(name = "cinsiyet")
    private String cinsiyet;

    @Column(name = "Itiraz")
    private String itiraz;

    @Column(name = "Yardım Statü")
    private String yardimStatu;

    @Column(name = "Dosya Karar Sayısı")
    private String dosKarSayısı;

    @Column(name = "Dosya Tarihi")
    private LocalDate dosyaTarihi;

    @Column(name = "Yardım Teslim Tarihi")
    private LocalDate yarTeslimTarihi;

    @Column(name = "Yardım Tutarı")
    private double yardımTutari;

    @Column(name = "Adet")
    private int adet;

    @Column(name = "Teslim Eden Kişi")
    private String teslimKisi;

    @Column(name = "Red Sebepleri")
    private String redSebepler;

    @Column(name = "Yardım Kart No")
    private int yardımKartNo;

    @Column(name = "Yardım Kart Durum")
    private String yardımKartDurum;
    @Column(name = "Karta Yüklenen Miktar")
    private double kartMiktar;

    @Column(name = "Sadece Belirtilen Alt Tip")
    private String sadeceAltTip;

    @Column(name = "Yardım Başlangıç Tarihi")
    private LocalDate yarBaslangıcTarihi;

    @Column(name = "Kredi Bitiş Tarihi")
    private LocalDate krediBitisTarihi;

    public int getKararId() {
        return KararId;
    }

    public void setKararId(int kararId) {
        KararId = kararId;
    }

    public KullaniciBilgi getKullanici_id() {
        return kullanici_id;
    }

    public void setKullanici_id(KullaniciBilgi kullanici_id) {
        this.kullanici_id = kullanici_id;
    }


    public String getYardimTip() {
        return yardimTip;
    }

    public void setYardimTip(String yardimTip) {
        this.yardimTip = yardimTip;
    }

    public String getYardimAltTip() {
        return yardimAltTip;
    }

    public void setYardimAltTip(String yardimAltTip) {
        this.yardimAltTip = yardimAltTip;
    }

    public String getYardımDönem() {
        return yardımDönem;
    }

    public void setYardımDönem(String yardımDönem) {
        this.yardımDönem = yardımDönem;
    }

    public String getYönlendirenKurum() {
        return yönlendirenKurum;
    }

    public void setYönlendirenKurum(String yönlendirenKurum) {
        this.yönlendirenKurum = yönlendirenKurum;
    }

    public String getAcıklama() {
        return acıklama;
    }

    public void setAcıklama(String acıklama) {
        this.acıklama = acıklama;
    }

    public void setKilit(String kilit) {
        this.kilit = kilit;
    }

    public String getCinsiyet() {
        return cinsiyet;
    }

    public void setCinsiyet(String cinsiyet) {
        this.cinsiyet = cinsiyet;
    }


    public void setItiraz(String itiraz) {
        this.itiraz = itiraz;
    }

    public String getKilit() {
        return kilit;
    }

    public String getItiraz() {
        return itiraz;
    }

    public String getSadeceAltTip() {
        return sadeceAltTip;
    }

    public String getYardimStatu() {
        return yardimStatu;
    }

    public void setYardimStatu(String yardimStatu) {
        this.yardimStatu = yardimStatu;
    }

    public String getDosKarSayısı() {
        return dosKarSayısı;
    }

    public void setDosKarSayısı(String dosKarSayısı) {
        this.dosKarSayısı = dosKarSayısı;
    }

    public LocalDate getDosyaTarihi() {
        return dosyaTarihi;
    }

    public void setDosyaTarihi(LocalDate dosyaTarihi) {
        this.dosyaTarihi = dosyaTarihi;
    }

    public LocalDate getYarTeslimTarihi() {
        return yarTeslimTarihi;
    }

    public void setYarTeslimTarihi(LocalDate yarTeslimTarihi) {
        this.yarTeslimTarihi = yarTeslimTarihi;
    }

    public double getYardımTutari() {
        return yardımTutari;
    }

    public void setYardımTutari(double yardımTutari) {
        this.yardımTutari = yardımTutari;
    }

    public int getAdet() {
        return adet;
    }

    public void setAdet(int adet) {
        this.adet = adet;
    }

    public String getTeslimKisi() {
        return teslimKisi;
    }

    public void setTeslimKisi(String teslimKisi) {
        this.teslimKisi = teslimKisi;
    }

    public String getRedSebepler() {
        return redSebepler;
    }

    public void setRedSebepler(String redSebepler) {
        this.redSebepler = redSebepler;
    }

    public int getYardımKartNo() {
        return yardımKartNo;
    }

    public void setYardımKartNo(int yardımKartNo) {
        this.yardımKartNo = yardımKartNo;
    }

    public String getYardımKartDurum() {
        return yardımKartDurum;
    }

    public void setYardımKartDurum(String yardımKartDurum) {
        this.yardımKartDurum = yardımKartDurum;
    }

    public double getKartMiktar() {
        return kartMiktar;
    }

    public void setKartMiktar(double kartMiktar) {
        this.kartMiktar = kartMiktar;
    }


    public void setSadeceAltTip(String sadeceAltTip) {
        this.sadeceAltTip = sadeceAltTip;
    }

    public LocalDate getYarBaslangıcTarihi() {
        return yarBaslangıcTarihi;
    }

    public void setYarBaslangıcTarihi(LocalDate yarBaslangıcTarihi) {
        this.yarBaslangıcTarihi = yarBaslangıcTarihi;
    }

    public LocalDate getKrediBitisTarihi() {
        return krediBitisTarihi;
    }

    public void setKrediBitisTarihi(LocalDate krediBitisTarihi) {
        this.krediBitisTarihi = krediBitisTarihi;
    }

    public static YardimKarari getbyID(int id) {

        StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure()
                .build();
        try(SessionFactory sessionFactory = new MetadataSources(registry)
                .buildMetadata()
                .buildSessionFactory();)  {

// 2. Session oluşturun
            Session session = sessionFactory.openSession();
// İşlemleri gerçekleştirin
            return session.get(YardimKarari.class, id);
        }catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static List<YardimKarari> getByIdNoAndNames2(String tckimlik) {
        Configuration configuration = new Configuration().configure();
        try (SessionFactory sessionFactory = configuration.buildSessionFactory(); Session session = sessionFactory.openSession()) {
            TypedQuery<YardimKarari> query = session.createQuery("SELECT y FROM YardimKarari y WHERE y.kullanici_id.idNo = :tckimlik ", YardimKarari.class);
            query.setParameter("tckimlik", tckimlik);
            List<YardimKarari> results = query.getResultList();
            return results;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static List<YardimKarari> getAll() {
        Configuration configuration = new Configuration().configure();
        SessionFactory sessionFactory = configuration.buildSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        TypedQuery<YardimKarari> query = session.createQuery("SELECT y FROM YardimKarari y ", YardimKarari.class);
        List<YardimKarari> results = query.getResultList();

        session.getTransaction().commit();
        session.close();
        sessionFactory.close();
        return results;
    }
    public static List<YardimKarari> getExperimental(String tckimlik, String ad, String soyad, String yardimTip, String yardimAltTip ) {
        StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure()
                .build();

// 2. Session oluşturun

// İşlemleri gerçekleştirin

        try(SessionFactory sessionFactory = new MetadataSources(registry)
                .buildMetadata()
                .buildSessionFactory();){
            Session session = sessionFactory.openSession();
            TypedQuery<YardimKarari> query = session.createQuery("SELECT y FROM YardimKarari y "
                    + "where (:ad IS NULL OR y.kullanici_id.appliName = :ad) "
                    + "and (:soyad IS NULL OR y.kullanici_id.surname = :soyad) "
                    + "and (:tckimlik IS NULL OR y.kullanici_id.idNo = :tckimlik) "
                    + "and (:yardimTip = '0' OR y.yardimTip = :yardimTip) "
                    + "and (:yardimAltTip = '0' OR y.yardimAltTip =:yardimAltTip)", YardimKarari.class);


            query.setParameter("ad", ad);
            query.setParameter("soyad", soyad);
            query.setParameter("tckimlik", tckimlik);
            query.setParameter("yardimTip", yardimTip);
            query.setParameter("yardimAltTip", yardimAltTip);

            List<YardimKarari> results=  query.getResultList();
            System.out.println(results);

            return results;


        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }



}
