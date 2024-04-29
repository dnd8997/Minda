package com.ssafy.diary.domain.member.service;

import com.amazonaws.services.kms.model.NotFoundException;
import com.ssafy.diary.domain.member.dto.MemberInfoResponseDto;
import com.ssafy.diary.domain.member.dto.MemberModifyRequestDto;
import com.ssafy.diary.domain.member.dto.MemberRegisterRequestDto;
import com.ssafy.diary.domain.member.entity.Member;
import com.ssafy.diary.domain.member.repository.MemberRepository;
import com.ssafy.diary.global.constant.AuthType;
import com.ssafy.diary.global.constant.Role;
import com.ssafy.diary.global.exception.AlreadyExistsMemberException;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.apache.coyote.BadRequestException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberService {
    final private MemberRepository memberRepository;
    final private PasswordEncoder passwordEncoder;

    @Transactional
    public void updateMemberPassword(Long memberIndex, MemberModifyRequestDto memberModifyRequestDto) throws BadRequestException {
        Member member= getMemberCheck(memberIndex);
        if(!passwordEncoder.matches(member.getPassword(),memberModifyRequestDto.getMemberOldPassword()))
        {
            throw new BadRequestException("member password incorrect");
        }
        member.setPassword(memberModifyRequestDto.getMemberNewPassword());
    } 
    public void updateMemberInfo(Long memberIndex, MemberModifyRequestDto memberModifyRequestDto) throws NotFoundException {
        Member member= getMemberCheck(memberIndex);
        member.setNickname(member.getNickname());
    }

    private Member getMemberCheck(Long memberIndex) {
        return memberRepository.findByIndex(memberIndex)
                .orElseThrow(() -> new UsernameNotFoundException("member not found"));
    }

    @Transactional
    public void registerMember(MemberRegisterRequestDto memberRegisterRequestDto) throws AlreadyExistsMemberException {

        boolean isExistsMember = checkExistMemberId(memberRegisterRequestDto.getId());

        if (!isExistsMember) {
            memberRepository.save(
                    Member.builder()
                            .id(memberRegisterRequestDto.getId())
                            .role(Role.USER)
                            .platform(AuthType.LOCAL)
                            .nickname(memberRegisterRequestDto.getNickname())
                            .email(memberRegisterRequestDto.getEmail())
                            .password(passwordEncoder.encode(memberRegisterRequestDto.getPassword()))
                            .build()
            );
        }
        if(isExistsMember){
            throw new AlreadyExistsMemberException("member ID "+memberRegisterRequestDto.getId()+ " is exists");
        }
    }
    @Transactional
    public boolean checkExistMemberId(String memberId){
        return memberRepository.existsByIdAndPlatform(
                memberId, AuthType.LOCAL
        );
    }

    public MemberInfoResponseDto getMemberInfo(Long memberIndex){
        Member member = getMemberCheck(memberIndex);

        return MemberInfoResponseDto.builder()
                .memberEmail(member.getEmail())
                .memberNickName(member.getNickname())
                .memberId(member.getId())
                .build();
    }
    
}
