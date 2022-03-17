package kr.co.picTO.security.service;

import kr.co.picTO.admin.advice.exception.EmailLoginFailedCException;
import kr.co.picTO.admin.advice.exception.EmailSignupFailedCException;
import kr.co.picTO.admin.advice.exception.UserNotFoundException;
import kr.co.picTO.security.domain.*;
import kr.co.picTO.security.repo.MemberRepository;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;


@Service
@AllArgsConstructor
public class MemberService {

    private MemberRepository repo;
    private PasswordEncoder passwordEncoder;

    @Transactional(readOnly = true)
    public MemberLoginResponseDTO login(String email, String password) {
        Member member = repo.findByEmail(email);
        if(member == null) throw new EmailLoginFailedCException();
        else if(!passwordEncoder.matches(password, member.getPassword()))
            throw new EmailLoginFailedCException();
        return new MemberLoginResponseDTO(member);
    }

    @Transactional
    public Long signUp(MemberSignUpRequestDTO memberSignUpRequestDTO) {
        if(repo.findByEmail(memberSignUpRequestDTO.getEmail()) == null)
            return repo.save(memberSignUpRequestDTO.toEntity()).getId();
        else throw new EmailSignupFailedCException();
    }

    @Transactional
    public Long save(MemberRequestDTO requestDTO) {
        repo.save(requestDTO.toEntity());
        return repo.findByEmail(requestDTO.getEmail()).getId();
    }

    @Transactional(readOnly = true)
    public MemberResponseDTO findById(Long id) {
        Member member = repo.findById(id)
                .orElseThrow(UserNotFoundException::new);
        return new MemberResponseDTO(member);
    }

    @Transactional(readOnly = true)
    public MemberResponseDTO findByEmail(String email) {
        Member member = repo.findByEmail(email);
        if (member == null) throw new UserNotFoundException();
        else return new MemberResponseDTO(member);
    }

    @Transactional(readOnly = true)
    public List<MemberResponseDTO> findAllUser() {
        return repo.findAll()
                .stream()
                .map(MemberResponseDTO::new)
                .collect(Collectors.toList());
    }

    @Transactional
    public Long update(Long id, MemberRequestDTO requestDTO) {
        Member modifiedMember = repo.findById(id).orElseThrow(UserNotFoundException::new);
        return id;
    }

    @Transactional
    public void delete(Long id) {
        repo.deleteById(id);
    }
}
