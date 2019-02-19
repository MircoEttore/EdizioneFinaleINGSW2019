package persistance;

import persistance.JDBC.ArtistaDaoJDBC;
import persistance.JDBC.CanzoneDaoJDBC;
import persistance.JDBC.EventoDaoJDBC;
import persistance.JDBC.UtenteDaoJDBC;
import persistence.dao.ArtistaDao;
import persistence.dao.CanzoneDao;
import persistence.dao.CategorieDAO;
import persistence.dao.EventoDao;
import persistence.dao.UtenteDao;

public class PostgresDAOFactory extends DAOFactory {

	private static DataSource dataSource;

	static {
		try {
			Class.forName("org.postgresql.Driver");
			// questi vanno messi in file di configurazione!!!
			// dataSource=new
			// DataSource("jdbc:postgresql://localhost:5432/postgres","postgres","postgres");
			dataSource = new DataSource("jdbc:postgresql://192.168.1.2:5432/Database_MicroK", "postgres", "postgres");
			// dataSource=new
			// DataSource("jdbc:postgresql://37.183.87.125:5432/postgres","postgres","password");
//			dataSource=new DataSource("jdbc:postgresql://192.168.43.197:5432/Database_MicroK","postgres","postgres");
			// dataSource=new
			// DataSource("jdbc:postgresql://localhost:5432/Database_MicroK","postgres","postgres");
		} catch (Exception e) {
			System.err.println("PostgresDAOFactory.class: failed to load Postgres JDBC driver\n" + e);
			e.printStackTrace();
		}
	}
	@Override
	public CanzoneDao getCanzoneDao() {
		return new CanzoneDaoJDBC(dataSource);
	}

	@Override
	public ArtistaDao getArtistaDAO() {
		return new ArtistaDaoJDBC(dataSource);
	}

	@Override
	public EventoDao getEventoDAO() {
		return new EventoDaoJDBC(dataSource);
	}

	@Override
	public CategorieDAO getCategoriaDAO() {
		return null;
	}

	@Override
	public UtenteDao getUtenteDAO() {
		return new UtenteDaoJDBC(dataSource);
	}
}
