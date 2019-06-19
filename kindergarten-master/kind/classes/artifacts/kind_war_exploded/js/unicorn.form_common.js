/**
 * Unicorn Admin Template
 * Diablo9983 -> diablo9983@gmail.com
**/


$(document).ready(function(){

	$('input[type=checkbox],input[type=radio],input[type=file]').uniform();
	
	$("select[name='priceType']").select2({
        placeholder:"请选择"
    });

    var state=$("select[name='state']").select2();
    state.val(["%"]).trigger('change');

    $('.colorpicker').colorpicker();

    $('.datepicker').datepicker();

});