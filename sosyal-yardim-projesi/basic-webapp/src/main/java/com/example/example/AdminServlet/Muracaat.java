package com.example.example.AdminServlet;

import com.example.example.DataBase.Address;
import com.example.example.DataBase.iletisim;
import com.example.example.DataBase.KullaniciBilgi;
import com.example.example.DataBase.Dilekce;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import jakarta.servlet.annotation.WebServlet;


@WebServlet(name = "Muracaat", value = "/adminpanel/muracat")
public class Muracaat extends HttpServlet {
    private static final long serialVersionUID = 1L;

protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
	
    // ID Info
    String sicilno = request.getParameter("sicilNo");

    String name = request.getParameter("name").toUpperCase();
    String surname = request.getParameter("soyisim").toUpperCase();
    String tc = request.getParameter("tckimlik");
    String phone = request.getParameter("phone");
    String kayitDurum = request.getParameter("KayitDurum");
    String il = request.getParameter("il");
    String ilce = request.getParameter("ilce");
    String cinsiyet = request.getParameter("cinsiyet");
    String anneAdi = request.getParameter("anneAd");
    String babaAdi = request.getParameter("babaAd");
    String ciltno = request.getParameter("ciltno"); 
    String medeniDurum = request.getParameter("medenidurum");												//Medeni Durum
    String sirano = request.getParameter("sirano");
    String esAd = request.getParameter("esAd");
    String esSoyAd = request.getParameter("esSoyAd");
    String adresno = request.getParameter("adresno");
    String dogumtarih = request.getParameter("dogumtarih");
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    LocalDate date = LocalDate.parse(dogumtarih, formatter);


    //İletisim Bilgileri
    
    String iletisimilce = request.getParameter("iletisimilce");
    if(iletisimilce.isEmpty()){ iletisimilce = "Gebze"; }
    String iletisimMahalle = request.getParameter("iletisimMahalle");
    if(iletisimMahalle.isEmpty()){ iletisimMahalle = "-"; }
    String iletisimSokak = request.getParameter("iletisimSokak");
    if(iletisimSokak.isEmpty()){ iletisimSokak = "-"; }
    String acikAdres = request.getParameter("acikAdres");
    if(acikAdres.isEmpty()){ acikAdres = "-"; }
    String apartman = request.getParameter("apartman");
    if(apartman.isEmpty()){ apartman = "-"; }
    String Blok = request.getParameter("Blok");
    if(Blok.isEmpty()){ Blok = "0"; }
    String daireNo = request.getParameter("daireNo");
    if(daireNo.isEmpty()){ daireNo = "0"; }
    String evTel = request.getParameter("evTel");
    if(evTel.isEmpty()){ evTel = "11111111111"; }
    String cepTel = request.getParameter("cepTel");
    if(cepTel.isEmpty()){ cepTel = "11111111111"; }
    String digerTel = request.getParameter("digerTel");
    if(digerTel.isEmpty()){ digerTel = "11111111111"; }
    String eposta = request.getParameter("eposta");
    if(eposta.isEmpty()){ eposta = " "; }
    String adresTarif = request.getParameter("adresTarif");
    
    //Muraacat Bilgileri
    String arsivDosyaNo = request.getParameter("arsivDosyaNo");
    if(arsivDosyaNo.isEmpty()){ arsivDosyaNo = "0"; }
    String yonlendirekurumname = request.getParameter("YonlendirilenKurumAd");
    if(yonlendirekurumname == null || yonlendirekurumname.isEmpty()){ yonlendirekurumname = "Gebze Belediyesi"; }
    String yonlendirenALTkurumname = request.getParameter("YonlendirenAltKurumName");
    if(yonlendirenALTkurumname == null || yonlendirenALTkurumname.isEmpty()){ yonlendirenALTkurumname = "Gebze Belediyesi"; }
    String yonlendirmeTarihDate = request.getParameter("yonlendirmeTarih");
    if(yonlendirmeTarihDate == null || yonlendirmeTarihDate.isEmpty()){ yonlendirmeTarihDate = LocalDate.now().format(formatter); }
    LocalDate yonlendirmeTarih = LocalDate.parse(yonlendirmeTarihDate, formatter);
    
    String Bolge = request.getParameter("Bolge");
    String muracaattip = request.getParameter("muracaattip");
    String comments = request.getParameter("comments");

    //Dilekçe Bilgileri
    
    String dilekceRefNo = request.getParameter("dilekceRefNo");
    if(dilekceRefNo.isEmpty()){ dilekceRefNo = "0"; }
    String dilekceKonu = request.getParameter("dilekceKonu");
    String dilekceSonuc = request.getParameter("dilekceSonuc");
    String birim = request.getParameter("birim");
    String yonlendirTarihiDate = request.getParameter("yonlendirTarihi");
    if(yonlendirmeTarihDate == null || yonlendirTarihiDate.isEmpty()){ yonlendirTarihiDate = LocalDate.now().format(formatter); }
    LocalDate yonlendirTarihi = LocalDate.parse(yonlendirTarihiDate, formatter);

    String itdilekceRefNo = request.getParameter("itdilekceRefNo");
    if(itdilekceRefNo.isEmpty()){ itdilekceRefNo = "0"; }
    String itdilekceKonu = request.getParameter("itdilekceKonu");
    String itdilekceSonuc = request.getParameter("itdilekceSonuc");
    String birimitraz = request.getParameter("birimitraz");
    String ityonlendirTarihiDate = request.getParameter("ityonlendirTarihi");
    if(ityonlendirTarihiDate.isEmpty()){ ityonlendirTarihiDate = LocalDate.now().format(formatter); }
    LocalDate ityonlendirTarihi = LocalDate.parse(ityonlendirTarihiDate, formatter);

    // Address
    
    String acıkAddress = request.getParameter("acıkAddress");
    String AddresNum = request.getParameter("AddresNum");


    try {
        // Hibernate session'ı yapılandırması
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


        KullaniciBilgi idinfo = new KullaniciBilgi();

        idinfo.setAppliName(name);
        idinfo.setSurname(surname);
        idinfo.setIdNo(tc);
        idinfo.setRegistrationStatus(kayitDurum);
        idinfo.setRegistrationProvince(il);
        idinfo.setRegistrationDistrict(ilce);
        idinfo.setGender(cinsiyet);
        idinfo.setMotherName(anneAdi);
        idinfo.setFatherName(babaAdi);
        idinfo.setCiltNo(sicilno);
        idinfo.SetAileSiraNo(sirano);
        idinfo.SetEsAd(esAd);
        idinfo.SetEsSoyad(esSoyAd);
        idinfo.setMaritalStatus(medeniDurum);
        idinfo.setBirthDate(date);
        idinfo.SetPhone(phone);
        idinfo.setAddresNo(adresno);
        idinfo.setSoybis("Yok");
        
        iletisim contact = new iletisim();
        contact.setDistrict(iletisimilce);
        contact.setNeighborhood(iletisimMahalle);
        contact.setStreet(iletisimSokak);
        contact.setAddressDefinition(acikAdres);
        contact.setApartment(apartman);
        contact.setBlockDoorNo(Blok);
        contact.setApartmentNo(daireNo);
        contact.setHomePhone(evTel);
        contact.setCellPhone(cepTel);
        contact.setOtherTel(digerTel);
        contact.seteMail(eposta);
        contact.setAddressDefinition(adresTarif);

        
        com.example.example.DataBase.Muracaat app = new com.example.example.DataBase.Muracaat();
        app.setArchiveFileNo(arsivDosyaNo);
        app.setStatus((byte) 1);
        app.setApplicationDate(yonlendirmeTarih);
        app.setApplicationType(muracaattip);
        app.setRegion(Bolge);
        app.setDescription(comments);

        Dilekce pet = new Dilekce();
        pet.setForwardingUnit(yonlendirekurumname);
        pet.setForwardingDilekce(yonlendirenALTkurumname);
        pet.setPetitionReferenceNo(dilekceRefNo);
        pet.setPetitionSubject(dilekceKonu);      
        pet.setPetitionResult(dilekceSonuc);

        pet.setForwardingDate2(yonlendirTarihi);      
        pet.setObjectionPetitionRefNo(itdilekceRefNo);
        pet.setObjectionPetitionSubject(itdilekceKonu);
        pet.setObjectionPetitionResult(itdilekceSonuc);

        pet.setForwardingDate(ityonlendirTarihi);
        
        Address add = new Address();
        add.setAddressNo(AddresNum);
        add.setPublicAddress(acıkAddress);
        idinfo.setContact(contact);
        idinfo.setApplication(app);
        idinfo.setAddress(add);
        idinfo.setPetition(pet);

        // Update the existing record with the new data
        session.persist(idinfo);
        session.persist(contact);
        session.persist(app);
        session.persist(pet);
        transaction.commit();

        session.close();
        sessionFactory.close();

        response.sendRedirect("../sign-in.jsp");
    } catch (Exception e) {
        System.err.println("Hata oluştu: " + e);
        e.printStackTrace();
    }
}
}
