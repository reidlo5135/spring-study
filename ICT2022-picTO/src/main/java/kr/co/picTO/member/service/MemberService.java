package kr.co.picTO.member.service;

import kr.co.picTO.member.domain.MemberVO;

import java.util.List;
import java.util.Optional;

public interface MemberService {

    public List<MemberVO> findAll();
    public Optional<MemberVO> findById(Long mno);
    public Optional<MemberVO> findByName(String name);
    public MemberVO save(MemberVO vo);


}
