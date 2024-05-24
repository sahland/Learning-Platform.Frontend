// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subscribers _$SubscribersFromJson(Map<String, dynamic> json) => Subscribers(
      subscriber: (json['subscriber'] as List<dynamic>)
          .map((e) => Subscriber.fromJson(e as Map<String, dynamic>))
          .toList(),
      learningProgresses: (json['learningProgresses'] as List<dynamic>)
          .map((e) => LearningProgresses.fromJson(e as Map<String, dynamic>))
          .toList(),
      ratings: (json['ratings'] as List<dynamic>)
          .map((e) => Ratings.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubscribersToJson(Subscribers instance) =>
    <String, dynamic>{
      'subscriber': instance.subscriber,
      'learningProgresses': instance.learningProgresses,
      'ratings': instance.ratings,
    };
