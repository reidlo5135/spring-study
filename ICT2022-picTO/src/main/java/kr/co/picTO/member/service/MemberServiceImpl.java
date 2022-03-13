package kr.co.picTO.member.service;

import kr.co.picTO.member.dao.MemberRepository;
import kr.co.picTO.member.domain.MemberVO;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{

    private MemberRepository repo;

    @Override
    public List<MemberVO> findAll() {
        List<MemberVO> members = new ArrayList<>();
        repo.findAll().forEach(e -> members.add(e));
        return members;
    }

    @Override
    public Optional<MemberVO> findById(Long mno) {
        Optional<MemberVO> member = repo.findById(mno);
        return member;
    }

    @Override
    public Optional<MemberVO> findByName(String name) {
        return Optional.empty();
    }

    @Override
    public MemberVO save(MemberVO vo) {
        repo.save(vo);
        return vo;
    }
}
