$(document).ready(function(){
	//Examples of how to assign the ColorBox event to elements.
	$("a[rel='photogallery']").colorbox({transition:"elastic",maxWidth: "80%",maxHeight: "80%",resize: true,slideshow:true,slideshowAuto:false,current: "immagine {current} di {total}" });
	
	$(".diaporama1").jDiaporama({
		animationSpeed: "slow",
		delay:4
	});
});