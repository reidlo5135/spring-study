package kr.co.picTO.security.controller;

import io.swagger.annotations.*;
import kr.co.picTO.admin.service.ResponseService;
import kr.co.picTO.admin.domain.CommonResult;
import kr.co.picTO.admin.domain.ListResult;
import kr.co.picTO.admin.domain.SingleResult;
import kr.co.picTO.security.domain.*;
import kr.co.picTO.security.jwt.JwtProvider;
import kr.co.picTO.security.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

@Api(tags = {"1. User"})
@RestController
@RequestMapping(value = "member")
@RequiredArgsConstructor
@Log4j2
public class MemberController {

    private final MemberService memberService;
    private final JwtProvider jwtProvider;
    private final ResponseService service;
    private final PasswordEncoder passwordEncoder;

    @ApiImplicitParams({
            @ApiImplicitParam(
                    name = "X-AUTH-TOKEN",
                    value = "로그인 성공 후 AccessToken",
                    required = true, dataType = "String", paramType = "header")
    })
    @ApiOperation(value = "Select All members", notes = "Select All members")
    @GetMapping(value = "/total")
    public ListResult<MemberResponseDTO> findAllMembers() {
        return service
                .getListResult(memberService.findAllUser());
    }

    @ApiImplicitParams({
            @ApiImplicitParam(
                    name = "X-AUTH-TOKEN",
                    value = "로그인 성공 후 AccessToken",
                    required = true, dataType = "String", paramType = "header")
    })
    @ApiOperation(value = "get By Id", notes = "get By Id")
    @GetMapping(value = "/id/{id}")
    public SingleResult<MemberResponseDTO> findByUserKey(@ApiParam(value = "member ID", required = true) @PathVariable Long id,
                                                         @ApiParam(value = "Language", defaultValue = "ko") @RequestParam String lang) {
        return service
                .getSingleResult(memberService.findById(id));
    }
    @ApiImplicitParams({
            @ApiImplicitParam(
                    name = "X-AUTH-TOKEN",
                    value = "로그인 성공 후 AccessToken",
                    required = true, dataType = "String", paramType = "header")
    })
    @ApiOperation(value = "get By Email", notes = "get By Email")
    @GetMapping(value = "/email/{email}")
    public SingleResult<MemberResponseDTO> findByEmail(@ApiParam(value = "member Email", required = true) @PathVariable String email,
                                            @ApiParam(value = "Language", defaultValue = "ko") @RequestParam String lang) {
        return service.getSingleResult(memberService.findByEmail(email));
    }

    @ApiOperation(value = "SingUp member", notes = "Register member")
    @PostMapping(value = "/reigster")
    public SingleResult<Long> save(@ApiParam(value = "Member Email", required = true) @RequestParam String email,
                                     @ApiParam(value = "Member Name", required = true) @RequestParam String name) {
        MemberRequestDTO vo = MemberRequestDTO.builder()
                .email(email)
                .name(name)
                .build();
        return service.getSingleResult(memberService.save(vo));
    }

    @ApiImplicitParams({
            @ApiImplicitParam(
                    name = "X-AUTH-TOKEN",
                    value = "로그인 성공 후 AccessToken",
                    required = true, dataType = "String", paramType = "header")
    })
    @ApiOperation(value = "modify member", notes = "modify Member Info")
    @PutMapping(value = "/modify")
    public SingleResult<Long> modify(@ApiParam(value = "member ID", required = true) @RequestParam Long id,
                                       @ApiParam(value = "member Email", required = true) @RequestParam String email,
                                       @ApiParam(value = "member Name", required = true) @RequestParam String name) {
        MemberRequestDTO vo = MemberRequestDTO.builder()
                .email(email)
                .name(name)
                .build();
        return service.getSingleResult(memberService.save(vo));
    }

    @ApiImplicitParams({
            @ApiImplicitParam(
                    name = "X-AUTH-TOKEN",
                    value = "로그인 성공 후 AccessToken",
                    required = true, dataType = "String", paramType = "header")
    })
    @ApiOperation(value = "member Delete", notes = "delete Member")
    @DeleteMapping(value = "/delete/{id}")
    public CommonResult delete(@ApiParam(value = "delete ID", required = true) @PathVariable Long id) {
        memberService.delete(id);
        return service.getSuccessResult();
    }

}
