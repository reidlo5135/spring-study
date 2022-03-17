package kr.co.picTO.admin.config;

import kr.co.picTO.admin.config.service.ResponseService;
import kr.co.picTO.security.controller.MemberController;
import kr.co.picTO.security.repo.MemberRepository;
import kr.co.picTO.security.service.MemberService;
import kr.co.picTO.security.service.SecurityMemberService;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SpringConfig {

    private final MemberRepository memberRepository;

    public SpringConfig(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    @Bean
    public ResponseService responseService() {
        return new ResponseService();
    }

    @Bean
    public MemberService memberService() {
        return new MemberService(memberRepository);
    }

    @Bean
    public SecurityMemberService securityMemberService() {
        return new SecurityMemberService(memberRepository);
    }

    @Bean
    public MemberController MemberController() {
        return new MemberController(memberService(), responseService());
    }
}
