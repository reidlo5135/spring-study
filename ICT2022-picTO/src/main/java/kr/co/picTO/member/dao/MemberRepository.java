package kr.co.picTO.member.dao;

import kr.co.picTO.member.domain.MemberVO;

import java.util.List;
import java.util.Optional;

public interface MemberRepository{

    public MemberVO save(MemberVO vo);
    public Optional<MemberVO> findById(Long id);
    public Optional<MemberVO> findByName(String name);
    public List<MemberVO> findAll();
}
