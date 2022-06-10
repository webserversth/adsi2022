<?php 

	class PermisosModel extends Mysql
	{
		public $intIdpermiso;
		public $intRolid;
		public $intModuloid;
		public $r;
		public $w;
		public $u;
		public $d;

		public function __construct()
		{
			parent::__construct();
		}

		public function selectModulos()
		{
			$sql = "SELECT * FROM TblModulo WHERE Est_IdEstado != 0";
			$request = $this->select_all($sql);
			return $request;
		}	
		public function selectPermisosRol(int $idrol)
		{
			$this->intRolid = $idrol;
			$sql = "SELECT * FROM TblPermisos WHERE Rol_IdRol = $this->intRolid";
			$request = $this->select_all($sql);
			return $request;
		}

		public function deletePermisos(int $idrol)
		{
			$this->intRolid = $idrol;
			$sql = "DELETE FROM TblPermisos WHERE Rol_IdRol = $this->intRolid";
			$request = $this->delete($sql);
			return $request;
		}

		public function insertPermisos(int $idrol, int $idmodulo, int $r, int $w, int $u, int $d){
			$this->intRolid = $idrol;
			$this->intModuloid = $idmodulo;
			$this->r = $r;
			$this->w = $w;
			$this->u = $u;
			$this->d = $d;
			$query_insert  = "INSERT INTO TblPermisos(Rol_IdRol,Mod_IdModulo,Perm_read,Perm_write,Perm_update,Perm_delete) VALUES(?,?,?,?,?,?)";
        	$arrData = array($this->intRolid, $this->intModuloid, $this->r, $this->w, $this->u, $this->d);
        	$request_insert = $this->insert($query_insert,$arrData);		
	        return $request_insert;
		}

		public function permisosModulo(int $idrol){
			$this->intRolid = $idrol;
			$sql = "SELECT tp.Rol_IdRol,
						   tp.Mod_IdModulo,
						   tm.Mod_Titulo as modulo,
						   tp.Perm_read,
						   tp.Perm_write,
						   tp.Perm_update,
						   tp.Perm_delete 
					FROM TblPermisos tp 
					INNER JOIN TblModulo tm
					ON tp.Mod_IdModulo = tm.IdModulo 
					WHERE tp.Rol_IdRol = $this->intRolid";
			$request = $this->select_all($sql);
			$arrPermisos = array();
			for ($i=0; $i < count($request); $i++) { 
				$arrPermisos[$request[$i]['Mod_IdModulo']] = $request[$i];
			}
			return $arrPermisos;
		}

		public function getRol(int $idrol){
			$this->intRolid = $idrol;
			$sql = "SELECT * FROM TblRol WHERE IdRol = $this->intRolid";
			$request = $this->select($sql);
			return $request;
		}
	}
 ?>