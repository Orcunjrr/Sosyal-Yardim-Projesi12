package com.example.example.AdminServlet;

import com.example.example.DataBase.KullaniciBilgi;
import com.example.example.DataBase.Tutanak;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "tutanakList", value = "/adminpanel/tutanaklist")
public class TutanakList extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tckimlik = request.getParameter("tckimlik");
        String ad = request.getParameter("name");
        String soyad = request.getParameter("soyisim");
        String muracaatNo = request.getParameter("muracaatNo");

        String mahalle = request.getParameter("mahalle");

        List<Tutanak> results = Tutanak.getBySearch(tckimlik,ad,soyad,muracaatNo,mahalle);
        request.setAttribute("filteredUsers", results);

        if(results.isEmpty()){
            request.setAttribute("mess", "Kayıt Bulunamadı!!");
            request.getRequestDispatcher("tutanaklist.jsp").forward(request, response);
        }
        request.getRequestDispatcher("tutanaklist.jsp").forward(request, response);
    }
}
