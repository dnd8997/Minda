package com.ssafy.diary.domain.auth.dto;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class AccessTokenDto {
	String accessToken;
}
