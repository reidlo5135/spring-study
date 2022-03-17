package kr.co.picTO.admin.advice.exception;

public class EmailSignupFailedCException extends RuntimeException{
    public EmailSignupFailedCException() {
        super();
    }

    public EmailSignupFailedCException(String message) {
        super(message);
    }

    public EmailSignupFailedCException(String message, Throwable cause) {
        super(message, cause);
    }
}
