import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:knitwit/api/models/models.dart';

part 'ratings.g.dart';

@JsonSerializable()
class Ratings extends Equatable {
  const Ratings({
    required this.rating
  });

  final List<Rating> rating;

  factory Ratings.fromJson(Map<String, dynamic> json) => _$RatingsFromJson(json);

  Map<String, dynamic> toJson() => _$RatingsToJson(this);

  @override
  List<Object> get props => [rating];
}