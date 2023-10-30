package com.example.example.AdminServlet;

import com.example.example.DataBase.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "BolgeTanim", value = "/adminpanel/BolgeTanim")
public class BolgeTanim extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String mahalleler[] = request.getParameterValues("MahId");

        List<Integer> mahalleid = new ArrayList<>();

        for (String str : mahalleler) {
            int num = Integer.parseInt(str);
            mahalleid.add(num);
        }
        int bolgeid = Integer.parseInt(request.getParameter("BolgeId"));

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

            Bolge bolge = session.get(Bolge.class,bolgeid);

            List<District> districts = new ArrayList<>();
            for(Integer mahid: mahalleid){
                districts.add(session.get(District.class,mahid));
            }

            for(District mahalle: districts) {
                mahalle.setBolge(bolge);
                session.merge(mahalle);
            }

            transaction.commit();
            session.close();
            sessionFactory.close();
            response.sendRedirect("./bolgetanimlama.jsp");

        }catch (Exception e){
            System.out.println(e);
        }
    }
}
 
