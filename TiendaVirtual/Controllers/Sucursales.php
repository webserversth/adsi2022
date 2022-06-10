<?php 
	class Sucursales extends Controllers{
		public function __construct()
		{
			parent::__construct();
			session_start();
			getPermisos(MDPAGINAS);
		}

		public function sucursales()
		{
			$pageContent = getPageRout('sucursales');
			if(empty($pageContent)){
				header("Location: ".base_url());
			}else{
				$data['page_tag'] = NOMBRE_EMPESA;
				$data['page_title'] = NOMBRE_EMPESA." - ".$pageContent['Pag_Titulo'];
				$data['page_name'] = $pageContent['Pag_Titulo'];
				$data['page'] = $pageContent;
				$this->views->getView($this,"sucursales",$data);  
			}
		}

	}
 ?>