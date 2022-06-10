<?php 
	class FacturaModel extends Mysql
	{
		public function __construct()
		{
			parent::__construct();
		}

		public function selectPedido(int $idpedido, $idpersona = NULL){
			$busqueda = "";
			if($idpersona != NULL){
				$busqueda = " AND p.Ped_IdPersona =".$idpersona;
			}
			$request = array();
			$sql = "SELECT p.IdPedido,
							p.Ped_Referenciacobro,
							p.Tpay_IdTransaccionpaypal,
							p.Per_IdPersona,
							DATE_FORMAT(p.Ped_Fecha, '%d/%m/%Y') as fecha,
							p.Ped_Costo_envio,
							p.Ped_Monto,
							p.Tpag_IdTipopago,
							t.Tpag_Tipopago,
							p.Ped_Direccion_envio,
							p.Est_IdEstado
					FROM TblPedido as p
					INNER JOIN TblTipopago t
					ON p.Tpag_IdTipopago = t.IdTipopago
					WHERE p.IdPedido =  $idpedido ".$busqueda;
			$requestPedido = $this->select($sql);
			if(!empty($requestPedido)){
				$idpersona = $requestPedido['personaid'];
				$sql_cliente = "SELECT IdPersona,
										Per_Nombres,
										Per_Apellidos,
										Per_Telefono,
										Per_Email
								FROM TblPersona WHERE IdPersona = $idpersona ";
				$requestcliente = $this->select($sql_cliente);
				$sql_detalle = "SELECT p.IdProducto,
											p.Prod_Nombre as producto,
											d.Prod_Precio,
											d.DetP_Cantidad
									FROM TblDetalle_pedido d
									INNER JOIN TblProducto p
									ON d.Prod_IdProducto = p.IdProducto
									WHERE d.Ped_IdPedido = $idpedido";
				$requestProductos = $this->select_all($sql_detalle);
				$request = array('cliente' => $requestcliente,
								'orden' => $requestPedido,
								'detalle' => $requestProductos
								 );
			}
			return $request;
		}

		

	}
 ?>