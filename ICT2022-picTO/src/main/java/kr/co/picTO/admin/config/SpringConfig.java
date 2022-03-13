package kr.co.picTO.admin.config;

import kr.co.picTO.member.controller.MemberController;
import kr.co.picTO.member.controller.TestController;
import kr.co.picTO.member.dao.JPAMemberRepository;
import kr.co.picTO.member.dao.MemberRepository;
import kr.co.picTO.member.service.MemberService;
import kr.co.picTO.member.service.MemberServiceImpl;
import lombok.AllArgsConstructor;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Configuration
@AllArgsConstructor
public class SpringConfig {

    @PersistenceContext
    private final EntityManager em;

    @Bean
    public TestController testController() {
        return new TestController();
    }

    @Bean
    public MemberRepository memberRepository() {
        return new JPAMemberRepository(em);
    }

    @Bean
    public MemberService memberService() {
        return new MemberServiceImpl(memberRepository());
    }

    @Bean
    public MemberController memberController() {
        return new MemberController(memberService());
    }
}
