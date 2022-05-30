
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>ROSEWOOD HOTEL</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/sign-in/">

    

    <!-- Bootstrap core CSS -->
<link href="<?=base_url('/bootstrap/css/bootstrap.min.css');?>" rel="stylesheet" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">



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
    </style>

    
    <!-- Custom styles for this template -->
    <link href="<?=base_url('/bootstrap/css/signin.css');?>" rel="stylesheet">
  </head>
  <body class="text-center">
    
<form class="form-signin" method="POST" action="<?=site_url('/login');?>">
  <img class="mb-4" src="/bootstrap/image/hotel1.png" alt="" width="200" height="200">
  <h1 class="h3 mb-3 font-weight-normal">Please Sign In</h1>
  <label for="inputUsername" class="sr-only" >Username</label>
  <input type="text" name="txtUser" class="form-control" placeholder="Username" required autofocus>
  <label for="inputPassword" class="sr-only">Password</label>
  <input type="password" name="txtPass" class="form-control" placeholder="Password" required>
  <div class="checkbox mb-3">
    <label>
      <input type="checkbox" value="remember-me"> Remember Me
    </label>
  </div>
  <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
  <?=session()->getFlashData('info');?>
</form>


    
  </body>
</html>
