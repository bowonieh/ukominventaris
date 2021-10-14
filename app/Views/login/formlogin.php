<link href="<?php echo BASE;?>vendor/twbs/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="<?php echo BASE;?>assets/css/login.css" rel="stylesheet">
<script src="<?php echo BASE;?>vendor/components/jquery/jquery.min.js"></script>
<script src="<?php echo BASE;?>vendor/twbs/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="<?php echo BASE;?>assets/js/notify.js"></script>

<!------ Include the above in your HEAD tag ---------->

    <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <!--<img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />-->
            
            <p>
                    Masukkan kombinasi username dan password yang telah terdaftar .
                <br>
                </p>
            <br>
            <!--
            <div>
                <span>Masukkan kombinasi email dan password yang telah terdaftar untuk masuk ke portal LTMPT. Jika belum memiliki akun LTMPT, silahkan melakukan registrasi akun LTMPT. Daftar di sini.</span>
            </div>
            -->
            <div class="form-signin">
               
                <input type="text" name="username" id="inputUsername" class="form-control" placeholder="Username" autofocus>
                <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
                
                <button class="btn btn-lg btn-primary btn-block btn-signin" id="SubmitBtn" >Sign in</button>
            </div><!-- /form -->
            <a href="<?php echo BASE;?>lupapassword" class="forgot-password">
                Lupa Password?
            </a>
            <a href="<?php echo BASE;?>register" class="forgot-password">
                Register
            </a>
        </div><!-- /card-container -->
    </div><!-- /container -->
    <script type="text/javascript">
        $('#SubmitBtn').on('click',function(a){
            //a.preventDefault();
            //alert($('#inputUsername').val());
            $.ajax({
                type: 'POST',
                url : 'login/checklogin',
                data: {
                    username : $('#inputUsername').val(),
                    password: $('#inputPassword').val()
                },
                success: function(data){
                   // var returnedData = JSON.parse(data);
                    //alert(returnedData.status);
                    //window.location.replace('/'+returnedData.location);
                    if(data.status){
                        $.notify(data.pesan,'success');
                       //alert(data.pesan);
                        setTimeout(function(){ window.location.href = 'profil' }, 2000);
                    }else{
                       $.notify(data.pesan,'error');
                    }
                }
                
            });
        });
    </script>
