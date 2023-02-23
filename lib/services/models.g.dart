// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String? ?? "",
      pfp_url: json['pfp_url'] as String? ?? "",
  socials: json['socials'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'pfp_url': instance.pfp_url,
      'socials': instance.socials,
    };
