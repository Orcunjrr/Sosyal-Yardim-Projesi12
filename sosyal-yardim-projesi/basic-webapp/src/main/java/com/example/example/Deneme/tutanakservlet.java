package com.example.example.Deneme;

import com.example.example.DataBase.KullaniciBilgi;
import com.example.example.DataBase.Tutanak;
import jakarta.persistence.Query;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

@WebServlet(name = "tutanakservlet", value = "/adminpanel/tutanakservlet")
public class tutanakservlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure()
                .build();
        SessionFactory sessionFactory = new MetadataSources(registry)
                .buildMetadata()
                .buildSessionFactory();
// 2. Session oluşturun
        Session session = sessionFactory.openSession();
// İşlemleri gerçekleştirin
        Transaction transaction = session.beginTransaction();

        String tcno= request.getParameter("tcnosu");
        int muracaatid = Integer.parseInt(request.getParameter("muracaatid"));

        Tutanak existingTutanak=null;
        try{
            Query query = session.createQuery("Select t FROM Tutanak t WHERE t.KullaniciId.idNo= :tcno and t.aktifpasif='Aktif'");
            query.setParameter("tcno", tcno);
            existingTutanak = (Tutanak) query.getSingleResult();
        }catch (Exception e){
            System.out.println(e);
        }


        if(existingTutanak != null){
            request.setAttribute("errorMessage", "Bir kullanıcının birden fazla tutanak bilgisi olamaz.");
            request.getRequestDispatcher("./TutanakEkle.jsp?Id=" + muracaatid).forward(request, response);
        }
        String[] clickedBoxes= request.getParameterValues("checkutu");
        String[] clickedBoxes2= request.getParameterValues("checkutu2");
        String genelToplam = request.getParameter("genelGelirToplam");
        StringBuilder veriler = new StringBuilder(); //as default variable
        StringBuilder duzensizveriler = new StringBuilder();
        String[] ucretAcikArray = request.getParameterValues("isaciklama");
        String[] ucretiListArray = request.getParameterValues("ucret");
        String[] ucretAcikArray1 = request.getParameterValues("isaciklama1");
        String[] duzensizgelir = request.getParameterValues("ucret1");
        if(clickedBoxes2 !=null){
            int k=0;
            for(String checkbox : clickedBoxes2){
                duzensizveriler.append(clickedBoxes2[k]).append(" : ");
                k++;
            }
        }
        for(String ucret : ucretAcikArray1) {
            if(!Objects.equals(ucret, "")){
                System.out.println("ücret if açık da ne "+ucret);
                duzensizveriler.append(ucret).append(" - ");
            }
        }
        for (String gelir : duzensizgelir){
            if(!Objects.equals(gelir,"")){
            duzensizveriler.append(gelir).append(" / ");
            }
        }
        if (clickedBoxes != null) {
            // Create arrays or lists to store the values for each checkbox
            int i=0;
            for (String checkbox: clickedBoxes) {
                // Check if ucretacik and ucreti arrays are not null and have values
                veriler.append(clickedBoxes[i]).append(" : ");
                i++;
            }
        }
        for(String isAciklama : ucretAcikArray){
            if(!Objects.equals(isAciklama, "")){
                veriler.append(isAciklama).append(" - ");
            }
        }
        for(String isPara:ucretiListArray){
            if(!Objects.equals(isPara, "")){
                veriler.append(isPara).append(" / ");
            }
        }

        veriler.append(duzensizveriler).append("@ Toplam : Gelir  - ").append(genelToplam);
        if(veriler==null){
            veriler = new StringBuilder("Gelir Bilgisi Bulunmamaktadır.");}
        String duzenliGelirToplam = request.getParameter("duzenliGelirToplam");
        String duzensizGelirToplam = request.getParameter("duzensizGelirToplam");
        String asker = request.getParameter("asker");
        String soybis = request.getParameter("soybis");
        String sehit = request.getParameter("sehit");
        String gazi = request.getParameter("gazi");
        String haneKisi = request.getParameter("haneKisi");
        String yetim = request.getParameter("yetimSayi");
        String cocuk = request.getParameter("cocukSayi");


        Tutanak veri = new Tutanak();

        //Geçim bilgileri
        veri.setBilgiler(veriler.toString());
        if(duzenliGelirToplam==null || duzenliGelirToplam.isEmpty()){
            veri.setToplamDuzensizGelir(0);
        }else{veri.setToplamDuzenliGelir(Integer.parseInt(duzenliGelirToplam));}

        if(duzensizGelirToplam==null || duzensizGelirToplam.isEmpty()){
            veri.setToplamDuzensizGelir(0);
        }else{veri.setToplamDuzensizGelir(Integer.parseInt(duzensizGelirToplam));}


        //Aile Nüfusu
        veri.setAskerMi(asker);
        veri.setSoybisMi(soybis);
        veri.setSehitMi(sehit);
        veri.setGaziMi(gazi);
        veri.setHaneKisi(Integer.parseInt(haneKisi));
        veri.setYetimSayi(Integer.parseInt(yetim));
        veri.setToplamCocuk(Integer.parseInt(cocuk));

        //Sağlık Bilgileri
        String saglikbilgi="";
        String saglikProb = request.getParameter("saglikp");
        if(saglikProb.equals("Var")){
            String[] checked= request.getParameterValues("saglik");
            if (checked != null) {
                // Create arrays or lists to store the values for each checkbox
                String[] problems = request.getParameterValues("problemler");

                int i=0;
                for (String checkbox: checked) {
                    // Check if ucretacik and ucreti arrays are not null and have values
                    saglikbilgi = saglikbilgi + "{" + checked[i] + " ; " + problems[i] + "}";
                    i++;
                }
            }
        }
        if(saglikbilgi==null){saglikbilgi="Sağlık Bilgisi Bulunmamaktadır.";}
        veri.setSaglikBilgiler(saglikbilgi);
        String engelliVarMi = request.getParameter("engelli");
        veri.setEngelliVarMi(engelliVarMi);

        //Ev Eşyaları
        String evEsyaları="";
        String[] esyalar = request.getParameterValues("evEsyalar");
        System.out.println(esyalar);
        if(esyalar==null){esyalar = new String[1]; esyalar[0]="hiçbiri";}
        for(String s : esyalar){
            evEsyaları = evEsyaları + "  " + s;
        }
        veri.setEvEsyalari(evEsyaları);

        //Ev-Araba-Gayrimenkul Durumu
        String evDurumu = request.getParameter("evDurumu");
        String evDurumAciklama = request.getParameter("evAcik");
        if(evDurumAciklama.isEmpty()){evDurumAciklama="Kullanımda";}
        String kiraMiktar = request.getParameter("kiraMiktar");
        Double kiraMiktarrr = Double.parseDouble(kiraMiktar);
        String evTipi = request.getParameter("evTip");
        String yakacakTip = request.getParameter("yakacakTip");
        String kiraMi = request.getParameter("kira");
        String evSayisi = request.getParameter("evSayisi");
        Integer evSayisiii = Integer.parseInt(evSayisi);
        String kiraGeliri = request.getParameter("kiraGeliri");
        Double kiraGelirrrrrr = Double.parseDouble(kiraGeliri);
        String araba = request.getParameter("araba");
        String arabaModel = request.getParameter("arabaModel");
        if(arabaModel.isEmpty()){arabaModel="yok";}
        String gayri = request.getParameter("gayrimenkul");
        String gayrituru = request.getParameter("gayriTur");
        if(gayrituru.isEmpty()){gayrituru="yok";}
        veri.setEvdurumu(evDurumu);
        veri.setEvDurumaciklama(evDurumAciklama);
        veri.setKiramiktar(kiraMiktarrr);
        veri.setEvtipi(evTipi);
        veri.setYakacaktipi(yakacakTip);
        veri.setKiradaMi(kiraMi);
        veri.setKacev(evSayisiii);
        veri.setTopkiragelir(kiraGelirrrrrr);
        veri.setArabavarmi(araba);
        veri.setArabamodel(arabaModel);
        veri.setGayrivarmi(gayri);
        veri.setGayritur(gayrituru);

        //Borç durumu
        String elektrik = request.getParameter("elektrik");
        String su = request.getParameter("su");
        String dogalgaz = request.getParameter("dogalgaz");
        String kira = request.getParameter("kira");
        String kredikarti = request.getParameter("kredikarti");
        String diger = request.getParameter("diger");
        String digerAcik = request.getParameter("digeraciklama");
        // Default values for debts in case of non-numeric input
        int elektrikBorc = 0;
        int suBorc= 0;
        int dogalgazBorc = 0;
        int kiraBorc = 0;
        int kredikartiBorc = 0;
        int digerBorc = 0;

        try {
            // Try parsing the debt values to integers if they are numeric
            elektrikBorc = Integer.parseInt(elektrik);
            suBorc = Integer.parseInt(su);
            dogalgazBorc = Integer.parseInt(dogalgaz);
            kiraBorc = Integer.parseInt(kira);
            kredikartiBorc = Integer.parseInt(kredikarti);
            digerBorc = Integer.parseInt(diger);
        } catch (NumberFormatException e) {
            // Handle the exception, e.g., log an error or provide a default value
            e.printStackTrace();
        }
        // Calculate the total borc
        int totalBorc = elektrikBorc + suBorc+ dogalgazBorc + kiraBorc + kredikartiBorc + digerBorc;

        String borclar = "elektrik: "+elektrik+" ,su: "+su+" ,doğalgaz: "+dogalgaz+" ,kira: "+kira+" ,kredi kartı: "+kredikarti+" ,diğer: "+diger+" ,diğer açıklama: "+digerAcik+ " ,toplam borç: "+ totalBorc;
        veri.setBorcDurumu(borclar);

        //Başvuru beyanı
        String bbeyan = request.getParameter("beyan");
        veri.setBasvuruBeyan(bbeyan);

        //Inceleme Ekibi Görüş Kanaati
        String gkanaat = request.getParameter("kanaat");
        veri.setGorusKanaati(gkanaat);

        //Sosyal güvence durumu
        String sguvencevarmi = request.getParameter("sosyalguv");
        String sosyalguv = request.getParameter("sosyalguvenceselect");
        String yonbirim = request.getParameter("yonbirim");
        String yonbirimaciklama = request.getParameter("yönkurumaciklama");
        veri.setSosyalguvence(sguvencevarmi);
        veri.setSosyalguvencesi(sosyalguv);
        veri.setYonlendirenBirim(yonbirim);
        veri.setYonKurumAciklama(yonbirimaciklama);

        //Talep edilen yardım türleri
        String talepEdilenYardimlar ="";
        String[] talepler = request.getParameterValues("talep");
        if(talepler == null){ talepler=new String[1]; talepler[0]="genel";}
        for(String talep:talepler){
            talepEdilenYardimlar = talepEdilenYardimlar + "{"+talep+"} ";
        }
        veri.setTalepEdilenYardimlar(talepEdilenYardimlar);

        //İnceleme Bilgileri
        String incelemetarih = request.getParameter("incelemeTarihi");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        if(incelemetarih == null || incelemetarih.isEmpty()){ incelemetarih = LocalDate.now().format(formatter); }
        String inceleme = request.getParameter("incelemeYapan");
        String inceleme1 = request.getParameter("incelemeYapan1");
        LocalDate incTarihi = LocalDate.parse(incelemetarih, formatter);
        veri.setIncelemeTarihi(incTarihi);
        veri.setInceleme(inceleme);
        veri.setInceleme1(inceleme1);

        //Başvuru Bilgileri
        String basAlan = request.getParameter("basvuruKisi");
        String durum = request.getParameter("durum");
        String cekmece = request.getParameter("cekmece");
        veri.setBasvuruKisi(basAlan);
        veri.setDurum(durum);
        veri.setCekmece(cekmece);
        veri.setAktifpasif("Aktif");
        String idinfoID = request.getParameter("KullaniciID");

        KullaniciBilgi kullanici = session.get(KullaniciBilgi.class,idinfoID);
        veri.setKullaniciId(kullanici);

        //persist
        session.persist(veri);
        session.merge(kullanici);

        transaction.commit();
        session.close();
        sessionFactory.close();
        response.sendRedirect("./TutanakEkle.jsp?Id="+muracaatid);
    }
}
 
