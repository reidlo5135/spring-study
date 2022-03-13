package kr.co.picTO.service;

import kr.co.picTO.admin.main.TomcatApplication;
import kr.co.picTO.member.dao.MemberRepository;
import kr.co.picTO.member.domain.MemberVO;
import kr.co.picTO.member.service.MemberServiceImpl;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.transaction.Transactional;
import java.util.List;

@SpringBootTest(classes = TomcatApplication.class)
@Transactional
public class MemberServiceTest {

    @Autowired
    private MemberServiceImpl mSvc;

    @Autowired
    private MemberRepository repo;

    @Test
    void getList() throws Exception{


        List<MemberVO> list = repo.findAll();

    }
}
