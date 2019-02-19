<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/stileAmministratore.css" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>--MicroK--MusicStore--</title>
</head>
<body>
	<table class="Macro">
		<tr class="Menu">
			<td>Aggiungi Canzone</td>
			<td>Aggiuangi Artista</td>
			<td>Aggiungi Evento</td>
		</tr>

		<tr id="AggiugniArtista">
			<td>
				<form method="POST" action="aggiungiartista">
					<div class="form-group">
						<label>Nome</label><br> <input name="nome"> <br>
						<label>Immagine</label><br><input class="form-control" name="path"><br>
						<label>Biografia</label><br><input class="form-control" name="biografia"> <br><br>
					</div>
					<button type="submit" class="btn btn-default">Conferma</button>
				</form>
			</td>
			
			<td>
				<form method="POST" action="aggiungiCanzone">
					<div class="form-group">
						<label>Titolo</label><br> <input name="titolo"> <br>
						<label>Album</label> <br><input name="album"><br>
						<label>Artista</label><br><input class="form-control" name="artista"><br>
						<label>Genere</label><br><input class="form-control" name="genere"> <br>
						<label>Anno</label><br> <input class="form-control" name="anno"> <br>
						<label>Casa Discografica </label><br><input class="form-control" name="casaDiscografica"> <br>
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
					</div>
					<button type="submit" class="btn btn-default">Conferma</button>
				</form>
			</td>
		</tr>
		
				<tr>
			<td>Modifica Artista</td>
			<td>Modifica Canzone</td>
			<td>Modifica Evento</td>
		</tr>
		<tr>
			<td>
				<form method="POST" action="">
					<input type="text" placeholder="digita Artista">
					<div>
						<input type="submit" value="cerca">
					</div>
				</form>
			</td>
			<td>
				<form method="POST" action="">
					<input type="text" placeholder="digita Canzone">
					<div>
						<input type="submit" value="cerca">
					</div>
				</form>

			</td>
			<td>
				<form method="POST" action="">
					<input type="text" placeholder="digita Evento">
					<div>
						<input type="submit" value="cerca" onclick="ApriPopUp()">
					</div>
				</form>
			</td>
		</tr>
		
	</table>
</body>
</html>