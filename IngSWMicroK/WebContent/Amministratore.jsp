<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/stileAmministratore.css" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table class="Macro">
		<tr class="Menu">
			<td>Aggiungi Canzone</td>
			<td>Aggiungi Artista</td>
			<td>Aggiungi Evento</td>
		</tr>

		<tr id="AggiugniCanzone">
			<td>
				<form method="POST" action=""><!-- AggiungiCanzone -->
					<div class="form-group">
						<label>Nome</label><br> <input name="nome"> <br>
						<label>Immagine</label><br><input class="form-control" name="path"><br>
						<label>Biografia</label><br><input class="form-control" name="biografia"> <br><br>
					</div>
					<button type="submit" class="btn btn-default">Conferma</button>
				</form>
			</td>
			
			<td>
				<form method="POST" action="">
					<div class="form-group">
						<label>Titolo</label><br> <input name="titolo"> <br>
						<label>Album</label> <br><input name="album"><br>
						<label>Artista</label><br><input class="form-control" name="artista"><br>
						<label>Genere</label><br><input class="form-control" name="genere"> <br>
						<label>Anno</label><br> <input class="form-control" name="anno"> <br>
						<label>Casa Discografica </label><br><input class="form-control" name="casadiscografica"> <br>
						<label>URL</label> <br><input name="url"><br>
						<label>Prezzo</label> <br><input name="prezzo"><br><br>
					</div>
					<button type="submit" class="btn btn-default">Conferma</button>
				</form>
			</td>
			<td>
				<form method="POST" action="aggiungiEvento">
					<div class="form-group">
						<label>Artista</label><br> <input name="artista"> <br>
						<label>Data</label><br><input class="form-control" name="data"><br>
						<label>Luogo</label><br><input class="form-control" name="luogo"> <br>
						<label>Nome Evento</label><br> <input class="form-control" name="nome"> <br>
						<label>Prezzo</label><br><input class="form-control" name="prezzo"> <br>
						<label>Collegamento Ipertestuale</label> <br><input name="link"><br><br>
					</div>
					<button type="submit" class="btn btn-default">Conferma</button>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>