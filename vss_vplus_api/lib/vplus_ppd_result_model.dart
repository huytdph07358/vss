class VplusPpdResultModel {
  VplusPpdResultModel({required this.success, this.result, this.message});

  factory VplusPpdResultModel.fromJson(Map<String, dynamic> json) {
    final bool success =
        json.containsKey('Success') ? json['Success'] as bool : false;
    final int? result = json['Result'] as int?;
    final String? message = json['Message'] as String?;

    return VplusPpdResultModel(
        success: success, result: result, message: message);
  }

  bool success;
  int? result;
  String? message;
}
