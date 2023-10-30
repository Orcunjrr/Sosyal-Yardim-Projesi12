package com.example.example.AdminServlet;

import com.example.example.DataBase.AileYakinliklari;
import com.example.example.DataBase.KullaniciBilgi;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
import java.util.List;
import java.util.Objects;

@WebServlet(name = "yakinlik", value = "/adminpanel/aile")
public class yakinlik extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dogum_tarihi = request.getParameter("dogum_tarihi");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate bd = LocalDate.parse(dogum_tarihi, formatter);
        LocalDate dd = null;

        try{
        String olum_tarihi = request.getParameter("olum_tarihi");
        if(olum_tarihi != null) {
             dd = LocalDate.parse(olum_tarihi, formatter);
        }}catch (Exception e){System.out.println(e);}
        String ad = request.getParameter("ad");
        String Tckimlik = request.getParameter("TcKimlik");
        String soyad = request.getParameter("soyad");
        String yakinlik = request.getParameter("yakinlik");
        String cinsiyet = request.getParameter("cinsiyet");
        String medeni_hal = request.getParameter("medeni_hal");
        String egitim_durumu = request.getParameter("egitim_durumu");
        String meslek = request.getParameter("meslek");
        String gelir = request.getParameter("gelir");
        String kullId = request.getParameter("KullId");
        String TCkullanici = request.getParameter("KullTC");
        double para = Double.parseDouble(gelir);
        int intTcKullanici = Integer.parseInt(TCkullanici);
        KullaniciBilgi ada= KullaniciBilgi.getbyID(intTcKullanici);
        System.out.println(ada);
        List<AileYakinliklari> aileList = AileYakinliklari.getAllAffinity();
        System.out.println(aileList);
        if(aileList != null || !aileList.isEmpty()){
            for (AileYakinliklari member : aileList) {
                if (Objects.equals(member.getTcKimlik(), Tckimlik) || Objects.equals(member.getTcKimlik(), TCkullanici)){
                    request.setAttribute("errorMessage", " GEÇERSİZ bir tckimlik numarası giriniz!");
                    request.getRequestDispatcher("./AileYakinliklari.jsp?Id=" + kullId).forward(request, response);
                }
            }
        }
        System.out.println(Tckimlik + "==" + TCkullanici);
        if(Tckimlik.equals(TCkullanici)){
                request.setAttribute("errorMessage", " GEÇERSİZ bir tckimlik numarası giriniz!");
                request.getRequestDispatcher("./AileYakinliklari.jsp?Id=" + kullId).forward(request, response);
        }
        else {
            try {
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

                com.example.example.DataBase.AileYakinliklari aile = new com.example.example.DataBase.AileYakinliklari();
                aile.setBirthDate(bd);
                aile.setName(ad);
                aile.setSurname(soyad);
                aile.setTcKimlik(Tckimlik);
                aile.setYakinlik(yakinlik);
                aile.setGender(cinsiyet);
                aile.setMedeni_hal(medeni_hal);
                aile.setEgitim_durumu(egitim_durumu);
                aile.setMeslek(meslek);
                aile.setGelir(para);
                aile.setDd(dd);
                aile.setIdInfoId(ada);
                session.persist(aile);
                transaction.commit();

                session.close();
                sessionFactory.close();
                request.setAttribute("errorMessage", "Kayıt işlemi başarılı.");
                response.sendRedirect("./AileYakinliklari.jsp?Id=" + kullId);
            } catch (Exception e) {
                e.printStackTrace(); // Hata mesajını konsola yazdırma
                // veya
                System.out.println("Hata oluştu: " + e.getMessage()); // Loglama

            }
        }
    }
}