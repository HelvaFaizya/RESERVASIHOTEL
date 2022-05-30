<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>ROSEWOOD HOTEL</title>

    <!-- Bootstrap core CSS -->
<link href="<?=base_url('/bootstrap/css/bootstrap.min.css');?>" rel="stylesheet" >





    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
 
      body {
  padding-top: 5rem;
}
.starter-template {
  padding: 3rem 1.5rem;
  text-align: center;
}
</style>
</head>

<body>
  <nav class="navbar navbar-expand-md navbar-dark bg-info fixed-top">
    <a class="navbar-brand" href="#">ROSEWOOD HOTEL</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
        <a class="nav-link" href="<?=site_url('/dashboard')?>">Home <span class="sr-only">(current)</span></a>
      </li>
      
      <?php
      if(session()->get('level')=='Admin'){
        ?>

      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-expanded="false">Master Data</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="<?=site_url('/fasilitas-kamar');?>">Fasilitas kamar</a>
          <a class="dropdown-item" href="<?=site_url('/fasilitas-hotel');?>">Fasilitas Hotel</a>
          <a class="dropdown-item" href="<?=site_url('/tampil-kamar');?>">Data Kamar</a>
        </div>
      </li>

      <?php }
      if(session()->get('level')=='Petugas') {
        ?>
   
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-expanded="false">Reservasi</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="<?=site_url('/tampil-reservasi');?>">Data Reservasi</a>
          <a class="dropdown-item" href="<?=site_url('/cek-kamar');?>">Cek Kamar</a>
        </div>
      </li>

      <?php } ?>

      <li class="nav-item">
        <a class="nav-link"href="<?=site_url('/logout');?>">LogOut</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

<main role="main" class="container">
  <?php
 if(!isset($JudulHalaman)){ ?>

<div class="starter-template">
    <h1>ROSEWOOD HOTEL KUNINGAN</h1>
    <p class="lead">Berikut ini adalah tampilan halaman pengelolaan aplikasi Reservasi Hotel Berbasis Website </p>
  </div>

  <?php } else { 
    echo $this->renderSection('konten');
    }  
    ?>

</main><!-- /.container -->
<script src="<?=base_url('bootstrap/js/jquery.slim.min1.js')?>"></script>
<script src="<?=base_url('bootstrap/js/bootstrap.bundle.min1.js')?>" ></script>

   <script>
  	$(document).ready(function() {
      	setTimeout(function() {
      	$(".alert").fadeOut('slow');
      	}, 2000);
 
  	});	 
  	</script>
    </body>
</html>