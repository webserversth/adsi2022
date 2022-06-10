<?php 

	class Permisos extends Controllers{
		public function __construct()
		{
			parent::__construct();
		}

		public function getPermisosRol(int $idrol)
		{
			$rolid = intval($idrol);
			if($rolid > 0)
			{
				$arrModulos = $this->model->selectModulos();
				$arrPermisosRol = $this->model->selectPermisosRol($rolid);
				$arrRol = $this->model->getRol($rolid);
				$arrPermisos = array('Perm_read' => 0, 'Perm_write' => 0, 'Perm_update' => 0, 'Perm_delete' => 0);
				$arrPermisoRol = array('IdRol' => $rolid, 'rol' => $arrRol['Rol_Nombre']);
             
				if(empty($arrPermisosRol))
				{
					for ($i=0; $i < count($arrModulos) ; $i++) { 

						$arrModulos[$i]['permisos'] = $arrPermisos;
					}
				}else{
					for ($i=0; $i < count($arrModulos); $i++) {
						$arrPermisos = array('Perm_read' => 0, 'Perm_write' => 0, 'Perm_update' => 0, 'Perm_delete' => 0);
						if(isset($arrPermisosRol[$i])){
							$arrPermisos = array('Perm_read' => $arrPermisosRol[$i]['Perm_read'], 
												 'Perm_write' => $arrPermisosRol[$i]['Perm_write'], 
												 'Perm_update' => $arrPermisosRol[$i]['Perm_update'], 
												 'Perm_delete' => $arrPermisosRol[$i]['Perm_delete'] 
												);
						}
						$arrModulos[$i]['permisos'] = $arrPermisos;
					}
				}
				$arrPermisoRol['modulos'] = $arrModulos;
				$html = getModal("modalPermisos",$arrPermisoRol);
			}
			die();
		}

		public function setPermisos()
		{
			if($_POST)
			{
				$intIdrol = intval($_POST['IdRol']);
				$modulos = $_POST['modulos'];

				$this->model->deletePermisos($intIdrol);
				foreach ($modulos as $modulo) {
					$idModulo = $modulo['IdModulo'];
					$r = empty($modulo['Perm_read']) ? 0 : 1;
					$w = empty($modulo['Perm_write']) ? 0 : 1;
					$u = empty($modulo['Perm_update']) ? 0 : 1;
					$d = empty($modulo['Perm_delete']) ? 0 : 1;
					$requestPermiso = $this->model->insertPermisos($intIdrol, $idModulo, $r, $w, $u, $d);
				}
				if($requestPermiso > 0)
				{
					$arrResponse = array('status' => true, 'msg' => 'Permisos asignados correctamente.');
				}else{
					$arrResponse = array("status" => false, "msg" => 'No es posible asignar los permisos.');
				}
				echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			}
			die();
		}

	}
 ?>