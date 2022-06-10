<?php 
	//Datos de configuracion para conexion a base de datos y proyecto web
	
	const BASE_URL = "http://localhost/adsi2022/TiendaVirtual";

	//Zona horaria
	date_default_timezone_set('America/Bogota');

	//Datos de conexión a Base de Datos
	const DB_HOST = "localhost";
	const DB_PORT = "3310";
	const DB_NAME = "DBadsi2022";
	const DB_USER = "root";
	const DB_PASSWORD = "rootsth";
	const DB_CHARSET = "utf8";
	
	//Datos de configuracion del proyecto

	//Para envío de correo
	const ENVIRONMENT = 1; // Local: 0, Produccón: 1;

	//Deliminadores decimal y millar Ej. 24,1989.00
	const SPM = ".";
	const SPD = ",";

	//Simbolo de moneda
	const SMONEY = "$";
	const CURRENCY = "USD";
	
	
	//publicidad
	const MENSAJE = "Envio gratis por compras mayores a  $100.000 pesos colombianos";

	//Api PayPal
	//SANDBOX PAYPAL
    const URLPAYPAL = "https://api-m.sandbox.paypal.com";
	const IDCLIENTE = "";
	const SECRET = "";
	//LIVE PAYPAL
	//const URLPAYPAL = "https://api-m.paypal.com";
	//const IDCLIENTE = "";
	//const SECRET = "";

	//Datos envio de correo
	const NOMBRE_REMITENTE = "Tienda Virtual";
	const EMAIL_REMITENTE = "infosena@sena.com";
	const NOMBRE_EMPESA = "Kow";
	const WEB_EMPRESA = "http://www.cdtisena.com/";

	const DESCRIPCION = "La mejor tienda en línea con artículos de moda.";
	const SHAREDHASH = "TiendaVirtual";

	//Datos Empresa
	const DIRECCION = "Cl. 72k ###26J - 97, Cali, Valle del Cauca  Valle del Cauca - Colombia";
	const TELEMPRESA = "0324315800";
	const WHATSAPP = "+573155660671";
	const EMAIL_EMPRESA = "infosena@sena.com";
	const EMAIL_PEDIDOS = "infosena@sena.com"; 
	const EMAIL_SUSCRIPCION = "infosena@sena.com";
	const EMAIL_CONTACTO = "infosena@sena.com";

	const CAT_SLIDER = "1,2,3";
	const CAT_BANNER = "4,5,6";
	const CAT_FOOTER = "1,2,3,4,5";

	//Datos para Encriptar / Desencriptar
	const KEY = 'adsi';
	const METHODENCRIPT = "AES-128-ECB";

	//Envío
	const COSTOENVIO = 15000;
	
	//Módulos
	const MDASHBOARD = 1;
	const MUSUARIOS = 2;
	const MCLIENTES = 3;
	const MPRODUCTOS = 4;
	const MPEDIDOS = 5;
	const MCATEGORIAS = 6;
	const MDSUSCRIPTORES = 7;
	const MDCONTACTOS = 8;
	const MDPAGINAS = 9;
	const MDPARAMETROS = 10;

	//Páginas
	const PINICIO = 1;
	const PTIENDA = 2;
	const PCARRITO = 3;
	const PNOSOTROS = 4;
	const PCONTACTO = 5;
	const PPREGUNTAS = 6;
	const PTERMINOS = 7;
	const PSUCURSALES = 8;
	const PERROR = 9;

	//Roles
	const RADMINISTRADOR = 1;
	const RSUPERVISOR = 2;
	const RCLIENTES = 3;
	const RVENDEDOR = 4;

	const STATUS = array('Completo','Aprobado','Cancelado','Reembolsado','Pendiente','Entregado','Activo','Inactivo');

	//Productos por página
	const CANTPORDHOME = 8;
	const PROPORPAGINA = 4;
	const PROCATEGORIA = 4;
	const PROBUSCAR = 4;

	//REDES SOCIALES
	const FACEBOOK = "https://www.facebook.com/adsi2022";
	const INSTAGRAM = "https://www.instagram.com/adsi2022/";
	

 ?>