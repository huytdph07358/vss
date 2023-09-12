import 'package:json_annotation/json_annotation.dart';
import 'package:vss_date_time_util/date_time_util.dart';

part 'log_model.g.dart';

@JsonSerializable()
class LogModel {
  LogModel();

  factory LogModel.fromJson(Map<String, dynamic> json) =>
      _$LogModelFromJson(json);

  String? Key;
  String? ApplicationCode;
  String? Version;
  String? CustomerCode;
  String? Module;
  String? Screen;
  String? Action;
  DateTime? CreateTime;
  String? User;
  String? DeviceInfo;

  Map<String, dynamic> toJson() => _$LogModelToJson(this);

  // DateTime? getDateTimeCreateTime() {
  //   return DateTimeUtil.parse(CreateTime);
  // }
}
