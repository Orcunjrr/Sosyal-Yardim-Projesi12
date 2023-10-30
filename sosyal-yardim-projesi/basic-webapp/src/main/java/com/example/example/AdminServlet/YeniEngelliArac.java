package com.example.example.AdminServlet;

import com.example.example.DataBase.EngelliAracHizmet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import java.io.Serializable;
import java.time.LocalDateTime;


import jakarta.servlet.annotation.WebServlet;


@WebServlet(name = "YeniEngelliArac", value = "/adminpanel/YeniEngelliArac")
public class YeniEngelliArac extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String muracid = request.getParameter("murid");
    	String Kurum = request.getParameter("Kurum");
    	String altkurum = request.getParameter("altkurum");
    	String kayitTarih = request.getParameter("kayitTarih");
    	String yardimDurum = request.getParameter("yardimDurum");
    	String EngelliArac = request.getParameter("EngelliArac");
    	String RandevuTarih = request.getParameter("RandevuTarih");
    	String EngelliAciklama = request.getParameter("EngelliAciklama");

    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter formatter2 = DateTimeFormatter.ISO_LOCAL_DATE_TIME;
        LocalDateTime dateTime = LocalDateTime.parse(RandevuTarih, formatter2);
    	LocalDate date = LocalDate.parse(kayitTarih, formatter);



    
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
           
    EngelliAracHizmet engeliarac = new EngelliAracHizmet();
    
    engeliarac.setEngelliHizmetTip(Kurum);
    engeliarac.setEngelliHizmetAltTip(altkurum);
    engeliarac.setEngelliAracAciklama(EngelliAciklama);
    engeliarac.setStatus(yardimDurum);
    engeliarac.setHizmetKayitTarih(date);
    engeliarac.setEngelliAraç(EngelliArac);
    engeliarac.setRandevuTarih(dateTime);
    
    session.persist(engeliarac);
    transaction.commit();

    session.close();
    sessionFactory.close();


    response.sendRedirect("./yeniEngelliAracHizmet.jsp?Id="+muracid);
} catch (Exception e) {
    System.err.println("Hata oluştu: " + e);
    e.printStackTrace();
}
}
}
