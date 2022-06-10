<?php 

class SuscriptoresModel extends Mysql{

	public function selectSuscriptores()
	{
		$sql = "SELECT IdSuscripcion, Sus_Nombre, Sus_Email, DATE_FORMAT(Sus_Datecreated, '%d/%m/%Y') as fecha
				FROM TblSuscripciones ORDER BY IdSuscripcion DESC";
		$request = $this->select_all($sql);
		return $request;
	}

}
 ?>