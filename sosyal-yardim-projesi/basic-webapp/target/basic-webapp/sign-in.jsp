<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<!--begin::Head-->
	<head>
		<title>Sosyal Yardım Portalı</title>
		<meta name="description" content="The most advanced Bootstrap Admin Theme on Themeforest trusted by 94,000 beginners and professionals. Multi-demo, Dark Mode, RTL support and complete React, Angular, Vue &amp; Laravel versions. Grab your copy now and get life-time updates for free." />
		<meta name="keywords" content="Metronic, bootstrap, bootstrap 5, Angular, VueJs, React, Laravel, admin themes, web design, figma, web development, free templates, free admin themes, bootstrap theme, bootstrap template, bootstrap dashboard, bootstrap dak mode, bootstrap button, bootstrap datepicker, bootstrap timepicker, fullcalendar, datatables, flaticon" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta charset="utf-8" />
		<meta property="og:locale" content="en_US" />
		<meta property="og:type" content="article" />
		<meta property="og:title" content="Metronic - Bootstrap 5 HTML, VueJS, React, Angular &amp; Laravel Admin Dashboard Theme" />
		<meta property="og:url" content="https://keenthemes.com/metronic" />
		<meta property="og:site_name" content="Keenthemes | Metronic" />
		<link rel="canonical" href="https://preview.keenthemes.com/metronic8" />
		<link rel="shortcut icon" href="assets/media/logos/favicon.ico" />
		<!--begin::Fonts-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
		<!--end::Fonts-->
		<!--begin::Global Stylesheets Bundle(used by all pages)-->
		<link href="assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
		<script src="https://www.google.com/recaptcha/api.js?render=6Ldk28EnAAAAAJDGH9lE0UYIRE2OcxPGyS7FnZwm"></script>
		<script>
			// reCAPTCHA token'ını gönderme ve doğrulama işlemi
			function submitFormWithRecaptcha(token) {
				document.getElementById('recaptchaToken').value = token;
			}

			// reCAPTCHA token'ını alma ve işlem yapma
			grecaptcha.ready(function() {
				grecaptcha.execute('6Ldk28EnAAAAAJDGH9lE0UYIRE2OcxPGyS7FnZwm').then(function(token) {
					submitFormWithRecaptcha(token);
				});
			});
		</script>



		<!--end::Global Stylesheets Bundle-->
	</head>
	<!--end::Head-->
	<!--begin::Body-->
	<body id="kt_body" class="bg-body">
	<!--begin::Main-->
	<div class="d-flex flex-column flex-root">
		<!--begin::Authentication - Sign-in -->
		<div class="d-flex flex-column flex-lg-row flex-column-fluid">
			<!--begin::Aside-->
			<div class="d-flex flex-column flex-lg-row-auto w-xl-600px positon-xl-relative" style="background-color: #F2C98A">
				<!--begin::Wrapper-->
				<div class="d-flex flex-column position-xl-fixed top-0 bottom-0 w-xl-600px scroll-y">
					<!--begin::Content-->
					<div class="d-flex flex-row-fluid flex-column text-center p-10 pt-lg-20">
						<!--begin::Logo-->

						<!--end::Logo-->
						<!--begin::Title-->
						<h1 class="fw-bolder fs-2qx pb-5 pb-md-10" style="color: #986923;">Sosyal Yardım Portalı</h1>
						<!--end::Title-->
						<!--begin::Description-->
						<p class="fw-bold fs-1" style="color: #986923;">Hoş Geldiniz</p>

						<div class="d-flex flex-row-auto bgi-no-repeat bgi-position-x-center bgi-size-contain bgi-position-y-bottom min-h-100px min-h-lg-350px" style="background-image:url(img/sy.png) "></div>
						<!--end::Illustration-->
					</div>
						<!--end::Description-->
					</div>
					<!--end::Content-->
					<!--begin::Illustration-->

				<!--end::Wrapper-->
			</div>
			<!--end::Aside-->
			<!--begin::Body-->
			<div class="d-flex flex-column flex-lg-row-fluid py-10">
				<!--begin::Content-->
				<div class="d-flex flex-center flex-column flex-column-fluid">
					<!--begin::Wrapper-->
					<div class="w-lg-500px p-10 p-lg-15 mx-auto">
							<!--begin::Form-->
							<form action="login" class="form w-100" novalidate="novalidate" id="kt_sign_in_form" method="post">
								<!--begin::Heading-->
								<div class="text-center mb-10"><div class="d-flex flex-row-auto bgi-no-repeat center bgi-size-contain bgi-position-y-top min-h-200px min-h-lg-5500px" style="background-image: url(images/Untitled.jpg)"> </div>
									<!--begin::Title-->
									<h1 class="text-dark mb-3">Giriş Yap</h1>
									<!--end::Title-->
									<!--begin::Link-->
									
									<!--end::Link-->
							  </div>
								<!--begin::Heading-->
								<!--begin::Input group-->
								<div class="fv-row mb-10">
									<% String mesaj=request.getParameter("error") ; if ( mesaj!= null) { %>
									<h2 class="fw-bolder fs-2qx pb-5 pb-md-10 text-lg-center center" style="color: red;">
										<p>Hatalı Giriş Yaptınız!</p>
										<p>Tekrar Deneyiniz</p>
									</h2>
									<% } %>

									<!--begin::Label-->
									<label class="form-label fs-6 fw-bolder text-dark">Kullanıcı Adı&nbsp;</label>
									<!--end::Label-->
									<!--begin::Input-->
									<input class="form-control form-control-lg form-control-solid" type="text" name="mail" autocomplete="off" />
									<!--end::Input-->
								</div>
								<!--end::Input group-->
								<!--begin::Input group-->
								<div class="fv-row mb-10">
									<!--begin::Wrapper-->
									<div class="d-flex flex-stack mb-2">
										<!--begin::Label-->
										<label class="form-label fw-bolder text-dark fs-6 mb-0">Şifre</label>
										<!--end::Label-->
										<!--begin::Link-->
										<!--end::Link-->
									</div>
									<!--end::Wrapper-->
									<!--begin::Input-->
								  <input class="form-control form-control-lg form-control-solid" type="password" name="password" autocomplete="off" />
									<!--end::Input-->
								</div>
								<div id="errorMessage" style="color: red; display: none;"></div>

								<input type="hidden" id="recaptchaToken" name="recaptchaToken">


								<!--end::Input group-->
								<!--begin::Actions-->
								<a href="reset-password.jsp" class="link-primary fs-6 fw-bolder float-end mb-2 pb-2">Şifremi Unuttum</a>
								<div class="text-center">
									<!--begin::Submit button-->
									<button type="submit" name="action" value="girisyap" class="btn hover btn-lg btn-primary w-100 mb-5">
										<span class="indicator-label">Giriş yap</span>
										<span class="indicator-progress">Bekleyiniz...
										<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
									</button>

									<button type="submit" name="action" value="kayitol" class="btn hover btn-lg btn-light w-100 mb-5">
										<span class="indicator-label">Kayıt Ol</span>
										<span class="indicator-progress">Bekleyiniz...
										<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
									</button>

									<button type="submit" name="action" value="yonetici" class="btn btn-lg btn-secondary w-100 mb-5">
										<span class="indicator-label">Yönetici Paneline Giriş</span>
										<span class="indicator-progress">Bekleyiniz...
										<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
									</button>

									<!--end::Submit button-->
									<!--begin::Separator-->
									<!--end::Separator-->

								</div>
								<!--end::Actions-->
							</form>
							<!--end::Form-->
						</div>
						<!--end::Wrapper-->
					</div>
					<!--end::Content-->
					<!--begin::Footer-->
					<div class="d-flex flex-center flex-wrap fs-6 p-5 pb-0">
						<!--begin::Links-->
						<div class="d-flex flex-center fw-bold fs-6">
							<a href="https://keenthemes.com" class="text-muted text-hover-primary px-2" target="_blank">Hakkımızda</a>
							<a href="https://keenthemes.com/support" class="text-muted text-hover-primary px-2" target="_blank">Destek</a>
							
						</div>
						<!--end::Links-->
					</div>
					<!--end::Footer-->
				</div>
				<!--end::Body-->
			</div>
			<!--end::Authentication - Sign-in-->
		</div>
	<!-- Kodunuzu mevcut JavaScript kodunuzun üzerine ekleyin -->
	<script>
		document.addEventListener("DOMContentLoaded", function () {
			const form = document.getElementById("kt_sign_in_form"); // Formunuzun "kt_sign_in_form" olduğunu varsayalım
			const usernameInput = document.querySelector('input[name="mail"]');
			const passwordInput = document.querySelector('input[name="password"]');

			form.addEventListener("submit", function (event) {

				const username = usernameInput.value.trim();
				const password = passwordInput.value.trim();

				// Kullanıcı adı (email) ve şifre boş mu kontrol edin
				if (username === "" || password === "") {
					errorMessage.textContent = "Kullanıcı adı ve şifre boş bırakılamaz.";
					errorMessage.style.display = "block";
				}
				const recaptchaToken = document.getElementById("recaptchaToken").value;
				if (recaptchaToken === null) {
					alert("Doğrulama tamamlanamadı. Sayfayı yenileyip tekrardan deneyiniz.");
					return; // İşlemi sonlandır
				}

			});
		});
	</script>

	<!--end::Main-->
		<script>var hostUrl = "assets/";</script>
		<!--begin::Javascript-->
		<!--begin::Global Javascript Bundle(used by all pages)-->
		<script src="assets/plugins/global/plugins.bundle.js"></script>
		<script src="assets/js/scripts.bundle.js"></script>
		<!--end::Global Javascript Bundle-->
		<!--begin::Page Custom Javascript(used by this page)-->
		<script src="assets/js/custom/authentication/sign-in/general.js"></script>
		<!--end::Page Custom Javascript-->
		<!--end::Javascript-->
	</body>
	<!--end::Body-->
</html>