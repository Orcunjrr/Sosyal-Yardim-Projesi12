<%@ page import="com.example.example.DataBase.*" %>
<%@ page import="com.example.example.AdminServlet.SilKullanici" %>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
  String yid= request.getParameter("Id");
  KullaniciBilgi kullanici = KullaniciBilgi.getbyID(Integer.parseInt(yid));
  List<KullaniciBilgi> kullanicilar = KullaniciBilgi.getByAddress(kullanici.getAddress().getAddressNo());
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
    <!-- /.content-header -->

    <!-- Main content -->
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
                <h3 class="card-title">Aynı Evde Oturanlar</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="row">
                  <div class="col-12">
                    <div class="table-responsive" style="overflow-x: auto;">
                      <table id="example2" class="table table-bordered table-hover" style="width: 100%; table-layout: fixed;">
                        <% if (kullanicilar.isEmpty()){ %>
                        <h2 class="fw-bolder fs-2qx pb-5 pb-md-10" style="color: red;">
                          <label>Kayıt Bulunamadı!</label>
                        </h2>
                        <% } else { %>
                        <colgroup>
                          <col style="width: 140px;">
                          <col style="width: 140px;">
                          <col style="width: 100px;">
                          <col style="width: 180px;">
                          <col style="width: 180px;">
                          <col style="width: 150px;">
                          <col style="width: 160px;">
                          <col style="width: 180px;">
                          <col style="width: 170px;">
                          <col style="width: 140px;">
                          <!-- Add additional columns here -->
                          <!-- For example:
                          <col style="width: 250px;">
                          <col style="width: 150px;">
                          -->
                        </colgroup>
                        <thead>
                        <tr>
                          <th>Tc Kimlik No</th>
                          <th>Ad</th>
                          <th>Soyad</th>
                          <th>Adres</th>
                          <th>Adres No</th>
                          <th>Aile Sıra No</th>
                          <th>Cilt No</th>
                          <th>Kayıtlı Olduğu İlçe</th>
                          <th>Kayıtlı Olduğu İl</th>
                          <th>Medeni Hal</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% for (KullaniciBilgi kullan : kullanicilar) { %>
                        <tr>
                          <td><%=kullan.getIdNo()%></td>
                          <td><%=kullan.getAppliName()%> </td>
                          <td><%=kullan.getSurname()%></td>
                          <td><%=kullan.getAddress().getPublicAddress()%> </td>
                          <td><%=kullan.getAddress().getAddressNo()%> </td>
                          <td><%=kullan.getAileSiraNo()%> </td>
                          <td><%=kullan.getCiltNo()%></td>
                          <td><%=kullan.getRegistrationDistrict()%> </td>
                          <td><%=kullan.getRegistrationProvince()%> </td>
                          <td><%=kullan.getMaritalStatus()%> </td>
                        </tr>
                        <% } %>
                        </tbody>
                        <% }  %>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
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

<script>
  $(function () {
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
      "language": {
        "url": "tr.json"
      }

    });
  });
</script>
<!-- Bootstrap 4 -->

<!-- DataTables -->

<!-- AdminLTE App -->

<!-- AdminLTE for demo purposes -->

<!-- page script -->


</body>
</html>

