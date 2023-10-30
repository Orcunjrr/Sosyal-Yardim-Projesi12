package com.example.example.AdminServlet;

import com.example.example.DataBase.KullaniciBilgi;
import com.example.example.DataBase.YardimKarari;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
//import jdk.vm.ci.meta.Local;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbookFactory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;


import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Iterator;

@WebServlet(name = "topYarYukleme", value = "/adminpanel/topYarYukleme")
@MultipartConfig(fileSizeThreshold=1024*1024,
        maxFileSize=1024*1024*5, maxRequestSize=1024*1024*5*5)
public class topYarYukleme extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("excelFile");
        if(filePart == null){
            request.setAttribute("errorMsg", " Dosya yükleyiniz.");
            request.getRequestDispatcher("./topyardim.jsp").forward(request, response);
        }

        try (InputStream fileInputStream = filePart.getInputStream()) {
            Workbook workbook = WorkbookFactory.create(fileInputStream);
            Sheet sheet = workbook.getSheetAt(0); // Assuming data is in the first sheet

            StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                    .configure()
                    .build();
            SessionFactory sessionFactory = new MetadataSources(registry)
                    .buildMetadata()
                    .buildSessionFactory();

            Session session = sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();

            Iterator<Row> rowIterator = sheet.iterator();
            //add until all rows are finished
            while (rowIterator.hasNext()) {
                Row row = rowIterator.next();
                String aciklama="";
                if(row.getCell(0)!=null) {
                    aciklama = String.valueOf(row.getCell(0));
                }
                int adet = (int) row.getCell(1).getNumericCellValue();
                String cinsiyet = String.valueOf(row.getCell(2));
                double dosyakararno = row.getCell(3).getNumericCellValue();
                LocalDate dosyatarihi = LocalDate.from(row.getCell(4).getLocalDateTimeCellValue());
                String itiraz = String.valueOf(row.getCell(5));
                double kartyukmiktar = row.getCell(6).getNumericCellValue();
                String kilit = String.valueOf(row.getCell(7));
                LocalDate kredibitis = LocalDate.from(row.getCell(8).getLocalDateTimeCellValue());
                String redsebepler = String.valueOf(row.getCell(9));
                String sadecealttip = String.valueOf(row.getCell(10));
                String teslimeden = String.valueOf(row.getCell(11));
                LocalDate yarbastarih = LocalDate.from(row.getCell(12).getLocalDateTimeCellValue());
                LocalDate yarteslimtarih = LocalDate.from(row.getCell(13).getLocalDateTimeCellValue());
                String yardimalttip = "";
                if(row.getCell(14)!=null){
                    yardimalttip= String.valueOf(row.getCell(14));
                }
                String yardimstatu = "";
                if(row.getCell(15)!=null){
                    yardimstatu=String.valueOf(row.getCell(15));
                }
                String yardimtip = "";
                if(row.getCell(16)!=null){
                    yardimtip=String.valueOf(row.getCell(16));
                }
                String yardonemler = "";
                if(row.getCell(17)!=null){
                    yardonemler=row.getCell(17).getStringCellValue();
                }
                String yarkartdurum = "";
                if(row.getCell(18)!=null){
                    yarkartdurum=row.getCell(18).getStringCellValue();
                }
                int yarkartno = (int) row.getCell(19).getNumericCellValue();
                double yardimtutar = row.getCell(20).getNumericCellValue();
                String yonkurum = "";
                if(row.getCell(21)!=null){
                    yonkurum=String.valueOf(row.getCell(21));
                }
                int kullaniciId = (int) row.getCell(22).getNumericCellValue();

                YardimKarari yardim = new YardimKarari();
                //yeni yardım kararını set et
                yardim.setAcıklama(aciklama);
                yardim.setAdet(adet);
                yardim.setCinsiyet(cinsiyet);
                yardim.setDosKarSayısı(String.valueOf(dosyakararno));
                yardim.setDosyaTarihi(dosyatarihi);
                yardim.setItiraz(itiraz);
                yardim.setKartMiktar(kartyukmiktar);
                yardim.setKilit(kilit);
                yardim.setKrediBitisTarihi(kredibitis);
                yardim.setRedSebepler(redsebepler);
                yardim.setSadeceAltTip(sadecealttip);
                yardim.setTeslimKisi(teslimeden);
                yardim.setYarBaslangıcTarihi(yarbastarih);
                yardim.setYarTeslimTarihi(yarteslimtarih);
                yardim.setYardimTip(yardimtip);
                yardim.setYardimAltTip(yardimalttip);
                yardim.setYardimStatu(yardimstatu);
                yardim.setYardımDönem(yardonemler);
                yardim.setYardımKartDurum(yarkartdurum);
                yardim.setYardımKartNo(yarkartno);
                yardim.setYardımTutari(yardimtutar);
                yardim.setYönlendirenKurum(yonkurum);

                KullaniciBilgi kullan=session.get(KullaniciBilgi.class,kullaniciId);
                if(kullan==null){ //Geçersiz kullanıcı id
                    request.setAttribute("errorMsg", " Yanlış kullanıcı bilgisi!!");
                    request.getRequestDispatcher("./topyardim.jsp").forward(request, response);
                    return;
                }
                else{
                    yardim.setKullanici_id(kullan);
                }

                session.persist(yardim);
            }

            transaction.commit();
            session.close();
            workbook.close();

            response.sendRedirect("./topyardim.jsp"); // Redirect after successful upload

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", " Dosya yüklenirken bir hata oluştu.");
            request.getRequestDispatcher("./topyardim.jsp").forward(request, response);
        }

    }

}
