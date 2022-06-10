<?php 
class ClientesModel extends Mysql
{
	private $intIdUsuario;
	private $strIdentificacion;
	private $strNombre;
	private $strApellido;
	private $intTelefono;
	private $strEmail;
	private $strPassword;
	private $strToken;
	private $intTipoId;
	private $intStatus;
	private $strNit;
	private $strNomFiscal;
	private $strDirFiscal;

	public function __construct()
	{
		parent::__construct();
	}	

	public function insertCliente(string $identificacion, string $nombre, string $apellido, int $telefono, string $email, string $password, int $tipoid, string $nit, string $nomFiscal, string $dirFiscal){

		$this->strIdentificacion = $identificacion;
		$this->strNombre = $nombre;
		$this->strApellido = $apellido;
		$this->intTelefono = $telefono;
		$this->strEmail = $email;
		$this->strPassword = $password;
		$this->intTipoId = $tipoid;
		$this->strNit = $nit;
		$this->strNomFiscal = $nomFiscal;
		$this->strDirFiscal = $dirFiscal;

		$return = 0;
		$sql = "SELECT * FROM TblPersona WHERE 
				Per_Email = '{$this->strEmail}' or Per_Identificacion = '{$this->strIdentificacion}' ";
		$request = $this->select_all($sql);

		if(empty($request))
		{
			$query_insert  = "INSERT INTO TblPersona(Per_Identificacion,Per_Nombres,Per_Apellidos,Per_Telefono,Per_Email,Per_Password,Rol_IdRol,nit,nombrefiscal,direccionfiscal) 
							  VALUES(?,?,?,?,?,?,?,?,?,?)";
        	$arrData = array($this->strIdentificacion,
    						$this->strNombre,
    						$this->strApellido,
    						$this->intTelefono,
    						$this->strEmail,
    						$this->strPassword,
    						$this->intTipoId,
    						$this->strNit,
    						$this->strNomFiscal,
    						$this->strDirFiscal);
        	$request_insert = $this->insert($query_insert,$arrData);
        	$return = $request_insert;
		}else{
			$return = "exist";
		}
        return $return;
	}

	public function selectClientes()
	{
		$sql = "SELECT IdPersona,Per_Identificacion,Per_Nombres,Per_Apellidos,Per_Telefono,Per_Email,Est_IdEstado 
				FROM TblPersona 
				WHERE Rol_IdRol = ".RCLIENTES." and Est_IdEstado != 0 "; 
		$request = $this->select_all($sql);
		return $request;
	}

	public function selectCliente(int $idpersona){
		$this->intIdUsuario = $idpersona;
		$sql = "SELECT IdPersona,Per_Identificacion,Per_Nombres,Per_Apellidos,Per_Telefono,Per_Email,nit,nombrefiscal,direccionfiscal,Est_IdEstado, DATE_FORMAT(Per_Datecreated, '%d-%m-%Y') as fechaRegistro 
				FROM TblPersona
				WHERE IdPersona = $this->intIdUsuario and Rol_IdRol = ".RCLIENTES;
		$request = $this->select($sql);
		return $request;
	}

	public function updateCliente(int $idUsuario, string $identificacion, string $nombre, string $apellido, int $telefono, string $email, string $password, string $nit, string $nomFiscal, string $dirFiscal){

		$this->intIdUsuario = $idUsuario;
		$this->strIdentificacion = $identificacion;
		$this->strNombre = $nombre;
		$this->strApellido = $apellido;
		$this->intTelefono = $telefono;
		$this->strEmail = $email;
		$this->strPassword = $password;
		$this->strNit = $nit;
		$this->strNomFiscal = $nomFiscal;
		$this->strDirFiscal = $dirFiscal;

		$sql = "SELECT * FROM TblPersona WHERE (Per_Email = '{$this->strEmail}' AND IdPersona != $this->intIdUsuario)
									  OR (Per_Identificacion = '{$this->strIdentificacion}' AND IdPersona != $this->intIdUsuario) ";
		$request = $this->select_all($sql);

		if(empty($request))
		{
			if($this->strPassword  != "")
			{
				$sql = "UPDATE TblPersona SET Per_Identificacion=?, Per_Nombres=?, Per_Apellidos=?, Per_Telefono=?, Per_Email=?, Per_Password=?, nit=?, nombrefiscal=?, direccionfiscal=? 
						WHERE IdPersona = $this->intIdUsuario ";
				$arrData = array($this->strIdentificacion,
        						$this->strNombre,
        						$this->strApellido,
        						$this->intTelefono,
        						$this->strEmail,
        						$this->strPassword,
        						$this->strNit,
        						$this->strNomFiscal,
        						$this->strDirFiscal);
			}else{
				$sql = "UPDATE TblPersona SET Per_Identificacion=?, Per_Nombres=?, Per_Apellidos=?, Per_Telefono=?, Per_Email=?, nit=?, nombrefiscal=?, direccionfiscal=? 
						WHERE IdPersona = $this->intIdUsuario ";
				$arrData = array($this->strIdentificacion,
        						$this->strNombre,
        						$this->strApellido,
        						$this->intTelefono,
        						$this->strEmail,
        						$this->strNit,
        						$this->strNomFiscal,
        						$this->strDirFiscal);
			}
			$request = $this->update($sql,$arrData);
		}else{
			$request = "exist";
		}
		return $request;
	}

	public function deleteCliente(int $intIdpersona)
	{
		$this->intIdUsuario = $intIdpersona;
		$sql = "UPDATE TblPersona SET Est_IdEstado = ? WHERE IdPersona = $this->intIdUsuario ";
		$arrData = array(0);
		$request = $this->update($sql,$arrData);
		return $request;
	}
}

 ?>