package com.example.example.AdminServlet;

import com.example.example.DataBase.Bolge;
import com.example.example.DataBase.District;

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


//... (import statements)

@WebServlet(name = "MahalleEkle", value = "/adminpanel/mahalleEkle")
public class MahalleEkle extends HttpServlet {
 private static final long serialVersionUID = 1L;

 protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     String ilce = request.getParameter("ilce");
     String mahalleAd = request.getParameter("mahalleAdi");
     int zoneid = Integer.parseInt(request.getParameter("bolgeid")); 

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
         District district = new District();
         district.setIlce(ilce);
         district.setDistrictName(mahalleAd);
         // Retrieve the Disabled object based on disabledID
         Bolge zone = session.get(Bolge.class, zoneid);
         district.setBolge(zone);

         // Personel örneğini kaydet
         session.persist(district);
         transaction.commit();

         session.close();
         sessionFactory.close();

         response.sendRedirect("./mahallelist.jsp");
     } catch (Exception e) {
         System.err.println("Hata oluştu: " + e);
         e.printStackTrace();
     }
 }
}

