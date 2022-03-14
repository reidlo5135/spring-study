package kr.co.picTO.member.dao;

import kr.co.picTO.member.domain.MemberVO;
import lombok.AllArgsConstructor;

import javax.persistence.EntityManager;
import java.util.List;
import java.util.Optional;

@AllArgsConstructor
public class JPAMemberRepository implements MemberRepository{

    private final EntityManager em;

    @Override
    public MemberVO save(MemberVO vo) {
        em.persist(vo);
        return vo;
    }

    @Override
    public Optional<MemberVO> findById(Long id) {
        MemberVO vo = em.find(MemberVO.class, id);
        return Optional.ofNullable(vo);
    }

    @Override
    public Optional<MemberVO> findByName(String name) {
        return Optional.empty();
    }

    @Override
    public List<MemberVO> findAll() {
        List<MemberVO> result = em.createQuery("select m from MemberVO m", MemberVO.class).getResultList();
        return result;
    }

}
