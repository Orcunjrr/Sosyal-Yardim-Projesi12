<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.example.example.DataBase.Personel" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.example.DataBase.Sokak" %>
<%@ page import="com.example.example.DataBase.District" %>
<%@ page import="java.util.Objects" %>
<%
  List<Sokak> sokak = Sokak.getAllSokak();
  List<District> mah = District.getAllDistrict();

HttpSession userSession = request.getSession();
String roleName = "Role_cadde_Listele";

if (!Rol.hasRole(userSession, roleName)) {
  response.sendRedirect("../Error/Error.html");
}
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
  <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">




  <!-- GEREKLI TABLE SIL ISLEMI ICIN -->


  <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
  <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>




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
	  .pagination .page-item.active .page-link {
	    background-color: #17a2b8; /* Kırmızı renk (#ff0000) olarak ayarlandı */
	    border-color: #17a2b8; /* Kenarlık rengi de kırmızı yapılıyor */
	    color: #fff !important; /* Metin rengi beyaz (#fff) olarak ayarlandı */
	  }
    /* DataTables stil düzenlemesi */
    .dataTables_wrapper {
      position: relative;
      padding: 20px; /* Arkaya gölge için içeriği itin */
      border-radius: 10px; /* Köşeleri keskin olmaktan çıkarın */
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2); /* Gölgeli efekti ekle */
    }
    .custom-datatable {
    position: relative;
    padding: 40px; /* Arkaya gölge için içeriği itin */
    border-radius: 10px; /* Köşeleri keskin olmaktan çıkarın */
    box-shadow: 0 2px 6px rgba(44, 166, 234, 0.6); /* Gölgeli/* Gölgeli efekti ekle */
    margin-top: 30px;
    margin-left: 30px;
    margin-right: 30px; /* Sol boşluk bırakmayın */
    
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
	.card-info{
		position: relative;
	    padding: 40px; /* Arkaya gölge için içeriği itin */
	    border-radius: 10px; /* Köşeleri keskin olmaktan çıkarın */
	    box-shadow: 0 2px 6px rgba(44, 166, 234, 0.6); /* Gölgeli /* Gölgeli efekti ekle */
	    margin-top: 30px;
	    margin-left: 30px;
	    margin-right: 30px;
	}
	.koyu-yazi {
  color: #000000; /* Siyah rengin hexadecimal kodu */
  /* Diğer stil özelliklerini burada belirtebilirsiniz */
}
    
  </style>

  <script>
    $(document).ready(function() {
      var selectedId;

      $('#example2 tbody').on('click', '.delete-button', function () {
        var userId = $(this).closest('tr').find('td#sokakID').text();

        console.log("Gelen Data  :"+ userId);
        selectedId = userId;
        $('#confirmationModal').modal('show');
      });

      $('#confirmDeleteButton').on('click', function() {
        $('#confirmationModal').modal('hide');
        // Silme işlemini gerçekleştirmek için gerekli kodu burada çağırabilirsiniz.
        // Örneğin: window.location.href = "silme.jsp?id=" + selectedId;
        $.get("kullanicisil", {id:selectedId})
        window.location.href = "SilSokak?sokakId=" + selectedId;

      });

      $('#cancelDeleteButton').on('click', function() {
        $('#confirmationModal').modal('hide');

      });
    });
  </script>
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
          <div class="col-sm-6">
            <h1>Cadde-Sokak Listesi</h1>
            <ol class="breadcrumb ">
              <li class="breadcrumb-item"><a href="#">Anasayfa</a></li>
              <li class="breadcrumb-item"><a href="#">Yönetici İşlemleri</a></li>
              <li class="breadcrumb-item"><a href="#">Cadde-Sokak</a></li>
              <li class="breadcrumb-item active">Cadde-Sokak Listesi</li>
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
                  Cadde-Sokak Girişi Bilgileri
                </h3>
              </div>
              <!-- /.card-header -->

              <!-- form başlangıcı -->
              <form role="form" >
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group row m-2">
                        <label class="col-sm-3 col-form-label">Mahalle Adı</label>
                        <div class="col-sm-6">
                          <select class="form-control">
                            <%for(District mahale : mah){%>
                            <option value="<%= mahale.getDistrictID()%>"><%=mahale.getDistrictName()%></option>
                            <%}%>
                          </div>
                        </select>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- form sonu -->
              </form>
            </div></div></div></div>
    </section>
    <!-- /.row -->

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
                <h3 class="card-title">Cadde-Sokak Listele</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="row">
                  <div class="col-12">
                        <div class="table-responsive" style="overflow-x: auto;">
                          <table id="example2" class="display table" style="width: 100%; table-layout: fixed;">
                            <%if(sokak.isEmpty()){ %>
                            <h3 class="fw-bolder " style="color: red;">
                              <label>Kayıt bulunamadı!</label>
                            </h3>
                            <%}else{%>
                            <colgroup>
                              <col style="width: 30px">
                              <col style="width: 50px">
                              <col style="width: 100px;">
                              <col style="width: 35px;">
                              <col style="width: 120px;">
                              <!-- Add additional columns here -->
                              <!-- For example:
                              <col style="width: 250px;">
                              <col style="width: 150px;">
                              -->
                            </colgroup>
                            <thead>
                            <tr>
                              <th></th>
                              <th>Cadde/Sokak Kodu</th>
                              <th>Cadde/Sokak Adı</th>
                              <th>Durumu</th>
                              <th>Mahalle Adı</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% for(Sokak sokaklar : sokak){ %>
                            <tr>
                              <td>
                                  <a href="caddeduzenle.jsp?ID=<%= sokaklar.getSokakID()%>">
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
                                  <i class="fa fa-times delete-button" style="font-size: 25px; color: red; cursor: pointer; vertical-align: middle;"></i>
                              </td>
                              <td id="sokakID"><%= sokaklar.getSokakID()%></td>
                              <td><%= sokaklar.getSokakname()%></td>
                              <td><% if(Objects.equals(sokaklar.getStatus(), (byte)0)){%>Pasif<%}else{%>Aktif<% }%></td>
                              <td><%= sokaklar.getDistrict().getDistrictName()%></td>
                            </tr>
                            <% } %>
                            </tbody>
                            <% } %>
                          </table>
                        </div>
                      <!-- /.card-body -->


                    <div class="modal fade" id="confirmationModal" tabindex="-1" role="dialog">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title">Silme İşlemi Onayı</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            Silme işlemini gerçekten yapmak istediğinizden emin misiniz?
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cancelDeleteButton">Hayır</button>
                            <button type="button" class="btn btn-danger" id="confirmDeleteButton">Evet</button>
                          </div>
                        </div>
                      </div>
                    </div>


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
<script>
  $(function () {
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": true,
      "ordering": true,
      "processing": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
      "language": {
        "url": "tr.json"
      },
      "serverside":true
    });
  });
</script>




</body>
</html>
