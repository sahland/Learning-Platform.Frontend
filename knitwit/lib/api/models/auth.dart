import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable()
class Auth extends Equatable {
  const Auth({
    required this.username,
    required this.password,
    //required this.courses
  });

  final String username;
  final String password;
  //final Courses courses;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);

  @override
  List<Object> get props => [username, password];
}
