package un.dez.easybuy.exception;

@SuppressWarnings("serial")
public class EasyBuyException extends RuntimeException {

	public EasyBuyException() {
		super();
	}

	public EasyBuyException(String message, Throwable cause) {
		super(message, cause);
	}

	public EasyBuyException(String message) {
		super(message);
	}

	public EasyBuyException(Throwable cause) {
		super(cause);
	}

}
