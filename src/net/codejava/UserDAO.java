package net.codejava;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	Connection connection;
	public UserDAO() {
		String jdbcURL = "jdbc:mysql://localhost:8889/bookshop";
		String dbUser = "root";
		String dbPassword = "root";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}

	public User checkLogin(String email, String password) throws SQLException, 
			ClassNotFoundException {
		
		String sql = "SELECT * FROM users WHERE lower(email) = lower(?) and password = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, email);
		String hashPassword = password;
		mdjavahash hasher = new mdjavahash();
		try {
			hashPassword = hasher.getHashPass(password);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		statement.setString(2, hashPassword);

		ResultSet result = statement.executeQuery();

		User user = null;

		if (result.next()) {
			user = new User();
			user.setFullname(result.getString("name"));
			user.setEmail(email);
			user.setPassword(password);
			user.setId(result.getInt("id"));;
		}
		return user;
	}
	
	public boolean checkUserEmail(String email) throws SQLException, 
	ClassNotFoundException {

		String sql = "SELECT * FROM users WHERE lower(email) = lower(?) ";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, email);
		
		ResultSet result = statement.executeQuery();
		
		if (result.next()) {
			return true;
		
		}
		return false;
	}
	
	public User insertUser(User user) throws SQLException, 
	ClassNotFoundException {

		String sql = "INSERT INTO `users`(`name`, `email`, `password`) VALUES (?,?,?)";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, user.getFullname());
		statement.setString(2, user.getEmail());
		String hashPassword = user.getPassword();
		mdjavahash hasher = new mdjavahash();
		try {
			hashPassword = hasher.getHashPass(user.getPassword());
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		statement.setString(3, hashPassword);
		
		statement.executeUpdate();
		
		String query = "select max(id) max from users";
		PreparedStatement pst = connection.prepareStatement(query);
		ResultSet rs = pst.executeQuery();
		
		if(rs.next()) {
			user.setId(rs.getInt("max"));
		}else {
			user.setId(-1);
		}
		return user;
	}
	
	
}
