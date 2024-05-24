import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:knitwit/api/models/models.dart';

part 'users.g.dart';

@JsonSerializable()
class Users extends Equatable {
  const Users({
    required this.user
  });

  final List<User> user;

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);

  @override
  List<Object> get props => [user];
}