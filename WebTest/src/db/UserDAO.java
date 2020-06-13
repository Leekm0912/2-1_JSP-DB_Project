package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class UserDAO {

	// dao : 데이터베이스 접근 객체의 약자로서
	// 실질적으로 db에서 회원정보 불러오거나 db에 회원정보 넣을때


	private Connection conn; // connection:db에접근하게 해주는 객체
	private PreparedStatement pstmt;
	private ResultSet rs;


	// mysql에 접속해 주는 부분
	public UserDAO() { // 생성자 실행될때마다 자동으로 db연결이 이루어 질 수 있도록함
		try {

			String dbURL = "jdbc:oracle:thin:@localhost:1521:orcl"; // localhost:3306 포트는 컴퓨터설치된 mysql주소

			String dbID = "MYDB";

			String dbPassword = "dongsu14";

			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {

			e.printStackTrace(); // 오류가 무엇인지 출력

		}

	}



	// 로그인을 시도하는 함수****

	public User login(String userID, String userPassword, String type) {
		User user = new User();
		String SQL = "";
		String userType = "";
		if(type.equals("매수자")) {
			SQL = "SELECT PW,매수자_이름, ID FROM 매수자 WHERE ID = ?";
			userType = "매수자";
		}
		else if(type.equals("매도자")) {
			SQL = "SELECT PW,매도자_이름, ID FROM 매도자 WHERE ID = ?";
			userType = "매도자";
		}
		
		try {

			// pstmt : prepared statement 정해진 sql문장을 db에 삽입하는 형식으로 인스턴스가져옴

			pstmt = conn.prepareStatement(SQL);

			// sql인젝션 같은 해킹기법을 방어하는것... pstmt을 이용해 하나의 문장을 미리 준비해서(물음표사용)

			// 물음표해당하는 내용을 유저아이디로, 매개변수로 이용.. 1)존재하는지 2)비밀번호무엇인지

			pstmt.setString(1, userID);

			// rs:result set 에 결과보관

			rs = pstmt.executeQuery();

			// 결과가 존재한다면 실행
			
			if (rs.next()) {

				// 패스워드 일치한다면 실행
				String enpw = rs.getString(1);
				char [] enpw_char = enpw.toCharArray();
				for(int i=0; i<enpw_char.length;i++){
					int temp = (int)enpw_char[i];
					temp += 30;
					enpw_char[i] = (char)temp;
				}
				enpw = new String(enpw_char);
				System.out.println(enpw);
				
				if (enpw.equals(userPassword)) {
					user.setUserName(rs.getString(2));
					user.setUserID(rs.getString(3));
					user.setUserType(userType);
					
					return user; // 로긴 성공

				} else {
					user.setUserType("0");
					return user; // 비밀번호 불일치
				}

			}
			user.setUserType("-1");
			return user; // 아이디가 없음 오류



		} catch (Exception e) {

			e.printStackTrace();

		}
		user.setUserType("-2");
		return user; // 데이터베이스 오류를 의미

	}



}