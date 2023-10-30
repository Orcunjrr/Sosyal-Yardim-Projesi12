<%@ page import="com.example.example.DataBase.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>



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
  <link rel="stylesheet"
        href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

  <!-- Tempusdominus Bbootstrap 4 -->
  <link rel="stylesheet"
        href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet"
        href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet"
        href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet"
        href="plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.css">
  <!-- Google Font: Source Sans Pro -->
  <link
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
    rel="stylesheet">
  <style>
    .form-heading {
      font-size: 17px;
      font-weight: bold;
      color: black; /* Change the color to your desired heading color */
      margin-bottom: 10px;
      /* Add some spacing between headings and form fields */
    }

    .card-info {
      position: relative;
      padding: 40px; /* Arkaya gölge için içeriği itin */
      border-radius: 10px; /* Köşeleri keskin olmaktan çıkarın */
      box-shadow: 0 2px 6px rgba(44, 166, 234, 0.6);
      /* Gölgeli efekti ekle */
      margin-top: 50px;
      margin-left: 30px;
      margin-right: 30px;
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
            <h1>Toplu Yardım Yükleme</h1>
            <ol class="breadcrumb ">
              <li class="breadcrumb-item"><a href="#">Anasayfa</a></li>
              <li class="breadcrumb-item"><a href="#">İşlemlerim</a></li>
              <li class="breadcrumb-item"><a href="#">Yardım Kararı</a></li>
              <li class="breadcrumb-item active">Toplu Yardım Yükleme</li>
            </ol>
          </div>

        </div>
      </div>
      <!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->

            <% if (request.getAttribute("errorMsg") != null) { %>
            <div style="color: red;">
              <%= request.getAttribute("errorMsg")%>
            </div>
            <% } %>

            <div class="card card-secondary">
              <div class="card-header">
                <h3 class="card-title">Toplu Yardım Giriş Bilgileri</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form action="topYarYukleme" method="post" enctype="multipart/form-data">
                <div class="card-body">


                    <div class="col-sm-3 col-form-group">

                        <label for="excelFile">Excel Dosyası Yükle</label>
                        <input type="file" class="form-control-file" id="excelFile" name="excelFile" accept=".xlsx, .xls">

                    </div>


                </div>

                 <div class="d-flex justify-content-center mb-2 pb-2"> <!-- Butonu ortalamak için d-flex ve justify-content-center sınıflarını kullanıyoruz -->
                  <button type="submit" class="btn btn-primary">Kaydet</button>
                </div>
              </form>
            </div>
          </div>
        </div>   <!-- /.card-body -->
      </div>
    <!-- /.container-fluid -->
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
                <h3 class="card-title">Yardım Listele</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="row">
                  <div class="col-12">
                    <div class="table-responsive" style="overflow-x: auto;">
                      <table id="topluyardim" class="table table-bordered table-hover" style="width: 100%; table-layout: fixed;">
                        <% List<YardimKarari> yardim = YardimKarari.getAll();
                          if (yardim != null && !yardim.isEmpty()) { %>
                        <colgroup>
                          <col style="width: 50px;">
                          <col style="width: 110px;">
                          <col style="width: 110px;">
                          <col style="width: 100px;">
                          <col style="width: 150px;">
                          <col style="width: 100px;">
                          <col style="width: 170px;">
                          <col style="width: 160px;">
                          <col style="width: 100px;">
                          <col style="width: 140px;">
                          <col style="width: 200px;">
                          <col style="width: 170px;">
                          <col style="width: 170px;">
                          <col style="width: 170px;">
                          <col style="width: 110px;">
                          <col style="width: 110px;">
                          <col style="width: 140px;">
                          <col style="width: 150px;">
                          <col style="width: 150px;">
                          <col style="width: 140px;">
                          <col style="width: 170px;">
                          <col style="width: 160px;">
                          <col style="width: 180px;">
                          <col style="width: 140px;">
                          <col style="width: 100px;">
                        </colgroup>
                        <thead>
                        <tr>
                          <th></th>
                          <th>Kullanıcı Id</th>
                          <th>Karar Id No</th>
                          <th>Cinsiyet</th>
                          <th>Açıklama</th>
                          <th>Adet</th>
                          <th>Dosya Karar Sayısı</th>
                          <th>Dosya Tarihi</th>
                          <th>İtiraz</th>
                          <th>Kredi Bitiş Tarihi</th>
                          <th>Red Sebepleri</th>
                          <th>Kart Miktar</th>
                          <th>Yardım Dönemleri</th>
                          <th>Yardım Kart Durumu </th>
                          <th>Yardım Statü</th>
                          <th>Yardım Kart No</th>
                          <th>Yönlendiren Kurum</th>
                          <th>Yardım Teslim Tarihi</th>
                          <th>Yardım Başlangıç Tarihi</th>
                          <th>Yardım Tip</th>
                          <th>Yardım Alt Tip</th>
                          <th>Teslim Eden Kişi</th>
                          <th>Sadece Alt Tip</th>
                          <th>Yardım Tutarı</th>
                          <th>Kilit</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% for (YardimKarari yardimBilgi : yardim) { %>
                        <tr>
                          <td>
                            <div class="d-flex justify-content-between align-items-center">
                              <a href="topyardim.jsp">
                                <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" class="icon-equal-size" viewBox="0 0 512 512">
                                  <style>
                                    .icon-equal-size {
                                      height: 20px;
                                      width: 20px;
                                      fill: black;
                                      vertical-align: middle;
                                    }
                                  </style>
                                  <path class="icon-equal-size" d="M441 58.9L453.1 71c9.4 9.4 9.4 24.6 0 33.9L424 134.1 377.9 88 407 58.9c9.4-9.4 24.6-9.4 33.9 0zM209.8 256.2L344 121.9 390.1 168 255.8 302.2c-2.9 2.9-6.5 5-10.4 6.1l-58.5 16.7 16.7-58.5c1.1-3.9 3.2-7.5 6.1-10.4zM373.1 25L175.8 222.2c-8.7 8.7-15 19.4-18.3 31.1l-28.6 100c-2.4 8.4-.1 17.4 6.1 23.6s15.2 8.5 23.6 6.1l100-28.6c11.8-3.4 22.5-9.7 31.1-18.3L487 138.9c28.1-28.1 28.1-73.7 0-101.8L474.9 25C446.8-3.1 401.2-3.1 373.1 25zM88 64C39.4 64 0 103.4 0 152V424c0 48.6 39.4 88 88 88H360c48.6 0 88-39.4 88-88V312c0-13.3-10.7-24-24-24s-24 10.7-24 24V424c0 22.1-17.9 40-40 40H88c-22.1 0-40-17.9-40-40V152c0-22.1 17.9-40 40-40H200c13.3 0 24-10.7 24-24s-10.7-24-24-24H88z"/>
                                </svg>
                              </a>
                            </div>
                          </td>
                          <td><%=yardimBilgi.getKullanici_id().getIdNo()%></td>
                          <td><%=yardimBilgi.getKararId()%> </td>
                          <td><%=yardimBilgi.getCinsiyet()%></td>
                          <td><%=yardimBilgi.getAcıklama()%> </td>
                          <td><%=yardimBilgi.getAdet()%> </td>
                          <td><%=yardimBilgi.getDosKarSayısı()%></td>
                          <td><%=yardimBilgi.getDosyaTarihi()%> </td>
                          <td><%=yardimBilgi.getItiraz()%> </td>
                          <td><%=yardimBilgi.getKrediBitisTarihi()%> </td>
                          <td><%=yardimBilgi.getRedSebepler()%> </td>
                          <td><%=yardimBilgi.getKartMiktar()%></td>
                          <td><%=yardimBilgi.getYardımDönem()%></td>
                          <td><%=yardimBilgi.getYardımKartDurum()%></td>
                          <td><%=yardimBilgi.getYardimStatu()%></td>
                          <td><%=yardimBilgi.getYardımKartNo()%></td>
                          <td><%=yardimBilgi.getYönlendirenKurum()%></td>
                          <td><%=yardimBilgi.getYarTeslimTarihi()%></td>
                          <td><%=yardimBilgi.getYarBaslangıcTarihi()%></td>
                          <td><%=yardimBilgi.getYardimTip()%></td>
                          <td><%=yardimBilgi.getYardimAltTip()%></td>
                          <td><%=yardimBilgi.getTeslimKisi()%></td>
                          <td><%=yardimBilgi.getSadeceAltTip()%></td>
                          <td><%=yardimBilgi.getYardımTutari()%></td>
                          <td><%=yardimBilgi.getKilit()%></td>
                        </tr>
                        <%}%>
                        </tbody>
                        <%}%>
                      </table>
                    </div>

                  </div>
                  <!-- Modal -->
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section><!-- /.content-wrapper -->
  </div>


  <footer class="main-footer">
    <strong><a href="https://www.gebze.bel.tr/">Gebze
      Belediyesi </a></strong>

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
<script
  src="plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script
  src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script
  src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script
  src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<script
  src="../../plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>


<!-- Bootstrap 4 -->

<!-- DataTables -->

<!-- AdminLTE App -->

<!-- AdminLTE for demo purposes -->

<!-- page script -->





</body>
</html>
