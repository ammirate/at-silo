function fadeMenu(li){
	if($(li).hasClass('enter')){
		t = $(li).children('ul');
		t.fadeIn(700);
	}
}

$(document).ready(function(){

	$('#cerca').val(' Cerca');
		
	$('#cerca').focus(function(){
		if($('#cerca').val()==' Cerca'){
			$('#cerca').val('');		
		}	
	});

	$('#link-rapidi').change(function(){
		href = '';
	
		$("#link-rapidi option:selected").each(function(){
			href += $(this).val();
        });

		document.location.href = href;
	
	});

	$('#channels li').mouseenter(function(){
		t= $(this);
		t.addClass('enter');
		setTimeout('fadeMenu(t);', 1500);	
	}).mouseleave(function(){
		$(this).removeClass('enter');
		t = $(this).children('ul');
		t.fadeOut(1000);
	});	

});