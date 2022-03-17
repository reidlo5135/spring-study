package kr.co.picTO.security.service;

import kr.co.picTO.security.domain.MemberRequestDTO;
import kr.co.picTO.security.domain.Member;
import kr.co.picTO.security.repo.MemberRepository;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@AllArgsConstructor
@Log4j2
public class SecurityMemberService implements UserDetailsService {

    private MemberRepository memberRepository;

//    @Override
//    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//        Optional<SecurityMemberEntity> securityMemberEntityOptional = securityRepository.findByEmail(username);
//        SecurityMemberEntity securityMemberEntity = securityMemberEntityOptional.orElse(null);
//
//        List<GrantedAuthority> authorities = new ArrayList<>();
//        authorities.add(new SimpleGrantedAuthority(securityMemberEntity.getRoleKey()));
//
//        if("admin@test.com".equals(username)) {
//            authorities.add(new SimpleGrantedAuthority(Role.ADMIN.getKey()));
//        } else {
//            authorities.add(new SimpleGrantedAuthority(Role.MEMBER.getKey()));
//        }
//        log.info("username : " + username);
//
//        return new User(securityMemberEntity.getEmail(), securityMemberEntity.getUpwd(), authorities);
//    }


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return memberRepository.findById(Long.parseLong(username)).orElseThrow();
    }

//    public Member signUpMember(MemberRequestDTO securityMemberDTO) {
//        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
//        securityMemberDTO.setUpwd(bCryptPasswordEncoder.encode(securityMemberDTO.getUpwd()));
//
//        return memberRepository.save(securityMemberDTO.toEntity());
//    }
//
//    public List<Member> findAll() {
//        return memberRepository.findAll();
//    }
}
