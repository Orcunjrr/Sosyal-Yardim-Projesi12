package com.example.example.Islemler;

import com.example.example.DataBase.KullaniciBilgi;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchServlet2", value = "/adminpanel/SearchServlet2")
public class SearchServlet2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tckimlik = request.getParameter("tckimlikk");
        String ad = request.getParameter("add");
        String soyad = request.getParameter("soyadd");
        String il = request.getParameter("il");
        System.out.println(il);

        List<KullaniciBilgi> results = KullaniciBilgi.getByIdNoAndNames(tckimlik, ad, soyad,il);
        request.setAttribute("filteredUsers", results);

        request.getRequestDispatcher("muracaatrapor.jsp").forward(request, response);
    }
}
