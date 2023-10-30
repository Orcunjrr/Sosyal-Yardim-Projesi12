<%@ page import="com.example.example.DataBase.*" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
  HttpSession userSession = request.getSession();
  String roleName = "Role_Tutanak_Listele";

  if (!Rol.hasRole(userSession, roleName)) {
    response.sendRedirect("../Error/Error.html");
  }
  List<District> mahalle = District.getAllDistrict();
  List<cekmece> cekmeces = cekmece.getAllUserInfo();
  List<TalepYardimTip> TalepYardim = TalepYardimTip.getAll();
  List<Bolge> bolge = Bolge.getAllZone();
  List<YonlendirilenKurum> yonKurum = YonlendirilenKurum.getAll();
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



  <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
  <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
  <!-- Google Font: Source Sans Pro -->
  <link
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
    rel="stylesheet">
  <style>
    .inline-form {
      display: flex;
      align-items: center;
    }
    .inline-form label {
      flex: 1;
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
            <h1>Tutanak Listesi</h1>
            <ol class="breadcrumb ">
              <li class="breadcrumb-item"><a href="#">Anasayfa</a></li>
              <li class="breadcrumb-item"><a href="#">İşlemlerim</a></li>
              <li class="breadcrumb-item"><a href="#">Tutanak</a></li>
              <li class="breadcrumb-item active">Tutanak Listesi</li>
            </ol>
          </div>

        </div>
      </div>
      <!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section>
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <!-- left column -->
            <div class="col-md-12">
              <!-- general form elements -->



              <div class="card card-secondary">
                <div class="card-header">
                  <h3 class="card-title">Tutanak Listesi</h3>
                </div>
                <% if (request.getAttribute("mess") != null) { %>
                <h3 class="fw-bolder " style="color: cornflowerblue;">
                  <label><%=request.getAttribute("mess")%></label>
                </h3>
                <% } %>
                <!-- /.card-header -->
                <!-- form start -->
                <form action="tutanaklist" method="post">
                <div>
                  <div class="card-body">
                    <div class="row">
                      <!-- Sol Sutün-->

                      <div class="col-md-6">

                        <div class="inline-form">
                          <label class="col-form-label col-sm-3">Tespit No: </label>
                          <div class="col-sm-7">
                            <input type="number" class="form-control" id="tespitNo" name="tespitNo"/>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-form-label col-sm-3">Müracaat No: </label>
                          <div class="col-sm-7">
                            <input type="number" class="form-control" id="muracaatNo" name="muracaatNo"/>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-form-label col-sm-3">T.C. Kimlik No: </label>
                          <div class="col-sm-7">
                            <input type="text" class="form-control" name="tckimlik" maxlength="11"/>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-form-label col-sm-3">Ad-Soyad: </label>
                          <div class="col-sm-7">
                            <div class="input-group">
                              <input type="text" class="form-control" name="name">
                              <div class="input-group-text">-</div>
                              <input type="text" class="form-control" name="soyisim">
                            </div>
                          </div>
                        </div>
                        <div class="inline-form mt-2">
                         <label class="col-sm-3 col-form-label">İlçe:</label>
                          <div class="col-sm-7">
                            <select class="form-control" name="ilce">
                             <option>GEBZE</option>
                            </select>
                          </div>
                        </div>
                        <div class="inline-form mt-2">
                          <label class="col-sm-3 col-form-label">Mahalle:</label>
                          <div class="col-sm-7">
                            <select class="form-control" name="mahalle" id="mahalleSelect">
                              <option value="-1" selected>Mahalle Seçiniz</option>
                              <% for(District mah : mahalle) {%>
                              <option value="<%= mah.getDistrictID() %>" ><%= mah.getDistrictName() %></option>
                              <%} %>
                            </select>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-sm-3 col-form-label">Cadde/Sokak:</label>
                          <div class="col-sm-7">
                            <input type="number" class="form-control" name="sokak">
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-sm-3 col-form-label">Adres No:</label>
                          <div class="col-sm-7">
                            <input type="number" class="form-control" name="addressNo">
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-sm-3 col-form-label">Ev Tipi:</label>
                          <div class="col-sm-7">
                            <select class="form-control" name="" multiple>
                              <option>Ev Sahibi</option>
                              <option>Kira</option>
                              <option>Diğer</option>
                              <option>Yakını Evi</option>
                              <option>Baraka</option>
                              <option>Evsiz</option>
                            </select>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-sm-3 col-form-label">Ev Tipi:</label>
                          <div class="col-sm-7">
                            <select class="form-control" name="evTip" multiple>
                              <option>Daire</option>
                              <option>Gecekondu</option>
                              <option>Müstakil</option>
                              <option>Baraka</option>
                              <option>Çadır</option>
                              <option>Daire 1+1</option>
                              <option>Daire 2+1</option>
                              <option>Daire 3+1</option>
                            </select>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-sm-3 col-form-label">Yakacak Tipi:</label>
                          <div class="col-sm-7">
                            <select class="form-control" name="yakacakTip" multiple>
                              <option>Soba</option>
                              <option>Kombi</option>
                              <option>Elektrik</option>
                              <option>Katalitik</option>
                              <option>Doğalgaz Sobası</option>
                            </select>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-sm-3 col-form-label">Arşiv Dosya No:</label>
                          <div class="col-sm-7">
                            <select class="form-control" name="">
                              <option>...</option>
                            </select>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-sm-3 col-form-label">Çekmece:</label>
                          <div class="col-sm-7">
                            <select class="form-control" name="cekmece" multiple>
                              <%for(cekmece ckmc : cekmeces){%>
                              <option value="<%=ckmc.getCekmeceId()%>"><%=ckmc.getCekmeceAdi()%></option>
                              <%}%>
                            </select>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-sm-3 col-form-label">Talep Edilen Yardımlar:</label>
                          <div class="col-sm-7">
                            <select class="form-control" name="talep" multiple>
                              <%for(TalepYardimTip yardim : TalepYardim){%>
                              <option value="<%=yardim.getTalepYardimId()%>"><%=yardim.getTalepYardimAdi()%></option>
                              <%}%>
                            </select>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-sm-3 col-form-label">Yardım Alma Durumu:</label>
                          <div class="col-sm-7">
                            <select class="form-control" name="YardimDurum">
                              <option>Hepsi</option>
                              <option>Yardım Alan</option>
                              <option>Yardım Almayan</option>
                            </select>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                         <label class="col-sm-3 col-form-label">Bölge</label>
                         <div class="col-sm-7">
                           <select class="form-control" name="bolge">
                             <% for(Bolge bol : bolge) { %>
                             <option value="<%= bol.getZoneId() %>" ><%= bol.getZoneName() %></option>
                             <%} %>
                           </select>
                         </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-sm-3 col-form-label">Durum:</label>
                          <div class="col-sm-7">
                            <select class="form-control" name="durum" >
                              <option>Hepsi</option>
                              <option>Talep İptal</option>
                              <option>Ulaşılamadı</option>
                              <option>Sonuçlandı</option>
                              <option>Tahkikata sevk</option>
                              <option>Değerlendirme Komisyonu</option>
                              <option>Beklemede</option>
                            </select>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-sm-3 col-form-label"> Yönlendiren Birim</label>
                          <div class="col-sm-7">
                            <select class="form-control" name="yonlendiren_birim">
                              <% for(YonlendirilenKurum yk: yonKurum){ %>
                              <option><%=yk.getYonlendirilenKurumName()%></option>
                              <% } %>
                            </select>
                          </div>
                        </div>



                      </div>


                      <!-- Sağ Sutün-->
                      <div class="col-md-6">

                        <div class="inline-form">
                          <label class="col-form-label col-sm-4">Sağlık problemi Var Mı?:</label>
                          <div class="col-sm-6">
                            <select class="form-control" name="saglikp">
                              <option>YOK</option>
                              <option>VAR</option>
                            </select>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-form-label col-sm-4">Ailede Engelli Var Mı?:</label>
                          <div class="col-sm-6">
                            <select class="form-control" name="engelli">
                              <option>YOK</option>
                              <option>VAR</option>
                            </select>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-form-label col-sm-4">Sosyal Yardım Güvencesi Var Mı?:</label>
                          <div class="col-sm-6">
                            <select class="form-control" name="sosyalguv">
                              <option>YOK</option>
                              <option>VAR</option>
                            </select>
                          </div>
                        </div>


                        <div class="inline-form mt-2">
                          <label class="col-form-label col-sm-4">Sosyal Güvencesi:</label>
                          <div class="col-sm-6">
                            <select class="form-control" name="sosyalguv">
                              <option selected disabled>Lütfen Seçiniz</option>
                              <option>Bağkur</option>
                              <option>Emekli Sandığı</option>
                              <option>SGK</option>
                              <option>Yeşil Kart</option>
                              <option>Genel Sağlık</option>
                              <option>18 Yaş Altı</option>
                            </select>
                          </div>
                        </div>


                        <div class="inline-form mt-2">
                          <label class="col-form-label col-sm-4">Yardım Alınan Kurumlar:</label>
                          <div class="col-sm-6">
                            <select class="form-control" name="" multiple>
                              <option>Engelli Maaşı</option>
                              <option>Emekli Maaşı</option>
                              <option>Diğer Özel Vakıflar</option>
                              <option>Büyük Şeh. Bel.</option>
                              <option>Evde Bakım</option>
                            </select>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-form-label col-sm-4">Medeni Durum:</label>
                          <div class="col-sm-6">
                            <select class="form-control" name="medenidurum" multiple>
                              <option>Evli</option>
                              <option>Bekar</option>
                              <option>Dul</option>
                              <option>Boşanmış</option>
                            </select>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-form-label col-sm-4">Eş Durumu:</label>
                          <div class="col-sm-6">
                            <select class="form-control" name="" multiple>
                              <option>Terk</option>
                              <option>Asker</option>
                              <option>Kayıp</option>
                              <option>Mahkum</option>
                              <option>Resmi Nikah Yok</option>
                            </select>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-form-label col-sm-4">Eş Ad Soyad: </label>
                          <div class="col-sm-6">
                            <div class="input-group">
                              <input type="text" class="form-control" name="esAd">
                              <div class="input-group-text">-</div>
                              <input type="text" class="form-control" name="esSoyAd">
                            </div>
                          </div>
                        </div>


                        <div class="inline-form mt-2">
                          <label class="col-form-label col-sm-4">Eş Durumu:</label>
                          <div class="col-sm-6">
                            <select class="form-control" name="">
                              <option selected disabled>Lütfen Seçiniz</option>
                              <option>Okur Yazar Değil</option>
                              <option>Okur Yazar</option>
                              <option>Ana OKulu</option>
                              <option>İlkÖğretim</option>
                              <option>OrtaOkul</option>
                              <option>Lise</option>
                              <option>Üniversite</option>
                              <option>Yüksek</option>
                              <option>Diğer</option>
                            </select>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-form-label col-sm-4">Ailede Yaşayan Kişi Sayısı: </label>
                          <div class="col-sm-6">
                            <div class="input-group">
                              <input type="Number" class="form-control" name="">
                              <div class="input-group-text">-</div>
                              <input type="number" class="form-control" name="">
                            </div>
                          </div>
                        </div>
                        <div class="inline-form mt-2">
                         <label class="col-sm-4 col-form-label">Doğum Tarihi Aralığı:</label>
                          <div class="col-sm-6">
                            <div class="input-group">
                              <input type="date" class="form-control" name="baslangic_tarihi">
                              <div class="input-group-text">-</div>
                              <input type="date" class="form-control" name="bitis_tarihi">
                            </div>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                         <label class="col-sm-4 col-form-label">Tutanak Giriş Tarihi :</label>
                         <div class="col-sm-6">
                           <div class="input-group">
                             <input type="date" class="form-control" name="baslangic_tarihi">
                             <div class="input-group-text">-</div>
                             <input type="date" class="form-control" name="bitis_tarihi">
                           </div>
                         </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-sm-4 col-form-label">Tutanak Güncelleme Tarihi:</label>
                          <div class="col-sm-6">
                            <div class="input-group">
                              <input type="date" class="form-control" name="baslangic_tarihi">
                              <div class="input-group-text">-</div>
                              <input type="date" class="form-control" name="bitis_tarihi">
                            </div>
                          </div>
                        </div>


                        <div class="inline-form mt-2">
                          <label class="col-sm-4 col-form-label required">Asker Var mı?</label>
                          <div class="form-group clearfix col-sm-6">
                            <div class="icheck-primary d-inline mt-2">
                              <input type="radio" id="radioPrimary1" name="asker"  value="E" required>
                              <label for="radioPrimary1">
                                Evet
                              </label>
                            </div>
                            <div class="icheck-primary d-inline mt-2">
                              <input type="radio" id="radioPrimary2" name="asker" value="K" required>
                              <label for="radioPrimary2">
                                Hayır
                              </label>
                            </div>
                            <div class="icheck-primary d-inline mt-2">
                              <input type="radio" id="radioPrimary3" name="asker" value="H" required checked="checked">
                              <label for="radioPrimary3">
                                Hepsi
                              </label>
                            </div>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-sm-4 col-form-label required">Şehit Var mı?</label>
                          <div class="form-group clearfix col-sm-6">
                            <div class="icheck-primary d-inline mt-2">
                              <input type="radio" id="radioPrimary4" name="sehit"  value="E">
                              <label for="radioPrimary4">
                                Evet
                              </label>
                            </div>
                            <div class="icheck-primary d-inline mt-2">
                              <input type="radio" id="radioPrimary5" name="sehit" value="K">
                              <label for="radioPrimary5">
                                Hayır
                              </label>
                            </div>
                            <div class="icheck-primary d-inline mt-2">
                              <input type="radio" id="radioPrimary6" name="sehit" value="H" checked="checked">
                              <label for="radioPrimary6">
                                Hepsi
                              </label>
                            </div>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-sm-4 col-form-label required">Gazi Var mı?</label>
                          <div class="form-group clearfix col-sm-6">
                            <div class="icheck-primary d-inline mt-2">
                              <input type="radio" id="radioPrimary7" name="gazi"  value="E" >
                              <label for="radioPrimary7">
                                Evet
                              </label>
                            </div>
                            <div class="icheck-primary d-inline mt-2">
                              <input type="radio" id="radioPrimary8" name="gazi" value="K">
                              <label for="radioPrimary8">
                                Hayır
                              </label>
                            </div>
                            <div class="icheck-primary d-inline mt-2">
                              <input type="radio" id="radioPrimary9" name="gazi" value="H" checked="checked">
                              <label for="radioPrimary9">
                                Hepsi
                              </label>
                            </div>
                          </div>
                        </div>

                        <div class="inline-form mt-2">
                          <label class="col-sm-4 col-form-label required">Son Tutanak mı?</label>
                          <div class="form-group clearfix col-sm-6">
                            <div class="icheck-primary d-inline mt-2">
                              <input type="radio" id="radioPrimary10" name="sontutanak"  value="E">
                              <label for="radioPrimary10">
                                Evet
                              </label>
                            </div>
                            <div class="icheck-primary d-inline mt-2">
                              <input type="radio" id="radioPrimary11" name="sontutanak" value="K">
                              <label for="radioPrimary11">
                                Hayır
                              </label>
                            </div>
                            <div class="icheck-primary d-inline mt-2">
                              <input type="radio" id="radioPrimary12" name="sontutanak" value="H" checked="checked">
                              <label for="radioPrimary12">
                                Hepsi
                              </label>
                            </div>
                          </div>
                        </div>

                      </div>
                    </div>

                    <!-- /.card-body -->

                    <div class="d-flex justify-content-center mt-3 pt-3"> <!-- Butonu ortalamak için d-flex ve justify-content-center sınıflarını kullanıyoruz -->
                      <button type="submit" class="btn btn-primary mr-1">Sorgula</button>
                      <button type="submit" class="btn btn-default ml-1">Temizle</button>
                    </div>
                  </div>
                </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

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
                <h3 class="card-title">Tutanak Listele</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="row">
                  <div class="col-12">
                    <div class="table-responsive" style="overflow-x: auto;">

                      <table id="example2" class="table table-bordered table-hover" style="width: 100%; table-layout: fixed;">
                        <% List<Tutanak> filteredUsers = (List<Tutanak>) request.getAttribute("filteredUsers");
                          if (filteredUsers == null || filteredUsers.isEmpty()) { %>
                        <h2 class="fw-bolder " style="color: red;">
                          <label>Kayıt bulunamadı!</label>
                        </h2>
                        <%}else{%>
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
                          <th>TUTANAK ID</th>
                          <th>Başvuran Kişi</th>
                          <th>Borç Durumu</th>
                          <th>Araba</th>
                          <th>Engelli Var mı?</th>
                          <th>Çekmece</th>
                          <th>Asker var mı?</th>
                          <th>Durum</th>
                          <th>Ev Durumu</th>
                          <th>Ev Durumu Açıklama</th>
                          <th>Ev Eşyaları</th>
                          <th>Ev Tipi</th>
                          <th>Gayrimenkul</th>
                          <th>Gayrimenkul Türü</th>
                          <th>Hanedeki Kişi Sayısı</th>
                          <th>Kira mı?</th>
                          <th>Kaç evi var?</th>
                          <th>Sosyal Güvence</th>
                          <th>Talep Edilen Yardımlar</th>
                          <th>Toplam Kira Geliri</th>
                          <th>İnceleme</th>
                        </tr>
                        </thead>
                        <tbody >
                        <% for (Tutanak in : filteredUsers) { %>
                        <tr>
                          <td>
                            <a href="MuracatListesic.jsp?Id=<%= in.getId()%>">
                              <i class="fa fa-eye" style="font-size: 20px; color:black; cursor: pointer; vertical-align: middle;"></i>
                            </a>
                            <a href="TutanakGüncelle.jsp?Id=<%= in.getKullaniciId().getIdInfoId()%> ">
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
                          <td id="userId"><%=in.getId()%></td>
                          <td><%=in.getBasvuruKisi() %></td>
                          <td><%=in.getBorcDurumu() %></td>
                          <td><%=in.getArabavarmi() +' ' + in.getArabamodel() %></td>
                          <td><%=in.getEngelliVarMi()%></td>
                          <td><%=in.getCekmece()%></td>
                          <td><%=in.getAskerMi()%></td>
                          <td><%=in.getDurum()%></td>
                          <td><%=in.getEvdurumu()%></td>
                          <td><%=in.getEvDurumaciklama()%></td>
                          <td><%=in.getEvEsyalari()%></td>
                          <td><%=in.getEvtipi()%></td>
                          <td><%=in.getGayrivarmi()%></td>
                          <td><%=in.getGayritur()%></td>
                          <td><%=in.getHaneKisi()%></td>
                          <td><%=in.getKiradaMi()%></td>
                          <td><%=in.getKacev()%></td>
                          <td><%=in.getSosyalguvence()%></td>
                          <td><%=in.getTalepEdilenYardimlar()%></td>
                          <td><%=in.getTopkiragelir()%></td>
                          <td><%=in.getInceleme()%></td>
                        </tr>
                        <% } %>
                        </tbody>
                        <% }  %>
                      </table>
                    </div>
                   <!-- /.card -->
                  </div>
                  <!-- Modal -->
                </div>
              </div><!-- /.card-body -->
            </div>
          </div>
        </div>  <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
  </div>
  <!-- /.content-wrapper -->
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
<script>
  $(document).ready(function() {
    var selectedId;

    $('#example2 tbody').on('click', '.delete-button', function () {
      var userId = $(this).closest('tr').find('td#userId').text();

      console.log("Gelen Data  :"+ userId);
      selectedId = userId;
      $('#confirmationModal').modal('show');
    });

    $('#confirmDeleteButton').on('click', function() {
      $('#confirmationModal').modal('hide');
      // Silme işlemini gerçekleştirmek için gerekli kodu burada çağırabilirsiniz.
      // Örneğin: window.location.href = "silme.jsp?id=" + selectedId;
      $.get("SilKullanici", {id:selectedId})
      window.location.href = "SilTutanak?IDNO=" + selectedId;

    });

    $('#cancelDeleteButton').on('click', function() {
      $('#confirmationModal').modal('hide');

    });
  });
</script>
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
