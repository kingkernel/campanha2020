/*
This é um arquivo javascript coms as funções especificas para este sistema
*/
$("#input-estados").change(function(){
	var estado = $("#input-estados").val();
	$("#input-cidade").load("/ajax/loadcidadeinput/", {st : estado});
	$("#input-cidade").effect("bounce");
});
