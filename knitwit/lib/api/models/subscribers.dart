import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:knitwit/api/models/models.dart';

part 'subscribers.g.dart';

@JsonSerializable()
class Subscribers extends Equatable {
  const Subscribers({
    required this.subscriber,
    required this.learningProgresses,
    required this.ratings
  });

  final List<Subscriber> subscriber;
  final List<LearningProgresses> learningProgresses;
  final List<Ratings> ratings;


  factory Subscribers.fromJson(Map<String, dynamic> json) => _$SubscribersFromJson(json);

  Map<String, dynamic> toJson() => _$SubscribersToJson(this);

  @override
  List<Object> get props => [subscriber, learningProgresses, ratings];
}