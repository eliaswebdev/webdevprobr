$('.btn-remove').on 'click', ->
	$('nav ul li.time-now').remove()
	alert 'O timenow foi removido com sucesso!'
	return