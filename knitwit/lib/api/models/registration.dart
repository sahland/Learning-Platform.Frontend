import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'registration.g.dart';

@JsonSerializable()
class Registration extends Equatable {
  const Registration({
    required this.username,
    required this.password,
    required this.confirmPassword,
    required this.email,
    //required this.courses
  });

  final String username;
  final String password;
  final String confirmPassword;
  final String email;
  //final Courses courses;

  factory Registration.fromJson(Map<String, dynamic> json) => _$RegistrationFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationToJson(this);

  @override
  List<Object> get props => [username, password, confirmPassword, email];
}