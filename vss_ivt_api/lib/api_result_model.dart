class ApiResultModel {
  dynamic Data;
  bool Success = false;
  dynamic Param;

  ApiResultModel({this.Data, required this.Success, this.Param});

  factory ApiResultModel.fromJson(Map<String, dynamic> json) {
    dynamic data;
    if (json.containsKey('Data')) {
      data = json['Data'];
    } else if (json.containsKey('data')) {
      data = json['data'];
    }
    bool success = false;
    if (json.containsKey('Success')) {
      success = json['Success'] as bool;
    } else if (json.containsKey('success')) {
      success = json['success'] as bool;
    }

    dynamic param;
    if (json.containsKey('Param')) {
      param = json['Param'];
    } else if (json.containsKey('param')) {
      param = json['param'];
    }

    return ApiResultModel(Data: data, Success: success, Param: param);
  }

  String? getMessage() {
    if (Param != null && Param['Messages'] != null) {
      var messages =
          (Param['Messages'] as List).map((e) => e as String).toList();
      return messages.join(', ');
    } else if (Param != null && Param['messages'] != null) {
      var messages =
          (Param['messages'] as List).map((e) => e as String).toList();
      return messages.join(', ');
    }
    return null;
  }

  String? getBugCode() {
    if (Param != null && Param['BugCodes'] != null) {
      var bugs = (Param['BugCodes'] as List).map((e) => e as String).toList();
      return bugs.join(', ');
    }
    return null;
  }
}
