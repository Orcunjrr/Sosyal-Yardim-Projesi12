<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="com.example.example.DataBase.*" %>
<%
  HttpSession userSession = request.getSession();
  if(!Rol.hasRole(userSession,"Role_Muracaat_Ekle")){
    response.sendRedirect("../Error/Error.html");
  }


  List<YonlendirilenKurum> yonKurum = YonlendirilenKurum.getAll();
  List<YonlendirilenAltKurum> yonAltKurum = YonlendirilenAltKurum.getAll();

  List<District> district = District.getAllDistrict();
    List<Bolge> zone = Bolge.getAllAktifZone();

%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Müracat Giriş Formu</title>
  <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
  <link href='https://fonts.googleapis.com/css?family=Lato:300,400' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="css/muracatgiris.css">

<style>
	.nbn{
		font-weight: bold;
	}
    .required:after {
      content:" *";
      color: red;
    }
</style>

</head>
<body>

<form action="adminpanel/muracat" method="post">
  <!--  General -->
  <div class="form-group">
    <h2 class="heading">Müracaat Girişi</h2>
  <div class="grid">
    <div class="col-1-2">
    <div class="controls">
      <input  type="text" id="name" class="floatLabel" name="name">
      <label for="name">İsim</label>
    </div>
    </div><div class="col-1-2">
    <div class="controls">
      <input type="text" id="soyisim" class="floatLabel nbn" name="soyisim">
      <label for="soyisim">Soyisim</label>
      </div>
    </div>
  </div>
    <div class="grid">
    <div class="col-1-2">
    <div class="controls">
      <input type="number" id="tckimlik" class="floatLabel" name="tckimlik" pattern="[0-9]{11}" title="TC Kimlik numarası yalnızca 11 haneli rakamlardan oluşmalıdır" maxlength="11" required>
      <label for="tckimlik" class="required">TC Kimlik No</label>
    </div></div>
    <div class="col-1-2">
    <div class="controls">
      <input type="tel" id="phone" name="phone" class="floatLabel" pattern="[0-9]{11}" title="Telefon numarası yalnızca 11 haneli rakamlardan oluşmalıdır" oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 11)" placeholder="Telefon Numarasını Giriniz" required maxlength="11">
      <label for="phone" class="required">Telefon</label>
    </div></div>
    </div>

    <div class="grid">
    <div class="col-1-3"><div class="controls">
      <i class="fa fa-sort"></i>
      <select class="kayitDurum" select="KayitDurum" name="KayitDurum">
        <option value="-1" selected> Kayıt durumu</option>
        <option value="Yeni Kayıt" >Yeni Kayıt</option>
        <option value="Eski Kayıt" >Eski Kayıt</option>
        <option value="Durum Desisikligi">Durum Değişikliği</option>
      </select>
      </div></div>


      <div class="col-1-3"><div class="controls">
        <i class="fa fa-sort"></i>
        <select name="il" >
          <option value="Kocaeli" selected > Kocaeli </option>
        </select>
      </div></div>
      <div class="col-1-3"><div class="controls">
        <i class="fa fa-sort"></i>
        <select name="ilce" >
          <option value="Gebze" selected > Gebze </option>
        </select>
      </div>


    </div>
    <div class="grid">
      <div class="col-1-3"><div class="controls">
        <i class="fa fa-sort"></i>
        <select name="cinsiyet">
          <option value="-1" selected> Cinsiyeti</option>
          <option value="Erkek" >Erkek</option>
          <option value="Kadin" >Kadın</option>
        </select>
      </div></div>


        <div class="col-1-3">
          <div class="controls">
           <input type="text" id="annead" class="floatLabel" name="anneAd">
           <label for="annead">Anne Adı</label>
          </div>          
        </div>



        <div class="col-1-3">
          <div class="controls">
            <input type="tel" id="babad" class="floatLabel" name="babaAd">
            <label for="babad">Baba Adı</label>
          </div>          
        </div>
      </div>
      </div>
      <div class="grid">
        <div class="col-1-2">
          <div class="controls">
            <input type="text" id="sicilNo" name="sicilNo" class="floatLabel" pattern="[0-9]{13}" title="Sicil No yalnızca 13 haneli rakamlardan oluşmalıdır" oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 13)" placeholder="13 haneli Sicil No Giriniz" required maxlength="13">
            <label for="sicilNo" class="required">Sicil No</label>
          </div>         
        </div>
        <div class="col-1-2">
          <div class="controls">
            <input type="number" id="sirano" class="floatLabel" name="sirano">
            <label for="sirano">Aile Sıra No</label>
          </div>         
        </div>
        <div class="col-2-3">
          <div class="controls">
            <input type="date" id="dogumtarih" class="floatLabel" name="dogumtarih" value="<?php echo date('Y-m-d'); ?>">
            <label for="dogumtarih" class="label-date"><i class="fa fa-calendar"></i> Doğum Tarihi</label>
          </div>
        </div>
        <div class="col-1-3">
          <div class="controls">
            <i class="fa fa-sort"></i>
            <select name="medenidurum" id="medeniselected" >
              <option value="-1" selected> Medeni Durumu</option>
              <option value="Bekar" >Bekar</option>
              <option value="Evli" >Evli</option>
              <option value="Bosanmis">Boşanmış</option>
            </select>
          </div>
        </div>
      </div>
    <div class="grid">
    <div class="col-1-2">
      <div class="controls">
        <input type="text" id="esAd" class="floatLabel" name="esAd" disabled>
        <label for="esAd">Eş Ad</label>
      </div></div>
      <div class="col-1-2">
      <div class="controls">
        <input type="text" id="esSoyAd" class="floatLabel" name="esSoyAd" disabled>
        <label for="esSoyAd">Eş Soyad</label>
      </div>
  </div>
    </div>
    <script>
      const medeniselected = document.getElementById('medeniselected');
      const adInput = document.getElementById('esAd');
      const soyadInput = document.getElementById('esSoyAd');

      medeniselected.addEventListener('change', function() {
        if (medeniselected.value == 'Bekar') {
          adInput.disabled = true;
          soyadInput.disabled = true;
        } else {
          adInput.disabled = false;
          soyadInput.disabled = false;
        }
      });
    </script>
    <div class="controls">
      <input type="text" id="adresno" class="floatLabel" name="adresno">
      <label for="adresno">adresno</label>
    </div>
  </div>
  <!--  Details -->
<div class="form-group">
    <h2 class="heading">Address Bilgileri</h2>
  <div class="grid">
    <div class="col-1-2">
    <div class="controls">
      <input type="text" id="acıkAddress" class="floatLabel" name="acıkAddress">
      <label for="acıkAddress">Açık Adres</label>
    </div>
    </div><div class="col-1-2">
    <div class="controls">
      <input type="text" id="AddresNum" class="floatLabel" name="AddresNum">
      <label for="AddresNum">Adres No</label>
      </div>
    </div>
    
  <div class="form-group">

    <h2 class="heading">İletişim Bilgileri</h2>
    <div class="grid">
      <div class="col-1-3">
        <div class="controls">
          <i class="fa fa-sort"></i>
          <select name="iletisimilce">
            <option value="Gebze" selected> Gebze</option>
          </select>
        </div>
      </div>

      <div class="col-1-3">
        <div class="controls">
          <i class="fa fa-sort"></i>
   		 <select name="iletisimMahalle" id="mahalleSelect" onchange="toggleSokakSelect()">
            <% for (District dist : district) { %>
				<option id="<%= dist.getDistrictID()%>" value="<%= dist.getDistrictID() %>" ><%= dist.getDistrictName() %></option>
			<% } %>
          </select>
        </div>
      </div>

       <div class="col-1-3">
        <div class="controls">
          <i class="fa fa-sort"></i>
    	 <select name="iletisimSokak" id="sokakSelect" style="display: none;">
           <option value="-1">Sokak seçiniz</option>
           <%  List<Sokak> sokak = Sokak.getAllSokak();
             for (Sokak s : sokak) { %>
           <option data-district-id="<%= s.getDistrict().getDistrictID() %>" value="<%= s.getSokakname() %>"><%= s.getSokakname()%></option>
           <% } %>
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

    </div>
      <div class="controls">
        <input type="text" id="acikAdres" class="floatLabel" name="acikAdres">
        <label for="acikAdres">Açık Adres</label>
      </div>
    <div class="grid">
      <div class="col-1-3">
        <div class="controls">
          <input type="text" id="apartman" class="floatLabel" name="apartman">
          <label for="apartman">apartman</label>
        </div>
      </div>
      <div class="col-1-3">
        <div class="controls">
          <input type="text" id="Blok" class="floatLabel" name="Blok">
          <label for="Blok">Blok</label>
        </div>
      </div>
      <div class="col-1-3">
        <div class="controls">
          <input type="number" id="daireNo" class="floatLabel" name="daireNo">
          <label for="daireNo">daireNo</label>
        </div>
      </div>
    </div>
  <div class="grid">
    <div class="col-1-3">
      <div class="controls">
        <input type="tel" id="evTel" name="evTel" class="floatLabel" pattern="[0-9]{11}" title="Telefon numarası yalnızca 11 haneli rakamlardan oluşmalıdır" oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 11)" placeholder="Telefon Numarasını Giriniz" required maxlength="11">
        <label for="evTel" class="required">EvTel</label>
      </div>
    </div>
    <div class="col-1-3">
      <div class="controls">
        <input type="tel" id="cepTel" name="cepTel" class="floatLabel" pattern="[0-9]{11}" title="Telefon numarası yalnızca 11 haneli rakamlardan oluşmalıdır" oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 11)" placeholder="Telefon Numarasını Giriniz" required maxlength="11">
        <label for="cepTel" class="required">Cep Tel</label>
      </div>
    </div>
    <div class="col-1-3">
      <div class="controls">
        <input type="tel" id="digerTel" name="digerTel" class="floatLabel" pattern="[0-9]{11}" title="Telefon numarası yalnızca 11 haneli rakamlardan oluşmalıdır" oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 11)" placeholder="Telefon Numarasını Giriniz" required maxlength="11">
        <label for="digerTel" class="required">Diğer Tel</label>
      </div>
    </div>

  </div>
    <div class="grid">
    <div class="col-1-2">
      <div class="controls">
        <input type="email" id="eposta" class="floatLabel" name="eposta">
        <label for="eposta">EPosta</label>
      </div>
    </div>
      <div class="col-1-2">
        <div class="controls">
          <input type="text" id="adresTarif" class="floatLabel" name="adresTarif" required>
          <label for="adresTarif" class="required">Adres Tarifi</label>
        </div>
      </div>
    </div>
</div> <h2 class="heading">Müracaat Bilgileri</h2>
  <div class="form-group">
    <div class="grid">
      <div class="col-1-2">
        <div class="controls">
          <input type="number" id="arsivDosyaNo" class="floatLabel" name="arsivDosyaNo">
          <label for="arsivDosyaNo">Arşiv Dosya No</label>
        </div>
      </div>
      <div class="col-1-2">
        <div class="controls">
          <input required type="date" id="yonlendirmeTarih" class="floatLabel" name="yonlendirmeTarih" value="<?php echo date('Y-m-d'); ?>">
          <label for="yonlendirmeTarih" class="label-date"><i class="fa fa-calendar required"></i> yonlendirmeTarih</label>
        </div>
      </div>
      <div class="col-1-2">
        <div class="controls">
          <i class="fa fa-sort"></i>
          <select name="Bolge">
              <option>Bölge Seçiniz</option>
            <% for (Bolge zones : zone) { %>
            <option value="<%= zones.getZoneId() %>" ><%= zones.getZoneName() %></option>
            <% } %>
          </select>
        </div>
      </div>
      <div class="col-1-2">
      <div class="controls">
        <i class="fa fa-sort"></i>
        <select name="muracaattip">
          <option value="-1" selected> Müracaat Tipi </option>
          <option>Kendi</option>
          <option>Dilekçe</option>
          <option>E-mail</option>
          <option>Yakını</option>

        </select>
        </div>
      </div>
    </div>
    <div class="grid">
      <div class="controls">
        <textarea name="comments" class="floatLabel" id="aciklama"></textarea>
        <label for="aciklama" class="required">Açıklama</label>
      </div>
      </div>
    </div>
    <h2 class="heading">Dilekçe Bilgileri</h2>
    <div class="form-group">
      <div class="grid">
        <div class="col-1-2">
          <div class="controls">
            <input type="number" id="dilekceRefNo" class="floatLabel" name="dilekceRefNo">
            <label for="dilekceRefNo">Dilekçe Ref No</label></div>
            <div class="controls">
              <input type="text" id="dilekceKonu" class="floatLabel" name="dilekceKonu">
              <label for="dilekceKonu">Dilekçe Konu</label></div>
              <div class="controls">
                <input type="text" id="dilekceSonuc" class="floatLabel" name="dilekceSonuc">
                <label for="dilekceSonuc">Dilekçe Sonuç</label></div>
                <div class="controls">
                  <i class="fa fa-sort"></i>
                  <select class="form-control" name="YonlendirilenKurumAd" id="yonselect" onchange="toggleYonSelect()">
                    <% for(YonlendirilenKurum yk: yonKurum){ %>
                    <option id="<%= yk.getYonlendirilenKurumID()%>"value="<%= yk.getYonlendirilenKurumName()%>"><%=yk.getYonlendirilenKurumName()%></option>
                    <% } %>
                  </select>
                </div>
                <div class="controls">
                  <input type="date" id="yonlendirTarihi" class="floatLabel" name="yonlendirTarihi" value="<?php echo date('Y-m-d'); ?>">
                  <label for="yonlendirTarihi" class="label-date"><i class="fa fa-calendar"></i>Yönlendirme Tarihi</label>
                </div>
              </div>

        <div class="col-1-2">
          <div class="controls">
            <input type="number" id="itdilekceRefNo" class="floatLabel" name="itdilekceRefNo">
            <label for="itdilekceRefNo">İtiraz Dilekçe Ref No</label></div>
          <div class="controls">
            <input type="text" id="itdilekceKonu" class="floatLabel" name="itdilekceKonu">
            <label for="itdilekceKonu">İtiraz Dilekçe Konu</label></div>
          <div class="controls">
            <input type="text" id="itdilekceSonuc" class="floatLabel" name="itdilekceSonuc">
            <label for="itdilekceSonuc">İtiraz Dilekçe Sonuç</label></div>
          <div class="controls">
            <i class="fa fa-sort"></i>
            <select class="form-control" name="YonlendirenAltKurumName" id="yonAltselect">
              <% for(YonlendirilenAltKurum yak: yonAltKurum){ %>
              <option data-yon-id="<%=yak.getYonlendirilenKurum().getYonlendirilenKurumName()%>" value="<%=yak.getYonlendirilenAltKurumName()%>"><%=yak.getYonlendirilenAltKurumName()%></option>
              <% } %>
            </select>
          </div>
          <script>
            function toggleYonSelect() {

              const selectedYon = document.getElementById('yonselect');
              const selectedYonAlt = document.getElementById('yonAltselect');
              const selectedYonValue = selectedYon.value;
              const options = selectedYonAlt.querySelectorAll('option');

              for (const option of options) {
                if (option.dataset.yonId === selectedYonValue) {
                  selectedYonAlt.style.display = '';
                  option.style.display = '';
                }else {
                  option.style.display = 'none'; // Hide non-matching options
                }

              }
            }
          </script>
          <div class="controls">
            <input type="date" id="ityonlendirTarihi" class="floatLabel" name="ityonlendirTarihi" value="<?php echo date('Y-m-d'); ?>">
            <label for="ityonlendirTarihi" class="label-date"><i class="fa fa-calendar"></i>İtiraz Yönlendirme Tarihi</label>
          </div>
        </div>
        </div>
      </div>

    </div>
    <div>
      <button type="submit" value="Submit" class="col-1-4">Gönder</button>

    </div>
  </div>
</form>














  <!--
        <div class="grid">
      <div class="col-1-3 col-1-3-sm">
        <div class="controls">
          <i class="fa fa-sort"></i>
          <select class="floatLabel">
            <option value="1">1</option>
            <option value="2" selected>2</option>
            <option value="3">3</option>
          </select>
          <label><i class="fa fa-male"></i>&nbsp;&nbsp;People</label>
        </div>
      </div>
      <div class="col-1-3 col-1-3-sm">
      <div class="controls">
        <i class="fa fa-sort"></i>
        <select class="floatLabel">
          <option value="blank"></option>
          <option value="deluxe" selected>With Bathroom</option>
          <option value="Zuri-zimmer">Without Bathroom</option>
        </select>
        <label for="fruit">Room</label>
       </div>
      </div>

      <div class="col-1-3 col-1-3-sm">
      <div class="controls">
        <i class="fa fa-sort"></i>
        <select class="floatLabel">
          <option value="blank"></option>
          <option value="single-bed">Zweibett</option>
          <option value="double-bed" selected>Doppelbett</option>
        </select>
        <label for="fruit">Bedding</label>
       </div>
      </div>

       </div>
        <div class="grid">
          <p class="info-text">Please describe your needs e.g. Extra beds, children's cots</p>
          <br>
          <div class="controls">
            <textarea name="comments" class="floatLabel" id="comments"></textarea>
            <label for="comments">Comments</label>
            </div>
              <button type="submit" value="Submit" class="col-1-4">Submit</button>
        </div>
    </div>  /.form-group -->

<!-- partial -->
  <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='//raw.githubusercontent.com/andiio/selectToAutocomplete/master/jquery-ui-autocomplete.js'></script>
<script src='//raw.githubusercontent.com/andiio/selectToAutocomplete/master/jquery.select-to-autocomplete.js'></script>
<script src='//raw.githubusercontent.com/andiio/selectToAutocomplete/master/jquery.select-to-autocomplete.min.js'></script><script  src="js/muracat.js"></script>

</body>
</html>
