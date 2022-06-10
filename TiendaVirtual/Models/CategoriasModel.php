<?php 

	class CategoriasModel extends Mysql
	{
		public $intIdcategoria;
		public $strCategoria;
		public $strDescripcion;
		public $intStatus;
		public $strPortada;
		public $strRuta;

		public function __construct()
		{
			parent::__construct();
		}

		public function inserCategoria(string $nombre, string $descripcion, string $portada, string $ruta, int $status){

			$return = 0;
			$this->strCategoria = $nombre;
			$this->strDescripcion = $descripcion;
			$this->strPortada = $portada;
			$this->strRuta = $ruta;
			$this->intStatus = $status;

			$sql = "SELECT * FROM TblCategoria WHERE Cat_Nombre = '{$this->strCategoria}' ";
			$request = $this->select_all($sql);

			if(empty($request))
			{
				$query_insert  = "INSERT INTO TblCategoria(Cat_Nombre,Cat_Descripcion,Cat_Portada,Cat_Ruta,Est_IdEstado) VALUES(?,?,?,?,?)";
	        	$arrData = array($this->strCategoria, 
								 $this->strDescripcion, 
								 $this->strPortada,
								 $this->strRuta, 
								 $this->intStatus);
	        	$request_insert = $this->insert($query_insert,$arrData);
	        	$return = $request_insert;
			}else{
				$return = "exist";
			}
			return $return;
		}

		public function selectCategorias()
		{
			$sql = "SELECT * FROM TblCategoria 
					WHERE Est_IdEstado != 0 ";
			$request = $this->select_all($sql);
			return $request;
		}

		public function selectCategoria(int $idcategoria){
			$this->intIdcategoria = $idcategoria;
			$sql = "SELECT * FROM TblCategoria
					WHERE IdCategoria = $this->intIdcategoria";
			$request = $this->select($sql);
			return $request;
		}

		public function updateCategoria(int $idcategoria, string $categoria, string $descripcion, string $portada, string $ruta, int $status){
			$this->intIdcategoria = $idcategoria;
			$this->strCategoria = $categoria;
			$this->strDescripcion = $descripcion;
			$this->strPortada = $portada;
			$this->strRuta = $ruta;
			$this->intStatus = $status;

			$sql = "SELECT * FROM TblCategoria WHERE Cat_Nombre = '{$this->strCategoria}' AND IdCategoria != $this->intIdcategoria";
			$request = $this->select_all($sql);

			if(empty($request))
			{
				$sql = "UPDATE TblCategoria SET Cat_Nombre = ?, Cat_Descripcion = ?, Cat_Portada = ?, Cat_Ruta = ?, Est_IdEstado = ? WHERE IdCategoria = $this->intIdcategoria ";
				$arrData = array($this->strCategoria, 
								 $this->strDescripcion, 
								 $this->strPortada,
								 $this->strRuta, 
								 $this->intStatus);
				$request = $this->update($sql,$arrData);
			}else{
				$request = "exist";
			}
		    return $request;			
		}

		public function deleteCategoria(int $idcategoria)
		{
			$this->intIdcategoria = $idcategoria;
			$sql = "SELECT * FROM TblProducto WHERE Cat_IdCategoria = $this->intIdcategoria";
			$request = $this->select_all($sql);
			if(empty($request))
			{
				$sql = "UPDATE TblCategoria SET Est_IdEstado = ? WHERE IdCategoria = $this->intIdcategoria ";
				$arrData = array(0);
				$request = $this->update($sql,$arrData);
				if($request)
				{
					$request = 'ok';	
				}else{
					$request = 'error';
				}
			}else{
				$request = 'exist';
			}
			return $request;
		}	

		public function getCategoriasFooter(){
			$sql = "SELECT IdCategoria, Cat_Nombre, Cat_Descripcion, Cat_Portada, Cat_Ruta
					FROM TblCategoria WHERE  Est_IdEstado = 1 AND IdCategoria IN (".CAT_FOOTER.")";
			$request = $this->select_all($sql);
			if(count($request) > 0){
				for ($c=0; $c < count($request) ; $c++) { 
					$request[$c]['Cat_Portada'] = BASE_URL.'/Assets/images/uploads/'.$request[$c]['Cat_Portada'];		
				}
			}
			return $request;
		}


	}
 ?>