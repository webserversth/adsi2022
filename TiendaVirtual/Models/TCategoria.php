<?php 
require_once("Libraries/Core/Mysql.php");
trait TCategoria{
	private $con;

	public function getCategoriasT(string $categorias){
		$this->con = new Mysql();
		$sql = "SELECT IdCategoria, Cat_Nombre, Cat_Descripcion, Cat_Portada, Cat_Ruta
				 FROM TblCategoria WHERE Est_IdEstado != 0 AND IdCategoria IN ($categorias)";
		$request = $this->con->select_all($sql);
		if(count($request) > 0){
			for ($c=0; $c < count($request) ; $c++) { 
				$request[$c]['Cat_Portada'] = BASE_URL.'/Assets/images/uploads/'.$request[$c]['Cat_Portada'];		
			}
		}
		return $request;
	}

	public function getCategorias(){
		$this->con = new Mysql();
		$sql = "SELECT c.IdCategoria, c.Cat_Nombre, c.Cat_Portada, c.Cat_Ruta, count(p.Cat_IdCategoria) AS cantidad
				FROM TblProducto p 
				INNER JOIN TblCategoria c
				ON p.Cat_IdCategoria = c.IdCategoria
				WHERE c.Est_IdEstado = 1
				GROUP BY p.Cat_IdCategoria, c.IdCategoria";
		$request = $this->con->select_all($sql);
		if(count($request) > 0){
			for ($c=0; $c < count($request) ; $c++) { 
				$request[$c]['Cat_Portada'] = BASE_URL.'/Assets/images/uploads/'.$request[$c]['Cat_Portada'];		
			}
		}
		return $request;
	}
}

 ?>