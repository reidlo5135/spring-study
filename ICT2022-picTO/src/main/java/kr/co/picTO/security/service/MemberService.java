package kr.co.picTO.security.service;

import kr.co.picTO.admin.advice.exception.UserNotFoundException;
import kr.co.picTO.security.domain.Member;
import kr.co.picTO.security.domain.MemberRequestDTO;
import kr.co.picTO.security.domain.MemberResponseDTO;
import kr.co.picTO.security.repo.MemberRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;


@Service
@AllArgsConstructor
public class MemberService {

    private MemberRepository repo;

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
