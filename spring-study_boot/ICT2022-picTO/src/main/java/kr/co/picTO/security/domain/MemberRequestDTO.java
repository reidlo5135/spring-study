package kr.co.picTO.security.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
public class MemberRequestDTO {

    private String email;
    private String name;

    @Builder
    public MemberRequestDTO(String email, String name) {
        this.email = email;
        this.name = name;
    }

    public Member toEntity() {
        return Member.builder()
                .email(email)
                .name(name)
                .build();
    }
}
