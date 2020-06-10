package chap05;

public class ExceptionTest extends RuntimeException{
	public ExceptionTest() {
		super("에러 발생 얍!");
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void error() {
		throw new ExceptionTest();
	}
	
}
