package kr.co.picTO.member.dao;

import kr.co.picTO.member.domain.MemberVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.persistence.EntityManager;
import java.util.List;
import java.util.Optional;

@Log4j2
@AllArgsConstructor
public class JPAMemberRepository implements MemberRepository{

    private final EntityManager em;

    @Override
    public MemberVO save(MemberVO vo) {
        log.info("<JPA REPO> SAVE VO : " + vo);
        em.persist(vo);
        return vo;
    }

    @Override
    public List<MemberVO> findAll() {
        List<MemberVO> result = em.createQuery("select m from MemberVO m", MemberVO.class).getResultList();
        return result;
    }

    @Override
    public Optional<MemberVO> findById(Long id) {
        MemberVO vo = em.find(MemberVO.class, id);
        return Optional.ofNullable(vo);
    }

    @Override
    public Optional<MemberVO> findByName(String name) {
        List<MemberVO> result = em.createQuery("select m from MemberVO m where m.name =:name", MemberVO.class)
                .setParameter("name", name)
                .getResultList();
        return result.stream().findAny();
    }
}
