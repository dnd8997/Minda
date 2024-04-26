import 'package:diary_fe/constants.dart';
import 'package:diary_fe/src/services/user_provider.dart';
import 'package:diary_fe/src/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiaryListPage extends StatelessWidget {
  const DiaryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors();
    var user = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColors.color1,
        title: const Text('일기 목록'),
      ),
      body: Stack(children: <Widget>[
        const Background(),
        Center(
          child: Text(
            user.user.nickname ?? '익명의 유저',
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ]),
    );
  }
}
