package com.ssafy.diary.global.exception;

public class AlreadyExistsEmailException extends RuntimeException {
    public AlreadyExistsEmailException(String message) {
        super(message);
    }
}
