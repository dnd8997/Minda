package com.ssafy.diary.domain.member.controller;

import com.ssafy.diary.domain.auth.dto.PrincipalMember;
import com.ssafy.diary.domain.member.dto.MemberInfoResponseDto;
import com.ssafy.diary.domain.member.dto.MemberRegisterRequestDto;
import com.ssafy.diary.domain.member.service.MemberService;
import com.ssafy.diary.global.exception.AlreadyExistsMemberException;
import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/member")
@RequiredArgsConstructor
public class MemberController {
    final private MemberService memberService;

    @Operation(summary = "아이디 중복 확인", description = "아이디 중복 확인")
    @GetMapping("/check")
    public ResponseEntity<String> checkMemberId(@RequestParam("id") String id) {
        if (memberService.checkExistMemberId(id)) {
            throw new AlreadyExistsMemberException("member ID " + id + " is exists");
        }
        return ResponseEntity.ok().build();
    }

    @Operation(summary = "회원 가입", description = "회원 가입")
    @PostMapping("/register")
    public ResponseEntity<Object> authJoin(@RequestBody MemberRegisterRequestDto memberRegisterRequestDto) {
        memberService.registerMember(memberRegisterRequestDto);
        return ResponseEntity.status(HttpStatus.CREATED).body("register successfully");
    }

    @Operation(summary = "회원 정보 조회", description = "회원 정보 조회")
    @GetMapping("/my")
    public ResponseEntity<MemberInfoResponseDto> memberInfo(@AuthenticationPrincipal PrincipalMember principalMember) {

        return ResponseEntity.ok().body(memberService.getMemberInfo(principalMember.getIndex()));
    }
}
