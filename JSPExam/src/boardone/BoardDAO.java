package boardone;

public class BoardDAO {

	private static BoardDAO instance = null;

	public BoardDAO() {
	}

	public static BoardDAO getInstance() {

		if (instance == null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO();
			}
		}
		return instance;
	}

}
