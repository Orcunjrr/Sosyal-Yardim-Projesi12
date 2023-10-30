
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.example.DataBase.*" %>
<%@ page import="com.example.example.DataBase.EngelliAracHizmet" %>


<%
  HttpSession userSession = request.getSession();
  String roleName = "Role_Muracaat_Listele";

  if (!Rol.hasRole(userSession, roleName)) {
    response.sendRedirect("../Error/Error.html");
  }
  List<Engelli> engelli = Engelli.getAll();
  List<EngelliAlt> engelliAlt = EngelliAlt.getAll();
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Gebze Belediyesi | Engelli Giris</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

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
    .form-heading {
      font-size: 17px;
      font-weight: bold;
      color: black; /* Change the color to your desired heading color */
      margin-bottom: 10px; /* Add some spacing between headings and form fields */

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
    <style>
     .hidden {
       display: none;
     }
    .pagination .page-item.active .page-link {
      background-color: #17a2b8; /* Kırmızı renk (#ff0000) olarak ayarlandı */
      border-color: #17a2b8; /* Kenarlık rengi de kırmızı yapılıyor */
      color: #fff !important; /* Metin rengi beyaz (#fff) olarak ayarlandı */
    }
    /* DataTables stil düzenlemesi */
    .required:after {
      content:" *";
      color: red;
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

  </style>
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
            <h1>Engelli Tanımlama</h1>
            <ol class="breadcrumb ">
              <li class="breadcrumb-item"><a href="#">Anasayfa</a></li>
              <li class="breadcrumb-item"><a href="#">Yönetici İşlemleri</a></li>
              <li class="breadcrumb-item"><a href="#">Engelli Tipleri Girişi</a></li>
              <li class="breadcrumb-item active">Engelli Tanımlama</li>
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
            <!-- /.card -->
            <!-- general form elements -->
            <!-- /.card -->
            <div class="card card-secondary">
              <div class="card-header">
                <h3 class="card-title">Engelli Giriş</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form action="EngelliGirisServlet" method="post">
                <div class="card-body">
                  <div class="form-group row">
                    <% String mesaj=request.getParameter("HATA") ; if ( mesaj!= null) { %>
                    <h1 class="fw-bolder fs-2qx pb-5 pb-md-10" style="color: red;">
                      <p>TC Kimlik numaralı insan bulunamadı!</p>
                    </h1>
                    <% } %>
                    <label   class="col-sm-2 col-form-label required">Tc Kimlik Numarası:</label>
                    <div class="col-sm-4">
                      <input type="text" name="tcKimlik" class="form-control" maxlength="11" required>
                    </div>
                    <label class="col-sm-2 col-form-label" >Engelli Tip/Grup:</label>
                    <div class="col-sm-4">
                      <select class="form-control required" name="EngelliTip">
                        <% for (Engelli engelTip : engelli) {  %>
                        <option value="<%= engelTip.getDisabledName() %>"><%= engelTip.getDisabledName() %></option>
                        <% } %>
                      </select>
                    </div>
                  </div>
                  <div class="form-group row">

                    <label class="col-sm-2 col-form-label required" >Engelli Alt Tip/Grup:</label>
                    <div class="col-sm-4">
                      <select class="form-control" name="EngelliAltTip">
                        <% for (EngelliAlt engelAltTip : engelliAlt) {  %>
                        <option value="<%= engelAltTip.getDisabledSubName() %>"><%= engelAltTip.getDisabledSubName() %></option>
                        <% } %>
                      </select>
                    </div>
                    <label class="col-sm-2 col-form-label required">Engel Derece:</label>
                    <div class="col-sm-4">
                      <input type="text" class="form-control" name="derece" required>
                    </div>
                  </div>

                  <div class="form-group row">
                    <label   class="col-sm-2 col-form-label">Eğitim Durumu:</label>
                    <div class="col-sm-4">
                      <select class="form-control" name="egitim_durumu">
                        <option>Lütfen Seçiniz</option>
                        <option>Okur Yazar Değil</option>
                        <option>Okur Yazar</option>
                        <option>Ana Okulu</option>
                        <option>İlköğretim</option>
                        <option>Ortaokul</option>
                        <option>Lise</option>
                        <option>Üniversite</option>
                        <option>Yüksek</option>
                        <option>Diğer</option>
                      </select>
                    </div>
                    <label   class="col-sm-2 col-form-label">Engel Başlangıç Tarihi:</label>
                    <div class="col-sm-4">
                      <select class="form-control" name="engel_baslangic">
                        <option>Doğuştan</option>
                        <option>Sonradan</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row">
                    <label   class="col-sm-2 col-form-label required">Ad:</label>
                    <div class="col-sm-4">
                      <input type="text" class="form-control" name="ad" required>
                    </div>

                    <label   class="col-sm-2 col-form-label required">Soyad:</label>
                    <div class="col-sm-4">
                      <input type="text" class="form-control" name="soyad" required>
                    </div>
                  </div>


                  <div class="form-group row">
                    <label   class="col-sm-2 col-form-label">Cinsiyet:</label>
                    <div class="col-sm-4">
                      <select class="form-control" name="cinsiyet">
                        <option>Kadın</option>
                        <option>Erkek</option>
                        <option>Belirtmek İstemiyorum</option>
                      </select>
                    </div>

                    <label   class="col-sm-2 col-form-label">Genel Açıklama:</label>
                    <div class="col-sm-4">
                      <input type="text" class="form-control" name="acıklama">
                    </div>

                  </div>
                  <!-- /.card-body -->

                  <div class="d-flex justify-content-center mb-2 pb-2 mt-2"> <!-- Butonu ortalamak için d-flex ve justify-content-center sınıflarını kullanıyoruz -->
                    <button type="submit" class="btn btn-primary">Kaydet</button>
                  </div>
              </form>
            </div>
            <!-- /.card -->

            <!-- /.card -->
            <!-- /.row -->
          </div><!-- /.container-fluid -->
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
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<script src="../../plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>


<!-- Bootstrap 4 -->

<!-- DataTables -->

<!-- AdminLTE App -->

<!-- AdminLTE for demo purposes -->

<!-- page script -->


</body>
</html>
