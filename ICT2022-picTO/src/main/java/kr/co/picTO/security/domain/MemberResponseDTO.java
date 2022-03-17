package kr.co.picTO.security.domain;

import lombok.Getter;

@Getter
public class MemberResponseDTO {

    private final Long id;
    private final String email;
    private final String name;

    public MemberResponseDTO(Member member) {
        this.id = member.getId();
        this.email = member.getEmail();
        this.name = member.getName();
    }
}
