<aside class="main-sidebar sidebar-dark-primary elevation-4" 
  style="background-color:black;
    background-image:
    radial-gradient(white, rgba(255,255,255,.2) 2px, transparent 40px),
    radial-gradient(white, rgba(255,255,255,.15) 1px, transparent 30px),
    radial-gradient(white, rgba(255,255,255,.1) 2px, transparent 40px),
    radial-gradient(rgba(255,255,255,.4), rgba(255,255,255,.1) 2px, transparent 30px);
    background-size: 550px 550px, 350px 350px, 250px 250px, 150px 150px;
    background-position: 0 0, 40px 60px, 130px 270px, 70px 100px;">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
     -->
  
  <!--Clase con nombre SIDEBAR, se quito por errores en responsive-->
  <div class="sidebar-menu"  style="">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image" style="padding-left: 15px;">
          <!--<img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">-->
          <img src="<?php echo(empty($userdata['picture'])) ? $url . 'assets/images/main-team-member-img-3-100x100.jpg' : $url . '/uploads/profile/' . $userdata['picture'] ?>" class="img-circle" alt="User Image">
        </div>
        
        <div class="info">
         <h4><strong style="font-family: 'Exo 2', sans-serif; color: white;" href="#" class="d-block"> <?= $userdata['nombreCompleto'] ?> ( <?= $nivelUsuario ?> )</strong></h4>
        </div>
       </div>
      
       <nav class="mt-2 sidebar-menu">
          <ul  class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            <li class="" style="margin-top: 1%;">
              <a class="nav-link" onclick="abrirMenuPrincipal();">
                <i class="nav-icon fas fa-bars" style="padding-top:3px; color:#0039FF;"></i>
                <p  style="font-size:125%; color:#00CBFF; margin-left: 8%;">Menu Principal</p>
              </a>
            </li>

              
              <?php
                  //ver como hacer para los sublitems
                  
                  if ($menu) {
                    foreach ($menu as $key => $value) {
                      if ($menu[$key]['idTipoInterna'] == 1) {
                        echo '<li class="nav-item" style="margin-top: 1%;" >' .
                        ' <a class="nav-link" href="' . $url . $menu[$key]['link'] . '"> ' .
                        '<i class="' . $menu[$key]['icono'] . ' " style="padding-top:3px; color:#0039FF;"></i>'.
                        '<i class=" fas fa-angle-left right"></i>
                        <p style="font-size:125%; color:#00CBFF; margin-left: 8%;"> '. $menu[$key]['nombre'] .'</p>                    
                        </a>';
                              
                          for ($j = 0; $j < count($menu); $j++) {
                            if ($menu[$j]['idTipoInterna'] == 2) {
                              if ($menu[$j]['idSubItem'] == $value['posicion']) {
                                echo '<ul class="nav nav-treeview"><li class="nav-item" >' .
                                '<a class="nav-link" href="' . $url . $menu[$j]['link'] . '">' .
                                '<i class="far fa-circle nav-icon" style="padding-top:3px;"></i>'.
                                '<span class="flecha" style="font-size:125%; color:white;">' . $menu[$j]['nombre'] . '</span>' .                     
                                '</a>';

                                  for ($k = 0; $k < count($menu); $k++) {
                                    if ($menu[$k]['idTipoInterna'] == 3 && $menu[$j]['posicion'] == $menu[$k]['idSubItem']) {
                                      echo '<ul><li>' .
                                      '<a class="nav-link" href="' . $url . $menu[$k]['link'] . '">' .                                 
                                      '<span style="font-size:125%; color:white;">' . $menu[$k]['nombre'] . '</span>' .
                                                          //  '<i class="' . $menu[$k]['icono'] . '"></i>
                                      '</a>';

                                      for ($l = 0; $l < count($menu); $l++) {
                                        if ($menu[$l]['idTipoInterna'] == 4 && $menu[$k]['posicion'] == $menu[$l]['idSubItem']) {
                                          echo '<ul><li>' .
                                        '<a href="' . $url . $menu[$l]['link'] . '">' .    
                                          '<span style="font-size:125%; color:white;">' . $menu[$l]['nombre'] . '</span>' .
                                                          //  '<i class="' . $menu[$k]['icono'] . '"></i>
                                          '</a>';
                                          echo "</li></ul>";
                                        }
                                      }
                                      echo "</li></ul>";
                                    }
                                  }
                                  echo "</li></ul>";
                                }
                              }
                            }
                            echo "</li>";
                      }
                    }
                  }
                  ?>  
          </ul>
      </nav>
    </div>

    
    
</aside>
