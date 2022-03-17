package kr.co.picTO.security.controller;

import io.swagger.annotations.Api;
import kr.co.picTO.security.jwt.JwtProvider;
import kr.co.picTO.security.service.SecurityMemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = "1. SingUp / LogIn")
@RequiredArgsConstructor
@RestController
@RequestMapping("/member")
public class SignController {

    private final SecurityMemberService securityMemberService;
    private final JwtProvider jwtProvider;

//    @ApiOperation(value = "로그인", notes = "이메일로 로그인을 합니다.")
//    @GetMapping("/login")
//    public SingResult
}
