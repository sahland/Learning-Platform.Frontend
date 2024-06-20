import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:knitwit/api/models/models.dart';

part 'tags.g.dart';

@JsonSerializable()
class Tags extends Equatable {
  const Tags({
    required this.tag
  });

  final List<Tag> tag;

  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);

  Map<String, dynamic> toJson() => _$TagsToJson(this);

  @override
  List<Object> get props => [tag];
}