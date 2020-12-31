<!-- Page content -->
<div class="content-wrapper">

    <div class="page-header">
        <div class="page-title">
            <h1 class= "m-5" style="margin: 15% 0%;">Menu Principal </h1>
        </div>
    </div>
    
    <div class="breadcrumb-line">
        <ul class="breadcrumb">
            <li><a href="<?=$url?>dashboard">Home</a></li>
            <li class="active">Dashboard</li>
        </ul>
    </div>
    
    <!-- Estados del Dia -->
    <div id="msjDia">
        <?=$saludoDia?>		  
    </div>	    

    <!-- Info blocks -->
    <div class="row">
    <div class="col-lg-3 col-6">
    <div class="small-box bg-info">
              <div class="inner">
                <h3><?=$totClientes?></h3>

                <p>Clientes</p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
              <a href="<?=$url?>clientes/listar_clientes" class="small-box-footer">Más información <i class="fas fa-arrow-circle-right"></i></a>
            </div>
            </div>
            <div class="col-lg-3 col-6">
            <div class="small-box bg-success">
              <div class="inner">
                <h3><?=$totProveedores?></h3>

                <p>Proveedores</p>
              </div>
              <div class="icon">
                <i class="fas fa-truck-loading"></i>
              </div>
              <a href="<?=$url?>proveedores/listar_proveedores" class="small-box-footer">Más información <i class="fas fa-arrow-circle-right"></i></a>
            </div>
            </div>

            <div class="col-lg-3 col-6">
            <div class="small-box bg-warning">
              <div class="inner">
                <h3><?=$totProductos?></h3>

                <p>Productos</p>
              </div>
              <div class="icon">
                <i class="fas fa-box-open"></i>
              </div>
              <a href="<?=$url?>productos/listar_productos" class="small-box-footer">Más información <i class="fas fa-arrow-circle-right"></i></a>
            </div>
            </div>

            <div class="col-lg-3 col-6">
            <div class="small-box bg-danger">
              <div class="inner">
                <h3><?=$totUsuarios?></h3>

                <p>Usuarios</p>
              </div>
              <div class="icon">
                <i class="fas fa-user"></i>
              </div>
              <a href="<?=$url?>usuarios/listar_usuarios" class="small-box-footer">Más información <i class="fas fa-arrow-circle-right"></i></a>
            </div>
            </div>


      </div>


      <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Area Chart</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <div class="chart">
                  <canvas id="areaChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
    <!-- /info blocks -->

    <div class="row">
        <div class="col-md-4">
            <!-- Ultimos Productos -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h6 class="panel-title"><i class="fas fa-boxes"></i> &Uacute;ltimos Productos</h6>
                </div>
                <ul class="message-list">
                    <?php if(isset($ultimosProductos)) : $i=0; ?>
                        <?php foreach ($ultimosProductos as $key => $value) : ?>
                            <?php if($i<4): ?>
                                <li>
                                    <div class="clearfix">
                                        <div class="chat-member">
                                            <a href="#">
                                                <?php 
                                                    if (file_exists('uploads/productos/'.$value['idGenProducto'].'/thumbs/'.$value['nombreImg'])) { 
                                                        echo '<img width="46.5px" height="40px" src="'.$url.'uploads/productos/'.$value['idGenProducto'].'/thumbs/'.$value['nombreImg'].'">';
                                                    }else{
                                                        echo '<img width="46.5px" height="40px" src="http://placehold.it/300">';
                                                    }
                                                ?>     
                                            </a>
                                            <h6>
                                                <?=$value['nombre']?>
                                                <small>
                                                    &nbsp; /&nbsp; 
                                                    <i class="icon-time" style="color:#FFF;font-size:1.0em;"></i>
                                                    <?=$value['fechaAlta']?>
                                                </small>
                                            </h6>
                                        </div>
                                    </div>
                                </li>
                            <?php endif; $i=$i+1;?> 
                        <?php endforeach; ?>
                    <?php endif; ?>                            
                </ul>
            </div>
        </div>        
      
        <div class="col-md-4">
            <!-- Ultimos Productos -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h6 class="panel-title"><i class="fas fa-history"></i> Historial Operaciones</h6>
                </div>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th class="text-center">Usuario</th>
                                <th class="text-center">Tipo</th>
                                <th class="text-center">Operaci&oacute;n</th>
                            </tr>
                        </thead>        
                        <tbody>
                            <?php if(!empty($historialOperaciones)) : $i=0; ?>
                                <?php foreach ($historialOperaciones as $key => $value) : ?>
                                    <?php if($i<6): ?>
                                        <tr>
                                            <td class="text-center"><?=$value['nombreCompleto']?></td>
                                            <td class="text-center"><?=$value['descripcionTipo']?></td>
                                            <td class="text-center"><?=$value['descripcionOperacion']?></td>
                                        </tr>
                                    <?php endif; $i=$i+1;?> 
                                <?php endforeach; ?>
                            <?php endif; ?>    
                        </tbody>
                    </table>
                </div>                                            
            </div>
        </div>             
        

       

        <div class="col-md-4">
            <!-- Ultimos Usuarios Conectados -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h6 class="panel-title"><i class="fa fa-user"></i> &Uacute;ltimos Usuarios Conectados</h6>
                </div>
                <ul class="message-list">
                    <?php if(!empty($ultimosUsuarios)) : $i=0; ?>
                        <?php foreach ($ultimosUsuarios as $key => $value) : ?>
                            <?php if($i<4): ?>
                                <li>
                                    <div class="clearfix">
                                        <div class="chat-member">
                                            <a href="#">
                                                <?php 
                                                    if (file_exists('uploads/usuarios/thumbs/'.$value['miniatura'])) { 
                                                        echo '<img src="'.$url.'uploads/usuarios/thumbs/'.$value['miniatura'].'">';
                                                    }else{
                                                        echo '<img width="46.5px" height="40px" src="http://placehold.it/300">';
                                                    }
                                                ?>     
                                            </a>
                                            <h4>
                                                <?=$value['usuarioLog']?><span class="status status-info"></span> 
                                                <small>
                                                    &nbsp; /&nbsp; 
                                                    <i class="icon-time" style="color:#FFF;font-size:1.0em;"></i>
                                                    <?=$value['fechaIngresoLog']?>
                                                </small>
                                            </h4>
                                        </div>
                                    </div>
                                </li>
                            <?php endif; $i=$i+1;?> 
                        <?php endforeach; ?>
                    <?php endif; ?>                            
                </ul>
            </div>
        </div>        
    </div>
    
    <div class="row">
        <div class="col-md-6">
            <!-- Notificaciones de Empresa -->
           
        </div>
        
        <div class="col-md-6">
            <!-- Contacto Soporte Tecnico -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h6 class="panel-title"><i class="fa fa-ticket"></i> Contactenos</h6>
                </div>
                <form action="#" class="block validate" role="form">
                    <div class="panel-body" style = "font-size: 12px;">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Nombre Completo: <span class="mandatory">*</span></label>
                                    <input type="text" name="name" placeholder="Nombre Completo" class="form-control required" style="font-size:15px;">
                                </div>

                                <div class="col-md-6">
                                    <label>Correo Electronico: <span class="mandatory">*</span></label>
                                    <input type="text" name="email_field" placeholder="Correo Electronico" class="form-control required" style="font-size:15px;">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Seleccione Departamento:</label>
                                    <select data-placeholder="Seleccione Departamento" class="select-full" tabindex="2">
                                        <option value=""></option> 
                                        <option value="Support">Soporte (online)</option> 
                                        <option value="Sles">Ventas</option> 
                                        <option value="Information">Informacion</option> 
                                        <option value="Administration">Administracion Web</option> 
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Mensaje: <span class="mandatory">*</span></label>
                            <textarea rows="5" cols="5" name="message" placeholder="Escriba su mensaje..." class="elastic form-control required" style="font-size:15px;"></textarea>
                        </div>

                        <div class="text-right">
                            <input type="reset" value="Cancelar" class="btn btn-danger" style="width: 30%;">
                            <input type="submit" value="Enviar Mensaje" class="btn btn-primary" style="width: 30%;">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    


		
			
		
			

			