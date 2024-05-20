import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media_file.g.dart';

@JsonSerializable()
class MediaFile extends Equatable {
  const MediaFile({
    required this.fileId,
    required this.fileKey,
    required this.fileName,
    required this.fileSize,
    required this.fileType,
    required this.createdAt,
  });

  final String fileId;
  final String fileKey;
  final String fileName;
  final String fileSize;
  final String fileType;
  final String createdAt;

  factory MediaFile.fromJson(Map<String, dynamic> json) => _$MediaFileFromJson(json);

  Map<String, dynamic> toJson() => _$MediaFileToJson(this);

  @override
  List<Object> get props => [fileName];
}