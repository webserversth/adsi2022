var tableParametros;
var divLoading = document.querySelector("#divLoading");
document.addEventListener('DOMContentLoaded', function(){
// tabla que muestra los datos en la pantalla Parametros
    tableParametros = $('#tableParametros').dataTable( {
        "aProcessing":true,
        "aServerSide":true,
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
        },
        "ajax":{
            "url": " "+base_url+"/Parametros/getParametros",
            "dataSrc":""
        },
        "columns":[ // deben ser iguales al nombre que aparece en el formato json y la cantidad debe ser igual a los cambos relacionados en los encabezados del views
            {"data":"IdParametro"},
            {"data":"Par_Valor"},
            {"data":"Par_Descripcion"},
			{"data":"Est_IdEstado"},
            {"data":"options"}
        ],
        'dom': 'lBfrtip',
        'buttons': [
            {
                "extend": "copyHtml5",
                "text": "<i class='far fa-copy'></i> Copiar",
                "titleAttr":"Copiar",
                "className": "btn btn-secondary"
            },{
                "extend": "excelHtml5",
                "text": "<i class='fas fa-file-excel'></i> Excel",
                "titleAttr":"Esportar a Excel",
                "className": "btn btn-success"
            },{
                "extend": "pdfHtml5",
                "text": "<i class='fas fa-file-pdf'></i> PDF",
                "titleAttr":"Esportar a PDF",
                "className": "btn btn-danger"
            },{
                "extend": "csvHtml5",
                "text": "<i class='fas fa-file-csv'></i> CSV",
                "titleAttr":"Esportar a CSV",
                "className": "btn btn-info"
            }
        ],
        "resonsieve":"true",
        "bDestroy": true,
        "iDisplayLength": 10, // numero de elementos a mostrar por paginas 
        "order":[[0,"desc"]]  
    });
	//Fin del codigo de la tabla que muestra la informacion en la pantalla parametro
	

    //NUEVO Parametro
    var formParametro = document.querySelector("#formParametro");
    formParametro.onsubmit = function(e) {
        e.preventDefault();

        var intIdParametro = document.querySelector('#idParametro').value;
        var strValor = document.querySelector('#txtValor').value;
        var strDescripcion = document.querySelector('#txtDescripcion').value;
        var intStatus = document.querySelector('#listStatus').value;        
        if(strValor == '' || strDescripcion == '' || intStatus == '')
        {
            swal("Atención", "Todos los campos son obligatorios." , "error");
            return false;
        }
        divLoading.style.display = "flex";
        var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
        var ajaxUrl = base_url+'/Parametros/setParametro'; 
        var formData = new FormData(formParametro);
        request.open("POST",ajaxUrl,true);
        request.send(formData);
        request.onreadystatechange = function(){
           if(request.readyState == 4 && request.status == 200){
                
                var objData = JSON.parse(request.responseText);
                if(objData.status)
                {
                    $('#modalFormParametro').modal("hide");
                    formParametro.reset();
                    swal("Parametro del sistema", objData.msg ,"success");
                    tableParametros.api().ajax.reload();
                }else{
                    swal("Error", objData.msg , "error");
                }              
            } 
            divLoading.style.display = "none";
            return false;
        }
        
    }

});

$('#tableParametros').DataTable();

function openModal(){

    document.querySelector('#idParametro').value ="";
    document.querySelector('.modal-header').classList.replace("headerUpdate", "headerRegister");
    document.querySelector('#btnActionForm').classList.replace("btn-info", "btn-primary");
    document.querySelector('#btnText').innerHTML ="Guardar";
    document.querySelector('#titleModal').innerHTML = "Nuevo Parametro";
    document.querySelector("#formParametro").reset();
	$('#modalFormParametro').modal('show');
}

window.addEventListener('load', function() {
    /*fntEditParametro();
    fntDelParametro();
    fntPermisos();*/
}, false);

function fntEditParametro(idparametro){
    document.querySelector('#titleModal').innerHTML ="Actualizar Parametro";
    document.querySelector('.modal-header').classList.replace("headerRegister", "headerUpdate");
    document.querySelector('#btnActionForm').classList.replace("btn-primary", "btn-info");
    document.querySelector('#btnText').innerHTML ="Actualizar";

    var idparametro = idparametro;
    var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    var ajaxUrl  = base_url+'/Parametros/getParametro/'+idparametro;
    request.open("GET",ajaxUrl ,true);
    request.send();

    request.onreadystatechange = function(){
        if(request.readyState == 4 && request.status == 200){
            
            var objData = JSON.parse(request.responseText);
            if(objData.status)
            {
                document.querySelector("#idParametro").value = objData.data.IdParametro;
                document.querySelector("#txtValor").value = objData.data.Par_Valor;
                document.querySelector("#txtDescripcion").value = objData.data.Par_Descripcion;

                if(objData.data.Est_IdEstado == 1)
                {
                    var optionSelect = '<option value="1" selected class="notBlock">Activo</option>';
                }else{
                    var optionSelect = '<option value="2" selected class="notBlock">Inactivo</option>';
                }
                var htmlSelect = `${optionSelect}
                                  <option value="1">Activo</option>
                                  <option value="2">Inactivo</option>
                                `;
                document.querySelector("#listStatus").innerHTML = htmlSelect;
                $('#modalFormParametro').modal('show');
            }else{
                swal("Error", objData.msg , "error");
            }
        }
    }

}

 //mostrar detalle de datos del parametro
	function fntViewInfoParametro(idparametro){
		// $('#modalViewSettings').modal('show'); // ayuda para mostrar el modal vacio
   // /* //Comentar para mostrar ayuda
    var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
    var ajaxUrl = base_url+'/Parametros/getParametro/'+idparametro;
    request.open("GET",ajaxUrl,true);
    request.send();
    request.onreadystatechange = function(){
        if(request.readyState == 4 && request.status == 200){
            var objData = JSON.parse(request.responseText);
            if(objData.status)
            {
				var estadoParametro = objData.data.Est_IdEstado == 1 ? 
                '<span class="badge badge-success">Activo</span>' : 
                '<span class="badge badge-danger">Inactivo</span>';
				
                document.querySelector("#celId").innerHTML = objData.data.idparametro;
                document.querySelector("#celValor").innerHTML = objData.data.valor;
                document.querySelector("#celDescripcion").innerHTML = objData.data.descripcion;
				document.querySelector("#celEstado").innerHTML = estadoParametro; 
                $('#modalViewParametro').modal('show');
            }else{
                swal("Error", objData.msg , "error");
            }
        }
    }// */ //Comentar para mostrar ayuda
}
	//Fin del codigo mostrar detalle de datos de parametro

function fntDelParametro(idparametro){
    swal({
        title: "Eliminar Parametro",
        text: "¿Realmente quiere eliminar el Parametro?",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "Si, eliminar!",
        cancelButtonText: "No, cancelar!",
        closeOnConfirm: false,
        closeOnCancel: true
    }, function(isConfirm) {
        
        if (isConfirm) 
        {
            var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
            var ajaxUrl = base_url+'/Parametros/delParametro/';
            var strData = "IdParametro="+idparametro;
            request.open("POST",ajaxUrl,true);
            request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            request.send(strData);
            request.onreadystatechange = function(){
                if(request.readyState == 4 && request.status == 200){
                    var objData = JSON.parse(request.responseText);
                    if(objData.status)
                    {
                        swal("Eliminar!", objData.msg , "success");
                        tableParametros.api().ajax.reload();
                    }else{
                        swal("Atención!", objData.msg , "error");
                    }
                }
            }
        }

    });
}
