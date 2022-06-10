<?php 

class ContactosModel extends Mysql{

	public function selectContactos()
	{
		$sql = "SELECT IdContacto, Cont_Nombre, Cont_Email, DATE_FORMAT(Cont_Datecreated, '%d/%m/%Y') as fecha
				FROM TblContacto ORDER BY IdContacto DESC";
		$request = $this->select_all($sql);
		return $request;
	}

	public function selectMensaje(int $idmensaje){
		$sql = "SELECT IdContacto, Cont_Nombre, Cont_Email, DATE_FORMAT(Cont_Datecreated, '%d/%m/%Y') as fecha, Cont_Mensaje
				FROM TblContacto WHERE IdContacto = {$idmensaje}";
		$request = $this->select($sql);
		return $request;
	}

}
 ?>