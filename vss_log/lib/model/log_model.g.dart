// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogModel _$LogModelFromJson(Map<String, dynamic> json) => LogModel()
  ..Key = json['Key'] as String?
  ..ApplicationCode = json['ApplicationCode'] as String?
  ..Version = json['Version'] as String?
  ..CustomerCode = json['CustomerCode'] as String?
  ..Module = json['Module'] as String?
  ..Screen = json['Screen'] as String?
  ..Action = json['Action'] as String?
  ..User = json['User'] as String?
  ..DeviceInfo = json['DeviceInfo'] as String?
  ..CreateTime = json['CreateTime'] as DateTime?;

Map<String, dynamic> _$LogModelToJson(LogModel instance) => <String, dynamic>{
      'Key': instance.Key,
      'ApplicationCode': instance.ApplicationCode,
      'Version': instance.Version,
      'CustomerCode': instance.CustomerCode,
      'Module': instance.Module,
      'Screen': instance.Screen,
      'Action': instance.Action,
      'User': instance.User,
      'DeviceInfo': instance.DeviceInfo,
      'CreateTime': instance.CreateTime,
    };
