package core;

public class CommonRes<T> {
	private T body;
	private String errorCode;
	private String errorMes;
	public String getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}
	public String getErrorMes() {
		return errorMes;
	}
	public void setErrorMes(String errorMes) {
		this.errorMes = errorMes;
	}
	public T getBody() {
		return body;
	}
	public void setBody(T body) {
		this.body = body;
	}
	
}
