// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaFile _$MediaFileFromJson(Map<String, dynamic> json) => MediaFile(
      fileId: json['fileId'] as String,
      fileKey: json['fileKey'] as String,
      fileName: json['fileName'] as String,
      fileSize: json['fileSize'] as String,
      fileType: json['fileType'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$MediaFileToJson(MediaFile instance) => <String, dynamic>{
      'fileId': instance.fileId,
      'fileKey': instance.fileKey,
      'fileName': instance.fileName,
      'fileSize': instance.fileSize,
      'fileType': instance.fileType,
      'createdAt': instance.createdAt,
    };
