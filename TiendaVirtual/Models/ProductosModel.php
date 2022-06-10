<?php 

	class ProductosModel extends Mysql
	{
		private $intIdProducto;
		private $strNombre;
		private $strDescripcion;
		private $intCodigo;
		private $intCategoriaId;
		private $intPrecio;
		private $intStock;
		private $intStatus;
		private $strRuta;
		private $strImagen;

		public function __construct()
		{
			parent::__construct();
		}

		public function selectProductos(){
			$sql = "SELECT p.IdProducto,
							p.Prod_Codigo,
							p.Prod_Nombre,
							p.Prod_Descripcion,
							p.Cat_IdCategoria,
							c.Cat_Nombre as categoria,
							p.Prod_Precio,
							p.Prod_Stock,
							p.Est_IdEstado 
					FROM TblProducto p 
					INNER JOIN TblCategoria c
					ON p.Cat_IdCategoria = c.IdCategoria
					WHERE p.Est_IdEstado != 0 ";
					$request = $this->select_all($sql);
			return $request;
		}	

		public function insertProducto(string $nombre, string $descripcion, int $codigo, int $categoriaid, string $precio, int $stock, string $ruta, int $status){
			$this->strNombre = $nombre;
			$this->strDescripcion = $descripcion;
			$this->intCodigo = $codigo;
			$this->intCategoriaId = $categoriaid;
			$this->strPrecio = $precio;
			$this->intStock = $stock;
			$this->strRuta = $ruta;
			$this->intStatus = $status;
			$return = 0;
			$sql = "SELECT * FROM TblProducto WHERE Prod_Codigo = '{$this->intCodigo}'";
			$request = $this->select_all($sql);
			if(empty($request))
			{
				$query_insert  = "INSERT INTO TblProducto(Cat_IdCategoria,
														Prod_Codigo,
														Prod_Nombre,
														Prod_Descripcion,
														Prod_Precio,
														Prod_Stock,
														Prod_Ruta,
														Est_IdEstado) 
								  VALUES(?,?,?,?,?,?,?,?)";
	        	$arrData = array($this->intCategoriaId,
        						$this->intCodigo,
        						$this->strNombre,
        						$this->strDescripcion,
        						$this->strPrecio,
        						$this->intStock,
        						$this->strRuta,
        						$this->intStatus);
	        	$request_insert = $this->insert($query_insert,$arrData);
	        	$return = $request_insert;
			}else{
				$return = "exist";
			}
	        return $return;
		}

		public function updateProducto(int $idproducto, string $nombre, string $descripcion, int $codigo, int $categoriaid, string $precio, int $stock, string $ruta, int $status){
			$this->intIdProducto = $idproducto;
			$this->strNombre = $nombre;
			$this->strDescripcion = $descripcion;
			$this->intCodigo = $codigo;
			$this->intCategoriaId = $categoriaid;
			$this->strPrecio = $precio;
			$this->intStock = $stock;
			$this->strRuta = $ruta;
			$this->intStatus = $status;
			$return = 0;
			$sql = "SELECT * FROM TblProducto WHERE Prod_Codigo = '{$this->intCodigo}' AND IdProducto != $this->intIdProducto ";
			$request = $this->select_all($sql);
			if(empty($request))
			{
				$sql = "UPDATE TblProducto 
						SET Cat_IdCategoria=?,
							Prod_Codigo=?,
							Prod_Nombre=?,
							Prod_Descripcion=?,
							Prod_Precio=?,
							Prod_Stock=?,
							Prod_Ruta=?,
							Est_IdEstado=? 
						WHERE IdProducto = $this->intIdProducto ";
				$arrData = array($this->intCategoriaId,
        						$this->intCodigo,
        						$this->strNombre,
        						$this->strDescripcion,
        						$this->strPrecio,
        						$this->intStock,
        						$this->strRuta,
        						$this->intStatus);

	        	$request = $this->update($sql,$arrData);
	        	$return = $request;
			}else{
				$return = "exist";
			}
	        return $return;
		}

		public function selectProducto(int $idproducto){
			$this->intIdProducto = $idproducto;
			$sql = "SELECT p.IdProducto,
							p.Prod_Codigo,
							p.Prod_Nombre,
							p.Prod_Descripcion,
							p.Prod_Precio,
							p.Prod_Stock,
							p.Cat_IdCategoria,
							c.Cat_Nombre as categoria,
							p.Est_IdEstado
					FROM TblProducto p
					INNER JOIN TblCategoria c
					ON p.Cat_IdCategoria = c.IdCategoria
					WHERE IdProducto = $this->intIdProducto";
			$request = $this->select($sql);
			return $request;

		}

		public function insertImage(int $idproducto, string $imagen){
			$this->intIdProducto = $idproducto;
			$this->strImagen = $imagen;
			$query_insert  = "INSERT INTO TblImagen(Prod_IdProducto,Img_Imagen) VALUES(?,?)";
	        $arrData = array($this->intIdProducto,
        					$this->strImagen);
	        $request_insert = $this->insert($query_insert,$arrData);
	        return $request_insert;
		}

		public function selectImages(int $idproducto){
			$this->intIdProducto = $idproducto;
			$sql = "SELECT Prod_IdProducto,Img_Imagen
					FROM TblImagen
					WHERE Prod_IdProducto= $this->intIdProducto";
			$request = $this->select_all($sql);
			return $request;
		}

		public function deleteImage(int $idproducto, string $imagen){
			$this->intIdProducto = $idproducto;
			$this->strImagen = $imagen;
			$query  = "DELETE FROM TblImagen 
						WHERE Prod_IdProducto = $this->intIdProducto 
						AND Img_Imagen = '{$this->strImagen}'";
	        $request_delete = $this->delete($query);
	        return $request_delete;
		}

		public function deleteProducto(int $idproducto){
			$this->intIdProducto = $idproducto;
			$sql = "UPDATE TblProducto SET Est_IdEstado = ? WHERE IdProducto = $this->intIdProducto ";
			$arrData = array(0);
			$request = $this->update($sql,$arrData);
			return $request;
		}
	}
 ?>