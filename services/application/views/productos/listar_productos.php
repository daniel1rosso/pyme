<!-- Page container -->
<div class="page-container">

    <!-- Page content -->
    <div class="page-content">

        <!-- Page header -->
        <div class="page-header">
            <div class="page-title">
                <h1  class= "m-5" style="margin: 15% 0%;">Productos</h1>
            </div>
        </div>

        <!---->

        <?php if (isset($successModif)) : ?>
            <div class="callout callout-success  ">
                <button type="button" class="close" data-dismiss="alert">×</button>
                <h5>¡Bien!</h5>
                <p>Se modificó el producto con éxito.</p>
            </div>
        <?php endif; ?>

        <!---->

        <div class="breadcrumb-line">
            <ul class="breadcrumb">
                <li><a href="<?= $url ?>dashboard">Home</a></li>
                <li class="active">Productos</li>
            </ul>

            <div class="visible-xs breadcrumb-toggle">
                <a class="btn btn-link btn-lg btn-icon" data-toggle="collapse" data-target=".breadcrumb-buttons"><i class="icon-menu2"></i></a>
            </div>
        </div>

        <!---->

        <div class="col-md-12 input-group" style="margin: 0.5% 0%;">
            <div class="col-md-6">
            </div>
            
            <div class="col-md-6 ">
                <div class="form-actions " style="float: right; margin-left:2%;">
                    <a onclick="agregarProducto()" class="btn btn-primary">
                        <i class="icon-plus"></i>
                        Agregar Producto
                    </a>
                </div>

                <?php if ( $empresa[0]['stock'] == 0 ) : ?>
                
                <div class=" form-actions" style="float: right;">
                    <div style="float: right;">
                        <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Ajustar Stock</button>
                        <ul class="dropdown-menu icons-left">
                            <li><a class="tip" data-toggle="modal" onclick="aumentarStock()" ><i class="fas fa-arrow-circle-up"></i> Aumentar Stock</a></li>
                            <li><a class="tip " data-toggle="modal" onclick="disminuirStock()">  <i class="fas fa-arrow-circle-down"></i>Disminuir Stock</a></li>
                        </ul>
                    </div>
                </div>
                <?php endif; ?>
                
            </div>
    
        </div>
        <!---->
        <?php if ($userdata['idUsuario'] != 28 && $userdata['idUsuario'] != 29): ?>            
            <ul class="page-stats list-justified" >
                <li class="bg-primary text-center" style="margin: 0% 5%;">
                    <div class="page-stats-showcase" style="float:none;">
                        <span>
                            Unidades en Stock
                        </span>
                        <h2><span id="stock_listado_producto" name="stock_listado_product" style="font-size: larger;"><?= $totStock ?></span></h2>
                    </div>
                </li>
                <li class="bg-danger text-center" style="margin: 0% 5%;">
                    <div class="page-stats-showcase" style="float:none;">
                        <span>
                            Costo Total
                            &nbsp;
                            <a href="#" data-placement="bottom" class="tip" data-original-title="Corresponde al total que surge de multiplicar el costo de los productos (asignado en la base de datos) por la cantidad de unidades en stock disponibles.">
                                <i class="fas fa-question-circle"></i>
                            </a>
                        </span>
                        <h2><span id="valor_costo_total_listado_producto" name="valor_costo_total_listado_producto" style="font-size: larger;">$<?= number_format($costoTotal, 2, ',', '.') ?></span></h2>
                    </div>
                </li>
                <li class="bg-success text-center" style="margin: 0% 5%;">
                    <div class="page-stats-showcase" style="float:none;">
                        <span>
                            Valor Venta Total
                            &nbsp;
                            <a href="#" data-placement="bottom" class="tip" data-original-title="Corresponde al total que surge de multiplicar el precio de venta de los productos (asignado en la base de datos) por la cantidad de unidades en stock disponibles.">
                                <i class="fas fa-question-circle"></i>
                            </a>                        
                        </span>
                        <h2><span id="valor_venta_total_listado_producto" name="valor_venta_total_listado_producto" style="font-size: larger;">$<?= number_format($valorVentaTotal, 2, ',', '.') ?></span></h2>
                    </div>
                </li>
            </ul>        
        <?php endif;
        ?>            
        <!---->

        <div class="tabbable page-tabs">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#productos" data-toggle="tab">
                        <i class="fas fa-boxes" style="font-size:1.4em;"></i> 
                        Productos
                    </a>
                </li>	  	                 
            </ul>
            <div class="tab-content">
                <div class="tab-pane active  " id="productos">

                    <!-- Striped and bordered datatable inside panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading"><h6 class="panel-title"><i class="icon-paragraph-justify"></i> Listado</h6></div>
                        <div class="datatable">
                            <table class="table table-striped table-bordered" id="listadoProductos">
                                <thead>
                                    <tr>
                                        <th class="text-center">Nº</th>
                                        <th class="text-center">Nombre</th>
                                        <th class="text-center">Stock</th>
                                        <th class="text-center">Costo</th>
                                        <th class="text-center">Precio Venta</th>
                                        <!-- <th class="text-center">IVA Ventas</th>
                                        <th class="text-center">IVA Compras</th>
                                        <th class="text-center">Tipo de Producto</th> -->
                                        <th class="text-center">Proveedor</th>
                                        <th class="text-center">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (isset($productos)) : ?>
                                        <?php foreach ($productos as $key => $value) : ?>
                                            <tr id="<?= $value['idGenProducto'] ?>">
                                                <td class="text-center"><?= $value['idProducto'] ?></td>
                                                <td class="text-center"><?= $value['nombre'] ?></td>
                                                <td class="text-center"><?= $value['stock'] ?></td>
                                                <td class="text-center"><?= "$" . number_format($value['precioCompra'], 2, ",", ".") ?></td>
                                                <td class="text-center"><?= "$" . number_format($value['precioVenta'], 2, ",", ".") ?></td>
                                                <td class="text-center"><?= $value['nombEmpresa'] ?></td>
                                                <td class="text-center">
                                                    <?php if ($userdata['idUsuario'] != 28 && $userdata['idUsuario'] != 29): ?>                               
                                                        <a onclick="eliminar_producto('<?=$value['idGenProducto']?>')" style="color:#339AF0"><i class="icon-remove4"></i></a>
                                                    <?php endif?>                                                        
                                                    &nbsp;
                                                    <a onclick="updateProducto('<?= $value['idGenProducto'] ?>')" style="color:#339AF0"><i class="icon-pencil3"></i></a>
                                                </td>
                                            </tr>				                        
                                        <?php endforeach; ?>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>            
            </div>
        </div>