<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.example.example.DataBase.Personel" %>
<%@ page import="com.example.example.DataBase.Okul" %>
<%
  HttpSession userSession = request.getSession();
  String roleName = "Role_Okul_Düzenle";

  if (!Rol.hasRole(userSession, roleName)) {
    response.sendRedirect("../Error/Error.html");
  }
String talepId = request.getParameter("Id");
int Id = Integer.parseInt(talepId);
Okul okul = Okul.getById(Id);

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
	.card-info{
		position: relative;
	    padding: 40px; /* Arkaya gölge için içeriği itin */
	    border-radius: 10px; /* Köşeleri keskin olmaktan çıkarın */
	    box-shadow: 0 2px 6px rgba(44, 166, 234, 0.6); /* Gölgeli /* Gölgeli efekti ekle */
	    margin-top: 30px;
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
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-8">
            <h1>Okul Düzenle</h1>
            <ol class="breadcrumb ">
              <li class="breadcrumb-item"><a href="#">Anasayfa</a></li>
              <li class="breadcrumb-item"><a href="#">Yönetici İşlemleri</a></li>
              <li class="breadcrumb-item"><a href="#">Eğitim </a></li>
              <li class="breadcrumb-item"><a href="#">Okul Listesi</a></li>
              <li class="breadcrumb-item active">Okul Düzenle</li>
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
                <h3 class="card-title">
                  Okul Düzenle
                </h3>
              </div>
              <!-- /.card-header -->

              <!-- form başlangıcı -->
              <form action="OkulUpdate" method="post">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Durum</label>
                        <select class="form-control" name="Durum" style="max-width: 300px;">
                          <option value="Aktif" <%= okul.getDurum()==1 ? "selected" : "" %> >Aktif</option>
                          <option value="Pasif" <%= okul.getDurum()==0 ? "selected" : "" %>>Pasif</option>
                        </select>
                        <input type="hidden" name="okulid" value="<%=okul.getSchoolID()%>">
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label>Okul Türü</label>
                        <div class="form-group clearfix">
                          <div class="icheck-primary d-inline">
                            <input value="Devlet" type="radio" id="radioPrimary2" name="Okul" required <%= okul.getOkul().equals("Devlet") ? "checked" : "" %>>
                            <label for="radioPrimary2">
                              Devlet
                            </label>
                          </div>

                          <div class="icheck-primary d-inline">
                            <input value="Ozel" type="radio" id="radioPrimary4" name="Okul" required <%= okul.getOkul().equals("Ozel") ? "checked" : "" %>>
                            <label for="radioPrimary4">
                              Özel
                            </label>
                          </div>
                        </div>
                      </div>
                    </div>

                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Okul Tipi</label>
                        <select class="form-control" name="OkulSect" style="max-width: 300px;">
                          <option value="Anaokul" <%= okul.getOkulTipi().equals("Anaokul") ? "selected" : "" %> >	Anaokul</option>
                          <option value="İlkokul" <%= okul.getOkulTipi().equals("İlkokul") ? "selected" : "" %>>	İlkokul</option>
                          <option value="Ortaokul" <%= okul.getOkulTipi().equals("Ortaokul") ? "selected" : "" %>>	Ortaokul</option>
                          <option value="Lise" <%= okul.getOkulTipi().equals("Lise") ? "selected" : "" %>>	Lise</option>
                          <option value="Yüksek Lisans" <%= okul.getOkulTipi().equals("Yüksek Lisans") ? "selected" : "" %>>Yüksek Lisans</option>
                          <option value="Önlisans" <%= okul.getOkulTipi().equals("Önlisans") ? "selected" : "" %>>	Önlisans</option>
                          <option value="Lisans" <%= okul.getOkulTipi().equals("Lisans") ? "selected" : "" %>>	Lisans</option>
                          <option value="Diğer" <%= okul.getOkulTipi().equals("Diğer") ? "selected" : "" %>>	Diğer</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Okul Adı</label>
                        <input type="text" class="form-control" name="OkulName" value="<%= okul.getOkulName()%>" required>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- form sonu -->

                <div class="d-flex justify-content-center mb-2 pb-2"> <!-- Butonu ortalamak için d-flex ve justify-content-center sınıflarını kullanıyoruz -->
                  <button type="submit" class="btn btn-primary">Kaydet</button>
                </div>
              </form>
            </div></div></div></div>
    </section>
    <!-- /.row -->
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
