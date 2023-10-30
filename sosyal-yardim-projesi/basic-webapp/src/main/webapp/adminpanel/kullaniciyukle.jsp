<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.example.DataBase.Rol" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="com.example.example.DataBase.Personel" %>

<%

  HttpSession userSession = request.getSession();
  if(!Rol.hasRole(userSession,"Role_Kullanıcı_Ekle")) {
    response.sendRedirect("../Error/Error.html");
  }

	List<Rol> roles = Rol.getAllRoles();

  String durum = request.getParameter("DURUM");
  String message;
  if (durum != null) {
    message = "Kullanıcı Adı veya Email kullanılmış.";
  } else {
    message = "";
  }

  /* HttpSession userSession = request.getSession();
String roleName = "Role_Kullanıcı_Ekle";
=======
  HttpSession userSession = request.getSession();
  Set<Rol> roless = (Set<Rol>) userSession.getAttribute("roles");
  String mail = (String) userSession.getAttribute("mail");
  Rol.hasRole(userSession,"Kullanici");
>>>>>>> 7fd0b9eaae8ed87a85731764508a663b983da08b

if (!Rol.hasRole(userSession, roleName)) {
    response.sendRedirect("../Error/Error.html");
} */

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
	<style >
	.card-info{
		position: relative;
	    padding: 40px; /* Arkaya gölge için içeriği itin */
	    border-radius: 10px; /* Köşeleri keskin olmaktan çıkarın */
	    box-shadow: 0 2px 6px rgba(44, 166, 234, 0.6); /* Gölgeli /* Gölgeli efekti ekle */
	    margin-top: 30px;
	    margin-left: 30px;
	    margin-right: 30px;
	}

  .alert {
    padding: 10px;
    background-color: #f2f2f2;
    color: #333;
    border: 1px solid #ddd;
  }
  .required:after {
    content:" *";
    color: red;
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
          <div class="col-sm-6">
            <h1>Kullanıcı Ekle</h1>
            <ol class="breadcrumb ">
              <li class="breadcrumb-item"><a href="#">Anasayfa</a></li>
              <li class="breadcrumb-item"><a href="#">Yönetici İşlemleri</a></li>
              <li class="breadcrumb-item"><a href="#">Kullanıcı</a></li>
              <li class="breadcrumb-item active">Kullanıcı Ekle</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <div id="messageDiv"></div>

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
                  Kullanıcı Ekle
                </h3>
              </div>
              <!-- /.card-header -->

              <!-- form start -->
              <form action="adminregister" method="post" id="kullaniciyukle">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label class="required">E-Posta</label>
                        <input type="email" name="email" class="form-control" placeholder="E-posta adresinizi giriniz." required>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label class="required">Ünvan</label>
                        <input type="text" name="unvan" class="form-control" placeholder="Ünvanı giriniz" required>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label class="required">Kullanıcı Adı</label>
                        <input type="text" class="form-control" name="username" placeholder="Kullanıcı adını giriniz" required>
                        <span id="username-error"></span>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label class="required">Şifre</label>
                        <input type="password" name="password" class="form-control" placeholder="Şifreyi Giriniz" required>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label class="required">Ad</label>
                        <input type="text" name="name" class="form-control" placeholder="Adınızı Giriniz" required>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label class="required">Soyad</label>
                        <input type="text"  name="surname" class="form-control" placeholder="Soyadınızı Giriniz" required>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label for="sicilNo" class="required">Sicil No</label>
                        <input type="text" id="sicilNo" name="sicilNo" class="form-control" pattern="[0-9]{13}" title="Sicil No yalnızca 13 haneli rakamlardan oluşmalıdır" oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 13)" placeholder="13 haneli Sicil No Giriniz" required maxlength="13">
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label class="required">Cinsiyet</label>
                        <div class="form-group clearfix">
                          <div class="icheck-primary d-inline">
                            <input type="radio" id="radioPrimary1" name="cinsiyet"  value="E" required>
                            <label for="radioPrimary1">
                              Erkek
                            </label>
                          </div>
                          <div class="icheck-primary d-inline">
                            <input type="radio" id="radioPrimary3" name="cinsiyet" value="K"required>
                            <label for="radioPrimary3">
                              Kadın
                            </label>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label for="phone" class="required">Telefon</label>
                        <input type="tel" id="phone" name="phone" class="form-control" pattern="[0-9]{11}" title="Telefon numarası yalnızca 11 haneli rakamlardan oluşmalıdır" oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 11)" placeholder="Telefon Numarasını Giriniz" required maxlength="11">
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label class="required">Durum</label>
                        <div class="form-group clearfix">
                          <div class="icheck-primary d-inline">
                            <input type="radio" id="radioPrimary2" name="durum" value="1" required>
                            <label for="radioPrimary2">
                              Aktif
                            </label>
                          </div>
                          <div class="icheck-primary d-inline">
                            <input type="radio" id="radioPrimary4" name="durum" value="0" required>
                            <label for="radioPrimary4">
                              Pasif
                            </label>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- Select multiple-->
                      <div class="form-group">
                        <label>Seçilebilir profil</label>
                        <select id="selec1" name="cars1" multiple class="custom-select">
                          <% for (Rol role : roles) { %>
                          <option value="<%= role.getId() %>" ><%= role.getRoleName() %></option>
                          <% } %>
                        </select>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Seçilen profil</label>
                        <select id="selec2"  name="selected" multiple class="custom-select">
                        </select>
                      </div>
                    </div>
                  </div>
                  <script>
                    document.getElementById("selec1").addEventListener("change", function() {
                      var selected = this.options[this.selectedIndex];
                      document.getElementById("selec2").appendChild(selected);
                    });
                    document.getElementById("selec2").addEventListener("change", function() {
                      var selected = this.options[this.selectedIndex];
                      document.getElementById("selec1").appendChild(selected);
                    });
                  </script>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label class="required">Adres</label>
                        <textarea class="form-control" name="address" rows="3" placeholder="Adres giriniz." required></textarea>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <!-- select -->
                      <div class="form-group">
                        <label>Bölüm</label>
                        <select class="form-control" name="selectedBolum">
                          <option value="Yazilim" >Yazılım</option>
                          <option value="Yonetici">Yönetiçi</option>
                          <option value="Danisma">Danışma</option>
                          <option value="Baskanlik">Başkanlık</option>
                          <option value="Seflik">Şeflik </option>
                          <option value="Depo-Dagıtım">Depo - Dağıtım </option>
                          <option value="Saha_Ekibi">Saha Ekibi </option>
                          <option value="Market-Inkılap">Market - İnkılap </option>
                          <option value="Market-Necip_Fazıl">Market - Necip Fazıl </option>
                        </select>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->
                <div class="d-flex justify-content-center mb-2 pb-2"> <!-- Butonu ortalamak için d-flex ve justify-content-center sınıflarını kullanıyoruz -->
                  <button type="submit" class="btn btn-primary">Kullanıcı Ekle</button>
                </div>
              </form>
          </div></div></div></div>
  </section>
  <!-- /.row -->

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
  var messageDiv = document.getElementById("messageDiv");
  var message = "<%= message %>";
  messageDiv.innerHTML = '<div class="alert">' + message + '</div>';
</script>


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

</body>
</html>