package com.example.example.AdminServlet;

import com.example.example.DataBase.*;
import com.example.example.DataBase.Muracaat;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "MuracaatGuncelle", value = "/adminpanel/MuracaatGuncel")
public class MuracaatGuncelle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doPost(request,response);    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");




        // ID Info

        String name = request.getParameter("isim");
        String surname = request.getParameter("soyisim");
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
        String soybis = request.getParameter("soybis");


        //İletisim Bilgileri

        String iletisimilce = request.getParameter("iletisimilce");
        String iletisimMahalle = request.getParameter("iletisimMahalle");
        String iletisimSokak = request.getParameter("iletisimSokak");
        String acikAdres = request.getParameter("acikAdres");
        String apartman = request.getParameter("apartman");
        String Blok = request.getParameter("Blok");
        String daireNo = request.getParameter("daireNo");
        String evTel = request.getParameter("evTel");
        String cepTel = request.getParameter("cepTel");
        String digerTel = request.getParameter("digerTel");
        String eposta = request.getParameter("eposta");
        String adresTarif = request.getParameter("adresTarif");

        //Dilekçe Bilgileri

        String dilekceRefNo = request.getParameter("dilekceRefNo");
        String dilekceKonu = request.getParameter("dilekceKonu");
        String dilekceSonuc = request.getParameter("dilekceSonuc");
        String birim = request.getParameter("birim");
        String yonlendirTarihiDate = request.getParameter("yonlendirTarihi");
        LocalDate yonlendirTarihi = LocalDate.parse(yonlendirTarihiDate, formatter);

        String itdilekceRefNo = request.getParameter("itdilekceRefNo");
        String itdilekceKonu = request.getParameter("itdilekceKonu");
        String itdilekceSonuc = request.getParameter("itdilekceSonuc");
        String birimitraz = request.getParameter("birimitraz");

        // Address

        String acıkAddress = request.getParameter("acıkAddress");
        String AddresNum = request.getParameter("AddresNum");

        //Muraacat Bilgileri
        String muracatdurum = request.getParameter("muracaatDurum");
        String arsivDosyaNo = request.getParameter("arsivDosyaNo");
        String yonlendirmeTarihDate = request.getParameter("yonlendirmeTarih");
        LocalDate yonlendirmeTarih = LocalDate.parse(yonlendirmeTarihDate, formatter);

        String Bolge = request.getParameter("Bolge");
        String muracaattip = request.getParameter("muracaattip");
        String comments = request.getParameter("comments");

        //ID GIRISLERI
        String SidID = request.getParameter("idinfoid");
        String SiletID = request.getParameter("iletisimid");
        String SmuracID = request.getParameter("muracaatid");
        String SdilekID = request.getParameter("dilekceid");
        String Sadresid = request.getParameter("adresid");
        String StcID = request.getParameter("tcid");

        int idID = Integer.parseInt(SidID);
        int iletID = Integer.parseInt(SiletID);
        int muracID = Integer.parseInt(SmuracID);
        int dilekID = Integer.parseInt(SdilekID);
        int adresID = Integer.parseInt(Sadresid);
        int TCID = Integer.parseInt(StcID);


        try{
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


            KullaniciBilgi idinfo = KullaniciBilgi.getbyID(TCID);
            System.out.println(idinfo);
            idinfo.setAppliName(name);
            idinfo.setSurname(surname);
            idinfo.setIdNo(tc);
            idinfo.setRegistrationStatus(kayitDurum);
            idinfo.setRegistrationProvince(il);
            idinfo.setRegistrationDistrict(ilce);
            idinfo.setGender(cinsiyet);
            idinfo.setMotherName(anneAdi);
            idinfo.setFatherName(babaAdi);
            idinfo.setCiltNo(ciltno);
            idinfo.SetAileSiraNo(sirano);
            idinfo.SetEsAd(esAd);
            idinfo.SetEsSoyad(esSoyAd);
            idinfo.setMaritalStatus(medeniDurum);
            idinfo.SetPhone(phone);
            idinfo.setAddresNo(adresno);

            iletisim contact = iletisim.getbyID(iletID);
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

            Muracaat app = Muracaat.getbyID(muracID);
            app.setArchiveFileNo(arsivDosyaNo);
            app.setApplicationDate(yonlendirmeTarih);
            app.setApplicationType(muracaattip);
            app.setRegion(Bolge);
            app.setDescription(comments);

            Dilekce pet = Dilekce.getbyID(dilekID);
            pet.setPetitionReferenceNo(dilekceRefNo);
            pet.setPetitionSubject(dilekceKonu);
            pet.setPetitionResult(dilekceSonuc);
            pet.setForwardingDilekce(birim);
            pet.setForwardingDate2(yonlendirTarihi);
            pet.setObjectionPetitionRefNo(itdilekceRefNo);
            pet.setObjectionPetitionSubject(itdilekceKonu);
            pet.setObjectionPetitionResult(itdilekceSonuc);
            pet.setForwardingUnit(birimitraz);

            Address add = Address.getbyID(adresID);
            add.setAddressNo(AddresNum);
            add.setPublicAddress(acıkAddress);
            idinfo.setContact(contact);
            idinfo.setApplication(app);
            idinfo.setAddress(add);
            idinfo.setPetition(pet);




            session.merge(add);
            session.merge(contact);
            session.merge(app);
            session.merge(idinfo);
            transaction.commit();



            session.close();
            sessionFactory.close();

            response.sendRedirect("./muracaatliste.jsp");

        }catch (Exception e) {
            e.printStackTrace();
        }

    }
}
 
