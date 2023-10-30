package com.example.example.AdminServlet;

import com.example.example.DataBase.EngelliGiris;
import com.example.example.DataBase.KullaniciBilgi;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "engelliListele" , value = "/adminpanel/engelliListele")
public class engelliListele extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tckimlik = request.getParameter("tcKimlik");
        String ad = request.getParameter("ad");
        String soyad = request.getParameter("soyad");
        String engelliTip = request.getParameter("EngelliTip");
        String engelliAltTip = request.getParameter("EngelliAltTip");
        List<EngelliGiris> results = EngelliGiris.getExperimental(tckimlik,ad,soyad,engelliAltTip,engelliTip);
        request.setAttribute("engelliList", results);
        if(results.isEmpty()){
            request.setAttribute("mess","Kayıt Bulunamadı!!");
            request.getRequestDispatcher("engellilist.jsp").forward(request, response);
        }
        request.getRequestDispatcher("engellilist.jsp").forward(request, response);
    }

}
