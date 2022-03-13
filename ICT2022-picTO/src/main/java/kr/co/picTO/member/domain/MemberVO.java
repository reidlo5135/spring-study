package kr.co.picTO.member.domain;

import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "member")
@Data
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class MemberVO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long mno;

    @Column(name = "id")
    private String id;

    @Column(name = "name")
    private String name;

    @Builder
    public MemberVO(String id, String name){
        this.id = id;
        this.name = name;
    }
}
