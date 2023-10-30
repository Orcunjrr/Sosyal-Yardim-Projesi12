<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.example.example.DataBase.Personel" %>
<%@ page import="com.example.example.DataBase.Engelli" %>
<%@ page import="java.util.List" %>
<%
  HttpSession userSession = request.getSession();
  if(!Rol.hasRole(userSession,"Role_Engelli_Düzenle")){
    response.sendRedirect("../Error/Error.html");
  }

String id = request.getParameter("ID");
int ID = Integer.parseInt(id);
Engelli engelli = Engelli.getbyID(ID);
  List<Personel> users = Personel.getAllUserInfo();

String roleName = "Role_Kullanıcı_Listele";

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
  		.custom-datatable2{
  		background-color:  #fafafa;
	  		position: relative;
	    padding: 40px; /* Arkaya gölge için içeriği itin */
	    border-radius: 10px; /* Köşeleri keskin olmaktan çıkarın */
	    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.4); /* Gölgeli efekti ekle */
	    
	    margin-left: 30px;
	    margin-right: 30px;
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
    background-color: white;
    position: relative;
    padding: 40px; /* Arkaya gölge için içeriği itin */
    border-radius: 10px; /* Köşeleri keskin olmaktan çıkarın */
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.4); /* Gölgeli efekti ekle */
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
  	.custom-datatable2 h3.card-title {
  	
	  font-size: 24px; /* Yazı boyutunu istediğiniz gibi ayarlayın */
	  font-weight: bold;
	  font-family: Arial, sans-serif; /* Kalın yazı tipi */
	  text-align: center; /* Yazıyı ortala */
	  margin-bottom: 20px; /* Aşağıya boşluk bırakın */
}	
	.card-info {
      background-color:  #fafafa; /* Turkuaz rengi (#17a2b8) olarak ayarlandı */
      border-radius: 10px;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.4); /* Gölgeli efekt eklemek için */
      margin: 30px; /* Kenar boşlukları */
      padding: 40px; /* İçerikten içeri boşluk bırakmak için */
    }
	.koyu-yazi {
  color: #000000; /* Siyah rengin hexadecimal kodu */
  /* Diğer stil özelliklerini burada belirtebilirsiniz */
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
            <h1>Engelli Tipi Düzenle</h1>
            <ol class="breadcrumb ">
              <li class="breadcrumb-item"><a href="#">Anasayfa</a></li>
              <li class="breadcrumb-item"><a href="#">Yönetici İşlemleri</a></li>
              <li class="breadcrumb-item"><a href="#">Engelli Tipleri Girişi</a></li>
              <li class="breadcrumb-item"><a href="#">Engelli Tipi Tanımlama</a></li>
              <li class="breadcrumb-item active">Engelli Tipi Düzenle</li>
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
                  Engelli Tipi Düzenle
                </h3>
              </div>
              <!-- /.card-header -->

              <!-- form başlangıcı -->
              <form role="form" action="disabledUpdate" method="post">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-4">
                      <div class="form-group text-center">
                        <label class="required">Engelli Tip Adı</label>
                        <div class="input-group"> <!-- input alanını düzenlemek için input-group kullanıyoruz -->
                          <input type="hidden" class="form-control" name="disabledid" value="<%=engelli.getDisabledID()%>">
                          <input type="text" class="form-control" name="disabledName" value="<%= engelli.getDisabledName() %>" required>
                          <div class="input-group-append"> <!-- Butonu input alanına eklemek için input-group-append kullanıyoruz -->
                            <button type="submit" class="btn btn-primary">Düzenle</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- form sonu -->
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
<script src="//cdn.datatables.net/plug-ins/1.13.5/i18n/tr.json"></script>

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
<script>
  var select1 = document.getElementById("select1");
  var select2 = document.getElementById("select2");

  // İlk kutudan seçenek seçildiğinde senkronize et
  select1.addEventListener("change", function() {
    var selectedOptions = Array.from(select1.selectedOptions);

    selectedOptions.forEach(function(option) {
      select2.appendChild(option);
      option.selected = false;
    });
  });

  // İkinci kutudan seçenek seçildiğinde senkronize et
  select2.addEventListener("change", function() {
    var selectedOptions = Array.from(select2.selectedOptions);

    selectedOptions.forEach(function(option) {
      select1.appendChild(option);
      option.selected = false;
    });
  });
</script>

<!-- Bootstrap 4 -->

<!-- DataTables -->

<!-- AdminLTE App -->

<!-- AdminLTE for demo purposes -->

<!-- page script -->
<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true,
      "autoWidth": false,
    });
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
  <script>
    function confirmDelete() {
        // Bootstrap modal for confirmation dialog
        var confirmationModal = `
            <div class="modal fade" id="deleteConfirmationModal" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmationModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="deleteConfirmationModalLabel">Kullanıcıyı Sil</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Kullanıcıyı silmek istediğinize emin misiniz?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">İptal</button>
                            <button type="button" class="btn btn-danger" onclick="deleteUser()">Sil</button>
                        </div>
                    </div>
                </div>
            </div>
        `;

        // Append modal to the document body
        document.body.insertAdjacentHTML('beforeend', confirmationModal);

        // Show the confirmation modal
        $('#deleteConfirmationModal').modal('show');
    }

    function deleteUser() {
        // Perform delete operation here
        // This function will be called when the user confirms the deletion
        // You can add your code to delete the user from the system

        // After successful deletion, you may redirect the user or update the table accordingly

        // Close the confirmation modal
        $('#deleteConfirmationModal').modal('hide');
    }
  </script>




</body>
</html>
