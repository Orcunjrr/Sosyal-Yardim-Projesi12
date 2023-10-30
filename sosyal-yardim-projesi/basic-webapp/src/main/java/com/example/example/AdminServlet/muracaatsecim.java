package com.example.example.AdminServlet;

import com.example.example.DataBase.Engelli;
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

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Müracaat Seçimi", value = "/adminpanel/muracaatsecim")
public class muracaatsecim extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Adi = request.getParameter("isim");
        String SoyAdi = request.getParameter("soyad");



        try {

            // Personel örneğini oluşturun
           List<KullaniciBilgi> kullanici = KullaniciBilgi.getByadsoyad(Adi,SoyAdi);


            // Personel örneğini kay,dedin
            request.setAttribute("kisiisim", kullanici);

            request.getRequestDispatcher("tutanakgir.jsp").forward(request, response);


        } catch (Exception e) {
            System.err.println("Hata oluştu: " + e);
            e.printStackTrace();
        }
    }
    }





