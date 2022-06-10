<?php 

	class parametros extends Controllers{
		public function __construct()
		{
			parent::__construct();
			session_start();
			//session_regenerate_id(true);
			if(empty($_SESSION['login']))
			{
				header('Location: '.base_url().'/login');
				die();
			}
			getPermisos(MUSUARIOS);
		}

// Inicio de controller para cargue de informacion de encabezado
		public function parametros()
		{
			if(empty($_SESSION['permisosMod']['Perm_read'])){
				header("Location:".base_url().'/dashboard');
			}
			$data['page_id'] = 3;
			$data['page_tag'] = "Parametros del sistema";
			$data['page_name'] = "parametros_sistema";
			$data['page_title'] = "Parametros del sistema <small> Tienda Virtual</small>";
			$data['page_functions_js'] = "functions_parametros.js";
			$this->views->getView($this,"parametros",$data);
		} // Fin de informacion de encabezado

// Inicio de controller para cargue de informacion de tabla que muestra los datos en la pantalla settings
        	public function getParametros()
		{
			if($_SESSION['permisosMod']['Perm_read']){
				$btnView = '';
				$btnEdit = '';
				$btnDelete = '';
				$arrData = $this->model->selectParametros();
				//dep($arrData);exit;  // // ayuda Muestra la informacion del Json ingresando al a la url http://localhost/adsi2022/TiendaVirtual_V2/parametros/getParametro

				for ($i=0; $i < count($arrData); $i++) {

					if($arrData[$i]['Est_IdEstado'] == 1)
					{
						$arrData[$i]['Est_IdEstado'] = '<span class="badge badge-success">Activo</span>';
					}else{
						$arrData[$i]['Est_IdEstado'] = '<span class="badge badge-danger">Inactivo</span>';
					}

					if($_SESSION['permisosMod']['Perm_update']){
						$btnView = '<button class="btn btn-info btn-sm" onClick="fntViewInfoParametro('.$arrData[$i]['IdParametro'].')" title="Ver Parametro"><i class="far fa-eye"></i></button>';
						$btnEdit = '<button class="btn btn-primary btn-sm btnEditParametro" onClick="fntEditParametro('.$arrData[$i]['IdParametro'].')" title="Editar"><i class="fas fa-pencil-alt"></i></button>';
					}
					if($_SESSION['permisosMod']['Perm_delete']){
						$btnDelete = '<button class="btn btn-danger btn-sm btnDelParametro" onClick="fntDelParametro('.$arrData[$i]['IdParametro'].')" title="Eliminar"><i class="far fa-trash-alt"></i></button>
					</div>';
					}
					$arrData[$i]['options'] = '<div class="text-center">'.$btnView.' '.$btnEdit.' '.$btnDelete.'</div>';
				}
				echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
			}
			die();
		}



// Fin de controller para cargue de informacion de tabla que muestra los datos en la pantalla settings
	

		public function getSelectParametros()
		{
			$htmlOptions = "";
			$arrData = $this->model->selectParametros();
			if(count($arrData) > 0 ){
				for ($i=0; $i < count($arrData); $i++) { 
					if($arrData[$i]['Est_IdEstado'] == 1 ){
					$htmlOptions .= '<option value="'.$arrData[$i]['IdParametro'].'">'.$arrData[$i]['Par_Valor'].'</option>';
					}
				}
			}
			echo $htmlOptions;
			die();		
		}

		public function getParametro(int $idparametro)
		{
			if($_SESSION['permisosMod']['Perm_read']){
				$intIdparametro = intval(strClean($idparametro));
				if($intIdparametro > 0)
				{
					$arrData = $this->model->selectParametro($intIdparametro);
					if(empty($arrData))
					{
						$arrResponse = array('status' => false, 'msg' => 'Datos no encontrados.');
					}else{
						$arrResponse = array('status' => true, 'data' => $arrData);
					}
					echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
				}
			}
			die();
		}

		public function setparametro(){
				$intIdparametro = intval($_POST['idParametro']);
				$strValor =  strClean($_POST['txtValor']);
				$strDescipcion = strClean($_POST['txtDescripcion']);
				$intStatus = intval($_POST['listStatus']);
				$request_parametro = "";
				if($intIdparametro == 0)
				{
					//Crear
					if($_SESSION['permisosMod']['Perm_write']){
						$request_parametro = $this->model->insertParametro($strValor, $strDescipcion,$intStatus);
						$option = 1;
					}
				}else{
					//Actualizar
					if($_SESSION['permisosMod']['Perm_update']){
						$request_parametro = $this->model->updateParametro($intIdparametro, $strValor, $strDescipcion, $intStatus);
						$option = 2;
					}
				}

				if($request_parametro > 0 )
				{
					if($option == 1)
					{
						$arrResponse = array('status' => true, 'msg' => 'Datos guardados correctamente.');
					}else{
						$arrResponse = array('status' => true, 'msg' => 'Datos Actualizados correctamente.');
					}
				}else if($request_parametro == 'exist'){
					
					$arrResponse = array('status' => false, 'msg' => '¡Atención! El Rol ya existe.');
				}else{
					$arrResponse = array("status" => false, "msg" => 'No es posible almacenar los datos.');
				}
				echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			die();
		}

		public function delParametro()
		{
			if($_POST){
				if($_SESSION['permisosMod']['Perm_delete']){
					$intIdparametro = intval($_POST['IdParametro']);
					$requestDelete = $this->model->deleteParametro($intIdparametro);
					if($requestDelete)
					{
						$arrResponse = array('status' => true, 'msg' => 'Se ha eliminado el paramero');
					}else{
						$arrResponse = array('status' => false, 'msg' => 'Error al eliminar el parametro.');
					}
					echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
				}
			}
			die();
		}

	}
 ?>