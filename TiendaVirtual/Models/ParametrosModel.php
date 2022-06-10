<?php 

	class parametrosModel extends Mysql
	{
		public $intIdparametro;
		public $strValor;
		public $strDescripcion;
		public $intStatus;

		public function __construct()
		{
			parent::__construct();
		}

		public function selectParametros()
		{

			//EXTRAE ROLES
			$sql = "SELECT * FROM TblParametro WHERE Est_IdEstado != 0";
			$request = $this->select_all($sql);
			return $request;
		}

		public function selectParametro(int $idparametro)
		{
			//BUSCAR ROLE
			$this->intIdparametro = $idparametro;
			$sql = "SELECT * FROM TblParametro WHERE IdParametro = $this->intIdparametro";
			$request = $this->select($sql);
			return $request;
		}

		public function insertParametro(string $valor, string $descripcion, int $status){

			$return = "";
			$this->strValor = $valor;
			$this->strDescripcion = $descripcion;
			$this->intStatus = $status;

			$sql = "SELECT * FROM TblParametro WHERE Par_Valor = '{$this->strValor}' ";
			$request = $this->select_all($sql);

			if(empty($request))
			{
				$query_insert  = "INSERT INTO TblParametro(Par_Valor,Par_Descripcion,Est_IdEstado) VALUES(?,?,?)";
	        	$arrData = array($this->strValor, $this->strDescripcion, $this->intStatus);
	        	$request_insert = $this->insert($query_insert,$arrData);
	        	$return = $request_insert;
			}else{
				$return = "exist";
			}
			return $return;
		}	

		public function updateParametro(int $idparametro, string $valor, string $descripcion, int $status){
			$this->intIdparametro = $idparametro;
			$this->strValor = $valor;
			$this->strDescripcion = $descripcion;
			$this->intStatus = $status;

			$sql = "SELECT * FROM TblParametro WHERE Par_Valor= '$this->strValor' AND IdParametro != $this->intIdparametro";
			$request = $this->select_all($sql);

			if(empty($request))
			{
				$sql = "UPDATE TblParametro SET Par_Valor = ?, Par_Descripcion = ?, Est_IdEstado = ? WHERE IdParametro = $this->intIdparametro ";
				$arrData = array($this->strValor, $this->strDescripcion, $this->intStatus);
				$request = $this->update($sql,$arrData);
			}else{
				$request = "exist";
			}
		    return $request;			
		}
		
		public function deleteParametro(int $idparametro)
		{
			$this->intIdparametro = $idparametro;
        	$sql = "UPDATE TblParametro SET Est_IdEstado = ? WHERE IdParametro = $this->intIdparametro";
			$arrData = array(0);
			$request = $this->update($sql,$arrData);
			return $request;
	    }
	}
 ?>