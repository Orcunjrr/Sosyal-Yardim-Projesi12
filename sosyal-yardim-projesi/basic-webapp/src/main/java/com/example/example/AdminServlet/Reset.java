package com.example.example.AdminServlet;

import com.example.example.DataBase.Personel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "reset", value = "/reset")
public class Reset extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("mail");
        Personel user = Personel.getUserInfoByMail(email);

        if (user != null) {
            int userId = user.getId();
            resp.sendRedirect("adminpanel/kullaniciduzenle.jsp?userId=" + userId);
        } else {
            resp.sendRedirect("reset-password.jsp?DURUM=ERROR");
        }
    }
}
