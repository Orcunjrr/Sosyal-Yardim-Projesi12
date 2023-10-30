<%@ page import="com.example.example.DataBase.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%

  List<YardimTipi> yardimtipi = YardimTipi.getAll();
  List<YardimTipiAlt> yardimalttip= YardimTipiAlt.getAll();
  List<YonlendirilenKurum> yonKurum = YonlendirilenKurum.getAll();
  List<District> mahalle = District.getAllDistrict();
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
            <h1>Yardım Liste Özel</h1>
            <ol class="breadcrumb ">
              <li class="breadcrumb-item"><a href="#">Anasayfa</a></li>
              <li class="breadcrumb-item"><a href="#">İşlemlerim</a></li>
              <li class="breadcrumb-item"><a href="#">Yardım Kararı</a></li>
              <li class="breadcrumb-item active">Yardım Liste Özel</li>
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
                <h3 class="card-title">Yardım Karar Liste Kriterleri</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form action="yardimkararilisteleme" method="post">
                <div class="card-body">
                  <div class="form-group row">

                    <label class="col-sm-2 col-form-label">Karar No: </label>
                    <div class="col-sm-4">
                      <input type="number" class="form-control" id="yKurum" name=""/>
                    </div>


                    <label class="col-sm-2 col-form-label">Karar Tarihi</label>
                    <div class="col-sm-4">
                      <div class="input-group">
                        <input type="date" class="form-control" name="baslangic_tarihi">
                        <div class="input-group-text">-</div>
                        <input type="date" class="form-control" name="bitis_tarihi">
                      </div>
                    </div>
                  </div>



                  <div class="form-group row">

                    <label class="col-sm-2 col-form-label">Müraacat No:</label>

                    <div class="col-sm-4">
                      <input type="number" class="form-control" name="">
                    </div>


                    <label class="col-sm-2 col-form-label">Kayıt Tarihi</label>
                    <div class="col-sm-4">
                      <div class="input-group">
                        <input type="date" class="form-control" name="baslangic_tarihi">
                        <span class="input-group-text">-</span>
                        <input type="date" class="form-control" name="bitis_tarihi">
                      </div>
                    </div>
                  </div>






                  <div class="form-group row">

                    <label class="col-sm-2 col-form-label">Adı:</label>
                    <div class="col-sm-4 input-group">
                      <input type="text" class="form-control" name="ad">
                    </div>


                    <label class="col-sm-2 col-form-label">Yardım Statu:</label>
                    <div class="col-sm-4">
                      <select class="form-control" name="">
                        <option selected disabled>Lütfen Seçiniz</option>
                        <option>Komisyon Kabul</option>
                        <option>Komisyon Red</option>
                        <option>Red</option>
                        <option>Kabul</option>
                        <option>Hizmet Verildi</option>
                        <option>Randevu Alındı</option>
                      </select>
                    </div>
                  </div>



                  <div class="form-group row">

                    <label class="col-sm-2 col-form-label"> Soyadı:</label>
                    <div class="col-sm-4">
                      <input type="text" class="form-control" name="soyad">
                    </div>


                    <label class="col-sm-2 col-form-label">Yardım Tip/Grup:</label>
                    <div class="col-sm-4">
                      <input type="hidden" name="muracaatid" value="">
                      <select class="form-control"  name="yardim_tipi">
                        <% for(YardimTipi y: yardimtipi){ %>
                        <option><%=y.getHelpName()%></option>
                        <%}%>
                      </select>
                    </div>
                  </div>



                  <div class="form-group row ">

                    <label class="col-sm-2 col-form-label">T.C. Kimlik No:</label>
                    <div class="col-sm-4 input-group">
                      <input type="number" class="form-control" name="tcKimlik" maxlength="11">
                    </div>



                    <label class="col-sm-2 col-form-label">Yardım Alt Tip/Grup:</label>
                    <div class="col-sm-4">
                      <select class="form-control" name="yardim_alt_tip">
                        <% for(YardimTipiAlt yarAlt: yardimalttip){ %>
                        <option><%=yarAlt.getHelpSubName()%></option>
                        <%}%>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row">


                    <label class="col-sm-2 col-form-label">Tespit No:</label>
                    <div class="col-sm-4">
                      <input type="number" class="form-control" name="">
                    </div>

                    <label class="col-sm-2 col-form-label">Son Yardım:</label>
                    <div class="col-sm-4">
                      <select class="form-control" name="">
                        <option selected disabled>Lütfen Seçiniz</option>
                        <option>evet</option>
                        <option>Hayır</option>
                        <option>Hepsi</option>
                      </select>
                    </div>
                  </div>




                  <div class="form-group row">

                    <label class="col-sm-2 col-form-label">İlçe:</label>
                    <div class="col-sm-4">
                      <select class="form-control" name="">
                        <option>GEBZE</option>
                      </select>
                    </div>


                    <label class="col-sm-2 col-form-label">Yardım Kart Durum:</label>
                    <div class="col-sm-4">
                      <select class="form-control" name="">
                        <option selected disabled>Lütfen Seçiniz</option>
                        <option>Aktif</option>
                        <option>Pasif</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row">

                    <label class="col-sm-2 col-form-label">Mahalle:</label>
                    <div class="col-sm-4">
                      <select class="form-control" name="mahalle">
                        <% for(District mah : mahalle) {%>
                        <option value="<%= mah.getDistrictID() %>" ><%= mah.getDistrictName() %></option>
                        <%} %>
                      </select>
                    </div>



                    <label class="col-sm-2 col-form-label">Yardım Kart No:</label>
                    <div class="col-sm-4">
                      <input type="number" class="form-control" name="">
                    </div>
                  </div>


                  <div class="form-group row">

                    <label class="col-sm-2 col-form-label">Cadde/Sokak:</label>
                    <div class="col-sm-4">
                      <select class="form-control" name="">
                        <option>Lütfen Seçiniz</option>
                      </select>
                    </div>


                    <label class="col-sm-2 col-form-label">Çekmece:</label>
                    <div class="col-sm-4">
                      <select class="form-control" name="">
                        <option selected disabled>Lütfen Seçiniz</option>
                        <option>Aktif</option>
                        <option>Pasif</option>
                      </select>
                    </div>
                  </div>

                  <div class="form-group row ">

                    <label class="col-sm-2 col-form-label">Toplam Tutar:</label>
                    <div class="col-sm-4">
                      <div class="input-group">
                        <input type="text" class="form-control" name="">
                        <div class="input-group-text">-</div>
                        <input type="text" class="form-control" name="">
                      </div>
                    </div>


                    <label class="col-sm-2 col-form-label">Dosya Karar Sayısı:</label>
                    <div class="col-sm-4">
                      <input type="text" class="form-control" name="">
                    </div>
                  </div>

                  <div class="form-group row">

                    <label class="col-sm-2 col-form-label">Yardım Dönemleri:</label>
                    <div class="col-sm-4">
                      <select class="form-control" name="yardim_dönemleri">
                        <option selected disabled>Lütfen Seçiniz</option>
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


                    <label class="col-sm-2 col-form-label">Adet/Sayı:</label>
                    <div class="col-sm-4 input-group">
                      <input type="number" class="form-control" name="">
                    </div>
                  </div>

                  <div class="form-group row">

                    <label class="col-sm-2 col-form-label"> Yönlendiren Birim:</label>
                    <div class="col-sm-4">
                      <select class="form-control" name="yonlendiren_birim">
                        <% for(YonlendirilenKurum yk: yonKurum){ %>
                        <option><%yk.getYonlendirilenKurumName();%></option>
                        <% } %>
                      </select>
                    </div>


                    <label class="col-sm-2 col-form-label">Bölge:</label>
                    <div class="col-sm-4">
                      <input type="text" class="form-control" name="">
                    </div>
                  </div>

                  <div class="form-group row ">

                    <label class="col-sm-2 col-form-label">Yardım Başlangıç Tarihi:</label>
                    <div class="col-sm-4">
                      <div class="input-group">
                        <input type="date" class="form-control" name="baslangic_tarihi">
                        <div class="input-group-text">-</div>
                        <input type="date" class="form-control" name="bitis_tarihi">
                      </div>
                    </div>



                    <label class="col-sm-2 col-form-label">İtiraz mı?</label>
                    <div class="col-sm-4">
                      <label><input type="radio" name="itirazDurumu" value="var"> İtiraz Var</label>
                      <label><input type="radio" name="itirazDurumu" value="yok"> İtiraz Yok</label>
                    </div>
                  </div>

                  <div class="form-group row ">

                    <label class="col-sm-2 col-form-label">Kredi Bitiş Tarihi:</label>
                    <div class="col-sm-4">
                      <div class="input-group">
                        <input type="date" class="form-control" name="baslangic_tarihi">
                        <div class="input-group-text">-</div>
                        <input type="date" class="form-control" name="bitis_tarihi">
                      </div>
                    </div>

                    <label class="col-sm-2 col-form-label">Red Sebebi:</label>
                    <div class="col-sm-4">
                      <select class="form-control" name=""  multiple="true" >
                        <option>Yüksek Gelir</option>
                        <option>Evde Çalışabilicek Yaşta Bireylerin Olması</option>
                        <option>Alışkanlık Haline Getirilmesi</option>
                        <option>Sigortalı İşte Çalışılmama</option>
                        <option>Yalan Beyan</option>
                        <option>Sorumsuzluk</option>
                        <option>Araç Durumu</option>
                        <option>Gayrimenkul Durumu</option>
                        <option>Tek Yaşıyor Fakat Bakıcak Çocuk Sayısı Fazla</option>
                        <option>Ziynet Eşya</option>
                      </select>
                    </div>
                  </div>

                <!-- /.card-body -->




                  <div class="d-flex justify-content-center mt-3 pt-3"> <!-- Butonu ortalamak için d-flex ve justify-content-center sınıflarını kullanıyoruz -->


                    <button type="submit" class="btn btn-primary mr-1">Sorgula</button>
                  <button type="submit" class="btn btn-default ml-1">Temizle</button>
                </div>
              </form>
            </div>

            <!-- /.card -->

          </section>



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
                        <h3 class="card-title">Yardım Kararı Bilgileri</h3>
                      </div>
                      <!-- /.card-header -->
                      <div class="card-body">
                        <div class="row">
                          <div class="col-12">
                            <div class="table-responsive" style="overflow-x: auto;">
                              <table id="example2" class="table table-bordered table-hover" style="width: 100%; table-layout: fixed;">
                                <% List<YardimKarari> yardimlist = (List<YardimKarari>) request.getAttribute("yardimKararList");
                                  if (yardimlist != null && !yardimlist.isEmpty()) { %>
                                <colgroup>
                                  <col style="width: 50px;">
                                  <col style="width: 110px;">
                                  <col style="width: 140px;">
                                  <col style="width: 100px;">
                                  <col style="width: 150px;">
                                  <col style="width: 140px;">
                                  <col style="width: 170px;">
                                  <col style="width: 160px;">
                                  <col style="width: 180px;">
                                  <col style="width: 140px;">
                                  <col style="width: 170px;">
                                  <col style="width: 170px;">
                                  <col style="width: 170px;">
                                  <col style="width: 170px;">
                                  <col style="width: 110px;">
                                  <col style="width: 110px;">
                                  <col style="width: 140px;">
                                  <col style="width: 100px;">
                                  <col style="width: 150px;">
                                  <col style="width: 140px;">
                                  <col style="width: 170px;">
                                  <col style="width: 160px;">
                                  <col style="width: 180px;">
                                  <col style="width: 140px;">
                                  <col style="width: 170px;">
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
                                  <th>Kullanıcı Id</th>
                                  <th>Karar Id No</th>
                                  <th>Cinsiyet</th>
                                  <th>Açıklama</th>
                                  <th>Adet</th>
                                  <th>Dosya Karar Sayısı</th>
                                  <th>Dosya Tarihi</th>
                                  <th>İtiraz</th>
                                  <th>Kredi Bitiş Tarihi</th>
                                  <th>Red Sebepleri</th>
                                  <th>Kart Miktar</th>
                                  <th>Yardım Dönemleri</th>
                                  <th>Yardım Kart Durumu </th>
                                  <th>Yardım Statü</th>
                                  <th>Yardım Kart No</th>
                                  <th>Yönlendiren Kurum</th>
                                  <th>Yardım Teslim Tarihi</th>
                                  <th>Yardım Başlangıç Tarihi</th>
                                  <th>Yardım Tip</th>
                                  <th>Yardım Alt Tip</th>
                                  <th>Teslim Eden Kişi</th>
                                  <th>Sadece Alt Tip</th>
                                  <th>Yardım Tutarı</th>
                                  <th>Kilit</th>





                                </tr>
                                </thead>
                                <tbody>
                                <% for (YardimKarari yardımBilgi : yardimlist) { %>
                                <tr>
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
                                  <td><%=yardımBilgi.getKullanici_id().getIdNo()%></td>
                                  <td><%=yardımBilgi.getKararId()%> </td>
                                  <td><%=yardımBilgi.getCinsiyet()%></td>
                                  <td><%=yardımBilgi.getAcıklama()%> </td>
                                  <td><%=yardımBilgi.getAdet()%> </td>
                                  <td><%=yardımBilgi.getDosKarSayısı()%></td>
                                  <td><%=yardımBilgi.getDosyaTarihi()%> </td>
                                  <td><%=yardımBilgi.getItiraz()%> </td>
                                  <td><%=yardımBilgi.getKrediBitisTarihi()%> </td>
                                  <td><%=yardımBilgi.getRedSebepler()%> </td>
                                  <td><%=yardımBilgi.getKartMiktar()%></td>
                                  <td><%=yardımBilgi.getYardımDönem()%></td>
                                  <td><%=yardımBilgi.getYardımKartDurum()%></td>
                                  <td><%=yardımBilgi.getYardimStatu()%></td>
                                  <td><%=yardımBilgi.getYardımKartNo()%></td>
                                  <td><%=yardımBilgi.getYönlendirenKurum()%></td>
                                  <td><%=yardımBilgi.getYarTeslimTarihi()%></td>
                                  <td><%=yardımBilgi.getYarBaslangıcTarihi()%></td>
                                  <td><%=yardımBilgi.getYardimTip()%></td>
                                  <td><%=yardımBilgi.getYardimAltTip()%></td>
                                  <td><%=yardımBilgi.getTeslimKisi()%></td>
                                  <td><%=yardımBilgi.getSadeceAltTip()%></td>
                                  <td><%=yardımBilgi.getYardımTutari()%></td>
                                  <td><%=yardımBilgi.getKilit()%></td>
                                </tr>
                                <%}%>
                                </tbody>
                                <%}%>
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

<!-- Bootstrap 4 -->

<!-- DataTables -->

<!-- AdminLTE App -->

<!-- AdminLTE for demo purposes -->

<!-- page script -->





</body>
</html>
