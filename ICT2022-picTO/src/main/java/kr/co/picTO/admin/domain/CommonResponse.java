package kr.co.picTO.admin.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum CommonResponse {
    SUCESS(0, "SUCCESSED"),
    FAIL(-1, "FAILED");

    private int code;
    private String msg;
}
