<?php headerAdmin($data); ?>
<main class="app-content">
  <div class="app-title">
    <div>
      <h1><i class="fa fa-file-text-o"></i> <?= $data['page_title'] ?></h1>
    </div>
    <ul class="app-breadcrumb breadcrumb">
      <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
      <li class="breadcrumb-item"><a href="<?= base_url(); ?>/pedidos"> Pedidos</a></li>
    </ul>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <?php
          if(empty($data['arrPedido'])){
        ?>
        <p>Datos no encontrados</p>
        <?php }else{
            $cliente = $data['arrPedido']['cliente']; 
            $orden = $data['arrPedido']['orden'];
            $detalle = $data['arrPedido']['detalle'];
            $transaccion = $orden['Tpay_IdTransaccionpaypal'] != "" ? 
                           $orden['Tpay_IdTransaccionpaypal'] : 
                           $orden['Ped_Referenciacobro'];
         ?>
        <section id="sPedido" class="invoice">
          <div class="row mb-4">
            <div class="col-6">
              <h2 class="page-header"><img src="<?= media(); ?>/tienda/images/logo.png" ></h2>
            </div>
            <div class="col-6">
              <h5 class="text-right">Fecha: <?= $orden['fecha'] ?></h5>
            </div>
          </div>
          <div class="row invoice-info">
            <div class="col-4">
              <address><strong><?= NOMBRE_EMPESA; ?></strong><br>
                <?= DIRECCION ?><br>
                <?= TELEMPRESA ?><br>
                <?= EMAIL_EMPRESA ?><br>
                <?= WEB_EMPRESA ?>
              </address>
            </div>
            <div class="col-4">
              <address><strong><?= $cliente['Per_Nombres'].' '.$cliente['Per_Apellidos'] ?></strong><br>
                Envío: <?= $orden['Ped_Direccion_envio']; ?><br>
                Tel: <?= $cliente['Per_Telefono'] ?><br>
                Email: <?= $cliente['Per_Email'] ?>
               </address>
            </div>
            <div class="col-4"><b>Orden #<?= $orden['IdPedido'] ?></b><br> 
                <b>Pago: </b><?= $orden['Tpag_Tipopago'] ?><br>
                <b>Transacción:</b> <?= $transaccion ?> <br>
                <b>Estado:</b> <?= $orden['Est_IdEstado'] ?> <br>
                <b>Monto:</b> <?= SMONEY.' '. formatMoney($orden['Ped_Monto']) ?>
            </div>
          </div>
          <div class="row">
            <div class="col-12 table-responsive">
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>Descripción</th>
                    <th class="text-right">Precio</th>
                    <th class="text-center">Cantidad</th>
                    <th class="text-right">Importe</th>
                  </tr>
                </thead>
                <tbody>
                    <?php 
                        $subtotal = 0;
                        if(count($detalle) > 0){
                            foreach ($detalle as $producto) {
                                $subtotal += $producto['DetP_Cantidad'] * $producto['DetP_Precio'];
                     ?>
                  <tr>
                    <td><?= $producto['producto'] ?></td>
                    <td class="text-right"><?= SMONEY.' '. formatMoney($producto['DetP_Precio']) ?></td>
                    <td class="text-center"><?= $producto['DetP_Cantidad'] ?></td>
                    <td class="text-right"><?= SMONEY.' '. formatMoney($producto['DetP_Cantidad'] * $producto['DetP_Precio']) ?></td>
                  </tr>
                  <?php 
                            }
                        }
                   ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="3" class="text-right">Sub-Total:</th>
                        <td class="text-right"><?= SMONEY.' '. formatMoney($subtotal) ?></td>
                    </tr>
                    <tr>
                        <th colspan="3" class="text-right">Envío:</th>
                        <td class="text-right"><?= SMONEY.' '. formatMoney($orden['Ped_Costo_envio']) ?></td>
                    </tr>
                    <tr>
                        <th colspan="3" class="text-right">Total:</th>
                        <td class="text-right"><?= SMONEY.' '. formatMoney($orden['Ped_Monto']) ?></td>
                    </tr>
                </tfoot>
              </table>
            </div>
          </div>
          <div class="row d-print-none mt-2">
            <div class="col-12 text-right"><a class="btn btn-primary" href="javascript:window.print('#sPedido');" ><i class="fa fa-print"></i> Imprimir</a></div>
          </div>
        </section>
        <?php } ?>
      </div>
    </div>
  </div>
</main>
<?php footerAdmin($data); ?>