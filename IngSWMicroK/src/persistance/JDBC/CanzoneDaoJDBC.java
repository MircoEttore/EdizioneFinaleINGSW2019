package persistance.JDBC;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import model.Artista;
import model.Canzone;
import model.IndiceDiGradimento;

import persistance.DataSource;
import persistance.PersistenceException;

import persistence.dao.CanzoneDao;

import java.util.List;


public class CanzoneDaoJDBC implements CanzoneDao {
	private DataSource dataSource;
	private Connection connection = null;
	private PreparedStatement statement = null;

	public CanzoneDaoJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public void save(Canzone canzone) throws SQLException {
		this.connection = this.dataSource.getConnection();
//Insert tupla
		try {
			String insert = "insert into canzone(titolo,artista,genere,anno,casadiscografica,indicedigradimento,url,album,prezzo) values (?,?,?,?,?,?,?,?,?)";
			statement = connection.prepareStatement(insert);
			statement.setString(1, canzone.getTitolo());
			statement.setString(2, canzone.getArtista().getNomeArtista());
			statement.setString(3, canzone.getGenere());
			statement.setInt(4, canzone.getAnno());
			statement.setString(5, canzone.getCasaDiscografica());
			statement.setInt(6, canzone.getIndiceDiGradimento().getVotoAttuale());
			statement.setString(7, canzone.getUrl());
			statement.setString(8, canzone.getAlbum());
			statement.setDouble(9, canzone.getPrezzo());
			statement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			if (statement != null) {
				statement.close();
			}

			if (connection != null) {
				connection.close();
			}
			addArtista(canzone);
		}

	}

	private void addArtista(Canzone canzone) throws SQLException {
		try {
			Boolean artistaPresente = false;
			connection = this.dataSource.getConnection();

			String sql = "SELECT Nome FROM artista WHERE nome= ?";
			this.statement = this.connection.prepareStatement(sql);
			statement.setString(1, canzone.getArtista().getNomeArtista());

			ResultSet rs = statement.executeQuery();
			//Se � presente nella Resulset imposta l'artista come presente 
			while (rs.next()) {
				String username = rs.getString("nome");
				artistaPresente = true;
				System.out.println(username);
			}
			// Se non � presente nella Resulset imposta l'artista lo crea
			if (artistaPresente == false) {
				statement.addBatch();
				String insert = "insert into artista(nome,path_image_artista) values (?,?)";
				statement = connection.prepareStatement(insert);
				statement.setString(1, canzone.getArtista().getNomeArtista());
				statement.setString(2, canzone.getArtista().getPathImage());

				statement.executeUpdate();
				artistaPresente = false;
			}

			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			if (statement != null) {
				statement.close();
			}

			if (connection != null) {
				connection.close();
			}

		}
	}

	
	public void update(Canzone canzone) {
		Connection connection = this.dataSource.getConnection();
		try {
			//String update = "update canzone SET Nome = ?,Artista = ?, Anno = ? , Genere = ? , IndiceDiGradimento = ? , Album = ? , CasaDiscografica = ? , Url_canzoni = ? WHERE idcanzone = ? ";
			String update="update canzone SET titolo= ?,artista= ?,genere= ?,anno= ?,casadiscografica= ?,indicedigradimento= ?,url= ?,album=? Where idcanzone=?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setString(1, canzone.getTitolo());
			statement.setString(2, canzone.getArtista().getNomeArtista());
			statement.setString(3, canzone.getGenere());
			statement.setInt(4, canzone.getAnno());
			statement.setString(5, canzone.getCasaDiscografica());
			statement.setInt(6, canzone.getIndiceDiGradimento().getVotoAttuale());
			statement.setString(7, canzone.getUrl());
			statement.setString(8, canzone.getAlbum());
			statement.setInt(9,canzone.getIdCanzone());
			statement.executeUpdate();
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
	}


@Override
public List<Canzone> findAll() {

	 connection = this.dataSource.getConnection();
	ArrayList<Canzone>canzoni = new ArrayList<>();
	try {
		Canzone canzone;
		PreparedStatement statement;
		String query = "select * from canzone";
		statement = connection.prepareStatement(query);
		ResultSet result = statement.executeQuery();
		while (result.next()) {
			canzone = new Canzone();
			canzone.setIdCanzone(result.getInt("idcanzone"));				
			canzone.setTitolo(result.getString("titolo"));
			canzone.setArtista(new Artista (result.getString("artista")));
			canzone.setGenere(result.getString("genere"));
			canzone.setAnno(result.getInt("anno"));
			canzone.setCasaDiscografica(result.getString("casadiscografica"));
			canzone.setIndiceDiGradimento(new IndiceDiGradimento(result.getInt("IndiceDiGradimento")));
			canzone.setUrl(result.getString("url"));
			canzone.setAlbum(result.getString("album"));
			canzone.setIdCanzone(result.getInt("idcanzone"));
			canzone.setPrezzo(result.getDouble("prezzo"));
			canzoni.add(canzone);
		}
	} catch (SQLException e) {
		throw new PersistenceException(e.getMessage());
	}	 finally {
		try {
			connection.close();
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		}
	}
	return canzoni;
}




@Override
public List<Canzone> findForGenere(String genere) {

	 connection = this.dataSource.getConnection();
	ArrayList<Canzone>canzoni = new ArrayList<>();
	try {
		Canzone canzone;
		PreparedStatement statement;
		String query = "select * from canzone where genere= ?";
		statement = connection.prepareStatement(query);
		statement.setString(1,genere);
		ResultSet result = statement.executeQuery();
		while (result.next()) {
			canzone = new Canzone();
			canzone.setIdCanzone(result.getInt("idcanzone"));				
			canzone.setTitolo(result.getString("titolo"));
			canzone.setArtista(new Artista (result.getString("artista")));
			canzone.setGenere(result.getString("genere"));
			canzone.setAnno(result.getInt("anno"));
			canzone.setCasaDiscografica(result.getString("casadiscografica"));
			canzone.setIndiceDiGradimento(new IndiceDiGradimento(result.getInt("IndiceDiGradimento")));
			canzone.setUrl(result.getString("url"));
			canzone.setAlbum(result.getString("album"));
			canzone.setIdCanzone(result.getInt("idcanzone"));
			canzone.setPrezzo(result.getDouble("prezzo"));
			canzoni.add(canzone);
		}
	} catch (SQLException e) {
		throw new PersistenceException(e.getMessage());
	}	 finally {
		try {
			connection.close();
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		}
	}
	return canzoni;
}


@Override
public List<Canzone> findTop5ForGenere(String genere) {

	 connection = this.dataSource.getConnection();
	ArrayList<Canzone>canzoni = new ArrayList<>();
	try {
		Canzone canzone;
		PreparedStatement statement;
		String query = "select * from canzone where genere= ?";
		statement = connection.prepareStatement(query);
		statement.setString(1,genere);
		ResultSet result = statement.executeQuery();
		while (result.next()) {
			canzone = new Canzone();
			canzone.setIdCanzone(result.getInt("idcanzone"));				
			canzone.setTitolo(result.getString("titolo"));
			canzone.setArtista(new Artista (result.getString("artista")));
			canzone.setGenere(result.getString("genere"));
			canzone.setAnno(result.getInt("anno"));
			canzone.setCasaDiscografica(result.getString("casadiscografica"));
			canzone.setIndiceDiGradimento(new IndiceDiGradimento(result.getInt("IndiceDiGradimento")));
			canzone.setUrl(result.getString("url"));
			canzone.setAlbum(result.getString("album"));
			canzone.setIdCanzone(result.getInt("idcanzone"));
			canzone.setPrezzo(result.getDouble("prezzo"));
			canzoni.add(canzone);
		}
		
	
		Collections.sort(canzoni, new Comparator<Canzone>(){
			@Override
			public int compare(Canzone o1, Canzone o2){
				return ((Integer)o1.getIndiceDiGradimento().getVotoAttuale()).compareTo(o2.getIndiceDiGradimento().getVotoAttuale());
			}
		});
		
		Collections.reverse(canzoni);
	
	} catch (SQLException e) {
		throw new PersistenceException(e.getMessage());
	}	 finally {
		try {
			connection.close();
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		}
	}
	return canzoni;
}


	@Override
	public void delete(Canzone canzone) {
		Connection connection = this.dataSource.getConnection();
		try {
			String delete = "delete FROM canzone WHERE idCanzone = ? ";
			PreparedStatement statement = connection.prepareStatement(delete);
			statement.setInt(1, canzone.getIdCanzone());
			statement.executeUpdate();
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
	}
	@Override
	public void delete(Integer id ,String email) {
		Connection connection = this.dataSource.getConnection();
		
		try {
			String delete = "delete i from canzone i, utente u,artista a where i.idcanzone = ? and i.artista=a.nome and a.idartista = u.id_utente and u.email = ?";
			PreparedStatement statement = connection.prepareStatement(delete);
			statement.setInt(1, id);
			statement.setString(2, email);
			statement.executeUpdate();
		} catch (SQLException e) {
//			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
//				throw new PersistenceException(e.getMessage());
			}
		}
	}
	


	@Override
	public List<Canzone> findCanzone(String searchQuery) {
		 connection = this.dataSource.getConnection();
	//	searchQuery=searchQuery.toUpperCase();
		System.out.println("string : "+searchQuery);
		ArrayList<Canzone> listaCanzoni = new ArrayList<>();
		System.out.println(searchQuery);
		String[] someQueries = searchQuery.split(" ");
		ArrayList<String> queries = new ArrayList<String>();
		
		queries.add(searchQuery);
		for (String s : someQueries) {
			queries.add(s);
		}
		
		
		
		try {
			for (String search : queries) {
				System.out.println(search);
				PreparedStatement statement;
				String query = "SELECT * FROM canzone WHERE canzone.titolo LIKE ? OR canzone.artista LIKE  ?  OR  canzone.genere LIKE ? OR  canzone.album LIKE ?";
				statement = connection.prepareStatement(query);
				statement.setString(1, "%"+search+"%");
				statement.setString(2, "%"+search+"%");
				statement.setString(3, "%"+search+"%");
				statement.setString(4, "%"+search+"%");
				ResultSet result = statement.executeQuery();
			//	System.out.println(search);
				int i=0;
				while (result.next()) {
					Canzone canzone = new Canzone();
					canzone.setIdCanzone(result.getInt("idcanzone"));				
					canzone.setTitolo(result.getString("titolo"));
					canzone.setArtista(new Artista (result.getString("artista")));
					canzone.setGenere(result.getString("genere"));
					canzone.setAnno(result.getInt("anno"));
					canzone.setCasaDiscografica(result.getString("casadiscografica"));
					canzone.setIndiceDiGradimento(new IndiceDiGradimento(result.getInt("IndiceDiGradimento")));
					canzone.setUrl(result.getString("url"));
					canzone.setAlbum(result.getString("album"));
					canzone.setPrezzo(result.getDouble("prezzo"));
				
					
					

					
					if (!cercaDuplicato(canzone,listaCanzoni)) {
						
						listaCanzoni.add(canzone);
					
					}
			
				}
				//System.out.println(i);
			}
			

			 connection.close();

			

		} catch (SQLException e) {
//			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
//				throw new PersistenceException(e.getMessage());
			}
		}
		return listaCanzoni;
	}

	private boolean cercaDuplicato (Canzone c,ArrayList<Canzone> lista ) {
		
		for (Canzone cc :lista)
		{
			if (cc.getIdCanzone()==c.getIdCanzone())
				return true;
		}
		
		
		return false;
	}
	
//	@Override
//	public void cercaStottostringa (String s ) {
//		 connection = this.dataSource.getConnection();
//		 try {
//				String insert = "SELECT * from canzone as c  WHERE c.titolo LIKE ? \r\n" + "";
//				statement = connection.prepareStatement(insert);
//				statement.setString(1, "%"+s+"%");
//				ResultSet result = statement.executeQuery();
//				
//				
//				while (result.next()) {
//					Canzone canzone = new Canzone();
//					canzone.setIdCanzone(result.getInt("idcanzone"));				
//					canzone.setTitolo(result.getString("titolo"));
//					canzone.setArtista(new Artista (result.getString("artista")));
//					canzone.setGenere(result.getString("genere"));
//					canzone.setAnno(result.getInt("anno"));
//					canzone.setCasaDiscografica(result.getString("casadiscografica"));
//					canzone.setIndiceDiGradimento(new IndiceDiGradimento(result.getInt("IndiceDiGradimento")));
//					canzone.setUrl(result.getString("url"));
//					canzone.setAlbum(result.getString("album"));
//					canzone.setPrezzo(result.getDouble("prezzo"));
//					System.out.println(canzone.getTitolo());
//					}
//				
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				try {
//					connection.close();
//				} catch (SQLException e) {
//				}
//			}
//	}
	
}
