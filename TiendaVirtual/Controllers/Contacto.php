<?php 
	class Contacto extends Controllers{
		public function __construct()
		{
			parent::__construct();
			session_start();
			getPermisos(MDCONTACTOS);
		}

		public function contacto()
		{
			$pageContent = getPageRout('contacto');
			if(empty($pageContent)){
				header("Location: ".base_url());
			}else{
				$data['page_tag'] = NOMBRE_EMPESA;
				$data['page_title'] = NOMBRE_EMPESA." - ".$pageContent['Pag_Titulo'];
				$data['page_name'] = $pageContent['Pag_Titulo'];
				$data['page'] = $pageContent;
				$this->views->getView($this,"contacto",$data); 
			}

		}

	}
 ?>
