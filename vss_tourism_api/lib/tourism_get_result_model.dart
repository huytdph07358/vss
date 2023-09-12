class TourismGetResultModel {
  TourismGetResultModel({this.result, required this.code, required this.meta});

  factory TourismGetResultModel.fromJson(Map<String, dynamic> json) {
    final dynamic result = json.containsKey('result') ? json['result'] : null;
    final int code = json.containsKey('code') ? json['code'] as int : 0;
    final dynamic meta = json.containsKey('meta') ? json['meta'] : null;

    return TourismGetResultModel(result: result, code: code, meta: meta);
  }
  dynamic result;
  int code;
  dynamic meta;
}
