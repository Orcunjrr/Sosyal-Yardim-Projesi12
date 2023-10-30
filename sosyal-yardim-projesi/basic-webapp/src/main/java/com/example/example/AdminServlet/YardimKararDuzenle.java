package com.example.example.AdminServlet;

import com.example.example.DataBase.KullaniciBilgi;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Objects;

@WebServlet(name = "YardimKararDuzenle", value = "/adminpanel/yardimkararduzenle")
public class YardimKararDuzenle extends HttpServlet {
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            String KararId = request.getParameter("kararid");
            String muracaatid = request.getParameter("murId");
            String yardimTip = request.getParameter("yardim_tipi");
            String yardimAltTip = request.getParameter("yardim_alt_tip");
            String yardimStatu = request.getParameter("yardim_statu");
            String dosKarSayısı = request.getParameter("dosya_karar_sayisi");
            String yardımDönem = request.getParameter("yardim_dönemleri");
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate dosyaTarihi = LocalDate.parse(request.getParameter("dosya_tarihi"), formatter);
            String yönlendirenKurum = request.getParameter("yonlendiren_birim");
            LocalDate yarTeslimTarihi = LocalDate.parse(request.getParameter("yardim_teslim_tarihi"),formatter);
            String acıklama = request.getParameter("aciklama");
            Double yardımTutari=0.0;
            String yardimTuttariString = request.getParameter("yardim_tutari");
            if(!Objects.equals(yardimTuttariString, "")){yardımTutari= Double.valueOf(yardimTuttariString);
            }

            String kilit = request.getParameter("kilit");
            Integer adet = Integer.valueOf(request.getParameter("adet"));
            String cinsiyet = request.getParameter("cinsiyet");
            String teslimKisi = request.getParameter("teslim_kişi");
            String itiraz = request.getParameter("itiraz");
            String redSebepleri=" ";
            String[] sebepler = request.getParameterValues("sebep");
            if(sebepler != null){
                for (String sebep : sebepler){
                    redSebepleri = redSebepleri + "," +sebep;
                }
            }
            Integer yardımKartNo = Integer.valueOf(request.getParameter("yardim_kart_no"));
            String yardımKartDurum = request.getParameter("yardım_kart_durum");
            Double kartMiktar = Double.valueOf(request.getParameter("kart_miktar"));
            String sadeceAltTip = request.getParameter("belirtilen_alt_tip");
            LocalDate yarBaslangıcTarihi = LocalDate.parse(request.getParameter("yardim_bas_tarihi"),formatter);
            LocalDate krediBitisTarihi = LocalDate.parse(request.getParameter("kredi_bitis_tarihi"),formatter);
            int KarId = Integer.parseInt(KararId);

            try{
                SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
                Session session = sessionFactory.openSession();
                Transaction transaction = session.beginTransaction();

                com.example.example.DataBase.YardimKarari yardim = new com.example.example.DataBase.YardimKarari();
                yardim.setYardimTip(yardimTip);
                yardim.setYardimAltTip(yardimAltTip);
                yardim.setYardimStatu(yardimStatu);
                yardim.setDosKarSayısı(dosKarSayısı);
                yardim.setYardımDönem(yardımDönem);
                yardim.setDosyaTarihi(dosyaTarihi);
                yardim.setYönlendirenKurum(yönlendirenKurum);
                yardim.setYarTeslimTarihi(yarTeslimTarihi);
                yardim.setAcıklama(acıklama);
                yardim.setYardımTutari(yardımTutari);
                yardim.setKilit(kilit);
                yardim.setAdet(adet);
                yardim.setCinsiyet(cinsiyet);
                yardim.setTeslimKisi(teslimKisi);
                yardim.setItiraz(itiraz);
                yardim.setRedSebepler(redSebepleri);
                yardim.setYardımKartNo(yardımKartNo);
                yardim.setYardımKartDurum(yardımKartDurum);
                yardim.setKartMiktar(kartMiktar);
                yardim.setSadeceAltTip(sadeceAltTip);
                yardim.setYarBaslangıcTarihi(yarBaslangıcTarihi);
                yardim.setKrediBitisTarihi(krediBitisTarihi);
                yardim.setKararId(KarId);

                // KullaniciBilgi kullan = KullaniciBilgi.getbyID(Integer.parseInt(TCKIMLIK));
                KullaniciBilgi kullan=session.get(KullaniciBilgi.class,muracaatid);
                yardim.setKullanici_id(kullan);

                kullan.setYardimKarariId(yardim.getKullanici_id().getYardimKarariId());

                session.merge(kullan);
                session.merge(yardim);

                transaction.commit();

                session.close();
                sessionFactory.close();
                response.sendRedirect("./yardimkararlist.jsp");

            }catch (Exception e){
                System.err.println("Hata oluştu: " + e);
                e.printStackTrace();
            }




        }

    }

