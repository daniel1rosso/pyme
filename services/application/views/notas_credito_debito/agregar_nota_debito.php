<!-- Page content -->
<div class="page-content">

    <!-- Page header -->
    <div class="page-header">
        <div class="page-title">
            <h3>Nota Débito <small>Nuevo</small></h3>
        </div>
    </div>
    <!-- /page header -->

    <!-- Breadcrumbs line -->
    <div class="breadcrumb-line">
        <ul class="breadcrumb">
            <li><a href="<?= $url ?>dashboard">Home</a></li>
            <li><a href="<?= $url ?>notas_credito_debito/listar_nota_credito">Notas Débito</a></li>
            <li class="active">Agregar</li>
        </ul>

        <div class="visible-xs breadcrumb-toggle">
            <a class="btn btn-link btn-lg btn-icon" data-toggle="collapse" data-target=".breadcrumb-buttons"><i class="icon-menu2"></i></a>
        </div>
    </div>
    <!-- /breadcrumbs line -->

    <!-- Basic inputs -->
    <div class="panel panel-default">
        <div class="panel-heading"><h6 class="panel-title"><i class="icon-pencil3"></i> Agregar Nota Débito</h6></div>
        <div class="panel-body">        
            <form id="formNuevaNotaDebito" role="form" action="#" method="POST" enctype="multipart/form-data">
                <div id="paso-1" style="padding-bottom:15px;">
                    <div id="boxCabeceraForm">
                        <h3>
                            <small>
                                <i style="color:#333333;" class="fas fa-id-card" aria-hidden="true"></i>
                                DATOS CLIENTE.
                            </small>
                        </h3>
                    </div>             

                    <div class="row">
                        <div class="col-md-6" style="padding:0px;">
                            <div class="col-md-12">                              
                                <div class="form-group label-floating has-feedback"> 
                                    <label class="control-label" for="selectCliente_formNuevaNotaDebito"><span style="color: red;"> * </span>Cliente</label>
                                    <select name="selectCliente_formNuevaNotaDebito" id="selectCliente_formNuevaNotaDebito" class="select-full" required>
                                        <option value="0">Seleccionar Cliente</option>
                                        <?php
                                        if ($idGenIngreso != "" && isset($clientes) && isset($ingresos)) :
                                            for ($i = 0; $i < count($clientes); $i++) :
                                                if ($clientes[$i]['idCliente'] == $ingresos[0]['idCliente']) :
                                                    echo '<option selected="selected" value="' . $clientes[$i]['idCliente'] . '">' . $clientes[$i]['nombEmpresa'] . '</option>';
                                                else :
                                                    echo '<option value="' . $clientes[$i]['idCliente'] . '">' . $clientes[$i]['nombEmpresa'] . '</option>';
                                                endif;
                                            endfor;
                                        elseif (isset($clientes)) :
                                            for ($i = 0; $i < count($clientes); $i++) :
                                                echo '<option value="' . $clientes[$i]['idCliente'] . '">' . $clientes[$i]['nombEmpresa'] . '</option>';
                                            endfor;
                                        endif;
                                        ?>         
                                    </select>                                               

                                    <div id="errorselectCliente_formNuevaNotaDebito" class="btn-danger erroBoxs" style="display: none">
                                        * Debe seleccionar una opci&oacute;n
                                    </div>   
                                </div>                                            
                            </div>                    

                            <div class="col-md-12" style="padding:0px;">
                                <div class="col-md-12">                              
                                    <div class="form-group label-floating has-feedback"> 
                                        <label class="control-label" for="selectProductos_formNuevaNotaDebito">Productos</label>
                                        <select name="selectProductos_formNuevaNotaDebito" id="selectProductos_formNuevaNotaDebito" class="select-full" required>
                                            <option value="0">Seleccionar producto</option>
                                            <?php
                                            if (isset($productos)) :
                                                for ($i = 0; $i < count($productos); $i++) :
                                                    echo '<option value="' . $productos[$i]['idProducto'] . '">(' . $productos[$i]['codigo'] . ") - " . $productos[$i]['nombre'] . '</option>';
                                                endfor;
                                            endif;
                                            ?>         
                                        </select>                                               

                                        <div id="errorStockProducto_formNuevaNotaDebito" class="btn-danger erroBoxs" style="display: none">
                                            * Sin Stock
                                        </div>   
                                    </div>                                            
                                </div>   
                            </div>    
                        </div>                            

                        <div class="col-md-6" style="padding:0px;">
                            <div class="col-md-12" style="padding:0px;">
                                <div class="col-md-4">                                
                                    <div class="form-group label-floating has-feedback">     
                                        <label class="control-label" for="inputFechaEmision_formNuevaNotaDebito">Emision</label>
                                        <input type="text" id="inputFechaEmision_formNuevaNotaDebito" class="form-control date-range-filter" data-date-format="yyyy-mm-dd" autocomplete="off">

                                        <div id="errorinputFechaEmision_formNuevaNotaDebito" class="btn-danger erroBoxs" style="display: none">
                                            * Debe completar el campo
                                        </div>   
                                    </div>                                        
                                </div>
                                <div class="col-md-4">                                
                                    <div class="form-group label-floating has-feedback">     
                                        <label class="control-label" for="inputFechaVencimiento_formNuevaNotaDebito">Fecha Vto</label>
                                        <input type="text" id="inputFechaVencimiento_formNuevaNotaDebito" class="form-control date-range-filter" data-date-format="yyyy-mm-dd" autocomplete="off">

                                        <div id="errorinputFechaVencimiento_formNuevaNotaDebito" class="btn-danger erroBoxs" style="display: none">
                                            * Debe completar el campo
                                        </div>   
                                    </div>                                        
                                </div>
                                <div class="col-md-4">                                
                                    <div class="form-group label-floating has-feedback"> 
                                        <label class="control-label" for="selectTipoNota_formNuevaNotaDebito">Tipo</label>
                                        <select name="selectTipoNota_formNuevaNotaDebito" id="selectTipoNota_formNuevaNotaDebito" class="select-full" required>
                                            <option value="0">Seleccionar tipo</option>
                                            <?php
                                            if (isset($notas_tipos)) :
                                                for ($i = 0; $i < count($notas_tipos); $i++) :
                                                    if ($idGenIngreso != "") :
                                                        if ($i == 1) :
                                                            echo '<option selected="selected" value="' . $notas_tipos[$i]['idTipoNota'] . '">' . $notas_tipos[$i]['descripcion'] . '</option>';
                                                        else:
                                                            echo '<option value="' . $notas_tipos[$i]['idTipoNota'] . '">' . $notas_tipos[$i]['descripcion'] . '</option>';
                                                        endif;
                                                    else:
                                                        echo '<option value="' . $notas_tipos[$i]['idTipoNota'] . '">' . $notas_tipos[$i]['descripcion'] . '</option>';
                                                    endif;
                                                endfor;
                                            endif;
                                            ?>         
                                        </select>                                               

                                        <div id="errorselectTipoNota_formNuevaNotaDebito" class="btn-danger erroBoxs" style="display: none">
                                            * Debe seleccionar una opci&oacute;n
                                        </div>   
                                    </div>                                       
                                </div>
                            </div>
                        </div>  

                        <div class="col-md-6">

                            <div class="form-group label-floating has-feedback"> 
                                <div class="form-group label-floating has-feedback">     
                                    <label class="control-label" for="selectVentas_formNuevaNotaDebito"><span style="color: red;"> * </span>Ventas</label>
                                    <select name="selectVentas_formNuevaNotaDebito" id="selectVentas_formNuevaNotaDebito" class="select-full" required>
                                        <option value="0">Seleccionar una venta</option>
                                        <?php
                                        if (isset($ingresos)) :
                                            for ($i = 0; $i < count($ingresos); $i++) :
                                                if ($idGenIngreso != "" && $idGenIngreso == $ingresos[$i]['idGenIngreso']) :
                                                    echo '<option selected="selected" value="' . $ingresos[$i]['idGenIngreso'] . '">' . $ingresos[$i]['idIngreso'] . " - " . $ingresos[$i]['nombEmpresa'] . " - $" . number_format($ingresos[$i]['total'], 2, ",", ".") . '</option>';
                                                else:
                                                    echo '<option value="' . $ingresos[$i]['idGenIngreso'] . '">' . $ingresos[$i]['idIngreso'] . " - " . $ingresos[$i]['nombEmpresa'] . " - $" . number_format($ingresos[$i]['total'], 2, ",", ".") . '</option>';
                                                endif;
                                            endfor;
                                        endif;
                                        ?>         
                                    </select> 

                                    <div id="errorSelectVentas_formNuevaNotaDebito" class="btn-danger erroBoxs" style="display: none">
                                        * Debe completar el campo
                                    </div>   
                                </div> 
                            </div>                                     

                        </div>
                    </div>
                </div>                                 

                <div id="paso-2">
                    <div id="boxCabeceraForm">
                        <h3>
                            <small>
                                <i style="color:#333333;" class="fas fa-shopping-cart" aria-hidden="true"></i>
                                DETALLE Nota Débito.
                            </small>
                        </h3>
                    </div> 
                    <div class="tabbable page-tabs">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#notadebito" data-toggle="tab">
                                    <i class="fas fa-shopping-bag" style="font-size:1.4em;"></i> 
                                    Nota Débito
                                </a>
                            </li>	  
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active fade in" id="detalleNotaDebito">
                                <div class="panel panel-default">
                                    <div class="panel-heading"><h6 class="panel-title"><i class="icon-paragraph-justify"></i> Listado</h6></div>
                                    <div class="datatable">
                                        <table class="table table-striped table-bordered" id="listadoDetalleNotaDebito">
                                            <thead>
                                                <tr>
                                                    <th class="text-center col-lg-1">idGenProducto</th>
                                                    <th class="text-center col-lg-1">Codigo</th>
                                                    <th class="text-center col-lg-2">Producto</th>
                                                    <th class="text-center col-lg-1">Cantidad</th>                                     
                                                    <th class="text-center col-lg-2">Precio</th>
                                                    <th class="text-center col-lg-2">Descuento</th>
                                                    <th class="text-center col-lg-2">Subtotal</th>
                                                    <th class="text-center col-lg-1">IVA</th>                                        
                                                    <th class="text-center col-lg-1">Acciones</th>
                                                    <th class="text-center col-lg-1">idProducto</th>                                        
                                                </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>            
                </div>
                &nbsp;
                &nbsp;
                &nbsp;

                <div class="row">
                    <div class="col-md-12" style="padding:0px;">
                        <div class="col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading"><h6 class="panel-title"><i class="icon-pencil3"></i> Notas</h6></div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Nota: </label>
                                            <div class="col-sm-10">
                                                <textarea rows="5" cols="5" id="notaCliente_formNuevaNotaDebito" class="form-control" placeholder="Nota para el cliente"></textarea>
                                            </div>
                                        </div>
                                        &nbsp;
                                        &nbsp;
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Nota: </label>
                                            <div class="col-sm-10">
                                                <textarea rows="5" cols="5" id="notaInterna_formNuevaNotaDebito" class="form-control" placeholder="Nota interna"></textarea>
                                            </div>
                                        </div>                                            
                                    </div>                                            
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading"><h6 class="panel-title"><i class="icon-cogs"></i> Opciones y c&aacute;lculos</h6></div>
                                <div class="panel-body">
                                    <div class="row">              
                                        <div class="form-group label-floating has-feedback">     
                                            <label class="col-sm-3 control-label" disabled for="importeNoGravado">Importe neto no Gravado</label>
                                            <div class="col-sm-9">
                                                <input type="text" id="importeNoGravado_formNuevaNotaDebito" disabled class="form-control" >
                                            </div>

                                            <div id="errorimporteNoGravado_formNuevaNotaDebito" class="btn-danger erroBoxs" style="display: none">
                                                * Debe completar el campo
                                            </div>   
                                        </div>                                        
                                        <div class="boxIVA">

                                        </div>
                                        &nbsp;
                                        &nbsp;
                                        <div class="form-group label-floating has-feedback">     
                                            <label class="col-sm-3 control-label" for="descEfectuado">Descuento efectuado</label>
                                            <div class="col-sm-9">
                                                <input type="text" id="descEfectuado_formNuevaNotaDebito" disabled class="form-control" >
                                            </div>

                                            <div id="errordescEfectuado_formNuevaNotaDebito" class="btn-danger erroBoxs" style="display: none">
                                                * Debe completar el campo
                                            </div>   
                                        </div>                                        
                                        <div class="boxIVA">

                                        </div>    
                                        &nbsp;
                                        &nbsp;
                                        <div class="form-group label-floating has-feedback">     
                                            <label class="col-sm-3 control-label" for="totalVenta">Total venta</label>
                                            <div class="col-sm-9">
                                                <input type="text" id="totalVenta_formNuevaNotaDebito" disabled class="form-control" >
                                            </div>
                                            <div id="errortotalVenta_formNuevaNotaDebito" class="btn-danger erroBoxs" style="display: none">
                                                * Debe completar el campo
                                            </div>   
                                        </div> 
                                    </div>   
                                </div>   
                            </div>
                        </div>
                    </div>
                </div>

                <input type="hidden" name="idGenIngreso" id="idGenIngreso" class="form-control" value="<?= $idGenIngreso ?>">

                <div style="margin-top:15px;">
                    <span id="btnGuardarNotaDebito" class="btn btn-primary btn-raised btn-block">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>
                        Guardar
                    </span>
                </div>          
            </form>
        </div>
    </div>