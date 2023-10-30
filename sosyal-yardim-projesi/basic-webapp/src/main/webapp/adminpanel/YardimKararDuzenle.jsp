<%@ page import="com.example.example.DataBase.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
  List<YardimTipi> yardimtipi = YardimTipi.getAll();
  List<YardimTipiAlt> yardimalttip= YardimTipiAlt.getAll();
  List<KullaniciBilgi> kullanici = KullaniciBilgi.getAll();
  List<YonlendirilenKurum> yonKurum = YonlendirilenKurum.getAll();

%>

<%
  String Yardimid = request.getParameter("ID");
  int id = Integer.parseInt(Yardimid);
  YardimKarari yardimkarar = YardimKarari.getbyID(id);

  KullaniciBilgi info = YardimKarari.getbyID(id).getKullanici_id();

%>

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
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Yardım Kararı</h1>
            <ol class="breadcrumb ">
              <li class="breadcrumb-item"><a href="#">Anasayfa</a></li>
              <li class="breadcrumb-item"><a href="#">İşlemlerim</a></li>
              <li class="breadcrumb-item"><a href="#">Müracaat</a></li>
              <li class="breadcrumb-item"><a href="#">Müracaat Listesi</a></li>
              <li class="breadcrumb-item active">Yardım Kararı</li>
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
            <!--<form action="yardimkarari" method="post"> -->
            <!-- general form elements -->
            <div class="card card-secondary">
              <div class="card-header">
                <h3 class="card-title">Yardım Kararı</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <div class="card-body">
                <div class="form-group row m-2">
                  <label class="col-sm-2 col-form-label">TC Kimlik Numarası</label>
                  <div class="col-sm-4"><%= info.getIdNo() %></div>

                  <label class="col-sm-2 col-form-label">Ev Tel</label>
                  <div class="col-sm-4"><%= info.getContact().getHomePhone() %></div>
                </div>
                <div class="form-group row m-2">
                  <label class="col-sm-2 col-form-label">Müracaat No - Müracaat Eden</label>
                  <div class="col-sm-4"><%= info.getApplication().getArchiveFileNo() %></div>

                  <label class="col-sm-2 col-form-label">Cep Tel:</label>
                  <div class="col-sm-4"><%= info.getContact().getCellPhone() %></div>
                </div>
                <div class="form-group row m-2">
                  <label class="col-sm-2 col-form-label">Adı Soyadı</label>
                  <div class="col-sm-4"><%= info.getAppliName() %> <%= info.getSurname() %></div>

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
            </div>
            <!-- /.card -->

            <div class="card card-secondary">
              <div class="card-header">
                <h3 class="card-title">Yardım Kararı Bilgileri</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form action="yardimkararduzenle" method="post">
                <div class="card-body">
                  <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Yardım Tip/Grup</label>
                    <div class="col-sm-4">
                      <input type="hidden" name="murId" value="<%= info.getIdInfoId() %>">
                      <input type="hidden" name="kararid" value="<%= id %>">
                      <select class="form-control"  name="yardim_tipi">
                        <% for(YardimTipi y: yardimtipi){ %>
                        <option <%= y.getHelpName().equals(yardimkarar.getYardimTip()) ? "selected" : "" %>><%=y.getHelpName()%></option>
                        <%}%>
                      </select>
                    </div>

                    <label  class="col-sm-2 col-form-label">Yardım Statü</label>
                    <div class="col-sm-4">
                      <select class="form-control" name="yardim_statu">
                        <option value="Aktif"  <%= yardimkarar.getYardimStatu().equals("Aktif") ? "selected" : "" %> >Aktif</option>
                        <option value="Pasif"  <%= yardimkarar.getYardimStatu().equals("Pasif") ? "selected" : "" %> >Pasif</option>
                      </select>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Yardım Alt Tip/Grup</label>
                    <div class="col-sm-4">
                      <select class="form-control" name="yardim_alt_tip">
                        <% for(YardimTipiAlt yarAlt: yardimalttip){ %>

                        <option <%= yarAlt.getHelpSubName().equals(yardimkarar.getYardimAltTip()) ? "selected" : "" %>><%=yarAlt.getHelpSubName()%></option>
                        <%}%>
                      </select>
                    </div>
                    <label  class="col-sm-2 col-form-label">Dosya Karar Sayısı</label>
                    <div class="col-sm-4">
                      <input type="number" class="form-control" name="dosya_karar_sayisi" value="<%=yardimkarar.getDosKarSayısı()%>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Yardım Dönemleri</label>
                    <div class="col-sm-4">
                      <select class="form-control" name="yardim_dönemleri">
                        <option>Lütfen Seçiniz</option>
                        <option>Aylık</option>
                        <option>2 Aylık</option>
                        <option>3 Aylık</option>
                        <option>4 Aylık</option>
                        <option>5 Aylık</option>
                        <option>6 Aylık</option>
                        <option>7 Aylık</option>
                        <option>8 Aylık</option>
                        <option>9 Aylık</option>
                        <option>10 Aylık</option>
                        <option>11 Aylık</option>
                        <option>12 Aylık</option>
                      </select>
                    </div>

                    <label class="col-sm-2 col-form-label required">Dosya Tarihi</label>
                    <div class="col-sm-4">
                      <input type="date" class="form-control" name="dosya_tarihi" value="<%=yardimkarar.getDosyaTarihi()%>" required>
                    </div>
                  </div>

                  <div class="form-group row">
                    <label class="col-sm-2 col-form-label"> Yönlendiren Birim</label>
                    <div class="col-sm-4">
                      <select class="form-control" name="yonlendiren_birim">
                        <% for(YonlendirilenKurum yk: yonKurum){ %>
                        <option <%= yk.getYonlendirilenKurumName().equals(yardimkarar.getYönlendirenKurum()) ? "selected" : "" %>><%=yk.getYonlendirilenKurumName()%></option>
                        <% } %>
                      </select>
                    </div>

                    <label class="col-sm-2 col-form-label required">Yardım Teslim Tarihi:</label>
                    <div class="col-sm-4">
                      <input type="date" class="form-control" name="yardim_teslim_tarihi" value="<%=yardimkarar.getYarTeslimTarihi()%>" required>
                    </div>
                  </div>

                  <div class="form-group row ">
                    <label class="col-sm-2 col-form-label">Açıklama</label>
                    <div class="col-sm-4">
                      <input type="text" class="form-control" name="aciklama" value="<%=yardimkarar.getAcıklama()%>">
                    </div>
                    <label class="col-sm-2 col-form-label required">Yardım Tutarı</label>
                    <div class="col-sm-4">
                      <input type="number" class="form-control" name="yardim_tutari" value="<%=yardimkarar.getYardımTutari()%>" required>
                    </div>
                  </div>

                  <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Kilitli mi?</label>
                    <div class="col-sm-4">
                      <select class="form-control" name="kilit">
                        <option value="Evet"  <%= yardimkarar.getKilit().equals("Evet") ? "selected" : "" %> >Evet</option>
                        <option value="Hayır"  <%= yardimkarar.getKilit().equals("Hayır") ? "selected" : "" %> >Hayır</option>
                      </select>
                    </div>

                    <label class="col-sm-2 col-form-label required">Adet/Sayı</label>
                    <div class="col-sm-4">
                      <input type="number" class="form-control" name="adet" value="<%=yardimkarar.getAdet() %>" required>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Cinsiyet</label>
                    <div class="col-sm-4">
                      <select class="form-control" name="cinsiyet">
                        <option>Kadın</option>
                        <option value="Kadın"  <%= yardimkarar.getCinsiyet().equals("Kadın") ? "selected" : "" %> >Kadın</option>
                        <option value="Erkek"  <%= yardimkarar.getCinsiyet().equals("Erkek") ? "selected" : "" %> >Erkek</option>
                        <option <%= yardimkarar.getCinsiyet().equals("Belirtmek İstemiyorum") ? "selected" : "" %> >Belirtmek İstemiyorum</option>
                      </select>
                    </div>

                    <label class="col-sm-2 col-form-label">Teslim Eden Kişi</label>
                    <div class="col-sm-4">
                      <select class="form-control" name="teslim_kişi">
                        <% for(KullaniciBilgi k: kullanici){ %>
                        <option <%= k.getAppliName().equals(yardimkarar.getTeslimKisi()) ? "selected" : "" %>><%=k.getAppliName()%></option>
                        <%}%>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row">
                    <label class="col-sm-2 col-form-label">İtiraz mı?</label>
                    <div class="col-sm-4">
                      <input type="checkbox" id="itiraz" name="itiraz" value="itiraz">
                    </div>
                  </div>
                </div>

                <!-- /.card-body -->
            </div>
            <!-- /.card -->
            <div class="card card-secondary">
              <div class="card-header">
                <h3 class="card-title">Red Sebebi</h3>
              </div>
              <div class="card-body">
                <div class="form-group row">
                  <div class="col-sm-4">
                    <input type="checkbox" id="sebep1" name="sebep" value="Yüksek Gelir">
                    <label for="sebep1">Yüksek Gelir</label><br/>
                    <input type="checkbox" id="sebep2" name="sebep" value="Alışkanlık Haline Getirilmesi">
                    <label for="sebep2">Alışkanlık Haline Getirilmesi</label><br/>
                    <input type="checkbox" id="sebep3" name="sebep" value="Yalan Beyan">
                    <label for="sebep3">Yalan Beyan</label><br/>
                    <input type="checkbox" id="sebep4" name="sebep" value="Araç Durumu">
                    <label for="sebep4">Araç Durumu</label><br>
                    <input type="checkbox" id="sebep5" name="sebep" value="Tek Yaşıyor Fakat Bakacak Çocuk Sayısı Fazla">
                    <label for="sebep5">Tek Yaşıyor Fakat Bakacak Çocuk Sayısı Fazla</label><br/>
                    <input type="checkbox" id="sebep6" name="sebep" value="Yakın Zamanda Yardım Yapılmış Olması">
                    <label for="sebep6">Yakın Zamanda Yardım Yapılmış Olması</label><br>
                  </div>
                  <div class="col-sm-4">
                    <input type="checkbox" id="sebep7" name="sebep" value="Evde Çalışabilecek Yaşta Bireylerin Olması">
                    <label for="sebep7">Evde Çalışabilecek Yaşta Bireylerin Olması</label><br/>
                    <input type="checkbox" id="sebep8" name="sebep" value="Sigortalı İşte Çalışmama">
                    <label for="sebep8">Sigortalı İşte Çalışmama</label><br/>
                    <input type="checkbox" id="sebep9" name="sebep" value="Sorumsuzluk">
                    <label for="sebep9">Sorumsuzluk</label><br/>
                    <input type="checkbox" id="sebep10" name="sebep" value="Gayrimenkul Durumu">
                    <label for="sebep10">Gayrimenkul Durumu</label><br/>
                    <input type="checkbox" id="sebep11" name="sebep" value="Ziynet Eşya">
                    <label for="sebep11">Ziynet Eşya</label><br/>
                    <input type="checkbox" id="sebep12" name="sebep" value="Yaşının Genç Olması">
                    <label for="sebep12">Yaşının Genç Olması</label><br/>
                  </div>
                </div>
              </div>
            </div>
            <div class="card card-secondary">
              <div class="card-header">
                <h3 class="card-title">Yardım Kart Bilgileri</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">

                <div class="form-group row">
                  <label class="col-sm-2 col-form-label required">Yardım Kart No:</label>
                  <div class="col-sm-4">
                    <input type="number" class="form-control" name="yardim_kart_no" value="<%=yardimkarar.getYardımKartNo()%>" required>
                  </div>

                  <label  class="col-sm-2 col-form-label required">Karta Yüklenen Miktar:</label>
                  <div class="col-sm-4">
                    <input type="number" class="form-control" name="kart_miktar" value="<%=yardimkarar.getKartMiktar()%>" required>
                  </div>
                </div>

                <div class="form-group row">
                  <label class="col-sm-2 col-form-label">Yardım Kart Durum:</label>
                  <div class="col-sm-4">
                    <select class="form-control" name="yardım_kart_durum">
                      <option value="Pasif"  <%= yardimkarar.getYardımKartDurum().equals("Pasif") ? "selected" : "" %> >Pasif</option>
                      <option value="Aktif"  <%= yardimkarar.getYardımKartDurum().equals("Aktif") ? "selected" : "" %> >Aktif</option>
                    </select>
                  </div>

                  <label  class="col-sm-2 col-form-label">Sadece Belirtilen Alt Tip:</label>
                  <div class="col-sm-4">
                    <select class="form-control" name="belirtilen_alt_tip">
                      <option value="Evet"  <%= yardimkarar.getSadeceAltTip().equals("Evet") ? "selected" : "" %> >Evet</option>
                      <option value="Hayır"  <%= yardimkarar.getSadeceAltTip().equals("Hayır") ? "selected" : "" %> >Hayır</option>
                    </select>
                  </div>
                </div>

                <div class="form-group row">
                  <label class="col-sm-2 col-form-label required">Yardım Başlangıç Tarihi:</label>
                  <div class="col-sm-4">
                    <input type="date" class="form-control" name="yardim_bas_tarihi" value="<%=yardimkarar.getYarBaslangıcTarihi()%>" required>
                  </div>

                  <label  class="col-sm-2 col-form-label required">Kredi Bitiş Tarihi:</label>
                  <div class="col-sm-4">
                    <input type="date" class="form-control" name="kredi_bitis_tarihi" value="<%=yardimkarar.getKrediBitisTarihi()%>" required>
                  </div>
                </div>

              </div>
              <div class="row justify-content-center mb-2 pb-2"> <!-- Butonu alt satırda ortalamak için d-flex ve justify-content-center sınıflarını kullanıyoruz -->
                <button type="submit" class="btn btn-primary">Kaydet</button>
              </div>
            </div>

            </form>
          </div>

        </div>
      </div>
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


<!-- Bootstrap 4 -->

<!-- DataTables -->

<!-- AdminLTE App -->

<!-- AdminLTE for demo purposes -->

<!-- page script -->





</body>
</html>
