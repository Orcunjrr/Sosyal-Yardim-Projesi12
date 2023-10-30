package com.example.example.AdminServlet;

import com.example.example.DataBase.EngelliGiris;
import com.example.example.DataBase.YardimKarari;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "yardimkararlistozel" , value = "/adminpanel/yardimkararlistozel")
public class yardimkararlistozel extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tckimlik = request.getParameter("tcKimlik");
        String ad = request.getParameter("ad");
        String soyad = request.getParameter("soyad");
        String yardimTip = request.getParameter("yardim_tipi");
        String yardimAltTip = request.getParameter("yardim_alt_tip");
        List<YardimKarari> results = YardimKarari.getExperimental(tckimlik,ad,soyad,yardimTip,yardimAltTip);
        request.setAttribute("yardimkararlistozel", results);

        request.getRequestDispatcher("yardimkararlistozel.jsp").forward(request, response);
    }

}
