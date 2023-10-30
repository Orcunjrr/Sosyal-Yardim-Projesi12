<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.example.DataBase.*" %>
<%@ page import="com.example.example.AdminServlet.Muracaat" %>

<%
  List<District> mahalle = District.getAllDistrict();
  List<Bolge> bolge = Bolge.getAllZone();
  List<Sokak> sokak = Sokak.getAllSokak();
  List<YardimTipi> help = YardimTipi.getAll();

HttpSession userSession = request.getSession();
String roleName = "Role_Muracaat_Listele";

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
  <script>
    $(document).ready(function() {
      var selectedId;

      $('#TABLE tbody').on('click', '.delete-button', function () {

        var userId = $(this).closest('tr').find('td#tcno').text();

        console.log("Gelen Data  :"+ userId);
        selectedId = userId;
        $('#confirmationModal').modal('show');
      });

      $('#confirmDeleteButton').on('click', function() {
        $('#confirmationModal').modal('hide');
        // Silme işlemini gerçekleştirmek için gerekli kodu burada çağırabilirsiniz.
        // Örneğin: window.location.href = "silme.jsp?id=" + selectedId;
        $.get("SilMuracaat", {id:selectedId})
        window.location.href = "SilMuracaat?TCID=" + selectedId;

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
            <h1>Müracaat Listele</h1>
            <ol class="breadcrumb ">
              <li class="breadcrumb-item"><a href="#">Anasayfa</a></li>
              <li class="breadcrumb-item"><a href="#">İşlemlerim</a></li>
              <li class="breadcrumb-item"><a href="#">Müracaat</a></li>
              <li class="breadcrumb-item active">Müracaat Listele</li>
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
              <form action="SearchServlet" method="post">
                <div class="card-body">
                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">TC Kimlik Numarası</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="ad" maxlength="11">
                    </div>
                    <label class="col-sm-2 col-form-label ml-2">Müracaat No</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="ad" value="">
                    </div>
                  </div>

                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">Adı</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="ad">
                    </div>
                    <label class="col-sm-2 col-form-label ml-2">Soyadı</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="ad">
                    </div>
                  </div>

                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">Bölge</label>
                    <div class="col-sm-3">
                      <select class="form-control" name="ad">
                        <option value="">Lütfen Seçiniz</option>
                        <% for(Bolge bol : bolge) { %>
                        <option value="<%= bol.getZoneId() %>" ><%= bol.getZoneName() %></option>
                        <%} %>
                      </select>
                    </div>
                    <label class="col-sm-2 col-form-label ml-2">İlçe</label>
                    <div class="col-sm-3">
                      <select class="form-control" name="ad">
                        <option value="Gebze">Gebze</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">Mahalle</label>
                    <div class="col-sm-3">
                      <select class="form-control" name="ad" id="mahalleSelect" onchange="toggleSokakSelect()">
                        <option value="" selected>Lütfen Mahalle Seçiniz</option>
                        <% for(District mah : mahalle) {%>
                        <option value="<%= mah.getDistrictID() %>" ><%= mah.getDistrictName() %></option>
                        <%} %>
                      </select>
                    </div>
                    <label class="col-sm-2 col-form-label ml-2">Cadde/Sokak</label>
                    <div class="col-sm-3">
                      <select class="form-control" name="ad" id="sokakSelect">
                        <option value="">Sokak seçiniz</option>
                        <% for(Sokak sk : sokak) {%>
                        <option data-district-id="<%= sk.getDistrict().getDistrictID()%>" value="<%= sk.getSokakname() %>" ><%= sk.getSokakname() %></option>
                        <%} %>
                      </select>
                    </div>
                  </div>

                  <script>
                    function toggleSokakSelect() {
                      const mahalleSelect = document.getElementById('mahalleSelect');
                      const sokakSelect = document.getElementById('sokakSelect');
                      const selectedDistrictId = mahalleSelect.value;
                      const sokakOptions = sokakSelect.querySelectorAll('option');

                      for (const option of sokakOptions) {
                        if (option.dataset.districtId === selectedDistrictId) {
                          sokakSelect.style.display = '';
                          option.style.display = '';
                        }else {
                          option.style.display = 'none'; // Hide non-matching options
                        }

                      }
                    }
                  </script>

                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">Cep Telefonu</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="ad">
                    </div>
                    <label class="col-sm-2 col-form-label ml-2">Ev Telefonu</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="ad">
                    </div>
                  </div>

                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">Kayıt Durumu</label>
                    <div class="col-sm-3">
                      <select class="form-control" name="ad">
                        <option value="">Lütfen Seçiniz</option>
                        <option>Yeni Kayıt</option>
                        <option>Eski Kayıt</option>
                        <option>Durum Değişikliği</option>
                      </select>
                    </div>
                    <label class="col-sm-2 col-form-label ml-2">Yardım Alma Durumu</label>
                    <div class="col-sm-3">
                      <select class="form-control" name="ad">
                        <option value="">Hepsi</option>
                        <option>Yardım Alan</option>
                        <option>Yardım Almayan</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">Adres No</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="ad">
                    </div>
                    <label class="col-sm-2 col-form-label ml-2">Soybis</label>
                    <div class="col-sm-3">
                      <select class="form-control" name="ad">
                        <option value="">Lütfen Seçiniz</option>
                        <option>Alındı</option>
                        <option>Yok</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">İtiraz Dilekçe Referans No</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="ad">
                    </div>
                    <label class="col-sm-2 col-form-label ml-2">Dilekçe Referans No</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="ad">
                    </div>
                  </div>

                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">Doğum Tarihi Aralığı</label>
                    <div class="col-sm-3 input-group">
                      <input type="date" class="form-control" name="ad">
                      <div class="input-group-text">-</div>
                      <input type="date" class="form-control" name="ad">
                    </div>
                    <label class="col-sm-2 col-form-label ml-2">Müracaat Tarihi Aralığı</label>
                    <div class="col-sm-3 input-group">
                      <input type="date" class="form-control" name="ad">
                      <div class="input-group-text">-</div>
                      <input type="date" class="form-control" name="ad">
                    </div>

                  </div>
                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">Arşiv Dosya No</label>
                    <div class="col-sm-3">
                      <input type="text" class="form-control" name="ad">
                    </div>
                    <label class="col-sm-2 col-form-label ml-2">Müracaat Durumu</label>
                    <div class="col-sm-3">
                      <select class="form-control" name="ad">
                        <option value="1" selected> Aktif</option>
                        <option value="0" >Pasif</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row m-2">
                    <label class="col-sm-3 col-form-label">Talep Edilen Yardımlar</label>
                    <div class="col-sm-4">
                      <select multiple class="form-control" name="ad">
                        <% for(YardimTipi h : help){ %>
                        <option value="<%= h.getHelpId()%>"><%= h.getHelpName() %></option>
                        <%} %>
                      </select>
                    </div>
                  </div>

                  <div class="row justify-content-center mt-3 pt-3"> <!-- Butonu alt satırda ortalamak için d-flex ve justify-content-center sınıflarını kullanıyoruz -->
                    <button type="submit" class="btn btn-primary mr-1">Sorgula</button>
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
                      <div class="card-body">
                        <div class="table-responsive" style="overflow-x: auto;">
                          <table id="TABLE" class="table table-bordered table-hover" style="width: 100%; table-layout: fixed;">
                            <% List<KullaniciBilgi> filteredUsers = (List<KullaniciBilgi>) request.getAttribute("filteredUsers");
                              if (filteredUsers != null && !filteredUsers.isEmpty()) { %>
                            <colgroup>
                              <col style="width: 200px;">
                              <col style="width: 140px;">
                              <col style="width: 140px;">
                              <col style="width: 140px;">
                              <col style="width: 80px;">
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
                              <th>Status</th>
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

                                  <i class="fa fa-eraser delete-button" style="font-size: 20px; color:#17a2b8; cursor: pointer; vertical-align: middle;"></i>

                                <a href="yardimkarari.jsp?Id=<%= in.getIdInfoId()%>">
                                  <i class="fa fa-gift" style="font-size: 20px; color:#17a2b8; cursor: pointer; vertical-align: middle;"></i>
                                </a>
                                <a href="TutanakEkle.jsp?Id=<%= in.getIdInfoId()%>">
                                  <i class="fa fa-newspaper" style="font-size: 20px; color:#17a2b8; cursor: pointer; vertical-align: middle;"></i>
                                </a>

                                <a href="MuracatListesic.jsp?Id=<%= in.getIdInfoId()%>">
                                  <i class="fa fa-eye" style="font-size: 20px; color:black; cursor: pointer; vertical-align: middle;"></i>
                                </a>
                                <a href="AileYakinliklari.jsp?Id=<%= in.getIdInfoId()%>">
                                  <i class="fa fa-users" style="font-size: 20px; color: #cd853f; cursor: pointer; vertical-align: middle;"></i>
                                </a>
                                <a href="yeniEngelliAracHizmet.jsp?Id=<%= in.getIdInfoId()%>">
                                  <i class="fa fa-wheelchair" style="font-size: 20px; color:blue; cursor: pointer; vertical-align: middle;"></i>
                                </a>
                                <a href="muracaatguncelle.jsp?ID=<%=in.getIdInfoId()%>">
                                  <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" class="icon-equal-size" viewBox="0 0 512 512">
                                    <style>
                                      .icon-equal-size {
                                        height: 20px;
                                        width: 20px;
                                        fill: #17a2b8;
                                        vertical-align: middle;
                                      }
                                    </style>
                                    <path class="icon-equal-size" d="M441 58.9L453.1 71c9.4 9.4 9.4 24.6 0 33.9L424 134.1 377.9 88 407 58.9c9.4-9.4 24.6-9.4 33.9 0zM209.8 256.2L344 121.9 390.1 168 255.8 302.2c-2.9 2.9-6.5 5-10.4 6.1l-58.5 16.7 16.7-58.5c1.1-3.9 3.2-7.5 6.1-10.4zM373.1 25L175.8 222.2c-8.7 8.7-15 19.4-18.3 31.1l-28.6 100c-2.4 8.4-.1 17.4 6.1 23.6s15.2 8.5 23.6 6.1l100-28.6c11.8-3.4 22.5-9.7 31.1-18.3L487 138.9c28.1-28.1 28.1-73.7 0-101.8L474.9 25C446.8-3.1 401.2-3.1 373.1 25zM88 64C39.4 64 0 103.4 0 152V424c0 48.6 39.4 88 88 88H360c48.6 0 88-39.4 88-88V312c0-13.3-10.7-24-24-24s-24 10.7-24 24V424c0 22.1-17.9 40-40 40H88c-22.1 0-40-17.9-40-40V152c0-22.1 17.9-40 40-40H200c13.3 0 24-10.7 24-24s-10.7-24-24-24H88z"/>
                                  </svg>
                                </a>
                              </td>
                              <td id="tcno"><%= in.getIdInfoId() %></td>
                              <td ><%=in.getIdNo() %></td>
                              <td><%=in.getAppliName() +' ' + in.getSurname() %></td>
                              <td><% if(in.getApplication().getStatus()==1){%>Aktif<%}else{%>Pasif<% }%></td>
                              <td><%=in.getEsAd() + ' '+in.getEsSoyad()%></td>
                              <td><%=in.getApplication().getArchiveFileNo()%></td>
                              <td><%=in.getApplication().getApplicationDate()%></td>
                              <td><%=in.getBirthDate()%></td>
                              <td><%=in.getMaritalStatus()%></td>
                              <td><%=in.getContact().getDistrict()%></td>
                              <td><%=in.getContact().getNeighborhood()%></td>
                              <td><%=in.getContact().getStreet()%></td>
                              <td ><%=in.getContact().getHomePhone()%></td>
                              <td><%=in.getPhone()%></td>
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
                      </div>
                      <!-- /.card-body -->
                    		            <!-- /.card -->
                  <!-- Modal -->
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

              <!-- MODAL           ----------------------       ------------------- ----------------       -->
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
                      <button type="button" class="btn btn-danger" id="confirmDeleteButton" >Evet</button>
                    </div>
                  </div>
                </div>
              </div>

            <!-- /.row -->
            </div><!-- /.container-fluid --></div></div></div>
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
