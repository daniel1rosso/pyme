

<!-- Navbar -->

<nav class="main-header navbar navbar-expand navbar-white navbar-light">

    <div class="container-fluid">

        
        <!--<div class="navbar-wrapper">
            <a class="sidebar-toggle">
                //<i class="icon-paragraph-justify2"></i>
                <i class="fas fa-bars"></i>
            </a>
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-icons">
                <span class="sr-only">Toggle navbar</span>
                <i class="icon-grid3"></i>
            </button>
            <button type="button" class="navbar-toggle offcanvas">
                <span class="sr-only">Toggle navigation</span>
                <i class="icon-paragraph-justify2"></i>
            </button>        

            <a class="navbar-brand" onclick="abrirMenuPrincipal()">
                <?= $title ?>
            </a>
            
        </div>-->
        
        <!--<li class="nav-item dropdown">
            <a aria-expanded="false" aria-haspopup="true" class="nav-link" data-toggle="dropdown" href="http://example.com" id="navbarDropdownMenuLink">
            <i class="material-icons">
                notifications
            </i>
            
            <?php if (isset($notificaciones)) : ?>
                <span class="notification">
                    <?= $cantNotificaciones ?>
                </span>
            <?php endif; ?>
                <p class="d-lg-none d-md-block"> Some Actions </p>
                <div aria-labelledby="navbarDropdownMenuLink" class="dropdown-menu dropdown-menu-right">
                    <?php if (isset($notificaciones)) : ?>
                        <?php foreach ($notificaciones as $key => $value) : ?>                     
                            <span class="dropdown-item" style="margin-top:5px;cursor:pointer;background-color: rgba(<?= $value['color'] ?>, 0.3);color:rgb(<?= $value['color'] ?>)" onclick="abrirNotificacion('<?= $value['idNotificacion'] ?>')">
                                <?= $value['titulo'] ?>
                            </span>
                            <?php endforeach; ?>
                    <?php else: ?>
                        <div style="padding:10px;width: 100%;">
                            <div class="alert alert-warning" style="padding: 10px;margin-bottom: 0px; text-align: center;">
                                Sin registros
                            </div>  
                        </div>
                    <?php endif; ?>                                       
                </div>
        </li>-->
        <ul class="navbar-nav ml-auto">                
            <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown">
                    <i class="far fa-bell fa-2x" ></i>
                    <span class="badge badge-warning navbar-badge" > <?= $cantNotificaciones ?> </span>
                </a>
                <div class="popup dropdown-menu dropdown-menu-left">
                    <div class="popup-header">
                        <span>Notificaciones de deudas</span>
                    </div>
                    <ul class="activity">
                        <?php if ($cantNotificaciones == 0) : ?>
                            <li>
                                <i class="fas fa-check-circle fa-lg" style="color: #428bca;"></i>
                                <div>
                                    <a>No tiene deudas pendientes</a>
                                </div>
                            </li>
                        <?php else: ?>
                            <?php if (!empty($notificacionesEgresos)) : ?>
                                <?php foreach ($notificacionesEgresos as $key => $value) : ?>
                                    <li>
                                        <i class="fas fa-check-circle fa-lg" style="color: #428bca;"></i>
                                        <div>
                                            <a onclick="marcar_leida_notificacion_egreso(<?= "'" . $value['idGenEgreso'] ."'" ?>, <?= "'" . $value['fechaRegistroNotificacion'] . "'" ?>);" >Compra con una deuda de <?= '$' . $value['montoDeuda'] ?> a <?= $value['nombEmpresa'] ?></a>
                                        </div>
                                        <small style="padding-left: 11%;"><?= $value['fechaRegistroNotificacion'] ?></small>
                                    </li>
                                <?php endforeach; ?> 
                            <?php endif; ?> 
                            <?php if (!empty($notificacionesGastos)) : ?>
                                <?php foreach ($notificacionesGastos as $key => $value) : ?>
                                    <li>
                                        <i class="fas fa-check-circle fa-lg" style="color: #428bca;"></i>
                                        <div>
                                            <a onclick="marcar_leida_notificacion_gasto(<?= "'" . $value['idGenGasto'] . "'" ?>, <?= "'" . $value['fechaRegistroNotificacion'] . "'" ?>);" >Gasto con una deuda de <?= '$' . $value['montoDeuda'] ?> vencido en <?= $value['fechaVto'] ?></a>
                                        </div>
                                        <small style="padding-left: 11%;"><?= $value['fechaRegistroNotificacion'] ?></small>
                                    </li>
                                <?php endforeach; ?> 
                            <?php endif; ?> 
                        <?php endif; ?> 
                    </ul>
                </div>
            </li>
            
            <li class="user dropdown nav-item">
                <a class="dropdown nav-link" data-toggle="dropdown" style = "font-size:180%;">
                    <img alt="" src="<?php echo(empty($userdata['picture'])) ? $url . 'assets/images/main-team-member-img-3-100x100.jpg' : $url . '/uploads/profile/' . $userdata['picture'] ?>">
                    <span><?= $user['usuario'] ?></span>
                </a>
                <ul class="dropdown-menu dropdown-menu-left icons-left">
                    <li><a href="<?= $url ?>admin/logout"><i class="icon-exit"></i>Cerrar Sesi&oacute;n</a></li>
                </ul>
            </li>
        </ul>     
        <ul class="navbar-nav" style="visibility: hidden; float:right;">
            <li class="nav-item" style="float:right;">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
        </ul>                  
    </div>

</nav>
<style>
    @media (max-width: 800px){
        .nav-item{visibility: visible;}
    }
</style>                            

<!-- /navbar -->

