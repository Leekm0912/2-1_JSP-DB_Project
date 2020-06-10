package chap03;

import java.util.Date;

public class MemberInfo {
	// id, password, name, registerDate, email 등의
	// 프로퍼티를 위한 필드
	private String id;
	private String password;
	private String name;
	private Date registerDate;
	private String email;

	// 프로퍼티 id 게터
	public String getId() {
		return id;
	}

	// 프로퍼티 id 세터
	public void setId(String val) {
		this.id = val;
	}

	// 프로퍼티 password 게터
	public String getPassword() {
		return password;
	}

	// 프로퍼티 password 세터
	public void setPassword(String val) {
		this.password = val;
	}

	// 프로퍼티 name 게터
	public String getName() {
		return name;
	}

	// 프로퍼티 name 세터
	public void setName(String val) {
		this.name = val;
	}

	// 프로퍼티 registerDate 게터
	public Date getRegisterDate() {
		return registerDate;
	}

	// 프로퍼티 registerDate 세터
	public void setRegisterDate(Date val) {
		this.registerDate = val;
	}

	// 프로퍼티 email 게터
	public String getEmail() {
		return email;
	}

	// 프로퍼티 email 세터
	public void setEmail(String val) {
		this.email = val;
	}
}