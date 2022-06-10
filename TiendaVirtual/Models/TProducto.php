<?php 
require_once("Libraries/Core/Mysql.php");
trait TProducto{
	private $con;
	private $strCategoria;
	private $intIdcategoria;
	private $intIdProducto;
	private $strProducto;
	private $cant;
	private $option;
	private $strRuta;
	private $strRutaCategoria;
	public function getProductosT(){
		$this->con = new Mysql();
		$sql = "SELECT p.IdProducto,
						p.Prod_Codigo,
						p.Prod_Nombre,
						p.Prod_Descripcion,
						p.Cat_IdCategoria,
						c.Cat_Nombre as categoria,
						p.Prod_Precio,
						p.Prod_Ruta,
						p.Prod_Stock
				FROM TblProducto p 
				INNER JOIN TblCategoria c
				ON p.Cat_IdCategoria = c.IdCategoria
				WHERE p.Est_IdEstado != 0 ORDER BY p.IdProducto DESC LIMIT ".CANTPORDHOME;
				$request = $this->con->select_all($sql);
				if(count($request) > 0){
					for ($c=0; $c < count($request) ; $c++) { 
						$intIdProducto = $request[$c]['IdProducto'];
						$sqlImg = "SELECT Img_Imagen
								FROM TblImagen
								WHERE Prod_IdProducto = $intIdProducto";
						$arrImg = $this->con->select_all($sqlImg);
						if(count($arrImg) > 0){
							for ($i=0; $i < count($arrImg); $i++) { 
								$arrImg[$i]['url_image'] = media().'/images/uploads/'.$arrImg[$i]['Img_Imagen'];
							}
						}
						$request[$c]['images'] = $arrImg;
					}
				}
		return $request;
	}

	public function getProductosPage($desde, $porpagina){
		$this->con = new Mysql();
		$sql = "SELECT p.IdProducto,
						p.Prod_Codigo,
						p.Prod_Nombre,
						p.Prod_Descripcion,
						p.Cat_IdCategoria,
						c.Cat_Nombre as categoria,
						p.Prod_Precio,
						p.Prod_Ruta,
						p.Prod_Stock
				FROM TblProducto p 
				INNER JOIN TblCategoria c
				ON p.Cat_IdCategoria = c.IdCategoria
				WHERE p.Est_IdEstado = 1 ORDER BY p.IdProducto DESC LIMIT $desde,$porpagina";
				$request = $this->con->select_all($sql);
				if(count($request) > 0){
					for ($c=0; $c < count($request) ; $c++) { 
						$intIdProducto = $request[$c]['IdProducto'];
						$sqlImg = "SELECT Img_Imagen
								FROM TblImagen
								WHERE Prod_IdProducto = $intIdProducto";
						$arrImg = $this->con->select_all($sqlImg);
						if(count($arrImg) > 0){
							for ($i=0; $i < count($arrImg); $i++) { 
								$arrImg[$i]['url_image'] = media().'/images/uploads/'.$arrImg[$i]['Img_Imagen'];
							}
						}
						$request[$c]['images'] = $arrImg;
					}
				}
		return $request;
	}

	public function getProductosCategoriaT(int $idcategoria, string $ruta, $desde = null, $porpagina = null){
		$this->intIdcategoria = $idcategoria;
		$this->strRuta = $ruta;
		$where = "";
		if(is_numeric($desde) AND is_numeric($porpagina)){
			$where = " LIMIT ".$desde.",".$porpagina;
		}

		$this->con = new Mysql();
		$sql_cat = "SELECT IdCategoria,Cat_Nombre,Cat_Ruta FROM TblCategoria WHERE IdCategoria = '{$this->intIdcategoria}'";
		$request = $this->con->select($sql_cat);

		if(!empty($request)){
			$this->strCategoria = $request['Cat_Nombre'];
			$this->strRutaCategoria = $request['Cat_Ruta'];
			$sql = "SELECT p.IdProducto,
							p.Prod_Codigo,
							p.Prod_Nombre,
							p.Prod_Descripcion,
							p.Cat_IdCategoria,
							c.Cat_Nombre as categoria,
							p.Prod_Precio,
							p.Prod_Ruta,
							p.Prod_Stock
					FROM TblProducto p 
					INNER JOIN TblCategoria c
					ON p.Cat_IdCategoria = c.IdCategoria
					WHERE p.Est_IdEstado != 0 AND p.Cat_IdCategoria = $this->intIdcategoria AND c.Cat_Ruta = '{$this->strRuta}'
					ORDER BY p.IdProducto DESC ".$where;
					$request = $this->con->select_all($sql);
					if(count($request) > 0){
						for ($c=0; $c < count($request) ; $c++) { 
							$intIdProducto = $request[$c]['IdProducto'];
							$sqlImg = "SELECT Img_Imagen
								FROM TblImagen
								WHERE Prod_IdProducto = $intIdProducto";
							$arrImg = $this->con->select_all($sqlImg);
							if(count($arrImg) > 0){
								for ($i=0; $i < count($arrImg); $i++) { 
									$arrImg[$i]['url_image'] = media().'/images/uploads/'.$arrImg[$i]['Img_Imagen'];
								}
							}
							$request[$c]['images'] = $arrImg;
						}
					}
			$request = array('IdCategoria' => $this->intIdcategoria,
								'Cat_Ruta' => $this->strRutaCategoria,
								'categoria' => $this->strCategoria,
								'productos' => $request
							);

		}
		return $request;
	}

	public function getProductoT(int $idproducto, string $ruta){
		$this->con = new Mysql();
		$this->intIdProducto = $idproducto;
		$this->strRuta = $ruta;
		$sql = "SELECT p.IdProducto,
						p.Prod_Codigo,
						p.Prod_Nombre,
						p.Prod_Descripcion,
						p.Cat_IdCategoria,
						c.Cat_Nombre as categoria,
						c.Cat_Ruta as ruta_categoria,
						p.Prod_Precio,
						p.Prod_Ruta,
						p.Prod_Stock
				FROM TblProducto p 
				INNER JOIN TblCategoria c
				ON p.Cat_IdCategoria = c.IdCategoria
				WHERE p.Est_IdEstado != 0 AND p.IdProducto = '{$this->intIdProducto}' AND p.Prod_Ruta = '{$this->strRuta}' ";
				$request = $this->con->select($sql);
				if(!empty($request)){
					$intIdProducto = $request['IdProducto'];
					$sqlImg = "SELECT Img_Imagen
								FROM TblImagen
								WHERE Prod_IdProducto = $intIdProducto";
					$arrImg = $this->con->select_all($sqlImg);
					if(count($arrImg) > 0){
						for ($i=0; $i < count($arrImg); $i++) { 
							$arrImg[$i]['url_image'] = media().'/images/uploads/'.$arrImg[$i]['Img_Imagen'];
						}
					}else{
						$arrImg[0]['url_image'] = media().'/images/uploads/product.png';
					}
					$request['images'] = $arrImg;
				}
		return $request;
	}

	public function getProductosRandom(int $idcategoria, int $cant, string $option){
		$this->intIdcategoria = $idcategoria;
		$this->cant = $cant;
		$this->option = $option;

		if($option == "Perm_read"){
			$this->option = " RAND() ";
		}else if($option == "a"){
			$this->option = " IdProducto ASC ";
		}else{
			$this->option = " IdProducto DESC ";
		}

		$this->con = new Mysql();
		$sql = "SELECT p.IdProducto,
						p.Prod_Codigo,
						p.Prod_Nombre,
						p.Prod_Descripcion,
						p.Cat_IdCategoria,
						c.Cat_Nombre as categoria,
						p.Prod_Precio,
						p.Prod_Ruta,
						p.Prod_Stock
				FROM TblProducto p 
				INNER JOIN TblCategoria c
				ON p.Cat_IdCategoria = c.IdCategoria
				WHERE p.Est_IdEstado != 0 AND p.Cat_IdCategoria = $this->intIdcategoria
				ORDER BY $this->option LIMIT  $this->cant ";
				$request = $this->con->select_all($sql);
				if(count($request) > 0){
					for ($c=0; $c < count($request) ; $c++) { 
						$intIdProducto = $request[$c]['IdProducto'];
						$sqlImg = "SELECT Img_Imagen
								FROM TblImagen
								WHERE Prod_IdProducto = $intIdProducto";
						$arrImg = $this->con->select_all($sqlImg);
						if(count($arrImg) > 0){
							for ($i=0; $i < count($arrImg); $i++) { 
								$arrImg[$i]['url_image'] = media().'/images/uploads/'.$arrImg[$i]['Img_Imagen'];
							}
						}
						$request[$c]['images'] = $arrImg;
					}
				}
		return $request;
	}	

	public function getProductoIDT(int $idproducto){
		$this->con = new Mysql();
		$this->intIdProducto = $idproducto;
		$sql = "SELECT p.IdProducto,
						p.Prod_Codigo,
						p.Prod_Nombre,
						p.Prod_Descripcion,
						p.Cat_IdCategoria,
						c.Cat_Nombre as categoria,
						p.Prod_Precio,
						p.Prod_Ruta,
						p.Prod_Stock
				FROM TblProducto p 
				INNER JOIN TblCategoria c
				ON p.Cat_IdCategoria = c.IdCategoria
				WHERE p.Est_IdEstado != 0 AND p.IdProducto = '{$this->intIdProducto}' ";
				$request = $this->con->select($sql);
				if(!empty($request)){
					$intIdProducto = $request['IdProducto'];
					$sqlImg = "SELECT Img_Imagen
								FROM TblImagen
								WHERE Prod_IdProducto = $intIdProducto";
					$arrImg = $this->con->select_all($sqlImg);
					if(count($arrImg) > 0){
						for ($i=0; $i < count($arrImg); $i++) { 
							$arrImg[$i]['url_image'] = media().'/images/uploads/'.$arrImg[$i]['Img_Imagen'];
						}
					}else{
						$arrImg[0]['url_image'] = media().'/images/uploads/product.png';
					}
					$request['images'] = $arrImg;
				}
		return $request;
	}

	public function cantProductos($categoria = null){
		$where = "";
		if($categoria != null){
			$where = " AND Cat_IdCategoria = ".$categoria;
		}
		$this->con = new Mysql();
		$sql = "SELECT COUNT(*) as total_registro FROM TblProducto WHERE Est_IdEstado = 1 ".$where;
		$result_register = $this->con->select($sql);
		$total_registro = $result_register;
		return $total_registro;

	}

	public function cantProdSearch($busqueda){
		$this->con = new Mysql();
		$sql = "SELECT COUNT(*) as total_registro FROM TblProducto WHERE Prod_Nombre LIKE '%$busqueda%' AND Est_IdEstado = 1 ";
		$result_register = $this->con->select($sql);
		$total_registro = $result_register;
		return $total_registro;
	}

	public function getProdSearch($busqueda, $desde, $porpagina){
		$this->con = new Mysql();
		$sql = "SELECT p.IdProducto,
						p.Prod_Codigo,
						p.Prod_Nombre,
						p.Prod_Descripcion,
						p.Cat_IdCategoria,
						c.Cat_Nombre as categoria,
						p.Prod_Precio,
						p.Prod_Ruta,
						p.Prod_Stock
				FROM TblProducto p 
				INNER JOIN TblCategoria c
				ON p.Cat_IdCategoria = c.IdCategoria
				WHERE p.Est_IdEstado = 1 AND p.Prod_Nombre LIKE '%$busqueda%' ORDER BY p.IdProducto DESC LIMIT $desde,$porpagina";
				$request = $this->con->select_all($sql);
				if(count($request) > 0){
					for ($c=0; $c < count($request) ; $c++) { 
						$intIdProducto = $request[$c]['IdProducto'];
						$sqlImg = "SELECT Img_Imagen
								FROM TblImagen
								WHERE Prod_IdProducto = $intIdProducto";
						$arrImg = $this->con->select_all($sqlImg);
						if(count($arrImg) > 0){
							for ($i=0; $i < count($arrImg); $i++) { 
								$arrImg[$i]['url_image'] = media().'/images/uploads/'.$arrImg[$i]['Img_Imagen'];
							}
						}
						$request[$c]['images'] = $arrImg;
					}
				}
		return $request;
	}
}

 ?>