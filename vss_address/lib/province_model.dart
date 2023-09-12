class ProvinceModel {
  ProvinceModel({
    this.provinceName,
    this.provinceCode,
  });

  factory ProvinceModel.fromJson(Map<String, dynamic> json) {
    final String? provinceName = json['provinceName'] as String?;
    final String? provinceCode = json['provinceCode'] as String?;

    return ProvinceModel(
      provinceName: provinceName,
      provinceCode: provinceCode,
    );
  }

  String? provinceName;
  String? provinceCode;
}
