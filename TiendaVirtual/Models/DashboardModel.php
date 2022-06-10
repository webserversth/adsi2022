<?php 
	class DashboardModel extends Mysql
	{
		public function __construct()
		{
			parent::__construct();
		}

		public function cantUsuarios(){
			$sql = "SELECT COUNT(*) as total FROM TblPersona WHERE Est_IdEstado != 0";
			$request = $this->select($sql);
			$total = $request['total']; 
			return $total;
		}
		public function cantClientes(){
			$sql = "SELECT COUNT(*) as total FROM TblPersona WHERE Est_IdEstado != 0 AND Rol_IdRol = ".RCLIENTES;
			$request = $this->select($sql);
			$total = $request['total']; 
			return $total;
		}
		public function cantProductos(){
			$sql = "SELECT COUNT(*) as total FROM TblProducto WHERE Est_IdEstado != 0 ";
			$request = $this->select($sql);
			$total = $request['total']; 
			return $total;
		}
		public function cantPedidos(){
			$rolid = $_SESSION['userData']['idrol'];
			$idUser = $_SESSION['userData']['IdPersona'];
			$where = "";
			if($rolid == RCLIENTES ){
				$where = " WHERE Per_IdPersona = ".$idUser;
			}

			$sql = "SELECT COUNT(*) as total FROM TblPedido ".$where;
			$request = $this->select($sql);
			$total = $request['total']; 
			return $total;
		}
		public function lastOrders(){
			$rolid = $_SESSION['userData']['idrol'];
			$idUser = $_SESSION['userData']['IdPersona'];
			$where = "";
			if($rolid == RCLIENTES ){
				$where = " WHERE p.Per_IdPersona = ".$idUser;
			}

			$sql = "SELECT p.IdPedido, CONCAT(pr.Per_Nombres,' ',pr.Per_Apellidos) as nombre, p.Ped_Monto, p.Ped_Proceso 
					FROM TblPedido p
					INNER JOIN TblPersona pr
					ON p.Per_IdPersona = pr.IdPersona
					$where
					ORDER BY p.IdPedido DESC LIMIT 10 ";
			$request = $this->select_all($sql);
			return $request;
		}	
		public function selectPagosMes(int $anio, int $mes){

			$sql = "SELECT p.Tpag_IdTipopago, tp.Tpag_Tipopago, COUNT(p.Tpag_IdTipopago) as cantidad, SUM(p.Ped_Monto) as total 
					FROM TblPedido p 
					INNER JOIN TblTipopago tp 
					ON p.Tpag_IdTipopago = tp.IdTipopago 
					WHERE MONTH(p.Ped_Fecha) = $mes AND YEAR(p.Ped_Fecha) = $anio GROUP BY Tpag_IdTipopago";
			$pagos = $this->select_all($sql);
			$meses = Meses();
			$arrData = array('anio' => $anio, 'mes' => $meses[intval($mes-1)], 'Tpag_Tipopago' => $pagos );
			return $arrData;
		}
		public function selectVentasMes(int $anio, int $mes){
			$rolid = $_SESSION['userData']['idrol'];
			$idUser = $_SESSION['userData']['IdPersona'];
			$where = "";
			if($rolid == RCLIENTES ){
				$where = " AND Per_IdPersona = ".$idUser;
			}

			$totalVentasMes = 0;
			$arrVentaDias = array();
			$dias = cal_days_in_month(CAL_GREGORIAN,$mes, $anio);
			$n_dia = 1;
			for ($i=0; $i < $dias ; $i++) { 
				$date = date_create($anio."-".$mes."-".$n_dia);
				$fechaVenta = date_format($date,"Y-m-d");
				$sql = "SELECT DAY(Ped_Fecha) AS dia, COUNT(IdPedido) AS cantidad, SUM(Ped_Monto) AS total 
						FROM TblPedido 
						WHERE DATE(Ped_Fecha) = '$fechaVenta' AND Ped_Proceso = 'Completo' ".$where;
				$ventaDia = $this->select($sql);
				$ventaDia['dia'] = $n_dia;
				$ventaDia['total'] = $ventaDia['total'] == "" ? 0 : $ventaDia['total'];
				$totalVentasMes += $ventaDia['total'];
				array_push($arrVentaDias, $ventaDia);
				$n_dia++;
			}
			$meses = Meses();
			$arrData = array('anio' => $anio, 'mes' => $meses[intval($mes-1)], 'total' => $totalVentasMes,'ventas' => $arrVentaDias );
			return $arrData;
		}
		public function selectVentasAnio(int $anio){
			$arrMVentas = array();
			$arrMeses = Meses();
			for ($i=1; $i <= 12; $i++) { 
				$arrData = array('anio'=>'','no_mes'=>'','mes'=>'','venta'=>'');
				$sql = "SELECT $anio AS anio, $i AS mes, SUM(Ped_Monto) AS venta 
						FROM TblPedido 
						WHERE MONTH(Ped_Fecha)= $i AND YEAR(Ped_Fecha) = $anio AND Ped_Proceso = 'Completo' 
						GROUP BY MONTH(Ped_Fecha) ";
				$ventaMes = $this->select($sql);
				$arrData['mes'] = $arrMeses[$i-1];
				if(empty($ventaMes)){
					$arrData['anio'] = $anio;
					$arrData['no_mes'] = $i;
					$arrData['venta'] = 0;
				}else{
					$arrData['anio'] = $ventaMes['anio'];
					$arrData['no_mes'] = $ventaMes['mes'];
					$arrData['venta'] = $ventaMes['venta'];
				}
				array_push($arrMVentas, $arrData);
				# code...
			}
			$arrVentas = array('anio' => $anio, 'meses' => $arrMVentas);
			return $arrVentas;
		}
		public function productosTen(){
			$sql = "SELECT * FROM TblProducto WHERE Est_IdEstado = 1 ORDER BY IdProducto DESC LIMIT 10 ";
			$request = $this->select_all($sql);
			return $request;
		}
	}
 ?>