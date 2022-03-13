package kr.co.picTO.member.controller;

import kr.co.picTO.member.domain.MemberVO;
import kr.co.picTO.member.service.MemberService;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController("memController")
@AllArgsConstructor
@RequestMapping(value = "member")
public class MemberController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    MemberService mSvc;

    @GetMapping(produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<MemberVO>> getAllMembers() {
        List<MemberVO> member = mSvc.findAll();
        return new ResponseEntity<List<MemberVO>>(member, HttpStatus.OK);
    }

    @GetMapping(value = "/{mno}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<MemberVO> findByMno(Long mno) {
        mno = 1L;
        Optional<MemberVO> member = mSvc.findById(mno);
        return new ResponseEntity<MemberVO>(member.get(), HttpStatus.OK);
    }
	
}
