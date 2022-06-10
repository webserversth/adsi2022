<?php 
require_once("Libraries/Core/Mysql.php");
trait TCliente{
	private $con;
	private $intIdUsuario;
	private $strNombre;
	private $strApellido;
	private $intTelefono;
	private $strEmail;
	private $strPassword;
	private $strToken;
	private $intTipoId;
	private $intIdTransaccion;

	public function insertCliente(string $nombre, string $apellido, int $telefono, string $email, string $password, int $tipoid){
		$this->con = new Mysql();
		$this->strNombre = $nombre;
		$this->strApellido = $apellido;
		$this->intTelefono = $telefono;
		$this->strEmail = $email;
		$this->strPassword = $password;
		$this->intTipoId = $tipoid;

		$return = 0;
		$sql = "SELECT * FROM TblPersona WHERE 
				Per_Email = '{$this->strEmail}' ";
		$request = $this->con->select_all($sql);

		if(empty($request))
		{
			$query_insert  = "INSERT INTO TblPersona(Per_Nombres,Per_Apellidos,Per_Telefono,Per_Email,Per_Password,Rol_IdRol) 
							  VALUES(?,?,?,?,?,?)";
        	$arrData = array($this->strNombre,
    						$this->strApellido,
    						$this->intTelefono,
    						$this->strEmail,
    						$this->strPassword,
    						$this->intTipoId);
        	$request_insert = $this->con->insert($query_insert,$arrData);
        	$return = $request_insert;
		}else{
			$return = "exist";
		}
        return $return;
	}

	public function insertPedido(string $idtransaccionpaypal = NULL, string $datospaypal = NULL, int $personaid, float $costo_envio, string $monto, int $tipopagoid, string $direccionenvio, string $proceso){
		$this->con = new Mysql();
		$query_insert  = "INSERT INTO TblPedido(Tpay_IdTransaccionpaypal,Ped_Datospaypal,Per_IdPersona,Ped_Costo_envio,Ped_Monto,Tpag_IdTipopago,Ped_Direccion_envio,Ped_Proceso) 
							  VALUES(?,?,?,?,?,?,?,?)";
		$arrData = array($idtransaccionpaypal,
    						$datospaypal,
    						$personaid,
    						$costo_envio,
    						$monto,
    						$tipopagoid,
    						$direccionenvio,
    						$proceso
    					);
		$request_insert = $this->con->insert($query_insert,$arrData);
	    $return = $request_insert;
	    return $return;
	}

	public function insertDetalle(int $idpedido, int $productoid, float $precio, int $cantidad){
		$this->con = new Mysql();
		$query_insert  = "INSERT INTO TblDetalle_pedido(Ped_IdPedido,Prod_IdProducto,DetP_Precio,DetP_Cantidad) 
							  VALUES(?,?,?,?)";
		$arrData = array($idpedido,
    					$productoid,
						$precio,
						$cantidad
					);
		$request_insert = $this->con->insert($query_insert,$arrData);
	    $return = $request_insert;
	    return $return;
	}

	public function insertDetalleTemp(array $pedido){
		$this->intIdUsuario = $pedido['idcliente'];
		$this->intIdTransaccion = $pedido['idtransaccion'];
		$productos = $pedido['productos'];

		$this->con = new Mysql();
		$sql = "SELECT * FROM TblDetalle_temp WHERE 
					DetT_Transaccionid = '{$this->intIdTransaccion}' AND 
					Per_IdPersona = $this->intIdUsuario";
		$request = $this->con->select_all($sql);

		if(empty($request)){
			foreach ($productos as $producto) {
				$query_insert  = "INSERT INTO TblDetalle_temp(Per_IdPersona,Prod_IdProducto,DetT_Precio,DetT_Cantidad,DetT_Transaccionid) 
								  VALUES(?,?,?,?,?)";
	        	$arrData = array($this->intIdUsuario,
	        					$producto['idproducto'],
	    						$producto['precio'],
	    						$producto['cantidad'],
	    						$this->intIdTransaccion
	    					);
	        	$request_insert = $this->con->insert($query_insert,$arrData);
			}
		}else{
			$sqlDel = "DELETE FROM TblDetalle_temp WHERE 
				DetT_Transaccionid = '{$this->intIdTransaccion}' AND 
					Per_IdPersona = $this->intIdUsuario";
			$request = $this->con->delete($sqlDel);
			foreach ($productos as $producto) {
				$query_insert  = "INSERT INTO detalle_temp(Per_IdPersona,Prod_IdProducto,DetT_Precio,DetT_Cantidad,DetT_Transaccionid) 
								  VALUES(?,?,?,?,?)";
	        	$arrData = array($this->intIdUsuario,
	        					$producto['idproducto'],
	    						$producto['precio'],
	    						$producto['cantidad'],
	    						$this->intIdTransaccion
	    					);
	        	$request_insert = $this->con->insert($query_insert,$arrData);
			}
		}
	}

	public function getPedido(int $idpedido){
		$this->con = new Mysql();
		$request = array();
		$sql = "SELECT p.IdPedido,
							p.Ped_Referenciacobro,
							p.Tpay_IdTransaccionpaypal,
							p.Per_IdPersona,
							p.Ped_Fecha,
							p.Ped_costo_envio,
							p.Ped_Monto,
							p.Tpag_IdTipopago,
							t.Tpag_Tipopago,
							p.Ped_direccion_envio,
							p.Ped_Proceso
					FROM TblPedido as p
					INNER JOIN TblTipopago t
					ON p.Tpag_IdTipopago = t.IdTipopago
					WHERE p.IdPedido  =  $idpedido";
		$requestPedido = $this->con->select($sql);
		if(count($requestPedido) > 0){
			$sql_detalle = "SELECT p.IdProducto,
											p.Prod_Nombre as producto,
											d.DetP_Precio,
											d.DetP_Cantidad
									FROM TblDetalle_pedido d
									INNER JOIN TblProducto p
									ON d.Prod_IdProducto = p.IdProducto
									WHERE d.Ped_IdPedido = $idpedido
									";
			$requestProductos = $this->con->select_all($sql_detalle);
			$request = array('orden' => $requestPedido,
							'detalle' => $requestProductos
							);
		}
		return $request;
	}

	public function setSuscripcion(string $nombre, string $email){
		$this->con = new Mysql();
		$sql = 	"SELECT * FROM TblSuscripciones WHERE Sus_Email = '{$email}'";
		$request = $this->con->select_all($sql);
		if(empty($request)){
			$query_insert  = "INSERT INTO TblSuscripciones(Sus_Nombre,Sus_Email) 
							  VALUES(?,?)";
			$arrData = array($nombre,$email);
			$request_insert = $this->con->insert($query_insert,$arrData);
			$return = $request_insert;
		}else{
			$return = false;
		}
		return $return;
	}

	public function setContacto(string $nombre, string $email, string $mensaje, string $ip, string $dispositivo, string $useragent){
		$this->con = new Mysql();
		$nombre  	 = $nombre != "" ? $nombre : ""; 
		$email 		 = $email != "" ? $email : ""; 
		$mensaje	 = $mensaje != "" ? $mensaje : ""; 
		$ip 		 = $ip != "" ? $ip : ""; 
		$dispositivo = $dispositivo != "" ? $dispositivo : ""; 
		$useragent 	 = $useragent != "" ? $useragent : ""; 
		$query_insert  = "INSERT INTO TblContacto(Cont_Nombre,Cont_Email,Cont_Mensaje,Cont_Ip,Cont_Dispositivo,Cont_Useragent) 
						  VALUES(?,?,?,?,?,?)";
		$arrData = array($nombre,$email,$mensaje,$ip,$dispositivo,$useragent);
		$request_insert = $this->con->insert($query_insert,$arrData);
		return $request_insert;
	}
}

 ?>