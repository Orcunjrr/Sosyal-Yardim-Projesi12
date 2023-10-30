package com.example.example.AdminServlet;

import com.example.example.DataBase.EngelliAracHizmet;
import com.example.example.DataBase.EngelliGiris;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "engelliAracListele" , value = "/adminpanel/engelliAracListele")
public class engelliAracListele extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int engellihizmetıd = Integer.parseInt(request.getParameter("engellihizmetıd"));
        String hizmetTip = request.getParameter("hizmetTip");
        String hizmetAltTip = request.getParameter("hizmetAltTip");
        String engelliArac = request.getParameter("engelliArac");
        String status = request.getParameter("status");
        String randevutarih = request.getParameter("randevutarih");
        String HizmetKayitTarih = request.getParameter("HizmetKayitTarih");
        String EngelliAracAçıklama = request.getParameter("EngelliAçıklama");

        List<EngelliAracHizmet> results = EngelliAracHizmet.getby(engellihizmetıd, hizmetTip, hizmetAltTip, engelliArac, status);
        request.setAttribute("engelliAracList", results);
        if(results.isEmpty()){
            request.setAttribute("mess","Kayıt Bulunamadı!!");
            request.getRequestDispatcher("engelliaraclist.jsp").forward(request, response);
        }
        request.getRequestDispatcher("engelliaraclist.jsp").forward(request, response);
    }
}


