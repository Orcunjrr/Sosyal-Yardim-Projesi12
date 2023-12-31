<%@ page import="com.example.example.DataBase.KullaniciBilgi" %>
<%@ page import="com.example.example.DataBase.Muracaat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
  HttpSession userSession = request.getSession();
  String roleName = "Role_Muracaat_Listele";

  if (!Rol.hasRole(userSession, roleName)) {
    response.sendRedirect("../Error/Error.html");
  }
  String YonlendirenKId = request.getParameter("Id");
  int Id = Integer.parseInt(YonlendirenKId);
  KullaniciBilgi info = KullaniciBilgi.getbyID(Id);
  Muracaat muracaat = Muracaat.getbyID(Id);
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
								<li class="breadcrumb-item"><a href="#">Müracatlar</a></li>
								<li class="breadcrumb-item"><a href="#">Müracat Listesi</a></li>
								<li class="breadcrumb-item active">Müracat</li>
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
									<h3 class="card-title">Kimlik Bilgileri</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form>
									<div class="card-body">



										<div class="form-group row m-2">
											<label class="col-sm-2 col-form-label">TC Kimlik
												Numarası:</label>
											<div class="col-sm-4"><%= info.getIdNo() %></div>

											<label class="col-sm-2 col-form-label">Medeni Hal:</label>
											<div class="col-sm-4"><%= info.getMaritalStatus() %></div>

										</div>




										<div class="form-group row m-2">

											<label class="col-sm-2 col-form-label">Soyadı:</label>
											<div class="col-sm-4"><%= info.getSurname() %></div>


											<label class="col-sm-2 col-form-label">N. Kayıtlı
												Olduğu İl:</label>
											<div class="col-sm-4"><%= info.getRegistrationProvince() %></div>
										</div>

										<div class="form-group row m-2">

											<label class="col-sm-2 col-form-label"> Adı: </label>
											<div class="col-sm-4"><%= info.getAppliName() %></div>

											<label class="col-sm-2 col-form-label">N. Kayıtlı
												Olduğu İlçe:</label>
											<div class="col-sm-4"><%= info.getRegistrationDistrict() %></div>
										</div>


										<div class="form-group row m-2">

											<label class="col-sm-2 col-form-label">Baba Adı:</label>
											<div class="col-sm-4"><%= info.getFatherName() %></div>

											<label class="col-sm-2 col-form-label">Cilt No:</label>
											<div class="col-sm-4"><%= info.getCiltNo() %></div>
										</div>


										<div class="form-group row m-2">

											<label class="col-sm-2 col-form-label"> Anne Adı:</label>
											<div class="col-sm-4"><%= info.getMotherName() %></div>

											<label class="col-sm-2 col-form-label">Aile Sıra No:</label>
											<div class="col-sm-4"><%= info.getAileSiraNo() %></div>
										</div>

										<div class="form-group row m-2">

											<label class="col-sm-2 col-form-label"> Doğum Tarihi:</label>
											<div class="col-sm-4"><%= info.getBirthDate() %></div>

											<label class="col-sm-2 col-form-label"> Sıra No:</label>
											<div class="col-sm-4"><%= info.getAileSiraNo() %></div>
										</div>

										<div class="form-group row m-2">

											<label class="col-sm-2 col-form-label"> Cinsiyet:</label>
											<div class="col-sm-4"><%= info.getGender() %></div>

											<label class="col-sm-2 col-form-label">Eş Adı:</label>
											<div class="col-sm-4"><%= info.getEsAd() %></div>
										</div>

										<div class="form-group row m-2">

											<label class="col-sm-2 col-form-label"> Kayıt Durumu:</label>
											<div class="col-sm-4"><%= info.getRegistrationStatus() %></div>

											<label class="col-sm-2 col-form-label"> İlk Kayıt
												Yapan: </label>
											<div class="col-sm-4">*****</div>
										</div>

										<div class="form-group row m-2">

											<label class="col-sm-2 col-form-label"> Soybis:</label>
											<div class="col-sm-4"><%=info.getSoybis()%></div>


										</div>
									</div>
									<!-- /.card-body -->

									<div class="card-footer"></div>
								</form>
							</div>
							<!-- /.card -->









							<!-- general form elements -->
							<div class="card card-secondary">
								<div class="card-header">
									<h3 class="card-title">İletişim Bilgileri</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form>
									<div class="card-body">


										<div class="form-group row m-2">

											<label class="col-sm-2 col-form-label"> İlçe: </label>
											<div class="col-sm-4"><%= info.getRegistrationDistrict() %></div>

											<label class="col-sm-2 col-form-label">Apartman/Site:</label>
											<div class="col-sm-4"><%= info.getContact().getApartment() %></div>
										</div>


										<div class="form-group row m-2">

											<label class="col-sm-2 col-form-label">Mahalle:</label>
											<div class="col-sm-4"><%= info.getContact().getNeighborhood() %></div>

											<label class="col-sm-2 col-form-label"> Blok/Kapı No:</label>
											<div class="col-sm-4"><%= info.getContact().getBlockDoorNo() %></div>
										</div>


										<div class="form-group row m-2">

											<label class="col-sm-2 col-form-label">Cadde/Sokak:</label>
											<div class="col-sm-4"><%= info.getContact().getNeighborhood() %></div>

											<label class="col-sm-2 col-form-label"> Daire No:</label>
											<div class="col-sm-4"><%= info.getContact().getApartmentNo() %></div>
										</div>

										<div class="form-group row m-2">

											<label class="col-sm-2 col-form-label">Adres Tarifi:</label>
											<div class="col-sm-4"><%= info.getContact().getAddressDefinition() %></div>

											<label class="col-sm-2 col-form-label"> Ev Tel:</label>
											<div class="col-sm-4"><%= info.getContact().getHomePhone() %></div>
										</div>

										<div class="form-group row m-2">

											<label class="col-sm-2 col-form-label">Koordinat:</label>
											<div class="col-sm-4">****</div>

											<label class="col-sm-2 col-form-label">Cep Tel:</label>
											<div class="col-sm-4"><%= info.getPhone() %></div>
										</div>

										<div class="form-group row m-2">

											<label class="col-sm-2 col-form-label"> e-Posta:</label>
											<div class="col-sm-4"><%= info.getContact().geteMail() %></div>

											<label class="col-sm-2 col-form-label"> Diğer Tel: </label>
											<div class="col-sm-4"><%= info.getContact().getOtherTel() %></div>
										</div>

									</div>
									<!-- /.card-body -->

									<div class="card-footer"></div>
								</form>
							</div>
							<!-- /.card -->









							<!-- general form elements -->
							<div class="card card-secondary">
								<div class="card-header">
									<h3 class="card-title">Müracaat Bilgileri</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form>
									<div class="card-body">



										<div class="form-group row m-2">
											<label class="col-sm-2 col-form-label">Yardım Kart No:</label>
											<div class="col-sm-4">***</div>

											<label class="col-sm-2 col-form-label">Yardım Kart Durum:</label>
											<div class="col-sm-4">***</div>

										</div>




										<div class="form-group row m-2">

											<label class="col-sm-2 col-form-label">Arşiv Dosya No:</label>
											<div class="col-sm-4"><%= info.getApplication().getArchiveFileNo() %></div>


											<label class="col-sm-2 col-form-label">Müracaat Tarihi:</label>
											<div class="col-sm-4"><%= muracaat.getApplicationDate()%></div>
										</div>

										<div class="form-group row m-2">

											<label class="col-sm-2 col-form-label"> Talep Edilen Yardım Türü: </label>
											<div class="col-sm-4">****</div>

											<label class="col-sm-2 col-form-label"> Müracaat Tipi:</label>
											<div class="col-sm-4"><%= info.getApplication().getApplicationType() %></div>
										</div>


										<div class="form-group row m-2">

											<label class="col-sm-2 col-form-label"> Bölge:</label>
											<div class="col-sm-4"><%= info.getApplication().getRegion() %></div>

											<label class="col-sm-2 col-form-label">Açıklama:</label>
											<div class="col-sm-4"><%= info.getApplication().getDescription() %></div>
										</div>

                    <div class="form-group row m-2">

                      <label class="col-sm-2 col-form-label"> Aktiflik Durumu:</label>
                      <div class="col-sm-4"><% if(info.getApplication().getStatus()==1){%>Aktif<%}else{%>Pasif<% }%></div>

                    </div>


										 
 
									</div>
									<!-- /.card-body -->

									<div class="card-footer"></div>
								</form>
							</div>
							<!-- /.card -->











							<!-- general form elements -->
							<div class="card card-secondary">
								<div class="card-header">
									<h3 class="card-title">Dilekçe Bilgileri</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form>
									<div class="card-body">



										<div class="form-group row m-2">
											<label class="col-sm-2 col-form-label">İtiraz Dilekçe Ref No:</label>
											<div class="col-sm-4"><%= info.getPetition().getObjectionPetitionRefNo() %></div>

											<label class="col-sm-2 col-form-label">Dilekçe Referans No:</label>
											<div class="col-sm-4"><%= info.getPetition().getPetitionReferenceNo() %></div>

										</div>




										<div class="form-group row m-2">

											<label class="col-sm-2 col-form-label">İtiraz Dilekçe Konu:</label>
											<div class="col-sm-4"><%= info.getPetition().getObjectionPetitionSubject() %></div>


											<label class="col-sm-2 col-form-label">Dilekçe Konu:</label>
											<div class="col-sm-4"><%= info.getPetition().getPetitionSubject() %></div>
										</div>

										<div class="form-group row m-2">

											<label class="col-sm-2 col-form-label">İtiraz Dilekçe Sonuç: </label>
											<div class="col-sm-4"><%= info.getPetition().getObjectionPetitionResult() %></div>

											<label class="col-sm-2 col-form-label"> Dilekçe Sonuç:</label>
											<div class="col-sm-4"><%= info.getPetition().getObjectionPetitionResult() %></div>
										</div>


										<div class="form-group row m-2">

											<label class="col-sm-2 col-form-label"> Yönlendiren Birim:</label>
											<div class="col-sm-4"><%= info.getPetition().getForwardingUnit() %></div>

											<label class="col-sm-2 col-form-label">Yönlendiren Birim:</label>
											<div class="col-sm-4"><%= info.getPetition().getForwardingDilekce() %></div>
										</div>
										
										
											<div class="form-group row m-2">

											<label class="col-sm-2 col-form-label">Yönlendirme Tarihi:</label>
											<div class="col-sm-4"><%= info.getPetition().getForwardingDate() %></div>

											<label class="col-sm-2 col-form-label">Yönlendirme Tarihi:</label>
											<div class="col-sm-4"><%= info.getPetition().getForwardingDate2() %></div>
										</div>


										 
 
									</div>
									<!-- /.card-body -->

									<div class="card-footer"></div>
								</form>
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
