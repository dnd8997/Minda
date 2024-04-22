import 'dart:developer';

import 'package:diary_fe/constants.dart';
import 'package:diary_fe/src/widgets/signup_dialog.dart';
import 'package:diary_fe/src/widgets/textform.dart';
import 'package:flutter/material.dart';

class LoginModal extends StatefulWidget {
  const LoginModal({super.key});

  @override
  State<LoginModal> createState() => _LoginModalState();
}

class _LoginModalState extends State<LoginModal> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  void _login() {
    String email = _idController.text;
    String password = _pwController.text;

    log('Email: $email, Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors();
    return Center(
      child: SingleChildScrollView(
        child: Dialog(
          backgroundColor: const Color(0xFFFFFFFF),
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SizedBox(
            width: 380,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // 모달 컨텐츠 크기에 맞게 조절
                children: <Widget>[
                  Text(
                    '로그인',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: themeColors.color1),
                  ),
                  const SizedBox(height: 25), // 간격 추가
                  TextForm(title: '아이디', controller: _idController),
                  const SizedBox(height: 20), // 간격 추가
                  TextForm(title: '비밀번호', controller: _pwController),

                  const SizedBox(height: 30), // 간격 추가
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeColors.color1, // 버튼 색상
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        '로그인',
                        style: TextStyle(
                          color: themeColors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20), // 간격 추가
                  GestureDetector(
                    onTap: () {
                      // 회원가입 페이지로 이동
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '아직 계정이 없으신가요?',
                          style: TextStyle(
                            fontSize: 13,
                            color: themeColors.color1,
                            fontWeight: FontWeight.w600,
                            // 밑줄
                          ),
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              barrierColor: Colors.transparent,
                              builder: (BuildContext context) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    dialogBackgroundColor:
                                        const Color(0xFFFFFFFF),
                                    dialogTheme:
                                        const DialogTheme(elevation: 0),
                                  ),
                                  child: const SignUpModal(),
                                );
                              },
                            );
                          },
                          child: Text(
                            '여기를 클릭하세요!',
                            style: TextStyle(
                              fontSize: 13,
                              color: themeColors.color2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 10.0), // 텍스트와의 간격을 주기 위해 마진 설정
                          child: Divider(
                            color: themeColors.color1, // 선의 색상
                            height: 1.5, // Divider의 높이를 설정
                          ),
                        ),
                      ),
                      Text(
                        "간편로그인",
                        style: TextStyle(
                          color: themeColors.color1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 10.0), // 텍스트와의 간격을 주기 위해 마진 설정
                          child: Divider(
                            color: themeColors.color1, // 선의 색상

                            height: 1.5, // Divider의 높이를 설정
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('카카오 로그인 들어갈 자리'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
