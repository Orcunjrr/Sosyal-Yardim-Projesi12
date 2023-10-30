package com.example.example.AdminServlet;

import com.example.example.DataBase.Tutanak;
import com.example.example.DataBase.YardimKarari;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "tutanakraporlistele" , value = "/adminpanel/tutanakraporlistele")
public class tutanakraporlistele extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tckimlik = request.getParameter("tckimlikno");
        String ad = request.getParameter("ad");
        String soyad = request.getParameter("soyad");
        String murNo = request.getParameter("muracaatNo");
        String ilce = request.getParameter("mahalle");
        List<Tutanak> results = Tutanak.getBySearch(tckimlik,ad,soyad,murNo,ilce);
        System.out.println("Servlet içinde: " + results);
        request.setAttribute("tutanakRaporList", results);

        request.getRequestDispatcher("tutanakraporsayfasi.jsp").forward(request, response);
    }
}
