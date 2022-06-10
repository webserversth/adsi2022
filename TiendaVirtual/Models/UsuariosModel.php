<?php 

	class UsuariosModel extends Mysql
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

		public function insertUsuario(string $identificacion, string $nombre, string $apellido, int $telefono, string $email, string $password, int $tipoid, int $status){

			$this->strIdentificacion = $identificacion;
			$this->strNombre = $nombre;
			$this->strApellido = $apellido;
			$this->intTelefono = $telefono;
			$this->strEmail = $email;
			$this->strPassword = $password;
			$this->intTipoId = $tipoid;
			$this->intStatus = $status;
			$return = 0;

			$sql = "SELECT * FROM TblPersona WHERE 
					Per_Email = '{$this->strEmail}' or Per_Identificacion = '{$this->strIdentificacion}' ";
			$request = $this->select_all($sql);

			if(empty($request))
			{
				$query_insert  = "INSERT INTO TblPersona(Per_Identificacion,Per_Nombres,Per_Apellidos,Per_Telefono,Per_Email,Per_Password,Rol_IdRol ,Est_IdEstado) 
								  VALUES(?,?,?,?,?,?,?,?)";
	        	$arrData = array($this->strIdentificacion,
        						$this->strNombre,
        						$this->strApellido,
        						$this->intTelefono,
        						$this->strEmail,
        						$this->strPassword,
        						$this->intTipoId,
        						$this->intStatus);
	        	$request_insert = $this->insert($query_insert,$arrData);
	        	$return = $request_insert;
			}else{
				$return = "exist";
			}
	        return $return;
		}

		public function selectUsuarios()
		{
			$whereAdmin = "";
			if($_SESSION['idUser'] != 1 ){
				$whereAdmin = " and p.IdPersona != 1 ";
			}
			$sql = "SELECT pr.IdPersona,pr.Per_Identificacion,pr.Per_Nombres,pr.Per_Apellidos,pr.Per_Telefono,pr.Per_Email,pr.Est_IdEstado,r.IdRol,r.Rol_Nombre 
					FROM TblPersona pr 
					INNER JOIN TblRol r
					ON pr.Rol_IdRol  = r.IdRol
					WHERE pr.Est_IdEstado != 0 ".$whereAdmin;
					$request = $this->select_all($sql);
					return $request;
		}
		public function selectUsuario(int $idpersona){
			$this->intIdUsuario = $idpersona;
			$sql = "SELECT pr.IdPersona,pr.Per_Identificacion,pr.Per_Nombres,pr.Per_Apellidos,
			pr.Per_Telefono,pr.Per_Email,r.IdRol,r.Rol_Nombre ,pr.Est_IdEstado, DATE_FORMAT(pr.Per_Datecreated, '%d-%m-%Y') as fechaRegistro 
					FROM TblPersona pr
					INNER JOIN TblRol r
					ON pr.Rol_IdRol  = r.IdRol
					WHERE pr.IdPersona = $this->intIdUsuario";
			$request = $this->select($sql);
			return $request;
		}

		public function updateUsuario(int $idUsuario, string $identificacion, string $nombre, string $apellido, int $telefono, string $email, string $password, int $tipoid, int $status){

			$this->intIdUsuario = $idUsuario;
			$this->strIdentificacion = $identificacion;
			$this->strNombre = $nombre;
			$this->strApellido = $apellido;
			$this->intTelefono = $telefono;
			$this->strEmail = $email;
			$this->strPassword = $password;
			$this->intTipoId = $tipoid;
			$this->intStatus = $status;

			$sql = "SELECT * FROM TblPersona WHERE (Per_Email = '{$this->strEmail}' AND IdPersona != $this->intIdUsuario)
										  OR (Per_Identificacion = '{$this->strIdentificacion}' AND IdPersona != $this->intIdUsuario) ";
			$request = $this->select_all($sql);

			if(empty($request))
			{
				if($this->strPassword  != "")
				{
					$sql = "UPDATE TblPersona SET Per_Identificacion=?, Per_Nombres=?, Per_Apellidos=?, Per_Telefono=?, Per_Email=?, Per_Password=?, Rol_IdRol =?, Est_IdEstado=? 
							WHERE IdPersona = $this->intIdUsuario ";
					$arrData = array($this->strIdentificacion,
	        						$this->strNombre,
	        						$this->strApellido,
	        						$this->intTelefono,
	        						$this->strEmail,
	        						$this->strPassword,
	        						$this->intTipoId,
	        						$this->intStatus);
				}else{
					$sql = "UPDATE TblPersona SET Per_Identificacion=?, Per_Nombres=?, Per_Apellidos=?, Per_Telefono=?, Per_Email=?, Rol_IdRol=?, Est_IdEstado=? 
							WHERE IdPersona = $this->intIdUsuario ";
					$arrData = array($this->strIdentificacion,
	        						$this->strNombre,
	        						$this->strApellido,
	        						$this->intTelefono,
	        						$this->strEmail,
	        						$this->intTipoId,
	        						$this->intStatus);
				}
				$request = $this->update($sql,$arrData);
			}else{
				$request = "exist";
			}
			return $request;
		
		}
		public function deleteUsuario(int $intIdpersona)
		{
			$this->intIdUsuario = $intIdpersona;
			$sql = "UPDATE TblPersona SET Est_IdEstado = ? WHERE IdPersona = $this->intIdUsuario ";
			$arrData = array(0);
			$request = $this->update($sql,$arrData);
			return $request;
		}

		public function updatePerfil(int $idUsuario, string $identificacion, string $nombre, string $apellido, int $telefono, string $password){
			$this->intIdUsuario = $idUsuario;
			$this->strIdentificacion = $identificacion;
			$this->strNombre = $nombre;
			$this->strApellido = $apellido;
			$this->intTelefono = $telefono;
			$this->strPassword = $password;

			if($this->strPassword != "")
			{
				$sql = "UPDATE TblPersona SET Per_Identificacion=?, Per_Nombres=?, Per_Apellidos=?, Per_Telefono=?, Per_Password=? 
						WHERE IdPersona = $this->intIdUsuario ";
				$arrData = array($this->strIdentificacion,
								$this->strNombre,
								$this->strApellido,
								$this->intTelefono,
								$this->strPassword);
			}else{
				$sql = "UPDATE TblPersona SET Per_Identificacion=?, Per_Nombres=?, Per_Apellidos=?, Per_Telefono=? 
						WHERE IdPersona = $this->intIdUsuario ";
				$arrData = array($this->strIdentificacion,
								$this->strNombre,
								$this->strApellido,
								$this->intTelefono);
			}
			$request = $this->update($sql,$arrData);
		    return $request;
		}

		public function updateDataFiscal(int $idUsuario, string $strNit, string $strNomFiscal, string $strDirFiscal){
			$this->intIdUsuario = $idUsuario;
			$this->strNit = $strNit;
			$this->strNomFiscal = $strNomFiscal;
			$this->strDirFiscal = $strDirFiscal;
			$sql = "UPDATE TblPersona SET nit=?, nombrefiscal=?, direccionfiscal=? 
						WHERE IdPersona = $this->intIdUsuario ";
			$arrData = array($this->strNit,
							$this->strNomFiscal,
							$this->strDirFiscal);
			$request = $this->update($sql,$arrData);
		    return $request;
		}

	}
 ?>