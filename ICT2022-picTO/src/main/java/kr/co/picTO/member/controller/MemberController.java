package kr.co.picTO.member.controller;

import kr.co.picTO.member.domain.MemberVO;
import kr.co.picTO.member.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController("memController")
@AllArgsConstructor
@Log4j2
@RequestMapping(value = "member")
public class MemberController {

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

    @PostMapping(value = "/member/register")
    public ResponseEntity<MemberVO> save(MemberVO vo) {
        return new ResponseEntity<MemberVO>(mSvc.save(vo), HttpStatus.OK);
    }

    @PutMapping(value = "/{mno}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<MemberVO> updateMember(Long mno, MemberVO vo) {
        return new ResponseEntity<MemberVO>(vo, HttpStatus.OK);
    }

    @DeleteMapping(value = "/{mno}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<Void> deleteMember(Long mno) {
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
	
}
