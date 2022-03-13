package kr.co.picTO.member.domain;

import lombok.Data;

import java.sql.Date;

@Data
public class MemberVO {

    private int mno;
    private String id;
    private String pwd;
    private String name;
    private int age;
    private Date regDate;
    private Date updateDate;
}
