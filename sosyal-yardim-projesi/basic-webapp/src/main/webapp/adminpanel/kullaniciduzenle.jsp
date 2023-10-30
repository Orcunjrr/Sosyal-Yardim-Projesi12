
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.example.DataBase.Rol" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.example.DataBase.Personel" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="com.example.example.RoleControl" %>
<%@ page import="jakarta.persistence.Tuple" %>
<%@ page import="java.io.PrintWriter" %>

<%
  HttpSession userSession = request.getSession();
  if(!Rol.hasRole(userSession,"Role_Kullanıcı_Duzenle")){ //ROL OLARAK KULLANICI DÜZENLE EKLENMELİ
    response.sendRedirect("../Error/Error.html");
  }

  List<String> Grups = Rol.getDistinctRolGrup();

  String userId = request.getParameter("userId");
  String userMail = request.getParameter("userMail");
  Personel user = null;
  int Id = 0;

  if (userId != null){
    Id = Integer.parseInt(userId);
    user = Personel.getUserInfoById(userId);
  } else if (userMail != null) {
    user = Personel.getUserInfoByMail(userMail);
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
    /* Sidebardaki "Anasayfa", "İşlemlerim", "Yönetici İşlemleri" ve "Raporlar" başlıklarının yazı rengini ve arka plan rengini belirgin hale getir */

    #islemlerim.nav-link,
    #yonetici.nav-link,
    #rapor.nav-link {
      color: #fff; /* Yazı rengini istediğiniz renk koduyla değiştirebilirsiniz */
      background-color:	#494949; /* Arka plan rengini istediğiniz renk koduyla değiştirebilirsiniz */
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
            <h1>Kullanıcı Düzenle</h1>
            <ol class="breadcrumb ">
              <li class="breadcrumb-item"><a href="#">Anasayfa</a></li>
              <li class="breadcrumb-item"><a href="#">Yönetici İşlemleri</a></li>
              <li class="breadcrumb-item"><a href="#">Kullanıcı</a></li>
              <li class="breadcrumb-item"><a href="#">Kullanıcı Listele</a></li>
              <li class="breadcrumb-item active">Kullanıcı Düzenle</li>
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
                  Kullanıcı Düzenle
                </h3>
              </div>
              <!-- /.card-header -->

              <!-- form start -->
              <form action="adminupdate" method="post">
                <div class="card-body" style="text-overflow-mode: auto; overflow: auto; overflow-inline: auto">
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label>E-Posta</label>
                        <input type="hidden" name="userId" class="form-control" value="<%= user.getId() %>" required>
                        <input type="email"  name="email" class="form-control" value="<%= user.getMail() %>" required>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Ünvan</label>
                        <input type="text" class="form-control"  name="unvan" value="<%= user.getUnvan() %>" required>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label>Kullanıcı Adı</label>
                        <input type="text" class="form-control"  name="username" value="<%= user.getUserName() %>" required>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Şifre</label>
                        <input type="password" class="form-control" name="password" value="<%= user.getPassword() %>" required>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label>Ad</label>
                        <input type="text" class="form-control"  name="name" value="<%= user.getName() %>" required>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Soyad</label>
                        <input type="text" class="form-control" name="surname" value="<%= user.getSurname() %>" required>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- text input -->
                      <div class="form-group">
                        <label>Sicil No</label>
                        <input type="text" id="sicilNo" name="sicilNo" class="form-control" value="<%= user.getRegistrationNo() %>" pattern="[0-9]{13}" title="Sicil No yalnızca 13 haneli rakamlardan oluşmalıdır" oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 13)" placeholder="13 haneli Sicil No Giriniz" required maxlength="13">

                      </div>

                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Cinsiyet</label>
                        <div class="form-group clearfix">
                          <div class="icheck-primary d-inline">
                            <input type="radio" id="radioPrimary1" name="cinsiyet" value="E" <%= user.getGender().equals("E") ? "checked" : "" %> required>
                            <label for="radioPrimary1">
                              Erkek
                            </label>
                          </div>

                          <div class="icheck-primary d-inline">
                            <input type="radio" id="radioPrimary3" name="cinsiyet" value="K" <%= user.getGender().equals("K") ? "checked" : "" %> required>
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
                        <label>Telefon</label>
                        <input type="tel" id="phone" name="phone" class="form-control" value="<%= user.getPhone() %>" pattern="[0-9]{11}" title="Telefon numarası yalnızca 11 haneli rakamlardan oluşmalıdır" oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 11)" placeholder="Telefon Numarasını Giriniz" required maxlength="11">

                      </div>

                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>Durum</label>
                        <div class="form-group clearfix">
                          <div class="icheck-primary d-inline">
                            <input type="radio" id="radioPrimary2" name="durum" value="1" <%= user.getStatus() == 1 ? "checked" : "" %> required>
                            <label for="radioPrimary2">
                              Aktif
                            </label>
                          </div>

                          <div class="icheck-primary d-inline">
                            <input type="radio" id="radioPrimary4" name="durum" value="0" <%= user.getStatus() == 0 ? "checked" : "" %> required>
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
                      <!-- text input -->
                      <div class="form-group">
                        <label>Adres</label>
                        <textarea class="form-control" rows="3" name="address" required><%= user.getAddress() %></textarea>
                      </div>

                    </div>
                    <div class="col-sm-6">
                      <!-- select -->
                      <div class="form-group">
                        <label>Bölüm</label>
                        <select class="form-control" name="selectedBolum">
                          <option value="Yazilim"  <%= user.getSection().equals("Yazilim") ? "selected" : "" %> >Yazılım</option>
                          <option value="Yonetici" <%= user.getSection().equals("Yonetici") ? "selected" : "" %>>Yönetiçi</option>
                          <option value="Danisma" <%= user.getSection().equals("Danisma") ? "selected" : "" %>>Danışma</option>
                          <option value="Baskanlik" <%= user.getSection().equals("Yazilim") ? "selected" : "" %>>Başkanlık</option>
                          <option value="Seflik" <%= user.getSection().equals("Baskanlik") ? "selected" : "" %>>Şeflik </option>
                          <option value="Depo-Dagıtım" <%= user.getSection().equals("Depo-Dagıtım") ? "selected" : "" %>>Depo - Dağıtım </option>
                          <option value="Saha_Ekibi" <%= user.getSection().equals("Saha_Ekibi") ? "selected" : "" %>>Saha Ekibi </option>
                          <option value="Market-Inkılap" <%= user.getSection().equals("Market-Inkılap") ? "selected" : "" %>>Market - İnkılap </option>
                          <option value="Market-Necip_Fazıl" <%= user.getSection().equals("Market-Necip_Fazıl") ? "selected" : "" %>>Market - Necip Fazıl </option>
                        </select>
                      </div>
                    </div>


                  </div>
                  <div class="row justify-content-around"> <!-- Butonu alt satırda ortalamak için d-flex ve justify-content-center sınıflarını kullanıyoruz -->
                    <button type="submit" class="btn btn-primary">Düzenle</button>
                    <button onclick="checkAll()" class="btn btn-danger">Tüm Rolleri ver ve Düzenle</button>

                  </div>

                  <label>Roller:</label>
                  <div class="form-group">

                    <%int sayi = Rol.RolGrupSayiAl(); %>

                    <%System.out.println(sayi);%>
                      <%for(int i = 0; i<sayi; i++){%>
                    <div class="col-sm" style="border:1px solid black; padding: 10px;border-radius: 7px;margin-top:10px; box-shadow: 0 2px 6px rgba(44,166,234,0.6);text-overflow-mode: auto; overflow: auto; overflow-inline: auto">
                      <label><%=Grups.get(i)%></label>
                      <%System.out.println("Grup adı: "+ Grups.get(i));%>
                      <%//System.out.println("Roles Ad: "+ roles.get(i).getRolGrup());%>
                      <%//if(Grups.get(i).equals("Persnel")){
                        List<Rol> roles = Rol.getRolNamesByGrup(Grups.get(i));
                      %>
                      <%System.out.println("IF ICINDE");%>
                      <%for(Rol roler : roles){%>
                      <%System.out.println(roler.getId());%>

                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="rol<%= roler.getId() %>" name="roles" value="<%= roler.getId() %>" <% if (RoleControl.hasUserRole(Id, roler.getId()) == 1) { %>checked<% } %>>
                        <label class="form-check-label" for="rol<%= roler.getId() %>"><%= roler.getRoleName()%></label>
                      </div>

                      <%}%>

                    </div>
                      <%}%>
              </form>
            </div></div></div></div>
    </section>
    <!-- /.row -->
  </div>

  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <strong><a href="https://www.gebze.bel.tr/">Gebze Belediyesi</a></strong>
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
  // Tüm checkbox'ları işaretlemek için bir fonksiyon tanımlayın
  function checkAll() {
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    checkboxes.forEach(function(checkbox) {
      checkbox.checked = true;
    });
  }

  // Butona tıklandığında checkAll() fonksiyonunu çağıran bir event listener ekleyin
  var input = document.getElementById('checkAllButton'); // Butonun id'sini buraya ekleyin
  var button = document.getElementById('checkAllButton'); // Butonun id'sini buraya ekleyin
  var label = document.getElementById('checkAllButton'); // Butonun id'sini buraya ekleyin

  button.addEventListener('click', checkAll);
  input.addEventListener('click', checkAll);
  label.addEventListener('mouseover', checkAll);

</script>
</body>
</html>
