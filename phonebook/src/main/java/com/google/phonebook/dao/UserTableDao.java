package com.google.phonebook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.google.phonebook.dto.PhoneBookDto;
import com.google.phonebook.dto.UserTableDto;

@Repository
public class UserTableDao {
	final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";

	// DB 연결을 가져오는 메서드, DBCP를 사용하는 것이 좋음
	public Connection open() {
		Connection conn = null;
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, "ora_user", "hong");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public void insert(UserTableDto usertableDto) throws Exception {
		Connection conn = open();

		String sql = "INSERT INTO usertable VALUES (?,?,?,?)";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		try (conn; pstmt) {
			pstmt.setString(1, usertableDto.getUsername());
			pstmt.setString(2, usertableDto.getImgnm());
			pstmt.setString(3, usertableDto.getUserid());
			pstmt.setString(4, usertableDto.getUserpassword());
			pstmt.executeUpdate();
		}

	}

	public UserTableDto searchAll(String insertsession) throws Exception {
		Connection conn = open();

		UserTableDto user = new UserTableDto();

		String sql = "SELECT * FROM USERTABLE where userid = ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, insertsession);
		ResultSet rs = pstmt.executeQuery();
		try (conn; pstmt; rs) {
			if (rs.next()) {
				user.setUsername(rs.getString("username"));
				user.setImgnm(rs.getString("imgnm"));
				user.setUserid(rs.getString("userid"));
				user.setUserpassword(rs.getString("userpassword"));
			}
			return user;
		}

	}
	public ArrayList<UserTableDto> searchuserinfo(String insertsession) throws Exception {
		Connection conn = open();

		UserTableDto user = new UserTableDto();
		ArrayList<UserTableDto> userinfo = new ArrayList<>();

		String sql = "SELECT * FROM USERTABLE where userid = ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, insertsession);
		ResultSet rs = pstmt.executeQuery();
		try (conn; pstmt; rs) {
			if (rs.next()) {
				user.setUsername(rs.getString("username"));
				user.setImgnm(rs.getString("imgnm"));
				user.setUserid(rs.getString("userid"));
				user.setUserpassword(rs.getString("userpassword"));
				userinfo.add(user);
			}
			return userinfo;
		}

	}
	

	public ArrayList<UserTableDto> isexistuserid() throws Exception {
		Connection conn = open();
		ArrayList<UserTableDto> usertablelist = new ArrayList<>();

		String sql = "SELECT * FROM USERTABLE ";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		try (conn; pstmt; rs) {
			while (rs.next()) {
				UserTableDto user = new UserTableDto();
				user.setUsername(rs.getString("username"));
				user.setImgnm(rs.getString("imgnm"));
				user.setUserid(rs.getString("userid"));
				user.setUserpassword(rs.getString("userpassword"));

				usertablelist.add(user);
			}
		}

		return usertablelist;

	}

	public ArrayList<UserTableDto> signupidcheck(String userid) throws Exception {
		Connection conn = open();
		ArrayList<UserTableDto> usertablelist = new ArrayList<>();

		String sql = "SELECT * FROM USERTABLE where userid = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		ResultSet rs = pstmt.executeQuery();
		try (conn; pstmt; rs) {
			while (rs.next()) {
				UserTableDto user = new UserTableDto();
				user.setUsername(rs.getString("username"));
				user.setImgnm(rs.getString("imgnm"));
				user.setUserid(rs.getString("userid"));
				user.setUserpassword(rs.getString("userpassword"));

				usertablelist.add(user);
			}
		}
		return usertablelist;

	}
	public void updateprofileimage(UserTableDto usertableDto) throws Exception {
		Connection conn = open();

		String sql = "UPDATE usertable SET imgnm = ? where userid = ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		try (conn; pstmt) {
			pstmt.setString(1, usertableDto.getImgnm());
			pstmt.setString(2, usertableDto.getUserid());
			pstmt.executeUpdate();
		}

	}
	public void updateprofilename(String usernm, String updateprofile ) throws Exception {
		Connection conn = open();
		
		String sql = "UPDATE usertable SET username = ? where userid = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		try (conn; pstmt) {
			pstmt.setString(1, usernm);
			pstmt.setString(2, updateprofile);
			pstmt.executeUpdate();
		}
		
	}
	public void updateprofilepassword(String userpw, String updateprofile) throws Exception {
		Connection conn = open();
		
		String sql = "UPDATE usertable SET userpassword = ? where userid = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		try (conn; pstmt) {
			pstmt.setString(1, userpw);
			pstmt.setString(2, updateprofile);
			pstmt.executeUpdate();
		}
		
	}
	public void userdelete(String deleteprofile) throws Exception {
		Connection conn = open();
		
		String sql = "delete from usertable where userid = ? ";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		try (conn; pstmt) {
			pstmt.setString(1, deleteprofile);
			pstmt.executeUpdate();
		}
		
	}
	
}
