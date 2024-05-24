import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating.g.dart';

@JsonSerializable()
class Rating extends Equatable {
  const Rating({
    required this.ratingId,
    required this.user,
    required this.course,
    required this.value,
  });

  final int ratingId;
  final String user;
  final String course;
  final int value;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);

  @override
  List<Object> get props => [ratingId, user, course, value];
}