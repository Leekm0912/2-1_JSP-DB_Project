package chap05;
// javax.servlet.http 패키지는 JDK가 가진 패키지가 아니라
// 톰캣 lib 폴더의 servlet-api.jar가 가진 패키지이므로
// 이를 사용하려면 톰캣 lib 폴더의 servlet-api.jar를 환경변수 CLASSPATH에 등록해야 한다.
// 환경변수 CLASSPATH 등록은 제어판에서 [시스템 및 보안]->[시스템]->[고급 시스템 설정]을 선택하여
// (시스템 속성) 창의 (고급 탭) 창에서 [환경변수]를 클릭하여 (환경변수) 창을 불러낸 후
// (시스템 변수 블록)에서 새로 만들기 클릭하여 변수 이름과 변수 값을 입력한 후 확인 버튼을 클릭한다.
// 변수 이름은 CLASSPATH로 하고 변수 값은 톰캣 lib 폴더의 servlet-api.jar로 한다.
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Cookie;
import java.util.Map;
import java.net.URLEncoder; 
import java.net.URLDecoder; 
import java.io.IOException; 

public class CookieUtil {
	// 쿠키 이름으로 각 쿠키를 접근하기 위한 Map 객체를 준비한다.
	private Map<String, Cookie> cookieMap = 
			new java.util.HashMap<String, Cookie>();
	// request 객체를 사용하여 전달받은 모든 쿠키를 준비한 멤버 cookieMap에 저장한다.
	public CookieUtil(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0 ; i < cookies.length ; i++) {
				cookieMap.put(cookies[i].getName(), cookies[i]);
			}
		}
	}
	// 전달받은 쿠키에서 쿠키 이름으로 쿠키를 찾는다.
	public Cookie getCookie(String name) {
		return cookieMap.get(name);
	}
	// 전달받은 쿠키에서 쿠키 이름으로 쿠키의 값을 찾는다.
	public String getValue(String name) throws IOException {
		Cookie cookie = cookieMap.get(name);
		if (cookie == null) {
			return null;
		}
		return URLDecoder.decode(cookie.getValue(), "utf-8");
	}
	// 전달받은 쿠키에서 쿠키 이름에 해당하는 쿠키가 존재하는지 확인한다.
	public boolean exists(String name) {
		return cookieMap.get(name) != null;
	}
	// 쿠키 이름과 쿠키 값만을 사용하여 새로운 쿠키를 생성한다.
	// static 메서드로서 생성된 쿠키를 반환한다.
	public static Cookie createCookie(String name, String value)
	throws IOException {
		return new Cookie(name, URLEncoder.encode(value, "utf-8"));
	}
	// 쿠키 이름, 값, 경로, 유효시간 등을 사용하여 새로운 쿠키를 생성한다.
	// static 메서드로서 생성된 쿠키를 반환한다.
	public static Cookie createCookie(String name, String value, String path, 
		int maxAge) throws IOException {
		Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
		cookie.setPath(path);
		cookie.setMaxAge(maxAge);
		return cookie;
	}
	// 쿠키 이름, 값, 도메인, 경로, 유효시간 등 모든 요소를 사용하여 새로운 쿠키를 생성한다.
	// static 메서드로서 생성된 쿠키를 반환한다.
	public static Cookie createCookie(String name, String value, String domain,
			String path, int maxAge) throws IOException {
		Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
		cookie.setDomain(domain);
		cookie.setPath(path);
		cookie.setMaxAge(maxAge);
		return cookie;
	}
}