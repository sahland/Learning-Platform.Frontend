import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable()
class Tag extends Equatable {
  const Tag({
    required this.tagId,
    required this.tagName,
    //required this.courses
  });

  final int tagId;
  final String tagName;
  //final Courses courses;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);

  @override
  List<Object> get props => [tagId, tagName];
}
