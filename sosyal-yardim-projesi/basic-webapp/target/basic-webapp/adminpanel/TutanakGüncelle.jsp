<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.example.DataBase.*" %>
<%@ page import="java.util.ArrayList" %>
<%
  HttpSession userSession = request.getSession();
  String roleName = "Role_Tutanak_Duzenle";

  if (!Rol.hasRole(userSession, roleName)) {
    response.sendRedirect("../Error/Error.html");
  }

  String id = request.getParameter("Id");
  int Id = Integer.parseInt(id);
  KullaniciBilgi info = KullaniciBilgi.getbyID(Id);

  String GelenVeriler = info.getTutanakId().getBilgiler();
  String[] satirlar = GelenVeriler.split("/");
  List<String> kimler = new ArrayList<>();
  List<String> meslekler = new ArrayList<>();
  List<String> ucretler = new ArrayList<>();
  for (String satir : satirlar) {
    String[] parcalar = satir.split(":");
    String[] meslekVeUcret = parcalar[3].split("-");

    kimler.add(parcalar[0]);
    meslekler.add(meslekVeUcret[0]);
    ucretler.add(meslekVeUcret[1]);
  }



  List<TalepYardimTip> talep = TalepYardimTip.getAll();
  List<Personel> allPersonel = Personel.getAllUserInfo();
  List<YonlendirilenKurum> yonKurum = YonlendirilenKurum.getAll();
  List<TutanakDurum> durum = TutanakDurum.getAll();
  List<cekmece> cekmeceList = cekmece.getAllUserInfo();
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Gebze Belediyesi | Yönetim Paneli</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">

  <!-- Ionicons -->
  <link rel="stylesheet" href="../https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

  <!-- Tempusdominus Bbootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

  <style>
    .required:after {
      content:" *";
      color: red;
    }
    .card-info{
      position: relative;
      padding: 40px; /* Arkaya gölge için içeriği itin */
      border-radius: 10px; /* Köşeleri keskin olmaktan çıkarın */
      box-shadow: 0 2px 6px rgba(44, 166, 234, 0.6); /* Gölgeli efekti ekle */
      margin-top: 50px;
      margin-left: 30px;
      margin-right: 30px;
    }

    .hidden {
      display: none;
    }
    .pagination .page-item.active .page-link {
      background-color: #17a2b8; /* Kırmızı renk (#ff0000) olarak ayarlandı */
      border-color: #17a2b8; /* Kenarlık rengi de kırmızı yapılıyor */
      color: #fff !important; /* Metin rengi beyaz (#fff) olarak ayarlandı */
    }
    /* DataTables stil düzenlemesi */
    .dataTables_wrapper {
      position: relative;
      padding: 20px; /* Arkaya gölge için içeriği itin */
    }
    .custom-datatable {
      position: relative;
      padding: 40px; /* Arkaya gölge için içeriği itin */
      border-radius: 10px; /* Köşeleri keskin olmaktan çıkarın */
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.4); /* Gölgeli efekti ekle */
      margin-top: 30px;
      margin-left: 30px;
      margin-right: 30px; /* Sol boşluk bırakmayın */
      overflow-x: auto;


    }
    .custom-datatable td {
      font-size: 14px; /* Metin boyutunu ayarlayın */
      font-family: Arial, sans-serif; /* Yazı tipini belirleyin */
      background-color: #f2f2f2; /* Arka plan rengini ayarlayın */
      color: #333; /* Metin rengini ayarlayın */
    }
    .custom-datatable th {
      padding: 10px; /* Arkaya gölge için içeriği itin */
      /* Köşeleri keskin olmaktan çıkarın */


      font-size: 14px;
      font-weight: bold;
      /* Metin boyutunu ayarlayın */
      font-family: Arial, sans-serif; /* Yazı tipini belirleyin */

    }
    .custom-datatable h3.card-title {
      font-size: 24px; /* Yazı boyutunu istediğiniz gibi ayarlayın */
      font-weight: bold;
      font-family: Arial, sans-serif; /* Kalın yazı tipi */
      text-align: center; /* Yazıyı ortala */
      margin-bottom: 20px; /* Aşağıya boşluk bırakın */
    }

    .koyu-yazi {
      color: #000000; /* Siyah rengin hexadecimal kodu */
      /* Diğer stil özelliklerini burada belirtebilirsiniz */
    }

    #nowrap {
      white-space: nowrap;
    }

  </style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Navbar -->
  <%@include file="navbar.jsp"%>
  <!-- /.navbar -->
  <%@include file="sidebar.jsp"%>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Tutanak Ekle</h1>
            <ol class="breadcrumb ">
              <li class="breadcrumb-item"><a href="#">Anasayfa</a></li>
              <li class="breadcrumb-item"><a href="#">İşlemlerim</a></li>
              <li class="breadcrumb-item"><a href="#">Müracaatlar</a></li>
              <li class="breadcrumb-item"><a href="#">Müracaat Listesi</a></li>
              <li class="breadcrumb-item active">Tutanak Ekle</li>
            </ol>
          </div>

        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-secondary">
              <div class="card-header">
                <h3 class="card-title">TUTANAK EKLEME KISMI</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form>
                <div class="card-body">
                  <div class="form-group row m-2">
                    <label   class="col-sm-2 col-form-label">TC Kimlik Numarası</label>
                    <div class="col-sm-4">
                      <%= info.getIdNo() %>
                    </div>
                    <label class="col-sm-2 col-form-label">Ev Tel</label>
                    <div class="col-sm-4">
                      <%= info.getContact().getHomePhone() %>
                    </div>
                  </div>
                  <div class="form-group row m-2">
                    <label   class="col-sm-2 col-form-label">Müracaat No - Müracaat Eden</label>
                    <div class="col-sm-4">
                      <%= "Müracaat No: " +info.getApplication().getAppId() + " Müracat Eden Ad " + info.getAppliName() %>
                    </div>
                    <label   class="col-sm-2 col-form-label">Cep Tel</label>
                    <div class="col-sm-4">
                      <%= info.getContact().getCellPhone() %>
                    </div>
                  </div>
                  <div class="form-group row m-2">
                    <label class="col-sm-2 col-form-label">Eş Adı Soyadı</label>
                    <div class="col-sm-4">
                      <%= info.getEsAd() + " " + info.getEsSoyad() %>
                    </div>

                    <label class="col-sm-2 col-form-label">Medeni Hali</label>
                    <div class="col-sm-4">
                      <%= info.getMaritalStatus() %>
                    </div>
                  </div>
                  <div class="form-group row m-2">

                    <label class="col-sm-2 col-form-label">Doğum Tarihi</label>
                    <div class="col-sm-4">
                      <%= info.getBirthDate() %>
                    </div>

                    <label   class="col-sm-2 col-form-label">Adresi</label>
                    <div class="col-sm-4">
                      <%= info.getRegistrationProvince() + "/" + info.getRegistrationDistrict() + " Mah: " + info.getContact().getNeighborhood() + " Sokak: " + info.getContact().getStreet()  %>
                    </div>
                  </div>
                  <div class="form-group row m-2">
                    <label   class="col-sm-2 col-form-label align-content-center">Belgeler</label>
                    <div class="custom-file row justify-content-around">
                      <input class="btn col-sm-2 btn-outline-secondary" type="file">
                      <input class="btn col-sm-3 btn-outline-secondary" type="file">
                      <input class="btn col-sm-2 btn-outline-secondary" type="file" >
                      <input class="btn col-sm-3 btn-outline-secondary" type="file">
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                </div>
              </form>
            </div>
            <!-- /.card -->
            <!-- general form elements -->
            <div class="card card-secondary">
              <div class="card-header">
                <h3 class="card-title">Aile Bilgi Şeması</h3>
              </div>
              <div>
                <div class="card-body bg-transparent border-bottom button-container row justify-content-around">
                  <button class="btn btn-secondary col-md-2"> <a href="ailelist.jsp?Id=<%=info.getIdNo()%>" class="text-white p-4" >Aile Yakınlıkları</a></button>
                  <button class="btn btn-secondary col-md-2">KPS Aile Yakınlıkları</button>
                  <button class="btn btn-secondary col-md-2"><a href="aynievdeoturanlarlist.jsp?Id=<%=info.getIdNo()%>" class="text-white p-4" >Aynı Evde Oturanlar</a></button>
                  <button class="btn btn-secondary col-md-2"><a href="egitimbilgilerilist.jsp?Id=<%=info.getIdInfoId()%>" class="text-white p-4" >Eğitim Bilgileri</a></button>
                  <button class="btn btn-secondary col-md-2"><a href="Askerhükümlügiris.jsp?Id=<%=info.getIdNo()%>" class="text-white p-4" >Asker/Hükümlü Girişi</a></button>
                </div>
              </div>
              <!-- /.card-header -->
              <!-- form start -->

            </div>

            <% if (request.getAttribute("errorMessage") != null) { %>
            <div style="color: red;">
              <%= request.getAttribute("errorMessage")%>
            </div>
            <% } %>

            <!-- AİLE GEÇİMİ  -->

            <form action="tutanakservlet" method="post">
              <div class="row">
                <div class="col-12 col-md-6">
                  <div class="card card-secondary">
                    <div class="card-header">
                      <h3 class="card-title">Ailenin Geçimini Kim Sağlıyor?</h3>
                    </div>
                    <div class="card-body">
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> Kim</label></div></div>
                        <div class="col"> <div class="form-check form-check-inline"><label class=" form-label">Meslek Açıklama</label></div></div>
                        <div class="col"><div class="form-check form-check-inline"><label class=" form-label"> Ücret</label></div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu" value="kendisi">Kendisi</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama"><%=meslekler%></div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret"> <%=ucretler%></div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu" value="es">Eşi</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama" value="<%=meslekler.get(2)%>"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret" value="<%=ucretler.get(2)%>"> </div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu" value="cocuklar">Çocukları</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret"> </div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu" value="cocuklar1">Çocuklar-1</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret"> </div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu" value="cocuklar2">Çocuklar-2</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret"> </div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu" value="cocuklar3" >Çocuklar-3</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret"> </div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu" value="askermaas">Asker Maaşı</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret"> </div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu" value="kirageliri">Kira Geliri</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret"> </div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu" value="diger" >Diğer: </label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret"> </div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu" value="yaslılık" >2022 Yaşlılık: </label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret"> </div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu" value="engelli">2022 Engelli :</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret"> </div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu" value="engelliyakini">Engelli Yakını Aylığı</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret"> </div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu" value="yetimayligi">Yetim Öksüz Aylığı</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret"> </div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu" value="emeklimaas">Emekli Maaşı</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret"> </div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu" value="emeklimaas1">Emekli Maaşı-1</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret"> </div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu" value="evdebakim" >Evde Bakım Parası</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret"> </div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu" value="dulmaası" >Dul Maaşı</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret"> </div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu" value="issizlik">İşsizlik Maaşı</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret"> </div></div>
                      </div>
                      <script>
                        function calculateDuzenli() {
                          // Get all elements with name="ucret"
                          const ucretInputsDuzenli = document.getElementsByName("ucret");
                          let totalIncome = 0;

                          // Iterate through the ucret inputs and add their values to totalIncome
                          for (let i = 0; i < ucretInputsDuzenli.length; i++) {
                            const inputValue = parseFloat(ucretInputsDuzenli[i].value) || 0; // Convert to float, default to 0 if NaN
                            totalIncome += inputValue;
                          }

                          // Set the total income in the "Düzenli Gelirler Toplamı" input field
                          const totalIncomeInput = document.getElementById("duzenliToplam");
                          totalIncomeInput.value = totalIncome;
                        }

                        // Listen for input changes in the "ucret" inputs and calculate total income on change
                        const ucretInputsDuzenli = document.getElementsByName("ucret");
                        for (let i = 0; i < ucretInputsDuzenli.length; i++) {
                          ucretInputsDuzenli[i].addEventListener("input", calculateDuzenli);
                        }
                      </script>
                      <div class="form-group row bg-transparent border-top border-bottom">
                        <div class="col-4"><div class="form-check form-check-inline"> </div></div>
                        <div class="col"> <div class="row col-auto"><label class=" form-label">Düzenli Gelirler Toplamı</label> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="duzenliGelirToplam" id="duzenliToplam"> </div></div>
                      </div>

                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu2" value="kaymakamlik">Kaymakamlık</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama1"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret1"> </div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu2" value="sosyalHizmet">Sosyal Hizmetler</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama1"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret1"> </div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu2" value="büyüksehir">Büyükşehir Beld.</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama1"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret1"> </div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu2" value="özelVakif">Diğer Özel Vakıflar</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama1"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret1"> </div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label"> <input class="form-check-input" type="checkbox" name="checkutu2" value="yardimlarla">yardımlarla</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="isaciklama1"> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="ucret1"> </div></div>
                      </div>
                      <script>
                        function calculateDuzensiz() {
                          // Get all elements with name="ucret"
                          const ucretInputsDuzensiz = document.getElementsByName("ucret1");
                          let totalIncome = 0;

                          // Iterate through the ucret inputs and add their values to totalIncome
                          for (let i = 0; i < ucretInputsDuzensiz.length; i++) {
                            const inputValue = parseFloat(ucretInputsDuzensiz[i].value) || 0; // Convert to float, default to 0 if NaN
                            totalIncome += inputValue;
                          }

                          // Set the total income in the "Düzenli Gelirler Toplamı" input field
                          const totalIncomeInput = document.getElementById("duzensizToplam");
                          totalIncomeInput.value = totalIncome;
                        }

                        // Listen for input changes in the "ucret" inputs and calculate total income on change
                        const ucretInputsDuzensiz = document.getElementsByName("ucret1");
                        for (let i = 0; i < ucretInputsDuzensiz.length; i++) {
                          ucretInputsDuzensiz[i].addEventListener("input", calculateDuzensiz);
                        }
                      </script>
                      <div class="form-group row bg-transparent border-top border-bottom">
                        <div class="col-4"><div class="form-check form-check-inline"> </div></div>
                        <div class="col"> <div class="row col-auto"><label class=" form-label">Düzensiz Gelirler Toplamı</label> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="duzensizGelirToplam" id="duzensizToplam"> </div></div>
                      </div>
                      <script>
                        function calculateTotalIncome() {
                          // Get "Düzenli Gelirler Toplamı" and "Düzensiz Gelirler Toplamı" values
                          const duzenliToplam = parseFloat(document.getElementById("duzenliToplam").value) || 0;
                          const duzensizToplam = parseFloat(document.getElementById("duzensizToplam").value) || 0;

                          // Calculate "Genel Gelir Toplamı"
                          const genelGelirToplam = duzenliToplam + duzensizToplam;

                          // Set the total income in the "Genel Gelir Toplamı" input field
                          const genelGelirToplamInput = document.getElementById("genelGelirToplam");
                          genelGelirToplamInput.value = genelGelirToplam;
                        }

                        // Listen for changes in "Düzenli Gelirler Toplamı" and "Düzensiz Gelirler Toplamı" inputs
                        document.getElementById("duzenliToplam").addEventListener("change", calculateTotalIncome);
                        document.getElementById("duzensizToplam").addEventListener("change", calculateTotalIncome);
                        const duzenliInputs = document.getElementsByName("ucret");
                        for (let i = 0; i < duzenliInputs.length; i++) {
                          duzenliInputs[i].addEventListener("input", calculateTotalIncome);
                        }

                        // Get all Düzensiz inputs and add change event listeners
                        const duzensizInputs = document.getElementsByName("ucret1");
                        for (let i = 0; i < duzensizInputs.length; i++) {
                          duzensizInputs[i].addEventListener("input", calculateTotalIncome);
                        }
                      </script>
                      <div class="form-group row bg-transparent border-bottom ">
                        <div class="col-4"><div class="form-check form-check-inline"> </div></div>
                        <div class="col"> <div class="row col-auto"><label class=" form-label">Genel Gelir Toplamı</label> </div></div>
                        <div class="col"><div class="row "><input class="form-control" type="number"  name="genelGelirToplam" id="genelGelirToplam"> </div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class=" form-label">Gelir Aralığı</label></div></div>
                        <div class="col"> <div class="row col-auto">
                          <select class="form-control" name="gelir_aralik">
                            <option>0-10.000</option>
                            <option>10.000-20.000</option>
                            <option>20.000-30.000</option>
                            <option>30.000+</option>
                          </select>

                        </div></div>
                        <div class="col"><div class="row "> </div></div>
                      </div>
                      <%--                    <div class="form-group row">--%>
                      <%--                      <div class="form-check form-check-inline">--%>
                      <%--                        <label class="col-12 col-md-auto form-label">--%>
                      <%--                          <input class="form-check-input" type="checkbox" name="checkutu" value="kendisi"> Kendisi--%>
                      <%--                        </label>--%>
                      <%--                      </div>--%>
                      <%--                      <div class="col-12 col-lg-4">--%>
                      <%--                        <input class="form-control" name="isaciklama">--%>
                      <%--                      </div>--%>
                      <%--                      <div class="col-12 col-lg-4">--%>
                      <%--                        <input class="form-control" name="ucret">--%>
                      <%--                      </div>--%>
                      <%--                    </div>--%>




                    </div>

                    <div class="card-header">Ev - Araba - Gayrimenkul Durumu</div>
                    <div class="card-body">
                      <div class="form-group row ">
                        <label   class="col-sm-5 col-form-label">Ev Durumu:</label>
                        <div class="col-sm-5">
                          <input type="hidden" name="muracaatid" value="<%=Id%>">
                          <input type="hidden" name="tcnosu" value="<%= info.getIdNo() %>">
                          <input type="hidden" name="KullaniciID" value="<%= info.getIdInfoId() %>">

                          <select class="form-control" name="evDurumu">
                            <option selected disabled>Lütfen Seçiniz</option>
                            <option>Ev Sahibi</option>
                            <option>Kira</option>
                            <option>Diğer</option>
                            <option>Yakınının Evi</option>
                            <option>Baraka</option>
                            <option>Evsiz</option>
                          </select>
                        </div></div>

                      <div class="form-group row ">
                        <label   class="col-sm-5 col-form-label">Ev Durumu Açıklama:</label>
                        <div class="col-sm-5">
                          <input type="text" class="form-control" name="evAcik">
                        </div></div>

                      <div class="form-group row ">
                        <label   class="col-sm-5 col-form-label">Kira Miktarı: </label>
                        <div class="col-sm-5">
                          <input type="number" class="form-control" name="kiraMiktar" value="0">
                        </div></div>

                      <div class="form-group row">
                        <label   class="col-sm-5 col-form-label">Ev Tipi: </label>
                        <div class="col-sm-5">
                          <select class="form-control" name="evTip">
                            <option selected disabled>Lütfen Seçiniz</option>
                            <option>Daire</option>
                            <option>Gecekondu</option>
                            <option>Müstakil</option>
                            <option>Baraka</option>
                            <option>Çadır</option>
                            <option>Daire 1+1</option>
                            <option>Daire 2+1</option>
                            <option>Daire 3+1</option>
                          </select>
                        </div></div>

                      <div class="form-group row">
                        <label   class="col-sm-5 col-form-label">Yakacak Tipi:</label>
                        <div class="col-sm-5">
                          <select class="form-control" name="yakacakTip">
                            <option selected disabled>Lütfen Seçiniz</option>
                            <option>Soba</option>
                            <option>Kombi</option>
                            <option>Elektrik</option>
                            <option>Katalitik</option>
                            <option>Doğalgaz Sobası</option>
                          </select>
                        </div></div>

                      <div class="form-group row">
                        <label   class="col-sm-5 col-form-label">Kirada Evi Var Mı?: </label>
                        <div class="col-sm-5">
                          <label class="form-check-label" style="margin: 2px"><input type="radio" name="kira" value="Var">VAR</label>
                          <label class="form-check-label" style="margin: 2px"><input type="radio" name="kira" value="Yok">YOK</label>
                        </div></div>

                      <div class="form-group row">
                        <label   class="col-sm-5 col-form-label">Kaç Evi Var?</label>
                        <div class="col-sm-5">
                          <input type="number" class="form-control" name="evSayisi" value="0">
                        </div></div>

                      <div class="form-group row">
                        <label   class="col-sm-5 col-form-label">Toplam Kira Geliri</label>
                        <div class="col-sm-5">
                          <input type="number" class="form-control" name="kiraGeliri" value="0">
                        </div></div>

                      <div class="form-group row">
                        <label   class="col-sm-5 col-form-label">Arabası Var Mı?</label>
                        <div class="col-sm-5">
                          <label class="form-check-label" style="margin: 2px"><input type="radio" name="araba" value="Var">VAR</label>
                          <label class="form-check-label" style="margin: 2px"><input type="radio" name="araba" value="Yok">YOK</label>
                        </div></div>

                      <div class="form-group row">
                        <label   class="col-sm-5 col-form-label">Araba Marka Model</label>
                        <div class="col-sm-5">
                          <input type="text" class="form-control" name="arabaModel">
                        </div></div>

                      <div class="form-group row">
                        <label   class="col-sm-5 col-form-label">Gayrimenkul Var Mı?</label>
                        <div class="col-sm-5">
                          <label class="form-check-label" style="margin: 2px"><input type="radio" name="gayrimenkul"value="Var">VAR</label>
                          <label class="form-check-label" style="margin: 2px"><input type="radio" name="gayrimenkul" value="Yok">YOK</label>
                        </div></div>

                      <div class="form-group row">
                        <label   class="col-sm-5 col-form-label">Gayrimenkul Türü</label>
                        <div class="col-sm-5">
                          <input type="text" class="form-control" name="gayriTur">
                        </div></div>
                    </div>


                    <div class="card-header">Sosyal Güvence Durumu</div>
                    <div class="card-body">
                      <div class="form-group row">
                        <div class="col-4">Sosyal Güvencesi</div>
                        <div class="col-4"><label class=" form-label"> <input class="form-check-input" type="radio" name="sosyalguv" value="Evet">Evet</label></div>
                        <div class="col-4"><label class=" form-label"> <input class="form-check-input" type="radio" name="sosyalguv" value="Hayır">Hayır</label></div>

                      </div>
                      <div class="form-group row">
                        <div class="col-4 form-check-label">Sosyal Güvencesi</div>
                        <div class="col-4"><select class="form-control" name="sosyalguvenceselect">
                          <option value="sgk">SGK</option>
                          <option value="sgk">BAĞKUR</option>
                        </select></div>

                      </div>
                      <div class="form-group row">
                        <div class="col-4">Yönlendiren Birim</div>
                        <div class="col-4">
                          <select class="form-control" name="yonbirim">
                            <%for(YonlendirilenKurum yk: yonKurum){%>
                            <option><%=yk.getYonlendirilenKurumName()%></option>
                            <%}%>
                          </select></div>


                      </div>
                      <div class="form-group row">
                        <div class="col-4">Yönlendiren Kurum Açıklaması</div>
                        <div class="col-4"><input type="text" class="form-control" name="yönkurumaciklama"></div>

                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-12 col-md-6">
                  <div class="card card-secondary">
                    <!-- RIGHT COLUMN -->
                    <div class="card-header">
                      <h3 class="card-title bg-transparent ">Aile Nüfusu</h3>
                    </div>


                    <div class="form-group row m-2">
                      <label class="col-sm-3 col-form-label required">Asker Var mı?</label>

                      <div class="col-sm-3 col-form-label">
                        <div class="icheck-primary d-inline">
                          <input value="Var" type="radio" id="askerevet" name="asker" required>
                          <label for="askerevet">
                            Var
                          </label>
                        </div>
                        <div class="icheck-primary d-inline">
                          <input value="Yok" type="radio" id="askerhayir" name="asker" required>
                          <label for="askerhayir">
                            Yok
                          </label>
                        </div>

                      </div>
                      <label class="col-sm-3 col-form-label required" id="nowrap">Soybis İşlendi mi?</label>
                      <div class="col-sm-3 col-form-label">
                        <div class="icheck-primary d-inline">
                          <input value="Var" type="radio" id="soybisevet" name="soybis" required>
                          <label for="soybisevet">
                            Var
                          </label>
                        </div>
                        <div class="icheck-primary d-inline">
                          <input value="Yok" type="radio" id="soybishayir" name="soybis" required>
                          <label for="soybishayir">
                            Yok
                          </label>
                        </div>
                      </div>
                    </div>

                    <div class="form-group row m-2">
                      <label class="col-sm-3 col-form-label required">Şehit Var mı?</label>
                      <div class="col-sm-3 col-form-label">
                        <div class="icheck-primary d-inline">
                          <input value="Var" type="radio" id="sehitvar" name="sehit" required>
                          <label for="sehitvar">
                            Var
                          </label>
                        </div>
                        <div class="icheck-primary d-inline">
                          <input value="Yok" type="radio" id="sehityok" name="sehit" required>
                          <label for="sehityok">
                            Yok
                          </label>
                        </div>
                      </div>
                      <label class="col-sm-3 col-form-label required">Gazi Var mı?</label>

                      <div class="col-sm-3 col-form-label">
                        <div class="icheck-primary d-inline">
                          <input value="Var" type="radio" id="gazivar" name="gazi" required>
                          <label for="gazivar">
                            Var
                          </label>
                        </div>
                        <div class="icheck-primary d-inline">
                          <input value="Yok" type="radio" id="gaziyok" name="gazi" required>
                          <label for="gaziyok">
                            Yok
                          </label>
                        </div>
                      </div>

                    </div>

                    <div class="form-group row m-2">
                      <label class="col-sm-6 col-form-label">Hanede Yaşayan Toplam Kişi Sayısı</label>
                      <div class="col-sm-6">
                        <input type="number" name="haneKisi" class="form-control" value="0">
                      </div>
                    </div>

                    <div class="form-group row m-2">
                      <label class="col-sm-6 col-form-label">Bakmakla Yükümlü Yetim</label>
                      <div class="col-sm-6">
                        <input type="number" name="yetimSayi" class="form-control" value="0">
                      </div>
                    </div>

                    <div class="form-group row m-2">
                      <label class="col-sm-6 col-form-label">Toplam Çocuk Sayısı</label>
                      <div class="col-sm-6">
                        <input type="number" name="cocukSayi" class="form-control" value="0">
                      </div>
                    </div>


                    <div class="card-header"><label class="required">Ailede Sağlık Problemi Olan Var Mı?</label></div>
                    <div class="card-body bg-transparent border-bottom">
                      <div class="form-group row">
                        <div class="col-4"> <div class="form-check form-check-inline"><div class="form-group clearfix">
                          <div class="icheck-primary d-inline">
                            <input value="Var" type="radio" id="radioPrimary2" name="saglikp" required>
                            <label for="radioPrimary2">
                              Var
                            </label>
                          </div>


                        </div></div></div>
                        <div class="col"><div class="icheck-primary d-inline">
                          <input value="Yok" type="radio" id="radioPrimary4" name="saglikp" required>
                          <label for="radioPrimary4">
                            Yok
                          </label>
                        </div></div>
                        <div class="col"></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class="col-12 col-md-auto form-label">Hasta Olanlar</label></div></div>
                        <div class="col"> <div class="row col-auto"><label class="col-12 col-md-auto form-label">Hastalığı</label></div></div>
                        <div class="col"></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class="col-12 col-md-auto form-label"> <input class="form-check-input" type="checkbox" name="saglik" value="kendi">Kendi</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="problemler" ></div></div>
                        <div class="col"></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class="col-12 col-md-auto form-label"> <input class="form-check-input" type="checkbox" name="saglik" value="es">Eş</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="problemler" > </div></div>
                        <div class="col"></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class="col-12 col-md-auto form-label"> <input class="form-check-input" type="checkbox" name="saglik" value="cocuk1">Çocuk-1</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="problemler" > </div></div>
                        <div class="col"><div class="row "><input class="form-control"  type="number" placeholder="Sayı" name="a" value=""></div></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class="col-12 col-md-auto form-label"> <input class="form-check-input" type="checkbox" name="saglik" value="cocuk2">Çocuk-2</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="problemler" > </div></div>
                        <div class="col"></div>
                      </div>
                      <div class="form-group row">
                        <div class="col-4"><div class="form-check form-check-inline"><label class="col-12 col-md-auto form-label"> <input class="form-check-input" type="checkbox" name="saglik" value="diger">Diğer</label></div></div>
                        <div class="col"> <div class="row col-auto"><input class="form-control"  name="problemler" > </div></div>
                        <div class="col"></div>
                      </div>


                    </div>
                    <div class="card-body bg-transparent border-bottom"></div>

                    <div class="card-header">Ailede Engelli Var Mı?</div>
                    <div class="card-body bg-transparent border-bottom row justify-content-around form-check-inline form-group clearfix">



                      <div class="icheck-primary d-inline">
                        <input value="Var" type="radio" id="asd" name="engelli" required>
                        <label for="asd">
                          Var
                        </label>
                      </div>
                      <div class="icheck-primary d-inline">
                        <input value="Yok" type="radio" id="asdd" name="engelli" required>
                        <label for="asdd">
                          Yok
                        </label>
                      </div>

                      <button type="button" class="btn btn-secondary col-lg-auto"><a href="engelligiris.jsp?Id=<%=info.getIdNo()%>" class="text-white p-4" >Engelli Giriş/Düzenle</a></button>
                    </div>

                    <div class="card-header">Ev Eşyaları</div>
                    <div class="card-body">
                      <div class="row">
                        <div class="col-md-3">
                          <label for="Bilgisayar"><input type="checkbox" name="evEsyalar" id="Bilgisayar" value="Bilgisayar">Bilgisayar</label>
                          <label for="Cep telefonu"><input type="checkbox" name="evEsyalar" id="Cep telefonu" value="Cep telefonu">Cep Telefonu</label>
                          <label for="Fırınlı ocak"><input type="checkbox" name="evEsyalar" id="Fırınlı ocak" value="Fırınlı ocak">Fırınlı Ocak</label>
                        </div>
                        <div class="col-md-3">
                          <label for="Bulaşık Mak"><input type="checkbox" name="evEsyalar" id="Bulaşık Mak" value="Bulaşık Mak">Bulaşık Mak</label>
                          <label for="Çamaşır Mak"><input type="checkbox" name="evEsyalar" id="Çamaşır Mak" value="Çamaşır Mak">Çamaşır Mak</label>
                          <label for="İnternet"><input type="checkbox" name="evEsyalar" id="İnternet" value="">İnternet</label>
                        </div>
                        <div class="col-md-3">
                          <label for="Elekt.Süpürge"><input type="checkbox" name="evEsyalar" id="Elekt.Süpürge" value="Elekt.Süpürge">Elekt.Süpürge</label>
                          <label for="Koltuk Takımı"><input type="checkbox" name="evEsyalar" id="Koltuk Takımı" value="Koltuk Takımı">Koltuk Takımı</label>
                          <label for="Telefon"><input type="checkbox" name="evEsyalar" id="Telefon" value="Telefon">Telefon</label>
                        </div>
                        <div class="col-md-3">
                          <label for="Şofben"><input type="checkbox" name="evEsyalar" id="Şofben" value="Şofben">Şofben</label>
                          <label for="Buzdolabı"><input type="checkbox" name="evEsyalar" id="Buzdolabı" value="Buzdolabı">Buzdolabı</label>
                          <label for="Televizyon"><input type="checkbox" name="evEsyalar" id="Televizyon" value="Televizyon">Televizyon</label>
                        </div>
                      </div>
                    </div>








                    <div class="card-header">Borç Durumu</div>
                    <div class="card-body">

                      <div class="form-group row m-2">
                        <label class="col-sm-6 col-form-label">Elektrik</label>
                        <div class="col-sm-6">
                          <input type="number" name="elektrik" class="form-control" value="0">
                        </div>
                      </div>

                      <div class="form-group row m-2">
                        <label class="col-sm-6 col-form-label">Su</label>
                        <div class="col-sm-6">
                          <input type="number" name="su" class="form-control" value="0">
                        </div>
                      </div>

                      <div class="form-group row m-2">
                        <label class="col-sm-6 col-form-label">Doğalgaz</label>
                        <div class="col-sm-6">
                          <input type="number" name="dogalgaz" class="form-control" value="0">
                        </div>
                      </div>

                      <div class="form-group row m-2">
                        <label class="col-sm-6 col-form-label">Kira</label>
                        <div class="col-sm-6">
                          <input type="number" name="kira" class="form-control" value="0">
                        </div>
                      </div>

                      <div class="form-group row m-2">
                        <label class="col-sm-6 col-form-label">Kredi Kartı</label>
                        <div class="col-sm-6">
                          <input type="number" name="kredikarti" class="form-control" value="0">
                        </div>
                      </div>

                      <div class="form-group row m-2">
                        <label class="col-sm-6 col-form-label">Diğer</label>
                        <div class="col-sm-6">
                          <input type="number" name="diger" class="form-control" value="0">
                        </div>
                      </div>

                      <div class="form-group row m-2">
                        <label class="col-sm-6 col-form-label">Diğer Açıklama</label>
                        <div class="col-sm-6">
                          <input type="text" name="digeraciklama" class="form-control" value="0">
                        </div>
                      </div>

                    </div>



                    <div class="card-header">Başvuru Beyanı</div>
                    <div class="card-body">
                      <textarea id="beyan" name="beyan" cols="75" rows="5"></textarea>
                    </div>


                    <div class="card-header">İnceleme Ekibi Görüş Kanaati</div>
                    <div class="card-body">
                      <textarea id="kanaat" name="kanaat" cols="75" rows="5"></textarea>
                    </div>

                  </div>
                </div>

              </div>

              <div class="card card-secondary">
                <div class="card-header">Talep Edilen Yardım Türü</div>
                <div class="card-body">
                  <div class="row">
                    <% int columnCount = 4;
                      for (int i = 0; i < talep.size(); i++) {
                        if (i % columnCount == 0) {
                          // Her sütun döngüsü başlangıcında yeni bir satır başlatıyoruz.
                          if (i > 0) {
                    %>
                  </div>
                  <div class="row">
                    <%
                        }
                      }
                    %>
                    <div class="col-sm-3">
                      <div class="form-group">
                        <label class="col-form-label"><input type="checkbox" name="talep" value="<%= talep.get(i).getTalepYardimAdi() %>"><%= talep.get(i).getTalepYardimAdi() %></label>
                      </div>
                    </div>
                    <%
                      }
                    %>
                  </div>
                </div>
              </div>

              <div class="card card-secondary border-top">
                <div class="card-body">
                  <div class="form-group row">
                    <div class="col-6"><div class="form-check form-check-inline"><label class="col-form-label">İnceleme Tarihi:</label>
                      <input type="date" name="incelemeTarihi" required>
                    </div></div>
                    <div class="col-6"><div class="form-check form-check-inline"><label class="col-form-label">İnceleme Yapan:</label>
                      <select class="form-control" name="incelemeYapan">
                        <% for(Personel p: allPersonel){%>
                        <option><%=p.getName()%></option>
                        <%}%>
                      </select>
                      <label class="">-</label>
                      <select class="form-control" name="incelemeYapan1">
                        <% for(Personel p: allPersonel){%>
                        <option><%=p.getSurname()%></option>
                        <%}%>
                      </select>
                    </div></div>
                  </div>

                </div>
              </div>
              <div class="card card-secondary border-top">
                <div class="card-body">
                  <div class="form-group row">
                    <div class="col-4"><div class="form-check form-check-inline"><label class="col-form-label"> Başvuru Alan Kişinin Adı:</label>
                      <select class="form-control" name="basvuruKisi">
                        <%for(Personel p:allPersonel){%>
                        <option><%=p.getName()+' '+p.getSurname()%></option>
                        <%}%>
                      </select>
                    </div></div>
                    <div class="col"> <div class="form-check form-check-inline"><label class="col-form-label">Durum:</label>
                      <select class="form-control" name="durum">
                        <%for(TutanakDurum d:durum){%>
                        <option><%=d.getDurumAdi()%></option>
                        <%}%>
                      </select>
                    </div></div>
                    <div class="col"><div class="form-check form-check-inline"><label class="col-form-label"> Çekmece:</label>
                      <select class="form-control" name="cekmece">
                        <%for(cekmece c:cekmeceList){%>
                        <option><%=c.getCekmeceAdi()%></option>
                        <%}%>
                      </select>
                    </div>
                      <button type="submit" class="btn btn-primary">Ekle</button>
                    </div>
                  </div>
                  <%-- Display the error message if it's set --%>
                </div>

              </div>

              <!-- /////////////AİLE GEÇİMİ  -->
            </form>





            <!-- /.card -->

            <!-- /.card -->

            </form>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
          <!-- /.row -->
        </div><!-- /.container-fluid -->
      </div>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <strong><a href="https://www.gebze.bel.tr/">Gebze Belediyesi  </a></strong>

    <div class="float-right d-none d-sm-inline-block">
      <b>2023</b>
    </div>
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS ../-->
<script src="plugins/chart.js/Chart.min.js"></script>
<!-- Sparklin../e -->
<script src="plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -/-->
<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<!-- jQuery K../nob Chart -->
<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterang../epicker -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdo../minus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summerno../te -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayS../crollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE../ App -->
<script src="dist/js/adminlte.js"></script>
<!-- AdminLTE../ dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
<!-- AdminLTE../ for demo purposes -->
<script src="dist/js/demo.js"></script>
<script src="../../plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>


<!-- Bootstrap 4 -->

<!-- DataTables -->

<!-- AdminLTE App -->

<!-- AdminLTE for demo purposes -->

<!-- page script -->


</body>
</html>
