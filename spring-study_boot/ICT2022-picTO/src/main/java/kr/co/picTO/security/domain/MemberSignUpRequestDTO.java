package kr.co.picTO.security.domain;

import lombok.Builder;
import lombok.Getter;

import java.util.Collections;

@Getter
public class MemberSignUpRequestDTO {

    private String email;
    private String password;
    private String name;

    @Builder
    public MemberSignUpRequestDTO(String email, String password, String name) {
        this.email = email;
        this.password = password;
        this.name = name;
    }

    public Member toEntity() {
        return Member.builder()
                .email(email)
                .upwd(password)
                .name(name)
                .roles(Collections.singletonList("ROLE_USER"))
                .build();
    }
}
