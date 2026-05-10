// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Answer _$AnswerFromJson(Map<String, dynamic> json) => _Answer(
  id: json['id'] as String,
  content: json['content'] as String,
  nextQuestion: json['nextQuestion'] as String?,
);

Map<String, dynamic> _$AnswerToJson(_Answer instance) => <String, dynamic>{
  'id': instance.id,
  'content': instance.content,
  'nextQuestion': ?instance.nextQuestion,
};
