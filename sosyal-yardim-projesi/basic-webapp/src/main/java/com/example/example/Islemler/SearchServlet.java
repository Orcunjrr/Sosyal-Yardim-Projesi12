package com.example.example.Islemler;

import com.example.example.DataBase.ActivityLogs;
import com.example.example.DataBase.District;
import com.example.example.DataBase.KullaniciBilgi;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "SearchServlet", value = "/adminpanel/SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate dogum_baslangic_tarihi = LocalDate.of(1900,1,1);
        LocalDate dogum_bitis_tarihi = LocalDate.of(3000,12,30);
        LocalDate mur_baslangic_Tarihi = LocalDate.of(1900,1,1);
        LocalDate mur_bitis_tarihi = LocalDate.of(3000,12,30);

        String tckimlik = request.getParameter("tckimlikk");
        String ad = request.getParameter("add");
        String soyad = request.getParameter("soyadd");
        String murid = request.getParameter("muracatno");
        //int murid= Integer.parseInt(mur);
        String bolge = request.getParameter("bolge");
        String sokakid = request.getParameter("sokak");
        String ceptel = request.getParameter("ceptel");
        String evtel = request.getParameter("evtel");
     //   String kayitDurum = request.getParameter("kayıtDurum");
     //   String YardimDurum = request.getParameter("YardimDurum");
        String Adresno= request.getParameter("addressNo");
      //  String saybis=request.getParameter("saybisdurum");
        String itrazdilekce = request.getParameter("itrazdilekce");
        /*
        EĞER ARRAY ŞEKLİNDE GELDİYSE BU YAZDIRIYOR. FAKAT TARIH NULL HATASI TEKRAR VERIYOR ONU DÜZELTMEK LAZIM
        String[] dilekcerefno = request.getParameterValues("ad");
        for(String les : dilekcerefno){
            System.out.println(" ARRAY DEGER  "+les);
        }

         */
        String mur_BAS_tarih=request.getParameter("baslangic_tarihi");
        String mur_BIT_tarih = request.getParameter("bitis_tarihi");
        String mahalle = request.getParameter("mahalle");
        String arsivdosyano =request.getParameter("arsivdosyano");
        String muracaatdurumu = request.getParameter("muracaatdurum");
     //   String TalepYardimList = request.getParameter("yardim");

        String dogumbas = request.getParameter("dogum_baslangic_tarihi");
        String dogumbitis = request.getParameter("dogum_bitis_tarihi");
        List<String> params = new ArrayList<>();
        if(!Objects.equals(dogumbas, "")) {
             dogum_baslangic_tarihi = LocalDate.parse(dogumbas, formatter);
        }
        if (!Objects.equals(dogumbitis, "")){
            dogum_bitis_tarihi = LocalDate.parse(dogumbitis, formatter);
        }
        if(!Objects.equals(mur_BAS_tarih, "")) {
            mur_baslangic_Tarihi = LocalDate.parse(mur_BAS_tarih, formatter);
        }
        if (!Objects.equals(mur_BIT_tarih, "")){
            mur_bitis_tarihi = LocalDate.parse(mur_BIT_tarih, formatter);
        }
        List<KullaniciBilgi> results = KullaniciBilgi.getExperimental(tckimlik, ad, soyad,sokakid,ceptel,evtel,Adresno,itrazdilekce,mahalle,arsivdosyano,muracaatdurumu,mur_baslangic_Tarihi,mur_bitis_tarihi,dogum_baslangic_tarihi, dogum_bitis_tarihi,murid);
        request.setAttribute("filteredUsers", results);
        if(results.isEmpty()){
            request.setAttribute("mess", "Kayıt Bulunamadı!!");
            request.getRequestDispatcher("muracaatliste.jsp").forward(request, response);
        }

        StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure()
                .build();


        try(SessionFactory sessionFactory = new MetadataSources(registry)
                .buildMetadata()
                .buildSessionFactory();) {
            Session session = sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();
            HttpSession htpsesion = request.getSession();
            ActivityLogs log = new ActivityLogs();
            Object leley = htpsesion.getAttribute("mail");

            log.setTarih(LocalDateTime.now());
            log.setOperasyonu("Müracaat Listeleme: " );
            log.setPersonel((String) leley);
            System.out.println("PERSOnEL ISMI "+ leley);

            session.persist(log);
            transaction.commit();
            session.close();
        }
        request.getRequestDispatcher("muracaatliste.jsp").forward(request, response);
    }
}

