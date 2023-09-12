class CommuneModel {
  CommuneModel({
    this.communeName,
    this.communeCode,
    this.districtCode,
  });

  factory CommuneModel.fromJson(Map<String, dynamic> json) {
    final String? communeName = json['communeName'] as String?;
    final String? communeCode = json['communeCode'] as String?;
    final String? districtCode = json['districtCode'] as String?;

    return CommuneModel(
      communeName: communeName,
      communeCode: communeCode,
      districtCode: districtCode,
    );
  }

  String? communeName;
  String? communeCode;
  String? districtCode;
}
