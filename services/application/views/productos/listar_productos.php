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

        <div class="col-md-12 input-group">
            <div class="col-md-6">
            </div>
            <!--CORREGIR RESPONSIVE DE BOTONES-->
            <div class="col-md-6 input-group text-right" style="float: left;">
                <?php if ( $empresa[0]['stock'] == 0 ) : ?>
                    <div class="form-actions" style="float: left; margin-right: 5%; margin-left: 60%;">
                        <div class="btn-group">
                            <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Ajustar Stock</button>
                            <ul class="dropdown-menu icons-left">
                                <li><a class="tip " data-toggle="modal" onclick="aumentarStock()" ><i class="fas fa-arrow-circle-up"></i> Aumentar Stock</a></li>
                                <li><a class="tip " data-toggle="modal" onclick="disminuirStock()"><i class="fas fa-arrow-circle-down"></i> Disminuir Stock</a></li>
                            </ul>
                        </div>
                    </div>
                <?php endif; ?>
                <div class="form-actions" style="padding-right: 0px; float: left;">
                    <a href="#modal-nuevo-producto" onclick="resetFormProducto()" data-toggle="modal" class="btn btn-primary">
                        <i class="icon-plus"></i>
                        Agregar Producto
                    </a>
                </div>
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
                        <h2><?= $totStock ?></h2>
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
                        <h2>$<?= number_format($costoTotal, 2, ',', '.') ?></h2>
                    </div>
                </li>
                <li class="bg-success text-center">
                    <div class="page-stats-showcase" style="float:none;">
                        <span>
                            Valor Venta Total
                            &nbsp;
                            <a href="#" data-placement="bottom" class="tip" data-original-title="Corresponde al total que surge de multiplicar el precio de venta de los productos (asignado en la base de datos) por la cantidad de unidades en stock disponibles.">
                                <i class="fas fa-question-circle"></i>
                            </a>                        
                        </span>
                        <h2>$<?= number_format($valorVentaTotal, 2, ',', '.') ?></h2>
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
                                        <th class="text-center">IVA Ventas</th>
                                        <th class="text-center">IVA Compras</th>
                                        <th class="text-center">Tipo de Producto</th>
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
                                                <td class="text-center"><?= $value['descIvaVentas'] ?></td>
                                                <td class="text-center"><?= $value['descIvaCompras'] ?></td>
                                                <td class="text-center"> - </td>
                                                <td class="text-center"><?= $value['nombEmpresa'] ?></td>
                                                <td class="text-center">
                                                    <?php if ($userdata['idUsuario'] != 28 && $userdata['idUsuario'] != 29): ?>                                                    
                                                        <a href="#modal-delete" class="tip delete_producto" role="button" data-id="<?= $value['idGenProducto'] ?>" data-toggle="modal" data-original-title="Eliminar"><i class="icon-remove4"></i></a>
                                                    <?php endif?>                                                        
                                                    &nbsp;
                                                    <a href="#" class="tip edit_producto" data-id="<?= $value['idGenProducto'] ?>" onclick="resetFormProducto()" data-toggle="modal" data-original-title="Editar"><i class="icon-pencil3"></i></a>
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