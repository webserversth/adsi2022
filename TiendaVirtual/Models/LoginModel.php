<?php 

	class LoginModel extends Mysql
	{
		private $intIdUsuario;
		private $strUsuario;
		private $strPassword;
		private $strToken;

		public function __construct()
		{
			parent::__construct();
		}	

		public function loginUser(string $usuario, string $password)
		{
			$this->strUsuario = $usuario;
			$this->strPassword = $password;
			$sql = "SELECT IdPersona,Est_IdEstado FROM TblPersona WHERE 
					Per_Email = '$this->strUsuario' and 
					Per_Password = '$this->strPassword' and 
					Est_IdEstado != 0 ";
			$request = $this->select($sql);
			return $request;
		}

		public function sessionLogin(int $iduser){
			$this->intIdUsuario = $iduser;
			//BUSCAR ROLE 
			$sql = "SELECT pr.IdPersona,
						   pr.Per_Identificacion,
						   pr.Per_Nombres,
						   pr.Per_Apellidos,
						   pr.Per_Telefono,
						   pr.Per_Email,
						   r.idrol,r.Rol_Nombre,
						   pr.Est_IdEstado 
					FROM TblPersona pr
					INNER JOIN TblRol r
					ON pr.Rol_IdRol = r.idrol
					WHERE pr.IdPersona = $this->intIdUsuario";
			$request = $this->select($sql);
			$_SESSION['userData'] = $request;
			return $request;
		}

		public function getUserEmail(string $strEmail){
			$this->strUsuario = $strEmail;
			$sql = "SELECT IdPersona,Per_Nombres,Per_Apellidos,Est_IdEstado FROM TblPersona WHERE 
					Per_Email = '$this->strUsuario' and  
					Est_IdEstado = 1 ";
			$request = $this->select($sql);
			return $request;
		}

		public function setTokenUser(int $idpersona, string $token){
			$this->intIdUsuario = $idpersona;
			$this->strToken = $token;
			$sql = "UPDATE TblPersona SET Per_Token = ? WHERE IdPersona = $this->intIdUsuario ";
			$arrData = array($this->strToken);
			$request = $this->update($sql,$arrData);
			return $request;
		}

		public function getUsuario(string $email, string $token){
			$this->strUsuario = $email;
			$this->strToken = $token;
			$sql = "SELECT IdPersona FROM TblPersona WHERE 
					Per_Email = '$this->strUsuario' and 
					Per_Token = '$this->strToken' and 					
					Est_IdEstado = 1 ";
			$request = $this->select($sql);
			return $request;
		}

		public function insertPassword(int $idPersona, string $password){
			$this->intIdUsuario = $idPersona;
			$this->strPassword = $password;
			$sql = "UPDATE TblPersona SET Per_Password = ?, Per_Token = ? WHERE IdPersona = $this->intIdUsuario ";
			$arrData = array($this->strPassword,"");
			$request = $this->update($sql,$arrData);
			return $request;
		}
	}
 ?>