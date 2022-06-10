<?php 

class PaginasModel extends Mysql
{
	private $intIdPagina;
	private $strTitulo;
	private $strContenido;
	private $intStatus;
	private $strRuta;
	private $strImagen;
	
	public function __construct()
	{
		parent::__construct();
	}

	public function selectPaginas(){
		$sql = "SELECT IdPagina, Pag_Titulo, DATE_FORMAT(Pag_Datecreate, '%d/%m/%Y') as fecha, Pag_Ruta, Est_IdEstado
				FROM TblPagina  
				WHERE Est_IdEstado != 0 ";
		$request = $this->select_all($sql);
		return $request;
	}	

	public function updatePost(int $idPost, string $titulo, string $contenido, string $portada, int $status){
		$this->intIdPagina = $idPost;
		$this->strTitulo = $titulo;
		$this->strContenido = $contenido;
		$this->strImagen = $portada;
		$this->intStatus = $status;
		$sql = "UPDATETblPagina SET Pag_Titulo = ?, Pag_Contenido = ?, Pag_Portada = ?, Est_IdEstado = ? WHERE IdPagina = $this->intIdPagina ";
		$arrData = array($this->strTitulo, 
						 $this->strContenido,
						 $this->strImagen, 
						 $this->intStatus);
		$request = $this->update($sql,$arrData);
	    return $request;
	}

	public function insertPost(string $titulo, string $contenido, string $portada, string $ruta, int $status){
		$this->strTitulo = $titulo;
		$this->strContenido = $contenido;
		$this->strImagen = $portada;
		$this->strRuta = $ruta;
		$this->intStatus = $status;
		$sql = "SELECT * FROM TblPagina WHERE Pag_Ruta = '{$this->strRuta}'";
		$request = $this->select_all($sql);
		if(empty($request)){
			$query_insert  = "INSERT INTO TblPagina(Pag_Titulo,
												Pag_Contenido,
												Pag_Portada,
												Pag_Ruta,
												Est_IdEstado) 
							  VALUES(?,?,?,?,?)";
			$arrData = array($this->strTitulo,
    						$this->strContenido,
    						$this->strImagen,
    						$this->strRuta,
    						$this->intStatus);
			$request_insert = $this->insert($query_insert,$arrData);
        	$return = $request_insert;
		}else{
			$return = 0;
		}
		return $return;
	}


	public function deletePagina(int $idpagina){
		$this->intIdPagina = $idpagina;
		$sql = "UPDATE TblPagina SET Est_IdEstado = ? WHERE IdPagina = $this->intIdPagina ";
		$arrData = array(0);
		$request = $this->update($sql,$arrData);
		return $request;
	}
}

 ?>