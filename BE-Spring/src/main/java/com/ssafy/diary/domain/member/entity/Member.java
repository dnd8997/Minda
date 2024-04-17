package com.ssafy.diary.domain.member.entity;

import com.ssafy.diary.global.entity.BaseEntity;
import jakarta.persistence.Entity;
import lombok.Getter;

import com.ssafy.diary.global.constant.AuthType;
import com.ssafy.diary.global.constant.Role;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@NoArgsConstructor
public class Member extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "member_index", nullable = false)
    private Long index;

    @Column(name = "member_id", nullable = false)
    private String id;

    @Setter
    @Column(name = "member_password")
    private String password;

    @Setter
    @Enumerated(EnumType.STRING)
    @Column(name = "member_role", nullable = false)
    private Role role = Role.USER;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "member_platform", nullable = false)
    private AuthType platform;

    @Setter
    @Column(name = "member_nickname")
    private String nickname;

    @Setter
    @Column(name = "member_email")
    private String email;

    @Setter
    @Column(name = "member_profile_image")
    private String profileImage;

    @Builder
    public Member(Long index, String id, String password, Role role, AuthType platform, String email, String nickname, String profileImage) {
        this.index = index;
        this.id = id;
        this.password = password;
        this.role = role;
        this.email = email;
        this.platform = platform;
        this.nickname = nickname;
        this.profileImage = profileImage;
    }
}
