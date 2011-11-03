function htmlExport(hdat){
	var w = window.open("","_blank","");
	w.document.open();
	w.document.write(hdat);
	w.document.close();
}