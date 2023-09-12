class DistrictModel {
  DistrictModel({
    this.districtName,
    this.districtCode,
    this.provinceCode,
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) {
    final String? districtName = json['districtName'] as String?;
    final String? districtCode = json['districtCode'] as String?;
    final String? provinceCode = json['provinceCode'] as String?;

    return DistrictModel(
      districtName: districtName,
      districtCode: districtCode,
      provinceCode: provinceCode,
    );
  }

  String? districtName;
  String? districtCode;
  String? provinceCode;
}
