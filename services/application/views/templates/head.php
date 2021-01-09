<!DOCTYPE html>
<html lang="en" class="translated-ltr">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
        <title><?= $title ?></title>

        <link rel="shortcut icon" href="<?php echo $url; ?>favicon.ico"  />
<!-- Los viejos -->


<!-- fin los viejos -->


        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
        <link href="<?= $url ?>assets/css/bootstrap-admin.min.css" rel="stylesheet" type="text/css">
        <link href="<?= $url ?>assets/css/londinium-theme_admin.css" rel="stylesheet" type="text/css">
        <link href="<?= $url ?>assets/css/styles_admin.css" rel="stylesheet" type="text/css">
        <link href="<?= $url ?>assets/css/icons.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <link href="<?= $url ?>assets/css/uploadfile.css"  rel="stylesheet"  type="text/css">
        <link href="<?= $url ?>assets/css/uploadfile.custom.css"  rel="stylesheet"  type="text/css">
        <link href="<?= $url ?>assets/css/weather_icons/css/weather-icons.css" rel="stylesheet">
        <link href="<?= $url ?>assets/css/weather_icons/css/weather-icons.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/tagmanager/3.0.2/tagmanager.min.css">
        <link href="<?= $url ?>assets/css/estilos.css" rel="stylesheet">
        <!--<link href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

        <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?= $url ?>assets/js/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="<?= $url ?>assets/js/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="<?= $url ?>assets/js/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="<?= $url ?>assets/js/plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?= $url ?>assets/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="<?= $url ?>assets/js/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="<?= $url ?>assets/js/plugins/daterangepicker/daterangepicker.css">
  <!-- Datatable CSS -->
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.css">
  <!-- summernote -->
  <link rel="stylesheet" href="<?= $url ?>assets/js/plugins/summernote/summernote-bs4.min.css">
  <link rel="preconnect" href="https://fonts.gstatic.com">
<link src="https://fonts.googleapis.com/css2?family=Exo+2:ital,wght@3,900&display=swap" rel="stylesheet">
    
  
        <script>
            //--- URL BASE ---//
            //LOCAL
            URL = '//localhost/pyme/';

            //SERVIDOR
//                URL = '';
        </script>


        <!--===============================================================================================-->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.js"></script>
         <!-- Sweet Alert --> 
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.9/sweetalert2.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.9/sweetalert2.min.js"></script>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="<?= $url ?>assets/js/application.js"></script>
<script type="text/javascript" src="<?= $url ?>assets/js/plugins/forms/listbox.js"></script>
<!--===============================================================================================-->
	<script src="<?= $url ?>assets/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="<?= $url ?>assets/vendor/bootstrap/js/popper.js"></script>
	<script src="<?= $url ?>assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="<?= $url ?>assets/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="<?= $url ?>assets/vendor/daterangepicker/moment.min.js"></script>
	<script src="<?= $url ?>assets/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="<?= $url ?>assets/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="<?= $url ?>assets/js/main.js"></script>
    
       
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/charts/sparkline.min.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/forms/uniform.min.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/forms/select2.min.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/forms/inputmask.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/forms/autosize.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/forms/inputlimit.min.js"></script>
        
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/forms/multiselect.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/forms/validate.min.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/forms/tags.min.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/forms/switch.min.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/forms/uploader/plupload.full.min.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/forms/uploader/plupload.queue.min.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/forms/wysihtml5/wysihtml5.min.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/forms/wysihtml5/toolbar.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/interface/daterangepicker.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/interface/fancybox.min.js"></script>


       
 

        <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/interface/jgrowl.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script>

        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/interface/colorpicker.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/interface/fullcalendar.min.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/interface/timepicker.min.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/charts/flot.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/charts/flot.pie.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/charts/full/pie.js"></script>

        <script type="text/javascript" src="<?= $url ?>assets/js/bootstrap.min.js"></script>
        

        <!-- DatePicker -->
        <link rel="stylesheet" type="text/css" href="<?= $url ?>assets/css/jquery.datetimepicker.css"/>
        <script type="text/javascript" src="<?= $url ?>assets/js/jquery.datetimepicker.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/build/jquery.datetimepicker.full.js"></script>   
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.min.js"></script> 

        <!-- Tag -->
        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/tagmanager/3.0.2/tagmanager.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-3-typeahead/4.0.1/bootstrap3-typeahead.min.js"></script> 

        <!-- Upload Multiple Files -->
        <script type="text/javascript" src="<?= $url ?>assets/js/jquery.uploadfile.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/jquery.uploadfile.min.js"></script>

        <!-- Ck Editor-->
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/ckeditor/ckeditor.js"></script>
        <!-- Ck Finder-->
        <script type="text/javascript" src="<?= $url ?>assets/js/plugins/ckfinder/ckfinder.js"></script>

        <!-- Funciones -->
        <script type="text/javascript" src="<?= $url ?>assets/js/coreAdmin.js"></script>
        <script type="text/javascript" src="<?= $url ?>assets/js/coreAdminImportarXLS.js"></script>

        <!-- Include jQuery Validator plugin -->
        <script src="<?= $url ?>assets/js/validator.js"></script>

       

        <script>
            /*--- Evito Disable HTML correction - CKEDITOR ---*/
            CKEDITOR.config.allowedContent = true;
        </script>
        




<!-- admin lte -->

<!-- jQuery -->

<!-- jQuery UI 1.11.4 -->
<script src="<?= $url ?>assets/js/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="<?= $url ?>assets/js/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="<?= $url ?>assets/js/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="<?= $url ?>assets/js/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="<?= $url ?>assets/js/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="<?= $url ?>assets/js/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="<?= $url ?>assets/js/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="<?= $url ?>assets/js/plugins/moment/moment.min.js"></script>
<script src="<?= $url ?>assets/js/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="<?= $url ?>assets/js/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="<?= $url ?>assets/js/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="<?= $url ?>assets/js/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="<?= $url ?>assets/js/adminlte.js"></script>



  </head>

<body class="sidebar-mini layout-fixed sidebar-collapse">
  <div class="wrapper">