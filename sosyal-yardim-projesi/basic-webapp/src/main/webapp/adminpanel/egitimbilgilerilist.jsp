
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.example.DataBase.*" %>
<%@ page import="com.example.example.DataBase.EngelliAracHizmet" %>


<%
  List<Okul> okullar = Okul.getAllSchool();

  String id = request.getParameter("Id");
  int Id = Integer.parseInt(id);
  System.out.println(Id);
  KullaniciBilgi info = KullaniciBilgi.getbyID(Id);
  String addressNo = info.getAddress().getAddressNo();
  List<EgitimBilgileri> bilgiler = EgitimBilgileri.getForSameHousehold(addressNo);

%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Gebze Belediyesi | Eğitim Bilgileri</title>
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
            <ol class="breadcrumb ">
              <li class="breadcrumb-item"><a href="#">Anasayfa</a></li>
              <li class="breadcrumb-item"><a href="#">Yönetici İşlemleri</a></li>
              <li class="breadcrumb-item"><a href="#">Tutanak Ekle</a></li>
              <li class="breadcrumb-item active">Eğitim Bilgileri</li>
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
                <h3 class="card-title">Eğitim Bilgileri</h3>
              </div>

              <% if (request.getAttribute("message") != null) { %>
              <h3 class="fw-bolder " style="color: cornflowerblue;">
                <label>Kayıt işlemi başarılı!</label>
              </h3>
              <% } %>
              <!-- form start -->
              <form action="egitimBilgileriServlet" method="post">
                <div class="card-body">
                  <div class="form-group row">

                    <label   class="col-sm-2 col-form-label"> </label>
                    <div class="col-sm-3">
                      <label class="form-check-label" style="margin: 2px"><input type="radio" name="devletozel"value="Devlet">Devlet</label>
                      <label class="form-check-label" style="margin: 2px"><input type="radio" name="devletozel" value="Özel">Özel</label>
                    </div>

                    <label class="col-sm-2 col-form-label">Başlama Tarihi:</label>
                    <div class="col-sm-3">
                      <input type="date" class="form-control" name="bastarihi" required>
                      <input type="hidden" name="kId" value="<%=info.getIdInfoId()%>">
                    </div>
                  </div>

                  <div class="form-group row">
                    <label class="col-sm-2 col-form-label" >Öğrenci Adı:</label>
                    <div class="col-sm-3">
                      <select class="form-control" name="ogrenci" required>
                        <% List<KullaniciBilgi> kullanicilar = KullaniciBilgi.getByAddress(info.getAddress().getAddressNo());
                          for (KullaniciBilgi kullan : kullanicilar) {  %>
                        <option value="<%= kullan.getAppliName() %>"><%= kullan.getAppliName() %></option>
                        <% } %>
                      </select>
                    </div>

                    <label class="col-sm-2 col-form-label">Bitiş Tarihi:</label>
                    <div class="col-sm-3">
                      <input type="date" class="form-control" name="bitTarih" required>
                    </div>
                  </div>

                  <div class="form-group row">
                    <label class="col-sm-2 col-form-label" >Okul Tipi:</label>
                    <div class="col-sm-3">
                      <select class="form-control" name="okultip">
                        <option>Anaokul</option>
                        <option>İlkokul</option>
                        <option>Ortaokul</option>
                        <option>Lise</option>
                        <option>Üniversite</option>
                        <option>Yüksekokul</option>
                        <option>Diğer</option>
                      </select>
                    </div>

                    <label   class="col-sm-2 col-form-label">Bölüm:</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="bölüm">
                    </div>
                  </div>

                  <div class="form-group row">
                    <label   class="col-sm-2 col-form-label">Okul Adı:</label>
                    <div class="col-sm-3">
                      <select class="form-control" name="okulad">
                        <%for(Okul okul: okullar) {%>
                        <option value="<%=okul.getOkulName()%>"><%=okul.getOkulName()%></option>
                        <%}%>
                      </select>
                    </div>

                    <label   class="col-sm-2 col-form-label">Sınıf:</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="sınıf">
                    </div>
                  </div>


                  <div class="form-group row">
                    <label   class="col-sm-2 col-form-label">Burs Oranı:</label>
                    <div class="col-sm-3">
                      <select class="form-control" name="bursoran">
                        <option disabled>Lütfen Seçiniz</option>
                        <option value="0">%0</option>
                        <option value="25">%25</option>
                        <option value="50">%50</option>
                        <option value="75">%75</option>
                        <option value="100">%100</option>
                      </select>
                    </div>

                    <label   class="col-sm-2 col-form-label">Açıklama: </label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="acıklama">
                    </div>
                  </div>

                  <!-- /.card-body -->

                  <div class="d-flex justify-content-center mb-2 pb-2 mt-2"> <!-- Butonu ortalamak için d-flex ve justify-content-center sınıflarını kullanıyoruz -->
                    <button type="submit" class="btn btn-primary">Kaydet</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-primary">
              <!-- /.card-header -->
            </div>
            <!-- /.card -->
            <div class="card card-secondary">
              <div class="card-header">
                <h3 class="card-title">Eğitim Bilgi Listesi</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="row">
                  <div class="col-12">
                    <div class="table-responsive" style="overflow-x: auto;">

                      <table id="example2" class="table table-bordered table-hover" style="width: 100%; table-layout: fixed;">
                        <%if (bilgiler.isEmpty()) { %>
                      <h1 class="fw-bolder fs-2qx pb-5 pb-md-10" style="color: red;">
                        <label>Kayıt Bulunamadı!</label>
                      </h1>
                      <% } else {%>
                        <colgroup>
                          <col style="width: 50px;">
                          <col style="width: 110px;">
                          <col style="width: 150px;">
                          <col style="width: 150px;">
                          <col style="width: 150px;">
                          <col style="width: 150px;">
                          <col style="width: 110px;">
                          <col style="width: 100px;">
                          <col style="width: 150px;">
                          <col style="width: 150px;">
                          <col style="width: 150px;">
                          <!-- Add additional columns here -->
                          <!-- For example:
                          <col style="width: 250px;">
                          <col style="width: 150px;">
                          -->
                        </colgroup>
                        <thead>
                        <tr>
                          <th>Id</th>
                          <th>Öğrenci Adı</th>
                          <th>Devlet-Özel</th>
                          <th>Okul Adı</th>
                          <th>Okul Tipi</th>
                          <th>Bölüm</th>
                          <th>Sınıf</th>
                          <th>Burs Oranı</th>
                          <th>Başlangıç Tarihi</th>
                          <th>Bitiş Tarihi</th>
                          <th>Açıklama</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for(EgitimBilgileri bilgi : bilgiler){ %>
                        <tr>
                          <td><%=bilgi.getEgitimId()%></td>
                          <td><%=bilgi.getOgrenciadi()%></td>
                          <td><%=bilgi.getDevletozel()%></td>
                          <td><%=bilgi.getOkuladi()%></td>
                          <td><%=bilgi.getOkultipi()%></td>
                          <td><%=bilgi.getBolum()%></td>
                          <td><%=bilgi.getSinif()%></td>
                          <td><%=bilgi.getBursorani()%></td>
                          <td><%=bilgi.getBaslangictarihi()%></td>
                          <td><%=bilgi.getBitistarihi()%></td>
                          <td><%=bilgi.getAciklama()%></td>
                        </tr>
                        <% }%>
                        </tbody>
                        <% }%>
                      </table>
                    </div>
                    <!-- /.card-body -->
                    <!-- /.card -->
                  </div>
                  <!-- Modal -->
                </div>
              </div>
              <!-- /.card-body -->
            </div>
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
