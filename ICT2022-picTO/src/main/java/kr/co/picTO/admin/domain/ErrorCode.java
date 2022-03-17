package kr.co.picTO.admin.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum ErrorCode {
    OpertaionNotAuthorized(6000, "Opertaion not Authorized"),
    DuplicateIdFound(6001, "Duplicate ID"),
    DuplicateEmailFound(6002, "Duplicate Email"),
    UnrecognizedRole(6010, "Unrecognized Role");

    private int code;
    private String description;
}
