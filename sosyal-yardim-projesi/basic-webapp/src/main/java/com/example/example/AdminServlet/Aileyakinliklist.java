package com.example.example.AdminServlet;

import com.example.example.DataBase.AileYakinliklari;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Aileyakinliklist" , value = "/adminpanel/Aileyakinliklist")
public class Aileyakinliklist extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tckimlik = request.getParameter("tcKimlik");
        String ad = request.getParameter("ad");
        String soyad = request.getParameter("soyad");
        String medenihal = request.getParameter("medeniHal");
        String yakinlik = request.getParameter("yakinlik");
        List<AileYakinliklari> results =AileYakinliklari.getExperimental(tckimlik,ad,soyad,medenihal,yakinlik);
        request.setAttribute("Aileyakinliklist", results);
        if(results.isEmpty()){
            request.setAttribute("mess", "Kayıt Bulunamadı!!");
            request.getRequestDispatcher("aileyakinlikliste.jsp").forward(request, response);
        }
        request.getRequestDispatcher("aileyakinlikliste.jsp").forward(request, response);
    }

}