<%@ page import="com.example.example.DataBase.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
  HttpSession userSession = request.getSession();
  String roleName = "Role_Yakinlik_Düzenle";

  if (!Rol.hasRole(userSession, roleName)) {
    response.sendRedirect("../Error/Error.html");
  }
List<Meslek> meslek = Meslek.getAllMeslek();
List<YakinlikDerecesi> yakinlik = YakinlikDerecesi.getAllAffinity();
List<AileYakinliklari> yakin = AileYakinliklari.getAllAffinity();
%>

<%
    String yonlendirenId = request.getParameter("Id");
    int id = Integer.parseInt(yonlendirenId);
    KullaniciBilgi info = KullaniciBilgi.getbyID(id);
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
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Aile Yakınlıkları</h1>
							<ol class="breadcrumb ">
								<li class="breadcrumb-item"><a href="#">Anasayfa</a></li>
                <li class="breadcrumb-item"><a href="#">İşlemlerim</a></li>
								<li class="breadcrumb-item"><a href="#">Müracaat</a></li>
								<li class="breadcrumb-item"><a href="#">Müracat Listesi</a></li>
								<li class="breadcrumb-item active">Aile Yakınlıkları</li>
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
							<div class="card card-secondary">
								<div class="card-header">
									<h3 class="card-title">Aile Yakınlıkları</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form>
									<div class="card-body">
										<div class="form-group row m-2">
											<label class="col-sm-2 col-form-label">TC Kimlik Numarası</label>
											<div class="col-sm-4"><%= info.getIdNo() %></div>

											<label class="col-sm-2 col-form-label">Ev Tel:</label>
											<div class="col-sm-4"><%= info.getContact().getHomePhone() %></div>
										</div>
										<div class="form-group row m-2">
											<label class="col-sm-2 col-form-label">Müracaat No - Müracaat Eden</label>

                      <div class="col-sm-4"><%= info.getApplication().getArchiveFileNo() %></div>
											<label class="col-sm-2 col-form-label">Cep Tel:</label>
											<div class="col-sm-4"><%= info.getContact().getCellPhone() %></div>
										</div>
										<div class="form-group row m-2">
											<label class="col-sm-2 col-form-label">Eş Adı Soyadı</label>
											<div class="col-sm-4"><%= info.getEsAd() %> <%= info.getEsSoyad() %></div>

											<label class="col-sm-2 col-form-label">Medeni Hali</label>
											<div class="col-sm-4"><%= info.getMaritalStatus() %></div>
										</div>
										<div class="form-group row m-2">
											<label class="col-sm-2 col-form-label">Arşiv No</label>
											<div class="col-sm-4"><%= info.getApplication().getArchiveFileNo() %></div>

											<label class="col-sm-2 col-form-label">Diğer Tel</label>
											<div class="col-sm-4"><%= info.getContact().getOtherTel()%></div>
										</div>
										<div class="form-group row m-2">
											<label class="col-sm-2 col-form-label"> Doğum Tarihi</label>
											<div class="col-sm-4"><%= info.getBirthDate() %></div>

											<label class="col-sm-2 col-form-label">Adresi</label>
											<div class="col-sm-4"><%= info.getAddress().getPublicAddress() %></div>
										</div>
									</div>
									<!-- /.card-body -->
									<div class="card-footer"></div>
								</form>
							</div>
							<!-- /.card -->

							<div class="card card-secondary">
								<div class="card-header">
									<h3 class="card-title">Aile Fert Bilgileri</h3>
								</div>

                <div>
                  <% if (request.getAttribute("errorMessage") != null) { %>
                  <div style="color: red;">
                    <%= request.getAttribute("errorMessage")%>
                  </div>
                  <% } %>
                </div>
								<!-- /.card-header -->
								<!-- form start -->
								<form action="aile" method="post">
									<div class="card-body">
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">Doğum Tarihi</label>
											<div class="col-sm-4">
												<input type="date" class="form-control" id="yKurum" name="dogum_tarihi"/>
											</div>
											<label  class="col-sm-2 col-form-label">Açıklama</label>
											<div class="col-sm-4">
												<select class="form-control" name="">
													<option>Lütfen Seçiniz</option>
                          <option>Terk</option>
                          <option>Asker</option>
                          <option>Kayıp</option>
                          <option>Mahkum</option>
                          <option>Resmi Nikah Yok</option>
                          <option>Gazi</option>
                          <option>Engelli</option>
                          <option>Yabancı Uyruk</option>
                          <option>Vefat Etmiş</option>
                          <option>Öksüz</option>
                          <option>Yetim</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">TC Kimlik Numarası</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" id="yKurum" name="TcKimlik" maxlength="11">
                        <input type="hidden"  name="KullId" value="<%=info.getIdInfoId()%>">
                        <input type="hidden"  name="KullTC" value="<%=info.getIdNo()%>">
											</div>
											<label  class="col-sm-2 col-form-label">Yakınlık</label>
											<div class="col-sm-4">
												<select class="form-control" name="yakinlik">
                          <%for (YakinlikDerecesi y : yakinlik){%>
													<option><%=y.getAffinityName()%></option>
                          <%}%>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">Adı</label>
											<div class="col-sm-4 input-group">
												<input type="text" class="form-control" name="ad">
											</div>
											<label class="col-sm-2 col-form-label">Meslek</label>
											<div class="col-sm-4">
												<select class="form-control" name="meslek">
                          <%for (Meslek m : meslek) {%>
													<option><%=m.getProfessionName()%></option>
                          <%}%>
                        </select>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">Soyadı</label>
											<div class="col-sm-4">
												<input type="text" class="form-control" name="soyad">
											</div>
											<label class="col-sm-2 col-form-label">Gelir</label>
											<div class="col-sm-4">
												<input type="text" name="gelir" value="0" class="form-control">
											</div>
										</div>
										<div class="form-group row ">
											<label class="col-sm-2 col-form-label"> Medeni Hali</label>
											<div class="col-sm-4">
												<select class="form-control" name="medeni_hal">
													<option>Evli</option>
													<option>Bekar</option>
													<option>Dul</option>
													<option>Boşanmış</option>
												</select>
											</div>
											<label class="col-sm-2 col-form-label">Eğitim Durumu</label>
											<div class="col-sm-4">
												<select class="form-control" name="egitim_durumu">
													<option>Lütfen Seçiniz</option>
                          <option>Okur Yazar Değil</option>
                          <option>Okur Yazar</option>
                          <option>Ana Okulu</option>
                          <option>İlköğretim</option>
                          <option>Ortaokul</option>
                          <option>Lise</option>
                          <option>Üniversite</option>
                          <option>Yüksek</option>
                          <option>Diğer</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2 col-form-label">Ölüm Tarihi</label>
											<div class="col-sm-4">
												<input type="date" name="olum_tarihi" class="form-control">
											</div>
                      <label class="col-sm-2 col-form-label">Cinsiyet</label>
                      <div class="col-sm-4">
                        <select class="form-control" name="cinsiyet">
                          <option>Lütfen Seçiniz</option>
                          <option>Kadın</option>
                          <option>Erkek</option>
                          <option>Belirtmek İstemiyorum</option>
                        </select>
                      </div>
										</div>
									</div>
									<!-- /.card-body -->
                  <div class="row justify-content-center mb-2 pb-2"> <!-- Butonu alt satırda ortalamak için d-flex ve justify-content-center sınıflarını kullanıyoruz -->
										<button type="submit" class="btn btn-primary">Kaydet</button>
										<button type="submit" class="btn btn-default ">Temizle</button>
									</div>
								</form>
							</div>
							<!-- /.card -->

							<div class="card card-secondary">
              <div class="card-header">
                <h3 class="card-title">Aile Yakınlıkları</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="row">
          <div class="col-12">
			                	<div class="table-responsive" style="overflow-x: auto;">
					                  <table id="example2" class="table table-bordered table-hover" style="width: 100%; table-layout: fixed;">
					                  	<colgroup>
					                  		<col style="width: 50px;">
			                                <col style="width: 140px;">
			                                <col style="width: 140px;">
			                                <col style="width: 100px;">
                                      <col style="width: 100px;">
			                                <col style="width: 140px;">
			                                <col style="width: 170px;">
			                                <col style="width: 160px;">
			                                <col style="width: 180px;">
			                                <col style="width: 140px;">
			                                <col style="width: 170px;">
			                                <!-- Add additional columns here -->
			                                <!-- For example:
			                                <col style="width: 250px;">
			                                <col style="width: 150px;">
			                                -->
		                           	 	</colgroup>
					                    <thead>
					                    <tr>
												<th></th>
												<th>Doğum Tarihi</th>
												<th>Ölüm Tarihi</th>
												<th>Ad</th>
                        <th>Soyad</th>
												<th>Yakınlık</th>
												<th>Cinsiyet</th>
												<th>Medeni Hal</th>
												<th>Eğitim Durumu</th>
												<th>Meslek</th>
												<th>Gelir</th>
					                    </tr>
					                    </thead>
					                    <tbody>
					                    <tr>
                                <%for (AileYakinliklari y : yakin){%>
					                      <td>
											  <a href="MuracatListeDuzenle.jsp">
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
										  </td>
					                      <td><%= y.getBirthDate()%></td>
					                      <td><%= y.getDd()%></td>
					                      <td><%= y.getName()%></td>
					                      <td><%= y.getSurname()%></td>
					                      <td><%= y.getYakinlik()%></td>
					                      <td><%= y.getGender()%></td>
					                      <td><%= y.getMedeni_hal()%></td>
					                      <td><%= y.getEgitim_durumu()%></td>
					                      <td><%= y.getMeslek()%></td>
					                      <td><%= y.getGelir()%></td>
					                    </tr>
                              <%}%>
					                    </tbody>
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
						</div>
						<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<footer class="main-footer">
			<strong><a href="https://www.gebze.bel.tr/">Gebze Belediyesi </a></strong>
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
