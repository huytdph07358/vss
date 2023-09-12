import 'province_model.dart';

/// dữ liệu lấy từ tổng cục thống kê ngày 6-5-2023
/// https://www.gso.gov.vn/phuong-phap-luan-thong-ke/danh-muc/don-vi-hanh-chinh/
class Province {
  static final List<ProvinceModel> provinceList = <ProvinceModel>[
    ProvinceModel(provinceCode: '89', provinceName: 'An Giang'),
    ProvinceModel(provinceCode: '77', provinceName: 'Bà Rịa - Vũng Tàu'),
    ProvinceModel(provinceCode: '95', provinceName: 'Bạc Liêu'),
    ProvinceModel(provinceCode: '24', provinceName: 'Bắc Giang'),
    ProvinceModel(provinceCode: '06', provinceName: 'Bắc Kạn'),
    ProvinceModel(provinceCode: '27', provinceName: 'Bắc Ninh'),
    ProvinceModel(provinceCode: '83', provinceName: 'Bến Tre'),
    ProvinceModel(provinceCode: '74', provinceName: 'Bình Dương'),
    ProvinceModel(provinceCode: '52', provinceName: 'Bình Định'),
    ProvinceModel(provinceCode: '70', provinceName: 'Bình Phước'),
    ProvinceModel(provinceCode: '60', provinceName: 'Bình Thuận'),
    ProvinceModel(provinceCode: '96', provinceName: 'Cà Mau'),
    ProvinceModel(provinceCode: '04', provinceName: 'Cao Bằng'),
    ProvinceModel(provinceCode: '92', provinceName: 'Cần Thơ'),
    ProvinceModel(provinceCode: '48', provinceName: 'Đà Nẵng'),
    ProvinceModel(provinceCode: '66', provinceName: 'Đắk Lắk'),
    ProvinceModel(provinceCode: '67', provinceName: 'Đắk Nông'),
    ProvinceModel(provinceCode: '11', provinceName: 'Điện Biên'),
    ProvinceModel(provinceCode: '75', provinceName: 'Đồng Nai'),
    ProvinceModel(provinceCode: '87', provinceName: 'Đồng Tháp'),
    ProvinceModel(provinceCode: '64', provinceName: 'Gia Lai'),
    ProvinceModel(provinceCode: '02', provinceName: 'Hà Giang'),
    ProvinceModel(provinceCode: '35', provinceName: 'Hà Nam'),
    ProvinceModel(provinceCode: '01', provinceName: 'Hà Nội'),
    ProvinceModel(provinceCode: '42', provinceName: 'Hà Tĩnh'),
    ProvinceModel(provinceCode: '30', provinceName: 'Hải Dương'),
    ProvinceModel(provinceCode: '31', provinceName: 'Hải Phòng'),
    ProvinceModel(provinceCode: '93', provinceName: 'Hậu Giang'),
    ProvinceModel(provinceCode: '17', provinceName: 'Hoà Bình'),
    ProvinceModel(provinceCode: '79', provinceName: 'Hồ Chí Minh'),
    ProvinceModel(provinceCode: '33', provinceName: 'Hưng Yên'),
    ProvinceModel(provinceCode: '91', provinceName: 'Kiên Giang'),
    ProvinceModel(provinceCode: '62', provinceName: 'Kon Tum'),
    ProvinceModel(provinceCode: '56', provinceName: 'Khánh Hòa'),
    ProvinceModel(provinceCode: '12', provinceName: 'Lai Châu'),
    ProvinceModel(provinceCode: '20', provinceName: 'Lạng Sơn'),
    ProvinceModel(provinceCode: '10', provinceName: 'Lào Cai'),
    ProvinceModel(provinceCode: '68', provinceName: 'Lâm Đồng'),
    ProvinceModel(provinceCode: '80', provinceName: 'Long An'),
    ProvinceModel(provinceCode: '36', provinceName: 'Nam Định'),
    ProvinceModel(provinceCode: '37', provinceName: 'Ninh Bình'),
    ProvinceModel(provinceCode: '58', provinceName: 'Ninh Thuận'),
    ProvinceModel(provinceCode: '40', provinceName: 'Nghệ An'),
    ProvinceModel(provinceCode: '25', provinceName: 'Phú Thọ'),
    ProvinceModel(provinceCode: '54', provinceName: 'Phú Yên'),
    ProvinceModel(provinceCode: '44', provinceName: 'Quảng Bình'),
    ProvinceModel(provinceCode: '49', provinceName: 'Quảng Nam'),
    ProvinceModel(provinceCode: '22', provinceName: 'Quảng Ninh'),
    ProvinceModel(provinceCode: '51', provinceName: 'Quảng Ngãi'),
    ProvinceModel(provinceCode: '45', provinceName: 'Quảng Trị'),
    ProvinceModel(provinceCode: '94', provinceName: 'Sóc Trăng'),
    ProvinceModel(provinceCode: '14', provinceName: 'Sơn La'),
    ProvinceModel(provinceCode: '72', provinceName: 'Tây Ninh'),
    ProvinceModel(provinceCode: '82', provinceName: 'Tiền Giang'),
    ProvinceModel(provinceCode: '08', provinceName: 'Tuyên Quang'),
    ProvinceModel(provinceCode: '34', provinceName: 'Thái Bình'),
    ProvinceModel(provinceCode: '19', provinceName: 'Thái Nguyên'),
    ProvinceModel(provinceCode: '38', provinceName: 'Thanh Hóa'),
    ProvinceModel(provinceCode: '46', provinceName: 'Thừa Thiên Huế'),
    ProvinceModel(provinceCode: '84', provinceName: 'Trà Vinh'),
    ProvinceModel(provinceCode: '86', provinceName: 'Vĩnh Long'),
    ProvinceModel(provinceCode: '26', provinceName: 'Vĩnh Phúc'),
    ProvinceModel(provinceCode: '15', provinceName: 'Yên Bái'),
  ];

  static ProvinceModel? findProvinceByAddress(String? address) {
    if (address == null || address.isEmpty) {
      return null;
    }
    for (final ProvinceModel province in provinceList) {
      if (address
          .toLowerCase()
          .contains(province.provinceName!.toLowerCase())) {
        return province;
      }
    }
    return null;
  }
}
