<?php 
	class PedidosModel extends Mysql
	{
		private $objCategoria;
		public function __construct()
		{
			parent::__construct();
		}

		public function selectPedidos($idpersona = null){
			$where = "";
			if($idpersona != null){
				$where = " WHERE p.Per_IdPersona = ".$idpersona;
			}
			$sql = "SELECT p.IdPedido,
							p.Ped_Referenciacobro,
							p.Tpay_IdTransaccionpaypal,
							DATE_FORMAT(p.Ped_Fecha, '%d/%m/%Y') as fecha,
							p.Ped_Monto,
							tp.Tpag_Tipopago,
							tp.IdTipopago,
							p.Est_IdEstado 
					FROM TblPedido p 
					INNER JOIN TblTipopago tp
					ON p.Tpag_IdTipopago = tp.IdTipopago $where ";
			$request = $this->select_all($sql);
			return $request;

		}	

		public function selectPedido(int $idpedido, $idpersona = NULL){
			$busqueda = "";
			if($idpersona != NULL){
				$busqueda = " AND p.Per_IdPersona =".$idpersona;
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
				$idpersona = $requestPedido['Per_IdPersona'];
				$sql_cliente = "SELECT IdPersona,
										Per_Nombres,
										Per_Apellidos,
										Per_Telefono,
										Per_Email,
										nit,
										nombrefiscal,
										direccionfiscal 
								FROM TblPersona WHERE IdPersona = $idpersona ";
				$requestcliente = $this->select($sql_cliente);
				$sql_detalle = "SELECT p.IdProducto,
											p.Prod_Nombre as producto,
											d.DetP_Precio,
											d.DetP_Cantidad
									FROM TblDetalle_pedido d
									INNER JOIN TblProducto p
									ON d.Prod_IdProducto  = p.IdProducto
									WHERE d.Ped_IdPedido = $idpedido";
				$requestProductos = $this->select_all($sql_detalle);
				$request = array('cliente' => $requestcliente,
								'orden' => $requestPedido,
								'detalle' => $requestProductos
								 );
			}
			return $request;
		}

		public function selectTransPaypal(string $idtransaccion, $idpersona = NULL){
			$busqueda = "";
			if($idpersona != NULL){
				$busqueda = " AND Per_IdPersona =".$idpersona;
			}
			$objTransaccion = array();
			$sql = "SELECT Ped_Datospaypal FROM TblPedido WHERE Tpay_IdTransaccionpaypal = '{$idtransaccion}' ".$busqueda;
			$requestData = $this->select($sql);
			if(!empty($requestData)){
				$objData = json_decode($requestData['Ped_Datospaypal']);
				//$urlOrden = $objData->purchase_units[0]->payments->captures[0]->links[2]->href;
				$urlOrden = $objData->links[0]->href;
				$objTransaccion = CurlConnectionGet($urlOrden,"application/json",getTokenPaypal());
			}
			return $objTransaccion;
		}

		public function reembolsoPaypal(string $idtransaccion, string $observacion){
			$response = false;
			$sql = "SELECT IdPedido,Ped_Datospaypal FROM TblPedido WHERE Tpay_IdTransaccionpaypal = '{$idtransaccion}' ";
			$requestData = $this->select($sql);
			if(!empty($requestData)){
				$objData = json_decode($requestData['Ped_Datospaypal']);
				$urlReembolso = $objData->purchase_units[0]->payments->captures[0]->links[1]->href;
				$objTransaccion = CurlConnectionPost($urlReembolso,"application/json",getTokenPaypal());
				if(isset($objTransaccion->status) and  $objTransaccion->status == "COMPLETED"){
					$idpedido = $requestData['IdPedido'];
					$idtrasaccion = $objTransaccion->id;
					$status = $objTransaccion->status;
					$jsonData = json_encode($objTransaccion);
					$observacion = $observacion;
					$query_insert  = "INSERT INTO TblDevolucion(Ped_IdPedido,
														Dev_Idtransaccion,
														Dev_DetalleDevolucion,
														Dev_Descripcion,
														Est_IdEstado) 
								  	VALUES(?,?,?,?,?)";
					$arrData = array($idpedido,
	        						$idtrasaccion,
	        						$jsonData,
	        						$observacion,
	        						$status
	        					);
					$request_insert = $this->insert($query_insert,$arrData);
					if($request_insert > 0){
	        			$updatePedido  = "UPDATE TblPedido SET Est_IdEstado = ? WHERE IdPedido = $idpedido";
			        	$arrPedido = array("Reembolsado");
			        	$request = $this->update($updatePedido,$arrPedido);
			        	$response = true;
	        		}
				}
				return $response;
			}
		}

		public function updatePedido(int $idpedido, $transaccion = NULL, $idtipopago = NULL, string $estado){
			if($transaccion == NULL){
				$query_insert  = "UPDATE TblPedido SET Est_IdEstado = ?  WHERE IdPedido = $idpedido ";
	        	$arrData = array($estado);
			}else{
				$query_insert  = "UPDATE TblPedido SET Ped_Referenciacobro = ?, Tpag_IdTipopago = ?,Est_IdEstado = ? WHERE IdPedido = $idpedido";
	        	$arrData = array($transaccion,
	        					$idtipopago,
	    						$estado
	    					);
			}
			$request_insert = $this->update($query_insert,$arrData);
        	return $request_insert;
		}
	}
 ?>