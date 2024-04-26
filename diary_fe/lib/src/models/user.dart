import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int? index;
  final String? id;
  final String? email;
  final String? nickname;

  User({
    this.index = 0,
    this.id = '',
    this.email = '',
    this.nickname = '',
  });

  // Json 직렬화 및 역직렬화를 위한 메서드
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
