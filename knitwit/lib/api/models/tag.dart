import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable()
class Tag extends Equatable {
  const Tag({
    required this.tagId,
    required this.tagName
  });

  final String tagId;
  final String tagName;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);

  @override
  List<Object> get props => [tagName];
}