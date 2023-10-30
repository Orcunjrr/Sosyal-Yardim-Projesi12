<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.example.example.DataBase.Personel" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.example.DataBase.KullaniciBilgi" %>
<%@ page import="com.example.example.DataBase.District" %>
<%@ page import="com.example.example.DataBase.Sokak" %>
<%@ page import="com.example.example.DataBase.Bolge" %>
<%@ page import="com.example.example.DataBase.YardimTipi" %>

<%
  List<District> mahalle = District.getAllDistrict();
  List<Bolge> bolge = Bolge.getAllZone();
  List<Sokak> sokak = Sokak.getAllSokak();
  List<YardimTipi> help = YardimTipi.getAll();
HttpSession userSession = request.getSession();
String roleName = "Role_Kullanıcı_Listele";

if (!Rol.hasRole(userSession, roleName)) {
  response.sendRedirect("../Error/Error.html");
}
%>

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
            <h1>Müracaat Raporu</h1>
            <ol class="breadcrumb ">
              <li class="breadcrumb-item"><a href="#">Anasayfa</a></li>
              <li class="breadcrumb-item"><a href="#">Raporlar</a></li>
              <li class="breadcrumb-item active">Müracaat Raporu</li>
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
                  Müracaat Liste Kriterleri
                </h3>
              </div>
              <!-- /.card-header -->

              <!-- form start -->
              <form action="SearchServlet2" method="post">
                <div class="card-body">
                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">Müracaat No</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="muracatno">
                    </div>
                    <label class="col-sm-2 col-form-label ml-2">Doğum Tarihi Aralığı</label>
                    <div class="col-sm-3 input-group">
                      <input type="date" class="form-control" name="baslangic_tarihi">
                      <div class="input-group-text">-</div>
                      <input type="date" class="form-control" name="bitis_tarihi">
                    </div>
                  </div>

                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">TC Kimlik Numarası</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="tckimlikk" maxlength="11">
                    </div>
                    <label class="col-sm-2 col-form-label ml-2">Müracaat Tarihi Aralığı</label>
                    <div class="col-sm-3 input-group">
                      <input type="date" class="form-control" name="baslangic_tarihi">
                      <div class="input-group-text">-</div>
                      <input type="date" class="form-control" name="bitis_tarihi">
                    </div>
                  </div>

                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">Adı</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="add">
                    </div>
                    <label class="col-sm-2 col-form-label ml-2">Müracaat Durumu</label>
                    <div class="col-sm-3">
                      <select class="form-control" name="muracaatdurum">
                        <option>Lütfen Seçiniz</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">Soyadı</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="soyadd">
                    </div>
                    <label class="col-sm-2 col-form-label ml-2">Bölge</label>
                    <div class="col-sm-3">
                      <select class="form-control" name="bolge">
                        <% for(Bolge bol : bolge) { %>
                        <option value="<%= bol.getZoneId() %>" ><%= bol.getZoneName() %></option>
                        <%} %>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">İlçe</label>
                    <div class="col-sm-3">
                      <select class="form-control" name="il">
                        <option value="Gebze">Gebze</option>
                      </select>
                    </div>
                    <label class="col-sm-2 col-form-label ml-2">Kayıt Durumu</label>
                    <div class="col-sm-3">
                      <select class="form-control" name="kayıtDurum">
                        <option>Lütfen Seçiniz</option>
                        <option>Yeni Kayıt</option>
                        <option>Eski Kayıt</option>
                        <option>Durum Değişikliği</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">Mahalle</label>
                    <div class="col-sm-3">
                      <select class="form-control" name="mahalle">
                        <% for(District mah : mahalle) {%>
                        <option value="<%= mah.getDistrictID() %>" ><%= mah.getDistrictName() %></option>
                        <%} %>
                      </select>
                    </div>
                    <label class="col-sm-2 col-form-label ml-2">Yardım Alma Durumu</label>
                    <div class="col-sm-3">
                      <select class="form-control" name="YardimDurum">
                        <option>Hepsi</option>
                        <option>Yardım Alan</option>
                        <option>Yardım Almayan</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">Cadde/Sokak</label>
                    <div class="col-sm-3">
                      <select class="form-control" name="sokak">
                        <% for(Sokak sk : sokak) {%>
                        <option value="<%= sk.getSokakID() %>" ><%= sk.getSokakname() %></option>
                        <%} %>
                      </select>
                    </div>
                    <label class="col-sm-2 col-form-label ml-2">Soybis</label>
                    <div class="col-sm-3">
                      <select class="form-control" name="saybisdurum">
                        <option>Lütfen Seçiniz</option>
                        <option>Alındı</option>
                        <option>Alınmadı</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">İtiraz Dilekçe Referans No</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="itrazdilekce">
                    </div>
                    <label class="col-sm-2 col-form-label ml-2">Ev Telefonu</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="evtel">
                    </div>
                  </div>

                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">Dilekçe Referans No</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="dilekcerefno">
                    </div>
                    <label class="col-sm-2 col-form-label ml-2">Cep Telefonu</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="ceptel">
                    </div>
                  </div>

                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">Arşiv Dosya No</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="arsivdosyano">
                    </div>
                    <label class="col-sm-2 col-form-label ml-2">Adres No</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="addressNo">
                    </div>
                  </div>

                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">Talep Edilen Yardımlar</label>
                    <div class="col-sm-4">
                      <select multiple class="form-control" name="yardim">
                        <% for(YardimTipi h : help){ %>
                        <option value="<%= h.getHelpId()%>"><%= h.getHelpName() %></option>
                        <%} %>
                      </select>
                    </div>
                  </div>

                  <div class="row justify-content-center mt-3 pt-3"> <!-- Butonu alt satırda ortalamak için d-flex ve justify-content-center sınıflarını kullanıyoruz -->
                    <button type="submit" class="btn btn-primary mr-1">Sorgula</button>
                    <button type="submit" class="btn btn-default ml-1">Temizle</button>
                  </div>
                </div>
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
            <div class="card card-secondary">
              <!-- /.card-header -->
            </div>
            <!-- /.card -->
            <div class="card card-secondary">
              <div class="card-header">
                <h3 class="card-title">Müracaat Listele</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="row">
                  <div class="col-12">
                        <div class="table-responsive" style="overflow-x: auto;">
                          <table id="example2" class="table table-bordered table-hover" style="width: 100%; table-layout: fixed;">
                            <% List<KullaniciBilgi> filteredUsers = (List<KullaniciBilgi>) request.getAttribute("filteredUsers");
                              if (filteredUsers != null && !filteredUsers.isEmpty()) { %>
                            <colgroup>
                              <col style="width: 60px;">
                              <col style="width: 140px;">
                              <col style="width: 140px;">
                              <col style="width: 180px;">
                              <col style="width: 140px;">
                              <col style="width: 170px;">
                              <col style="width: 160px;">
                              <col style="width: 140px;">
                              <col style="width: 140px;">
                              <col style="width: 140px;">
                              <col style="width: 140px;">
                              <col style="width: 140px;">
                              <col style="width: 140px;">
                              <col style="width: 140px;">
                              <col style="width: 140px;">
                              <col style="width: 180px;">
                              <col style="width: 190px;">
                              <col style="width: 180px;">
                              <col style="width: 150px;">
                              <col style="width: 150px;">
                              <col style="width: 100px;">
                              <!-- Add additional columns here -->
                              <!-- For example:
                              <col style="width: 250px;">
                              <col style="width: 150px;">
                              -->
                            </colgroup>
                            <thead>
                            <tr>
                              <th></th>
                              <th>Müracaat No</th>
                              <th>TC Kimlik No</th>
                              <th>Müracaat Eden Kişi</th>
                              <th>Eş Adı Soy Adı</th>
                              <th>Arşiv Dosya No</th>
                              <th>Müracaat Tarihi</th>
                              <th>Doğum Tarihi</th>
                              <th>Medeni Hali</th>
                              <th>İlçe</th>
                              <th>Mahalle</th>
                              <th>Cadde/Sokak</th>
                              <th>Ev Tel</th>
                              <th>Cep Tel</th>
                              <th>İş Tel</th>
                              <th>Müracaat Durumu</th>
                              <th>Talep Edilen Yardımlar</th>
                              <th>İtiraz Dilekçe Ref No</th>
                              <th>Açıklama</th>
                              <th>Kayıt Durumu</th>
                              <th>Soybis</th>
                            </tr>
                            </thead>
                            <tbody >
                            <% for (KullaniciBilgi in : filteredUsers) { %>
                            <tr>
                              <td>
                                <a href="MuracatListesic.jsp?Id=<%= in.getIdInfoId()%>">
                                  <i class="fa fa-eye" style="font-size: 20px; color:black; cursor: pointer; vertical-align: middle;"></i>
                                </a>
                              </td>
                              <td><%= in.getIdInfoId() %></td>
                              <td><%=in.getIdNo() %></td>
                              <td><%=in.getAppliName() +' ' + in.getSurname() %></td>
                              <td><%=in.getEsAd() + ' '+in.getEsSoyad()%></td>
                              <td><%=in.getApplication().getArchiveFileNo()%></td>
                              <td><%=in.getApplication().getApplicationDate()%></td>
                              <td><%=in.getBirthDate()%></td>
                              <td><%=in.getMaritalStatus()%></td>
                              <td><%=in.getContact().getDistrict()%></td>
                              <td><%=in.getContact().getNeighborhood()%></td>
                              <td><%=in.getContact().getStreet()%></td>
                              <td><%=in.getContact().getHomePhone()%></td>
                              <td></td>
                              <td><%=in.getContact().getCellPhone()%></td>
                              <td><%=in.getApplication().getRegion()%></td>
                              <td><%=in.getPetition().getForwardingDilekce()%></td>
                              <td><%=in.getPetition().getObjectionPetitionRefNo()%></td>
                              <td><%=in.getPetition().getObjectionPetitionSubject()%></td>
                              <td><%=in.getRegistrationStatus()%></td>
                              <td><%=in.getSoybis()%></td>
                            </tr>
                            <% } %>
                            </tbody>
                            <% }  %>
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
  document.addEventListener('DOMContentLoaded', function () {
    const toggleInputsBtn = document.getElementById('toggleInputsBtn');
    const müracaatKriterleriCard = document.getElementById('müracaatKriterleriCard');

    toggleInputsBtn.addEventListener('click', function () {
      // Toggle the 'hidden' class for the card element
      müracaatKriterleriCard.classList.toggle('hidden');
    });
  });
</script>

</body>
</html>
