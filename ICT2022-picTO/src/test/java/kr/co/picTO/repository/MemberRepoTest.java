package kr.co.picTO.repository;

import kr.co.picTO.admin.config.JPAConfig;
import kr.co.picTO.admin.config.SpringConfig;
import kr.co.picTO.member.dao.MemberRepository;
import kr.co.picTO.member.domain.MemberVO;
import org.junit.jupiter.api.Test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;


import java.util.List;

@ContextConfiguration(classes = {SpringConfig.class, JPAConfig.class})
@SpringBootTest
public class MemberRepoTest {

    @Autowired
    MemberRepository repo;

    @Test
    void findAll() {
        List<MemberVO> list = repo.findAll();
    }
}
