function atualizaQtd() {
	
	
	
    if (document.getElementById('pt').checked) {
        document.getElementById('paginaPt').style.display = 'inline';
        document.getElementById('precoPt').style.display = 'inline';
        document.getElementById('paginaEn').style.display = 'none';
        document.getElementById('precoEn').style.display = 'none';
        document.getElementById('idioma').value = 'PT';
    }
    else if(document.getElementById('en').checked){
        document.getElementById('paginaPt').style.display = 'none';
        document.getElementById('precoPt').style.display = 'none';
        document.getElementById('paginaEn').style.display = 'inline';
        document.getElementById('precoEn').style.display = 'inline';
        document.getElementById('idioma').value = 'EN';
    }
}