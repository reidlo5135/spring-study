package kr.co.picTO.security.domain;

import lombok.Getter;

import java.time.LocalDateTime;
import java.util.List;

@Getter
public class MemberLoginResponseDTO {

    private final Long id;
    private final List<String> roles;
    private final LocalDateTime createdDate;

    public MemberLoginResponseDTO(Member member) {
        this.id = member.getId();
        this.roles = member.getRoles();
        this.createdDate = member.getCreatedDate();
    }
}
