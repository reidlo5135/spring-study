package kr.co.picTO.security.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import kr.co.picTO.admin.domain.SingleResult;
import kr.co.picTO.admin.service.ResponseService;
import kr.co.picTO.security.domain.MemberLoginResponseDTO;
import kr.co.picTO.security.domain.MemberSignUpRequestDTO;
import kr.co.picTO.security.jwt.JwtProvider;
import kr.co.picTO.security.service.MemberService;
import kr.co.picTO.security.service.SecurityMemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

@Api(tags = "1. SingUp / LogIn")
@RequiredArgsConstructor
@RestController
@RequestMapping("/member")
public class SignController {


    private final JwtProvider jwtProvider;
    private final PasswordEncoder passwordEncoder;

    private final MemberService memberService;
    private final ResponseService service;


    @ApiOperation(value = "Login", notes = "Login by Email")
    @GetMapping(value = "/login")
    public SingleResult<String> login(@ApiParam(value = "Login ID : Email", required = true) @RequestParam String email,
                                      @ApiParam(value = "Login Pwd", required = true) @RequestParam String password) {

        MemberLoginResponseDTO memberLoginResponseDTO = memberService.login(email, password);

        String token = jwtProvider.createToken(String.valueOf(memberLoginResponseDTO.getId()), memberLoginResponseDTO.getRoles());
        return service.getSingleResult(token);
    }

    @ApiOperation(value = "SingUp", notes = "Signing Up")
    @PostMapping(value = "/singUp")
    public SingleResult<Long> singup(@ApiParam(value = "SignUp Id : Email", required = true) @RequestParam String email,
                                     @ApiParam(value = "SignUp Password : Password", required = true) @RequestParam String password,
                                     @ApiParam(value = "SignUP Name : Name", required = true) @RequestParam String name) {

        MemberSignUpRequestDTO memberSignUpRequestDTO = MemberSignUpRequestDTO.builder()
                .email(email)
                .password(passwordEncoder.encode(password))
                .name(name)
                .build();
        Long singUpId = memberService.signUp(memberSignUpRequestDTO);
        return service.getSingleResult(singUpId);
    }
}
