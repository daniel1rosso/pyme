<!-- Navbar -->
<!--<div class="navbar navbar-inverse" role="navigation"> -->
		<div class="navbar-header">
	<!--		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-right">
				<span class="sr-only">Toggle navbar</span>
				<i class="icon-grid3"></i>
			</button>
			<a class="navbar-brand" href="<?=$url?>"><?=$title?></a>
		</div>
-->
		<!-- 
                    <ul class="nav navbar-nav navbar-right collapse">
                        <li><a href="#"><i class="icon-screen2"></i></a></li>
                        <li><a href="#"><i class="icon-paragraph-justify2"></i></a></li>
                        <li>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-cogs"></i></a>
                            <ul class="dropdown-menu icons-right dropdown-menu-right">
                                <li><a href="#"><i class="icon-cogs"></i> This is</a></li>
                                <li><a href="#"><i class="icon-grid3"></i> Dropdown</a></li>
                                <li><a href="#"><i class="icon-spinner7"></i> With right</a></li>
                                <li><a href="#"><i class="icon-link"></i> Aligned icons</a></li>
                            </ul>
                        </li>
                    </ul> 
                -->
	</div>
	<!-- /navbar -->

    <!-- Login wrapper -->
    <!--
	<div class="login-wrapper">
		
            <form action="<?=$url?>admin/login" role="form" method="POST">
                <div class="popup-header" style="background-color:#FF4B36;">
                    <a href="#" class="pull-left"><i class="icon-user-plus"></i></a>
                    <span class="text-semibold">Login de Usuario</span>
                </div>
                <div class="well">
                    <div class="form-group <?php echo (isset($user)) ? 'has-feedback' : 'has-feedback has-error'; ?>">
                        <label>Usuario</label>
                        <input type="text" name="username" class="form-control" value="<?php echo (isset($user)) ? $user : ''; ?>" placeholder="<?php echo (isset($user)) ? 'Usuario' : 'Usuario'; ?>">
                        <i class="icon-users form-control-feedback"></i>
                    </div>
                    <div class="form-group <?php echo (isset($password)) ? 'has-feedback' : 'has-feedback has-error'; ?>">
                        <label>Password</label>
                        <input type="password" name="password" class="form-control" placeholder="Password">
                        <i class="icon-lock form-control-feedback"></i>
                    </div>

                    <div class="row form-actions">
                        <div class="col-xs-6">
                            <div class="checkbox checkbox-success">
                             
                                <label>
                                    <input type="checkbox" class="styled">
                                    Remember me
                                </label> 
                            
                            </div>
                        </div>

                        <div class="col-xs-6">
                            <button type="submit" class="btn btn-warning pull-right" style="background-color:#FF4B36;border:0px;"><i class="icon-menu2"></i> Entrar</button>
                        </div>
                    </div>
                </div>
            </form>
            
    </div>  
                -->
	<!-- /login wrapper -->
    <div class="limiter">
		<div class="container-login100" style="  background: linear-gradient(to right, #f0f2f0, #000c40); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */">
			<div class="wrap-login100">
                <form action="<?=$url?>admin/login" role="form" method="POST">
					<span class="login100-form-title p-b-26">
						Bienvenido
					</span>
					<span class="login100-form-title p-b-48" style="padding:0">
						<img src="<?=$url?>assets/images/ejemplo.png" style="width:70%">
					</span>

					<div class="wrap-input100 validate-input  <?php echo (isset($user)) ? 'has-feedback' : 'has-feedback has-error'; ?>" data-validate = "Valid email is: a@b.c">
                    <h3 style=""> 
                     <strong>Usuario</strong>    
                     </h3>
                    <input class="input100" type="text" name="username"  value="<?php echo (isset($user)) ? $user : ''; ?>" >
						<span class="focus-input100" data-placeholder="       "></span>
					</div>

                    <div class="wrap-input100 validate-input <?php echo (isset($password)) ? 'has-feedback' : 'has-feedback has-error'; ?>" data-validate="Enter password">
                     <h3 style=""> 
                     <strong>Contraseña</strong>    
                     </h3>
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<input class="input100" type="password" name="password">
						<span class="focus-input100" data-placeholder=""></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Iniciar Sesión
							</button>
						</div>
					</div>

					<!--<div class="text-center p-t-115">
						<span class="txt1">
							Don’t have an account?
						</span>

						<a class="txt2" href="#">
							Sign Up
						</a>
                    </div>
-->
                </form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1">




        <!-- Footer -->                    
        <footer class="footer clearfix fooerLogin" id="footerTSoft">
            <div class="text-center">
                <a href="#" target="_blank" style="text-decoration:none;">
                    <img id="logoFooterCR" src="<?=$url?>assets/images/logoTs/x64/64-ST-SB.png">
                    <strong>Red Hot Chili Devs</strong> 
                </a>
                Copyright &#169; <?=$anioFooter?> </a>
                <a href="#" class="go-top">
                   <i class="icon-angle-up"></i>
                </a>
            </div>
        </footer>         
        <!-- /footer -->
        </div>
</body>
</html>