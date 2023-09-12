import 'district_model.dart';

/// dữ liệu lấy từ tổng cục thống kê ngày 6-5-2023
/// https://www.gso.gov.vn/phuong-phap-luan-thong-ke/danh-muc/don-vi-hanh-chinh/
class District {
  static final List<DistrictModel> districtList = <DistrictModel>[
    DistrictModel(
        districtCode: '001', districtName: 'Quận Ba Đình', provinceCode: '01'),
    DistrictModel(
        districtCode: '002',
        districtName: 'Quận Hoàn Kiếm',
        provinceCode: '01'),
    DistrictModel(
        districtCode: '003', districtName: 'Quận Tây Hồ', provinceCode: '01'),
    DistrictModel(
        districtCode: '004',
        districtName: 'Quận Long Biên',
        provinceCode: '01'),
    DistrictModel(
        districtCode: '005', districtName: 'Quận Cầu Giấy', provinceCode: '01'),
    DistrictModel(
        districtCode: '006', districtName: 'Quận Đống Đa', provinceCode: '01'),
    DistrictModel(
        districtCode: '007',
        districtName: 'Quận Hai Bà Trưng',
        provinceCode: '01'),
    DistrictModel(
        districtCode: '008',
        districtName: 'Quận Hoàng Mai',
        provinceCode: '01'),
    DistrictModel(
        districtCode: '009',
        districtName: 'Quận Thanh Xuân',
        provinceCode: '01'),
    DistrictModel(
        districtCode: '016', districtName: 'Huyện Sóc Sơn', provinceCode: '01'),
    DistrictModel(
        districtCode: '017',
        districtName: 'Huyện Đông Anh',
        provinceCode: '01'),
    DistrictModel(
        districtCode: '018', districtName: 'Huyện Gia Lâm', provinceCode: '01'),
    DistrictModel(
        districtCode: '019',
        districtName: 'Quận Nam Từ Liêm',
        provinceCode: '01'),
    DistrictModel(
        districtCode: '020',
        districtName: 'Huyện Thanh Trì',
        provinceCode: '01'),
    DistrictModel(
        districtCode: '021',
        districtName: 'Quận Bắc Từ Liêm',
        provinceCode: '01'),
    DistrictModel(
        districtCode: '250', districtName: 'Huyện Mê Linh', provinceCode: '01'),
    DistrictModel(
        districtCode: '268', districtName: 'Quận Hà Đông', provinceCode: '01'),
    DistrictModel(
        districtCode: '269',
        districtName: 'Thị xã Sơn Tây',
        provinceCode: '01'),
    DistrictModel(
        districtCode: '271', districtName: 'Huyện Ba Vì', provinceCode: '01'),
    DistrictModel(
        districtCode: '272',
        districtName: 'Huyện Phúc Thọ',
        provinceCode: '01'),
    DistrictModel(
        districtCode: '273',
        districtName: 'Huyện Đan Phượng',
        provinceCode: '01'),
    DistrictModel(
        districtCode: '274',
        districtName: 'Huyện Hoài Đức',
        provinceCode: '01'),
    DistrictModel(
        districtCode: '275',
        districtName: 'Huyện Quốc Oai',
        provinceCode: '01'),
    DistrictModel(
        districtCode: '276',
        districtName: 'Huyện Thạch Thất',
        provinceCode: '01'),
    DistrictModel(
        districtCode: '277',
        districtName: 'Huyện Chương Mỹ',
        provinceCode: '01'),
    DistrictModel(
        districtCode: '278',
        districtName: 'Huyện Thanh Oai',
        provinceCode: '01'),
    DistrictModel(
        districtCode: '279',
        districtName: 'Huyện Thường Tín',
        provinceCode: '01'),
    DistrictModel(
        districtCode: '280',
        districtName: 'Huyện Phú Xuyên',
        provinceCode: '01'),
    DistrictModel(
        districtCode: '281', districtName: 'Huyện Ứng Hòa', provinceCode: '01'),
    DistrictModel(
        districtCode: '282', districtName: 'Huyện Mỹ Đức', provinceCode: '01'),
    DistrictModel(
        districtCode: '024',
        districtName: 'Thành phố Hà Giang',
        provinceCode: '02'),
    DistrictModel(
        districtCode: '026',
        districtName: 'Huyện Đồng Văn',
        provinceCode: '02'),
    DistrictModel(
        districtCode: '027', districtName: 'Huyện Mèo Vạc', provinceCode: '02'),
    DistrictModel(
        districtCode: '028',
        districtName: 'Huyện Yên Minh',
        provinceCode: '02'),
    DistrictModel(
        districtCode: '029', districtName: 'Huyện Quản Bạ', provinceCode: '02'),
    DistrictModel(
        districtCode: '030',
        districtName: 'Huyện Vị Xuyên',
        provinceCode: '02'),
    DistrictModel(
        districtCode: '031', districtName: 'Huyện Bắc Mê', provinceCode: '02'),
    DistrictModel(
        districtCode: '032',
        districtName: 'Huyện Hoàng Su Phì',
        provinceCode: '02'),
    DistrictModel(
        districtCode: '033', districtName: 'Huyện Xín Mần', provinceCode: '02'),
    DistrictModel(
        districtCode: '034',
        districtName: 'Huyện Bắc Quang',
        provinceCode: '02'),
    DistrictModel(
        districtCode: '035',
        districtName: 'Huyện Quang Bình',
        provinceCode: '02'),
    DistrictModel(
        districtCode: '040',
        districtName: 'Thành phố Cao Bằng',
        provinceCode: '04'),
    DistrictModel(
        districtCode: '042', districtName: 'Huyện Bảo Lâm', provinceCode: '04'),
    DistrictModel(
        districtCode: '043', districtName: 'Huyện Bảo Lạc', provinceCode: '04'),
    DistrictModel(
        districtCode: '045',
        districtName: 'Huyện Hà Quảng',
        provinceCode: '04'),
    DistrictModel(
        districtCode: '047',
        districtName: 'Huyện Trùng Khánh',
        provinceCode: '04'),
    DistrictModel(
        districtCode: '048', districtName: 'Huyện Hạ Lang', provinceCode: '04'),
    DistrictModel(
        districtCode: '049',
        districtName: 'Huyện Quảng Hòa',
        provinceCode: '04'),
    DistrictModel(
        districtCode: '051', districtName: 'Huyện Hoà An', provinceCode: '04'),
    DistrictModel(
        districtCode: '052',
        districtName: 'Huyện Nguyên Bình',
        provinceCode: '04'),
    DistrictModel(
        districtCode: '053',
        districtName: 'Huyện Thạch An',
        provinceCode: '04'),
    DistrictModel(
        districtCode: '058',
        districtName: 'Thành Phố Bắc Kạn',
        provinceCode: '06'),
    DistrictModel(
        districtCode: '060', districtName: 'Huyện Pác Nặm', provinceCode: '06'),
    DistrictModel(
        districtCode: '061', districtName: 'Huyện Ba Bể', provinceCode: '06'),
    DistrictModel(
        districtCode: '062',
        districtName: 'Huyện Ngân Sơn',
        provinceCode: '06'),
    DistrictModel(
        districtCode: '063',
        districtName: 'Huyện Bạch Thông',
        provinceCode: '06'),
    DistrictModel(
        districtCode: '064', districtName: 'Huyện Chợ Đồn', provinceCode: '06'),
    DistrictModel(
        districtCode: '065', districtName: 'Huyện Chợ Mới', provinceCode: '06'),
    DistrictModel(
        districtCode: '066', districtName: 'Huyện Na Rì', provinceCode: '06'),
    DistrictModel(
        districtCode: '070',
        districtName: 'Thành phố Tuyên Quang',
        provinceCode: '08'),
    DistrictModel(
        districtCode: '071',
        districtName: 'Huyện Lâm Bình',
        provinceCode: '08'),
    DistrictModel(
        districtCode: '072', districtName: 'Huyện Na Hang', provinceCode: '08'),
    DistrictModel(
        districtCode: '073',
        districtName: 'Huyện Chiêm Hóa',
        provinceCode: '08'),
    DistrictModel(
        districtCode: '074', districtName: 'Huyện Hàm Yên', provinceCode: '08'),
    DistrictModel(
        districtCode: '075', districtName: 'Huyện Yên Sơn', provinceCode: '08'),
    DistrictModel(
        districtCode: '076',
        districtName: 'Huyện Sơn Dương',
        provinceCode: '08'),
    DistrictModel(
        districtCode: '080',
        districtName: 'Thành phố Lào Cai',
        provinceCode: '10'),
    DistrictModel(
        districtCode: '082', districtName: 'Huyện Bát Xát', provinceCode: '10'),
    DistrictModel(
        districtCode: '083',
        districtName: 'Huyện Mường Khương',
        provinceCode: '10'),
    DistrictModel(
        districtCode: '084',
        districtName: 'Huyện Si Ma Cai',
        provinceCode: '10'),
    DistrictModel(
        districtCode: '085', districtName: 'Huyện Bắc Hà', provinceCode: '10'),
    DistrictModel(
        districtCode: '086',
        districtName: 'Huyện Bảo Thắng',
        provinceCode: '10'),
    DistrictModel(
        districtCode: '087', districtName: 'Huyện Bảo Yên', provinceCode: '10'),
    DistrictModel(
        districtCode: '088', districtName: 'Thị xã Sa Pa', provinceCode: '10'),
    DistrictModel(
        districtCode: '089', districtName: 'Huyện Văn Bàn', provinceCode: '10'),
    DistrictModel(
        districtCode: '094',
        districtName: 'Thành phố Điện Biên Phủ',
        provinceCode: '11'),
    DistrictModel(
        districtCode: '095',
        districtName: 'Thị Xã Mường Lay',
        provinceCode: '11'),
    DistrictModel(
        districtCode: '096',
        districtName: 'Huyện Mường Nhé',
        provinceCode: '11'),
    DistrictModel(
        districtCode: '097',
        districtName: 'Huyện Mường Chà',
        provinceCode: '11'),
    DistrictModel(
        districtCode: '098',
        districtName: 'Huyện Tủa Chùa',
        provinceCode: '11'),
    DistrictModel(
        districtCode: '099',
        districtName: 'Huyện Tuần Giáo',
        provinceCode: '11'),
    DistrictModel(
        districtCode: '100',
        districtName: 'Huyện Điện Biên',
        provinceCode: '11'),
    DistrictModel(
        districtCode: '101',
        districtName: 'Huyện Điện Biên Đông',
        provinceCode: '11'),
    DistrictModel(
        districtCode: '102',
        districtName: 'Huyện Mường Ảng',
        provinceCode: '11'),
    DistrictModel(
        districtCode: '103', districtName: 'Huyện Nậm Pồ', provinceCode: '11'),
    DistrictModel(
        districtCode: '105',
        districtName: 'Thành phố Lai Châu',
        provinceCode: '12'),
    DistrictModel(
        districtCode: '106',
        districtName: 'Huyện Tam Đường',
        provinceCode: '12'),
    DistrictModel(
        districtCode: '107',
        districtName: 'Huyện Mường Tè',
        provinceCode: '12'),
    DistrictModel(
        districtCode: '108', districtName: 'Huyện Sìn Hồ', provinceCode: '12'),
    DistrictModel(
        districtCode: '109',
        districtName: 'Huyện Phong Thổ',
        provinceCode: '12'),
    DistrictModel(
        districtCode: '110',
        districtName: 'Huyện Than Uyên',
        provinceCode: '12'),
    DistrictModel(
        districtCode: '111',
        districtName: 'Huyện Tân Uyên',
        provinceCode: '12'),
    DistrictModel(
        districtCode: '112',
        districtName: 'Huyện Nậm Nhùn',
        provinceCode: '12'),
    DistrictModel(
        districtCode: '116',
        districtName: 'Thành phố Sơn La',
        provinceCode: '14'),
    DistrictModel(
        districtCode: '118',
        districtName: 'Huyện Quỳnh Nhai',
        provinceCode: '14'),
    DistrictModel(
        districtCode: '119',
        districtName: 'Huyện Thuận Châu',
        provinceCode: '14'),
    DistrictModel(
        districtCode: '120',
        districtName: 'Huyện Mường La',
        provinceCode: '14'),
    DistrictModel(
        districtCode: '121', districtName: 'Huyện Bắc Yên', provinceCode: '14'),
    DistrictModel(
        districtCode: '122', districtName: 'Huyện Phù Yên', provinceCode: '14'),
    DistrictModel(
        districtCode: '123',
        districtName: 'Huyện Mộc Châu',
        provinceCode: '14'),
    DistrictModel(
        districtCode: '124',
        districtName: 'Huyện Yên Châu',
        provinceCode: '14'),
    DistrictModel(
        districtCode: '125', districtName: 'Huyện Mai Sơn', provinceCode: '14'),
    DistrictModel(
        districtCode: '126', districtName: 'Huyện Sông Mã', provinceCode: '14'),
    DistrictModel(
        districtCode: '127', districtName: 'Huyện Sốp Cộp', provinceCode: '14'),
    DistrictModel(
        districtCode: '128', districtName: 'Huyện Vân Hồ', provinceCode: '14'),
    DistrictModel(
        districtCode: '132',
        districtName: 'Thành phố Yên Bái',
        provinceCode: '15'),
    DistrictModel(
        districtCode: '133',
        districtName: 'Thị xã Nghĩa Lộ',
        provinceCode: '15'),
    DistrictModel(
        districtCode: '135', districtName: 'Huyện Lục Yên', provinceCode: '15'),
    DistrictModel(
        districtCode: '136', districtName: 'Huyện Văn Yên', provinceCode: '15'),
    DistrictModel(
        districtCode: '137',
        districtName: 'Huyện Mù Căng Chải',
        provinceCode: '15'),
    DistrictModel(
        districtCode: '138',
        districtName: 'Huyện Trấn Yên',
        provinceCode: '15'),
    DistrictModel(
        districtCode: '139',
        districtName: 'Huyện Trạm Tấu',
        provinceCode: '15'),
    DistrictModel(
        districtCode: '140',
        districtName: 'Huyện Văn Chấn',
        provinceCode: '15'),
    DistrictModel(
        districtCode: '141',
        districtName: 'Huyện Yên Bình',
        provinceCode: '15'),
    DistrictModel(
        districtCode: '148',
        districtName: 'Thành phố Hòa Bình',
        provinceCode: '17'),
    DistrictModel(
        districtCode: '150', districtName: 'Huyện Đà Bắc', provinceCode: '17'),
    DistrictModel(
        districtCode: '152',
        districtName: 'Huyện Lương Sơn',
        provinceCode: '17'),
    DistrictModel(
        districtCode: '153', districtName: 'Huyện Kim Bôi', provinceCode: '17'),
    DistrictModel(
        districtCode: '154',
        districtName: 'Huyện Cao Phong',
        provinceCode: '17'),
    DistrictModel(
        districtCode: '155', districtName: 'Huyện Tân Lạc', provinceCode: '17'),
    DistrictModel(
        districtCode: '156',
        districtName: 'Huyện Mai Châu',
        provinceCode: '17'),
    DistrictModel(
        districtCode: '157', districtName: 'Huyện Lạc Sơn', provinceCode: '17'),
    DistrictModel(
        districtCode: '158',
        districtName: 'Huyện Yên Thủy',
        provinceCode: '17'),
    DistrictModel(
        districtCode: '159',
        districtName: 'Huyện Lạc Thủy',
        provinceCode: '17'),
    DistrictModel(
        districtCode: '164',
        districtName: 'Thành phố Thái Nguyên',
        provinceCode: '19'),
    DistrictModel(
        districtCode: '165',
        districtName: 'Thành phố Sông Công',
        provinceCode: '19'),
    DistrictModel(
        districtCode: '167',
        districtName: 'Huyện Định Hóa',
        provinceCode: '19'),
    DistrictModel(
        districtCode: '168',
        districtName: 'Huyện Phú Lương',
        provinceCode: '19'),
    DistrictModel(
        districtCode: '169', districtName: 'Huyện Đồng Hỷ', provinceCode: '19'),
    DistrictModel(
        districtCode: '170', districtName: 'Huyện Võ Nhai', provinceCode: '19'),
    DistrictModel(
        districtCode: '171', districtName: 'Huyện Đại Từ', provinceCode: '19'),
    DistrictModel(
        districtCode: '172',
        districtName: 'Thành phố Phổ Yên',
        provinceCode: '19'),
    DistrictModel(
        districtCode: '173',
        districtName: 'Huyện Phú Bình',
        provinceCode: '19'),
    DistrictModel(
        districtCode: '178',
        districtName: 'Thành phố Lạng Sơn',
        provinceCode: '20'),
    DistrictModel(
        districtCode: '180',
        districtName: 'Huyện Tràng Định',
        provinceCode: '20'),
    DistrictModel(
        districtCode: '181',
        districtName: 'Huyện Bình Gia',
        provinceCode: '20'),
    DistrictModel(
        districtCode: '182',
        districtName: 'Huyện Văn Lãng',
        provinceCode: '20'),
    DistrictModel(
        districtCode: '183', districtName: 'Huyện Cao Lộc', provinceCode: '20'),
    DistrictModel(
        districtCode: '184',
        districtName: 'Huyện Văn Quan',
        provinceCode: '20'),
    DistrictModel(
        districtCode: '185', districtName: 'Huyện Bắc Sơn', provinceCode: '20'),
    DistrictModel(
        districtCode: '186',
        districtName: 'Huyện Hữu Lũng',
        provinceCode: '20'),
    DistrictModel(
        districtCode: '187',
        districtName: 'Huyện Chi Lăng',
        provinceCode: '20'),
    DistrictModel(
        districtCode: '188',
        districtName: 'Huyện Lộc Bình',
        provinceCode: '20'),
    DistrictModel(
        districtCode: '189',
        districtName: 'Huyện Đình Lập',
        provinceCode: '20'),
    DistrictModel(
        districtCode: '193',
        districtName: 'Thành phố Hạ Long',
        provinceCode: '22'),
    DistrictModel(
        districtCode: '194',
        districtName: 'Thành phố Móng Cái',
        provinceCode: '22'),
    DistrictModel(
        districtCode: '195',
        districtName: 'Thành phố Cẩm Phả',
        provinceCode: '22'),
    DistrictModel(
        districtCode: '196',
        districtName: 'Thành phố Uông Bí',
        provinceCode: '22'),
    DistrictModel(
        districtCode: '198',
        districtName: 'Huyện Bình Liêu',
        provinceCode: '22'),
    DistrictModel(
        districtCode: '199',
        districtName: 'Huyện Tiên Yên',
        provinceCode: '22'),
    DistrictModel(
        districtCode: '200', districtName: 'Huyện Đầm Hà', provinceCode: '22'),
    DistrictModel(
        districtCode: '201', districtName: 'Huyện Hải Hà', provinceCode: '22'),
    DistrictModel(
        districtCode: '202', districtName: 'Huyện Ba Chẽ', provinceCode: '22'),
    DistrictModel(
        districtCode: '203', districtName: 'Huyện Vân Đồn', provinceCode: '22'),
    DistrictModel(
        districtCode: '205',
        districtName: 'Thị xã Đông Triều',
        provinceCode: '22'),
    DistrictModel(
        districtCode: '206',
        districtName: 'Thị xã Quảng Yên',
        provinceCode: '22'),
    DistrictModel(
        districtCode: '207', districtName: 'Huyện Cô Tô', provinceCode: '22'),
    DistrictModel(
        districtCode: '213',
        districtName: 'Thành phố Bắc Giang',
        provinceCode: '24'),
    DistrictModel(
        districtCode: '215', districtName: 'Huyện Yên Thế', provinceCode: '24'),
    DistrictModel(
        districtCode: '216', districtName: 'Huyện Tân Yên', provinceCode: '24'),
    DistrictModel(
        districtCode: '217',
        districtName: 'Huyện Lạng Giang',
        provinceCode: '24'),
    DistrictModel(
        districtCode: '218', districtName: 'Huyện Lục Nam', provinceCode: '24'),
    DistrictModel(
        districtCode: '219',
        districtName: 'Huyện Lục Ngạn',
        provinceCode: '24'),
    DistrictModel(
        districtCode: '220',
        districtName: 'Huyện Sơn Động',
        provinceCode: '24'),
    DistrictModel(
        districtCode: '221',
        districtName: 'Huyện Yên Dũng',
        provinceCode: '24'),
    DistrictModel(
        districtCode: '222',
        districtName: 'Huyện Việt Yên',
        provinceCode: '24'),
    DistrictModel(
        districtCode: '223',
        districtName: 'Huyện Hiệp Hòa',
        provinceCode: '24'),
    DistrictModel(
        districtCode: '227',
        districtName: 'Thành phố Việt Trì',
        provinceCode: '25'),
    DistrictModel(
        districtCode: '228',
        districtName: 'Thị xã Phú Thọ',
        provinceCode: '25'),
    DistrictModel(
        districtCode: '230',
        districtName: 'Huyện Đoan Hùng',
        provinceCode: '25'),
    DistrictModel(
        districtCode: '231', districtName: 'Huyện Hạ Hoà', provinceCode: '25'),
    DistrictModel(
        districtCode: '232',
        districtName: 'Huyện Thanh Ba',
        provinceCode: '25'),
    DistrictModel(
        districtCode: '233',
        districtName: 'Huyện Phù Ninh',
        provinceCode: '25'),
    DistrictModel(
        districtCode: '234', districtName: 'Huyện Yên Lập', provinceCode: '25'),
    DistrictModel(
        districtCode: '235', districtName: 'Huyện Cẩm Khê', provinceCode: '25'),
    DistrictModel(
        districtCode: '236',
        districtName: 'Huyện Tam Nông',
        provinceCode: '25'),
    DistrictModel(
        districtCode: '237',
        districtName: 'Huyện Lâm Thao',
        provinceCode: '25'),
    DistrictModel(
        districtCode: '238',
        districtName: 'Huyện Thanh Sơn',
        provinceCode: '25'),
    DistrictModel(
        districtCode: '239',
        districtName: 'Huyện Thanh Thuỷ',
        provinceCode: '25'),
    DistrictModel(
        districtCode: '240', districtName: 'Huyện Tân Sơn', provinceCode: '25'),
    DistrictModel(
        districtCode: '243',
        districtName: 'Thành phố Vĩnh Yên',
        provinceCode: '26'),
    DistrictModel(
        districtCode: '244',
        districtName: 'Thành phố Phúc Yên',
        provinceCode: '26'),
    DistrictModel(
        districtCode: '246',
        districtName: 'Huyện Lập Thạch',
        provinceCode: '26'),
    DistrictModel(
        districtCode: '247',
        districtName: 'Huyện Tam Dương',
        provinceCode: '26'),
    DistrictModel(
        districtCode: '248', districtName: 'Huyện Tam Đảo', provinceCode: '26'),
    DistrictModel(
        districtCode: '249',
        districtName: 'Huyện Bình Xuyên',
        provinceCode: '26'),
    DistrictModel(
        districtCode: '251', districtName: 'Huyện Yên Lạc', provinceCode: '26'),
    DistrictModel(
        districtCode: '252',
        districtName: 'Huyện Vĩnh Tường',
        provinceCode: '26'),
    DistrictModel(
        districtCode: '253', districtName: 'Huyện Sông Lô', provinceCode: '26'),
    DistrictModel(
        districtCode: '256',
        districtName: 'Thành phố Bắc Ninh',
        provinceCode: '27'),
    DistrictModel(
        districtCode: '258',
        districtName: 'Huyện Yên Phong',
        provinceCode: '27'),
    DistrictModel(
        districtCode: '259', districtName: 'Thị xã Quế Võ', provinceCode: '27'),
    DistrictModel(
        districtCode: '260', districtName: 'Huyện Tiên Du', provinceCode: '27'),
    DistrictModel(
        districtCode: '261',
        districtName: 'Thành phố Từ Sơn',
        provinceCode: '27'),
    DistrictModel(
        districtCode: '262',
        districtName: 'Thị xã Thuận Thành',
        provinceCode: '27'),
    DistrictModel(
        districtCode: '263',
        districtName: 'Huyện Gia Bình',
        provinceCode: '27'),
    DistrictModel(
        districtCode: '264',
        districtName: 'Huyện Lương Tài',
        provinceCode: '27'),
    DistrictModel(
        districtCode: '288',
        districtName: 'Thành phố Hải Dương',
        provinceCode: '30'),
    DistrictModel(
        districtCode: '290',
        districtName: 'Thành phố Chí Linh',
        provinceCode: '30'),
    DistrictModel(
        districtCode: '291',
        districtName: 'Huyện Nam Sách',
        provinceCode: '30'),
    DistrictModel(
        districtCode: '292',
        districtName: 'Thị xã Kinh Môn',
        provinceCode: '30'),
    DistrictModel(
        districtCode: '293',
        districtName: 'Huyện Kim Thành',
        provinceCode: '30'),
    DistrictModel(
        districtCode: '294',
        districtName: 'Huyện Thanh Hà',
        provinceCode: '30'),
    DistrictModel(
        districtCode: '295',
        districtName: 'Huyện Cẩm Giàng',
        provinceCode: '30'),
    DistrictModel(
        districtCode: '296',
        districtName: 'Huyện Bình Giang',
        provinceCode: '30'),
    DistrictModel(
        districtCode: '297', districtName: 'Huyện Gia Lộc', provinceCode: '30'),
    DistrictModel(
        districtCode: '298', districtName: 'Huyện Tứ Kỳ', provinceCode: '30'),
    DistrictModel(
        districtCode: '299',
        districtName: 'Huyện Ninh Giang',
        provinceCode: '30'),
    DistrictModel(
        districtCode: '300',
        districtName: 'Huyện Thanh Miện',
        provinceCode: '30'),
    DistrictModel(
        districtCode: '303',
        districtName: 'Quận Hồng Bàng',
        provinceCode: '31'),
    DistrictModel(
        districtCode: '304',
        districtName: 'Quận Ngô Quyền',
        provinceCode: '31'),
    DistrictModel(
        districtCode: '305', districtName: 'Quận Lê Chân', provinceCode: '31'),
    DistrictModel(
        districtCode: '306', districtName: 'Quận Hải An', provinceCode: '31'),
    DistrictModel(
        districtCode: '307', districtName: 'Quận Kiến An', provinceCode: '31'),
    DistrictModel(
        districtCode: '308', districtName: 'Quận Đồ Sơn', provinceCode: '31'),
    DistrictModel(
        districtCode: '309',
        districtName: 'Quận Dương Kinh',
        provinceCode: '31'),
    DistrictModel(
        districtCode: '311',
        districtName: 'Huyện Thuỷ Nguyên',
        provinceCode: '31'),
    DistrictModel(
        districtCode: '312',
        districtName: 'Huyện An Dương',
        provinceCode: '31'),
    DistrictModel(
        districtCode: '313', districtName: 'Huyện An Lão', provinceCode: '31'),
    DistrictModel(
        districtCode: '314',
        districtName: 'Huyện Kiến Thuỵ',
        provinceCode: '31'),
    DistrictModel(
        districtCode: '315',
        districtName: 'Huyện Tiên Lãng',
        provinceCode: '31'),
    DistrictModel(
        districtCode: '316',
        districtName: 'Huyện Vĩnh Bảo',
        provinceCode: '31'),
    DistrictModel(
        districtCode: '317', districtName: 'Huyện Cát Hải', provinceCode: '31'),
    DistrictModel(
        districtCode: '318',
        districtName: 'Huyện Bạch Long Vĩ',
        provinceCode: '31'),
    DistrictModel(
        districtCode: '323',
        districtName: 'Thành phố Hưng Yên',
        provinceCode: '33'),
    DistrictModel(
        districtCode: '325', districtName: 'Huyện Văn Lâm', provinceCode: '33'),
    DistrictModel(
        districtCode: '326',
        districtName: 'Huyện Văn Giang',
        provinceCode: '33'),
    DistrictModel(
        districtCode: '327', districtName: 'Huyện Yên Mỹ', provinceCode: '33'),
    DistrictModel(
        districtCode: '328', districtName: 'Thị xã Mỹ Hào', provinceCode: '33'),
    DistrictModel(
        districtCode: '329', districtName: 'Huyện Ân Thi', provinceCode: '33'),
    DistrictModel(
        districtCode: '330',
        districtName: 'Huyện Khoái Châu',
        provinceCode: '33'),
    DistrictModel(
        districtCode: '331',
        districtName: 'Huyện Kim Động',
        provinceCode: '33'),
    DistrictModel(
        districtCode: '332', districtName: 'Huyện Tiên Lữ', provinceCode: '33'),
    DistrictModel(
        districtCode: '333', districtName: 'Huyện Phù Cừ', provinceCode: '33'),
    DistrictModel(
        districtCode: '336',
        districtName: 'Thành phố Thái Bình',
        provinceCode: '34'),
    DistrictModel(
        districtCode: '338',
        districtName: 'Huyện Quỳnh Phụ',
        provinceCode: '34'),
    DistrictModel(
        districtCode: '339', districtName: 'Huyện Hưng Hà', provinceCode: '34'),
    DistrictModel(
        districtCode: '340',
        districtName: 'Huyện Đông Hưng',
        provinceCode: '34'),
    DistrictModel(
        districtCode: '341',
        districtName: 'Huyện Thái Thụy',
        provinceCode: '34'),
    DistrictModel(
        districtCode: '342',
        districtName: 'Huyện Tiền Hải',
        provinceCode: '34'),
    DistrictModel(
        districtCode: '343',
        districtName: 'Huyện Kiến Xương',
        provinceCode: '34'),
    DistrictModel(
        districtCode: '344', districtName: 'Huyện Vũ Thư', provinceCode: '34'),
    DistrictModel(
        districtCode: '347',
        districtName: 'Thành phố Phủ Lý',
        provinceCode: '35'),
    DistrictModel(
        districtCode: '349',
        districtName: 'Thị xã Duy Tiên',
        provinceCode: '35'),
    DistrictModel(
        districtCode: '350',
        districtName: 'Huyện Kim Bảng',
        provinceCode: '35'),
    DistrictModel(
        districtCode: '351',
        districtName: 'Huyện Thanh Liêm',
        provinceCode: '35'),
    DistrictModel(
        districtCode: '352',
        districtName: 'Huyện Bình Lục',
        provinceCode: '35'),
    DistrictModel(
        districtCode: '353', districtName: 'Huyện Lý Nhân', provinceCode: '35'),
    DistrictModel(
        districtCode: '356',
        districtName: 'Thành phố Nam Định',
        provinceCode: '36'),
    DistrictModel(
        districtCode: '358', districtName: 'Huyện Mỹ Lộc', provinceCode: '36'),
    DistrictModel(
        districtCode: '359', districtName: 'Huyện Vụ Bản', provinceCode: '36'),
    DistrictModel(
        districtCode: '360', districtName: 'Huyện Ý Yên', provinceCode: '36'),
    DistrictModel(
        districtCode: '361',
        districtName: 'Huyện Nghĩa Hưng',
        provinceCode: '36'),
    DistrictModel(
        districtCode: '362',
        districtName: 'Huyện Nam Trực',
        provinceCode: '36'),
    DistrictModel(
        districtCode: '363',
        districtName: 'Huyện Trực Ninh',
        provinceCode: '36'),
    DistrictModel(
        districtCode: '364',
        districtName: 'Huyện Xuân Trường',
        provinceCode: '36'),
    DistrictModel(
        districtCode: '365',
        districtName: 'Huyện Giao Thủy',
        provinceCode: '36'),
    DistrictModel(
        districtCode: '366', districtName: 'Huyện Hải Hậu', provinceCode: '36'),
    DistrictModel(
        districtCode: '369',
        districtName: 'Thành phố Ninh Bình',
        provinceCode: '37'),
    DistrictModel(
        districtCode: '370',
        districtName: 'Thành phố Tam Điệp',
        provinceCode: '37'),
    DistrictModel(
        districtCode: '372',
        districtName: 'Huyện Nho Quan',
        provinceCode: '37'),
    DistrictModel(
        districtCode: '373',
        districtName: 'Huyện Gia Viễn',
        provinceCode: '37'),
    DistrictModel(
        districtCode: '374', districtName: 'Huyện Hoa Lư', provinceCode: '37'),
    DistrictModel(
        districtCode: '375',
        districtName: 'Huyện Yên Khánh',
        provinceCode: '37'),
    DistrictModel(
        districtCode: '376', districtName: 'Huyện Kim Sơn', provinceCode: '37'),
    DistrictModel(
        districtCode: '377', districtName: 'Huyện Yên Mô', provinceCode: '37'),
    DistrictModel(
        districtCode: '380',
        districtName: 'Thành phố Thanh Hóa',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '381',
        districtName: 'Thị xã Bỉm Sơn',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '382',
        districtName: 'Thành phố Sầm Sơn',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '384',
        districtName: 'Huyện Mường Lát',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '385',
        districtName: 'Huyện Quan Hóa',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '386',
        districtName: 'Huyện Bá Thước',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '387',
        districtName: 'Huyện Quan Sơn',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '388',
        districtName: 'Huyện Lang Chánh',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '389',
        districtName: 'Huyện Ngọc Lặc',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '390',
        districtName: 'Huyện Cẩm Thủy',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '391',
        districtName: 'Huyện Thạch Thành',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '392',
        districtName: 'Huyện Hà Trung',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '393',
        districtName: 'Huyện Vĩnh Lộc',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '394',
        districtName: 'Huyện Yên Định',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '395',
        districtName: 'Huyện Thọ Xuân',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '396',
        districtName: 'Huyện Thường Xuân',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '397',
        districtName: 'Huyện Triệu Sơn',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '398',
        districtName: 'Huyện Thiệu Hóa',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '399',
        districtName: 'Huyện Hoằng Hóa',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '400', districtName: 'Huyện Hậu Lộc', provinceCode: '38'),
    DistrictModel(
        districtCode: '401', districtName: 'Huyện Nga Sơn', provinceCode: '38'),
    DistrictModel(
        districtCode: '402',
        districtName: 'Huyện Như Xuân',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '403',
        districtName: 'Huyện Như Thanh',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '404',
        districtName: 'Huyện Nông Cống',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '405',
        districtName: 'Huyện Đông Sơn',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '406',
        districtName: 'Huyện Quảng Xương',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '407',
        districtName: 'Thị xã Nghi Sơn',
        provinceCode: '38'),
    DistrictModel(
        districtCode: '412',
        districtName: 'Thành phố Vinh',
        provinceCode: '40'),
    DistrictModel(
        districtCode: '413', districtName: 'Thị xã Cửa Lò', provinceCode: '40'),
    DistrictModel(
        districtCode: '414',
        districtName: 'Thị xã Thái Hoà',
        provinceCode: '40'),
    DistrictModel(
        districtCode: '415',
        districtName: 'Huyện Quế Phong',
        provinceCode: '40'),
    DistrictModel(
        districtCode: '416',
        districtName: 'Huyện Quỳ Châu',
        provinceCode: '40'),
    DistrictModel(
        districtCode: '417', districtName: 'Huyện Kỳ Sơn', provinceCode: '40'),
    DistrictModel(
        districtCode: '418',
        districtName: 'Huyện Tương Dương',
        provinceCode: '40'),
    DistrictModel(
        districtCode: '419',
        districtName: 'Huyện Nghĩa Đàn',
        provinceCode: '40'),
    DistrictModel(
        districtCode: '420', districtName: 'Huyện Quỳ Hợp', provinceCode: '40'),
    DistrictModel(
        districtCode: '421',
        districtName: 'Huyện Quỳnh Lưu',
        provinceCode: '40'),
    DistrictModel(
        districtCode: '422',
        districtName: 'Huyện Con Cuông',
        provinceCode: '40'),
    DistrictModel(
        districtCode: '423', districtName: 'Huyện Tân Kỳ', provinceCode: '40'),
    DistrictModel(
        districtCode: '424', districtName: 'Huyện Anh Sơn', provinceCode: '40'),
    DistrictModel(
        districtCode: '425',
        districtName: 'Huyện Diễn Châu',
        provinceCode: '40'),
    DistrictModel(
        districtCode: '426',
        districtName: 'Huyện Yên Thành',
        provinceCode: '40'),
    DistrictModel(
        districtCode: '427',
        districtName: 'Huyện Đô Lương',
        provinceCode: '40'),
    DistrictModel(
        districtCode: '428',
        districtName: 'Huyện Thanh Chương',
        provinceCode: '40'),
    DistrictModel(
        districtCode: '429',
        districtName: 'Huyện Nghi Lộc',
        provinceCode: '40'),
    DistrictModel(
        districtCode: '430', districtName: 'Huyện Nam Đàn', provinceCode: '40'),
    DistrictModel(
        districtCode: '431',
        districtName: 'Huyện Hưng Nguyên',
        provinceCode: '40'),
    DistrictModel(
        districtCode: '432',
        districtName: 'Thị xã Hoàng Mai',
        provinceCode: '40'),
    DistrictModel(
        districtCode: '436',
        districtName: 'Thành phố Hà Tĩnh',
        provinceCode: '42'),
    DistrictModel(
        districtCode: '437',
        districtName: 'Thị xã Hồng Lĩnh',
        provinceCode: '42'),
    DistrictModel(
        districtCode: '439',
        districtName: 'Huyện Hương Sơn',
        provinceCode: '42'),
    DistrictModel(
        districtCode: '440', districtName: 'Huyện Đức Thọ', provinceCode: '42'),
    DistrictModel(
        districtCode: '441',
        districtName: 'Huyện Vũ Quang',
        provinceCode: '42'),
    DistrictModel(
        districtCode: '442',
        districtName: 'Huyện Nghi Xuân',
        provinceCode: '42'),
    DistrictModel(
        districtCode: '443', districtName: 'Huyện Can Lộc', provinceCode: '42'),
    DistrictModel(
        districtCode: '444',
        districtName: 'Huyện Hương Khê',
        provinceCode: '42'),
    DistrictModel(
        districtCode: '445',
        districtName: 'Huyện Thạch Hà',
        provinceCode: '42'),
    DistrictModel(
        districtCode: '446',
        districtName: 'Huyện Cẩm Xuyên',
        provinceCode: '42'),
    DistrictModel(
        districtCode: '447', districtName: 'Huyện Kỳ Anh', provinceCode: '42'),
    DistrictModel(
        districtCode: '448', districtName: 'Huyện Lộc Hà', provinceCode: '42'),
    DistrictModel(
        districtCode: '449', districtName: 'Thị xã Kỳ Anh', provinceCode: '42'),
    DistrictModel(
        districtCode: '450',
        districtName: 'Thành Phố Đồng Hới',
        provinceCode: '44'),
    DistrictModel(
        districtCode: '452',
        districtName: 'Huyện Minh Hóa',
        provinceCode: '44'),
    DistrictModel(
        districtCode: '453',
        districtName: 'Huyện Tuyên Hóa',
        provinceCode: '44'),
    DistrictModel(
        districtCode: '454',
        districtName: 'Huyện Quảng Trạch',
        provinceCode: '44'),
    DistrictModel(
        districtCode: '455',
        districtName: 'Huyện Bố Trạch',
        provinceCode: '44'),
    DistrictModel(
        districtCode: '456',
        districtName: 'Huyện Quảng Ninh',
        provinceCode: '44'),
    DistrictModel(
        districtCode: '457', districtName: 'Huyện Lệ Thủy', provinceCode: '44'),
    DistrictModel(
        districtCode: '458', districtName: 'Thị xã Ba Đồn', provinceCode: '44'),
    DistrictModel(
        districtCode: '461',
        districtName: 'Thành phố Đông Hà',
        provinceCode: '45'),
    DistrictModel(
        districtCode: '462',
        districtName: 'Thị xã Quảng Trị',
        provinceCode: '45'),
    DistrictModel(
        districtCode: '464',
        districtName: 'Huyện Vĩnh Linh',
        provinceCode: '45'),
    DistrictModel(
        districtCode: '465',
        districtName: 'Huyện Hướng Hóa',
        provinceCode: '45'),
    DistrictModel(
        districtCode: '466',
        districtName: 'Huyện Gio Linh',
        provinceCode: '45'),
    DistrictModel(
        districtCode: '467',
        districtName: 'Huyện Đa Krông',
        provinceCode: '45'),
    DistrictModel(
        districtCode: '468', districtName: 'Huyện Cam Lộ', provinceCode: '45'),
    DistrictModel(
        districtCode: '469',
        districtName: 'Huyện Triệu Phong',
        provinceCode: '45'),
    DistrictModel(
        districtCode: '470',
        districtName: 'Huyện Hải Lăng',
        provinceCode: '45'),
    DistrictModel(
        districtCode: '471', districtName: 'Huyện Cồn Cỏ', provinceCode: '45'),
    DistrictModel(
        districtCode: '474', districtName: 'Thành phố Huế', provinceCode: '46'),
    DistrictModel(
        districtCode: '476',
        districtName: 'Huyện Phong Điền',
        provinceCode: '46'),
    DistrictModel(
        districtCode: '477',
        districtName: 'Huyện Quảng Điền',
        provinceCode: '46'),
    DistrictModel(
        districtCode: '478',
        districtName: 'Huyện Phú Vang',
        provinceCode: '46'),
    DistrictModel(
        districtCode: '479',
        districtName: 'Thị xã Hương Thủy',
        provinceCode: '46'),
    DistrictModel(
        districtCode: '480',
        districtName: 'Thị xã Hương Trà',
        provinceCode: '46'),
    DistrictModel(
        districtCode: '481', districtName: 'Huyện A Lưới', provinceCode: '46'),
    DistrictModel(
        districtCode: '482', districtName: 'Huyện Phú Lộc', provinceCode: '46'),
    DistrictModel(
        districtCode: '483',
        districtName: 'Huyện Nam Đông',
        provinceCode: '46'),
    DistrictModel(
        districtCode: '490',
        districtName: 'Quận Liên Chiểu',
        provinceCode: '48'),
    DistrictModel(
        districtCode: '491',
        districtName: 'Quận Thanh Khê',
        provinceCode: '48'),
    DistrictModel(
        districtCode: '492', districtName: 'Quận Hải Châu', provinceCode: '48'),
    DistrictModel(
        districtCode: '493', districtName: 'Quận Sơn Trà', provinceCode: '48'),
    DistrictModel(
        districtCode: '494',
        districtName: 'Quận Ngũ Hành Sơn',
        provinceCode: '48'),
    DistrictModel(
        districtCode: '495', districtName: 'Quận Cẩm Lệ', provinceCode: '48'),
    DistrictModel(
        districtCode: '497',
        districtName: 'Huyện Hòa Vang',
        provinceCode: '48'),
    DistrictModel(
        districtCode: '498',
        districtName: 'Huyện Hoàng Sa',
        provinceCode: '48'),
    DistrictModel(
        districtCode: '502',
        districtName: 'Thành phố Tam Kỳ',
        provinceCode: '49'),
    DistrictModel(
        districtCode: '503',
        districtName: 'Thành phố Hội An',
        provinceCode: '49'),
    DistrictModel(
        districtCode: '504',
        districtName: 'Huyện Tây Giang',
        provinceCode: '49'),
    DistrictModel(
        districtCode: '505',
        districtName: 'Huyện Đông Giang',
        provinceCode: '49'),
    DistrictModel(
        districtCode: '506', districtName: 'Huyện Đại Lộc', provinceCode: '49'),
    DistrictModel(
        districtCode: '507',
        districtName: 'Thị xã Điện Bàn',
        provinceCode: '49'),
    DistrictModel(
        districtCode: '508',
        districtName: 'Huyện Duy Xuyên',
        provinceCode: '49'),
    DistrictModel(
        districtCode: '509', districtName: 'Huyện Quế Sơn', provinceCode: '49'),
    DistrictModel(
        districtCode: '510',
        districtName: 'Huyện Nam Giang',
        provinceCode: '49'),
    DistrictModel(
        districtCode: '511',
        districtName: 'Huyện Phước Sơn',
        provinceCode: '49'),
    DistrictModel(
        districtCode: '512',
        districtName: 'Huyện Hiệp Đức',
        provinceCode: '49'),
    DistrictModel(
        districtCode: '513',
        districtName: 'Huyện Thăng Bình',
        provinceCode: '49'),
    DistrictModel(
        districtCode: '514',
        districtName: 'Huyện Tiên Phước',
        provinceCode: '49'),
    DistrictModel(
        districtCode: '515',
        districtName: 'Huyện Bắc Trà My',
        provinceCode: '49'),
    DistrictModel(
        districtCode: '516',
        districtName: 'Huyện Nam Trà My',
        provinceCode: '49'),
    DistrictModel(
        districtCode: '517',
        districtName: 'Huyện Núi Thành',
        provinceCode: '49'),
    DistrictModel(
        districtCode: '518',
        districtName: 'Huyện Phú Ninh',
        provinceCode: '49'),
    DistrictModel(
        districtCode: '519',
        districtName: 'Huyện Nông Sơn',
        provinceCode: '49'),
    DistrictModel(
        districtCode: '522',
        districtName: 'Thành phố Quảng Ngãi',
        provinceCode: '51'),
    DistrictModel(
        districtCode: '524',
        districtName: 'Huyện Bình Sơn',
        provinceCode: '51'),
    DistrictModel(
        districtCode: '525',
        districtName: 'Huyện Trà Bồng',
        provinceCode: '51'),
    DistrictModel(
        districtCode: '527',
        districtName: 'Huyện Sơn Tịnh',
        provinceCode: '51'),
    DistrictModel(
        districtCode: '528',
        districtName: 'Huyện Tư Nghĩa',
        provinceCode: '51'),
    DistrictModel(
        districtCode: '529', districtName: 'Huyện Sơn Hà', provinceCode: '51'),
    DistrictModel(
        districtCode: '530', districtName: 'Huyện Sơn Tây', provinceCode: '51'),
    DistrictModel(
        districtCode: '531',
        districtName: 'Huyện Minh Long',
        provinceCode: '51'),
    DistrictModel(
        districtCode: '532',
        districtName: 'Huyện Nghĩa Hành',
        provinceCode: '51'),
    DistrictModel(
        districtCode: '533', districtName: 'Huyện Mộ Đức', provinceCode: '51'),
    DistrictModel(
        districtCode: '534',
        districtName: 'Thị xã Đức Phổ',
        provinceCode: '51'),
    DistrictModel(
        districtCode: '535', districtName: 'Huyện Ba Tơ', provinceCode: '51'),
    DistrictModel(
        districtCode: '536', districtName: 'Huyện Lý Sơn', provinceCode: '51'),
    DistrictModel(
        districtCode: '540',
        districtName: 'Thành phố Quy Nhơn',
        provinceCode: '52'),
    DistrictModel(
        districtCode: '542', districtName: 'Huyện An Lão', provinceCode: '52'),
    DistrictModel(
        districtCode: '543',
        districtName: 'Thị xã Hoài Nhơn',
        provinceCode: '52'),
    DistrictModel(
        districtCode: '544', districtName: 'Huyện Hoài Ân', provinceCode: '52'),
    DistrictModel(
        districtCode: '545', districtName: 'Huyện Phù Mỹ', provinceCode: '52'),
    DistrictModel(
        districtCode: '546',
        districtName: 'Huyện Vĩnh Thạnh',
        provinceCode: '52'),
    DistrictModel(
        districtCode: '547', districtName: 'Huyện Tây Sơn', provinceCode: '52'),
    DistrictModel(
        districtCode: '548', districtName: 'Huyện Phù Cát', provinceCode: '52'),
    DistrictModel(
        districtCode: '549',
        districtName: 'Thị xã An Nhơn',
        provinceCode: '52'),
    DistrictModel(
        districtCode: '550',
        districtName: 'Huyện Tuy Phước',
        provinceCode: '52'),
    DistrictModel(
        districtCode: '551',
        districtName: 'Huyện Vân Canh',
        provinceCode: '52'),
    DistrictModel(
        districtCode: '555',
        districtName: 'Thành phố Tuy Hoà',
        provinceCode: '54'),
    DistrictModel(
        districtCode: '557',
        districtName: 'Thị xã Sông Cầu',
        provinceCode: '54'),
    DistrictModel(
        districtCode: '558',
        districtName: 'Huyện Đồng Xuân',
        provinceCode: '54'),
    DistrictModel(
        districtCode: '559', districtName: 'Huyện Tuy An', provinceCode: '54'),
    DistrictModel(
        districtCode: '560', districtName: 'Huyện Sơn Hòa', provinceCode: '54'),
    DistrictModel(
        districtCode: '561',
        districtName: 'Huyện Sông Hinh',
        provinceCode: '54'),
    DistrictModel(
        districtCode: '562', districtName: 'Huyện Tây Hoà', provinceCode: '54'),
    DistrictModel(
        districtCode: '563', districtName: 'Huyện Phú Hoà', provinceCode: '54'),
    DistrictModel(
        districtCode: '564',
        districtName: 'Thị xã Đông Hòa',
        provinceCode: '54'),
    DistrictModel(
        districtCode: '568',
        districtName: 'Thành phố Nha Trang',
        provinceCode: '56'),
    DistrictModel(
        districtCode: '569',
        districtName: 'Thành phố Cam Ranh',
        provinceCode: '56'),
    DistrictModel(
        districtCode: '570', districtName: 'Huyện Cam Lâm', provinceCode: '56'),
    DistrictModel(
        districtCode: '571',
        districtName: 'Huyện Vạn Ninh',
        provinceCode: '56'),
    DistrictModel(
        districtCode: '572',
        districtName: 'Thị xã Ninh Hòa',
        provinceCode: '56'),
    DistrictModel(
        districtCode: '573',
        districtName: 'Huyện Khánh Vĩnh',
        provinceCode: '56'),
    DistrictModel(
        districtCode: '574',
        districtName: 'Huyện Diên Khánh',
        provinceCode: '56'),
    DistrictModel(
        districtCode: '575',
        districtName: 'Huyện Khánh Sơn',
        provinceCode: '56'),
    DistrictModel(
        districtCode: '576',
        districtName: 'Huyện Trường Sa',
        provinceCode: '56'),
    DistrictModel(
        districtCode: '582',
        districtName: 'Thành phố Phan Rang-Tháp Chàm',
        provinceCode: '58'),
    DistrictModel(
        districtCode: '584', districtName: 'Huyện Bác Ái', provinceCode: '58'),
    DistrictModel(
        districtCode: '585',
        districtName: 'Huyện Ninh Sơn',
        provinceCode: '58'),
    DistrictModel(
        districtCode: '586',
        districtName: 'Huyện Ninh Hải',
        provinceCode: '58'),
    DistrictModel(
        districtCode: '587',
        districtName: 'Huyện Ninh Phước',
        provinceCode: '58'),
    DistrictModel(
        districtCode: '588',
        districtName: 'Huyện Thuận Bắc',
        provinceCode: '58'),
    DistrictModel(
        districtCode: '589',
        districtName: 'Huyện Thuận Nam',
        provinceCode: '58'),
    DistrictModel(
        districtCode: '593',
        districtName: 'Thành phố Phan Thiết',
        provinceCode: '60'),
    DistrictModel(
        districtCode: '594', districtName: 'Thị xã La Gi', provinceCode: '60'),
    DistrictModel(
        districtCode: '595',
        districtName: 'Huyện Tuy Phong',
        provinceCode: '60'),
    DistrictModel(
        districtCode: '596',
        districtName: 'Huyện Bắc Bình',
        provinceCode: '60'),
    DistrictModel(
        districtCode: '597',
        districtName: 'Huyện Hàm Thuận Bắc',
        provinceCode: '60'),
    DistrictModel(
        districtCode: '598',
        districtName: 'Huyện Hàm Thuận Nam',
        provinceCode: '60'),
    DistrictModel(
        districtCode: '599',
        districtName: 'Huyện Tánh Linh',
        provinceCode: '60'),
    DistrictModel(
        districtCode: '600',
        districtName: 'Huyện Đức Linh',
        provinceCode: '60'),
    DistrictModel(
        districtCode: '601', districtName: 'Huyện Hàm Tân', provinceCode: '60'),
    DistrictModel(
        districtCode: '602', districtName: 'Huyện Phú Quí', provinceCode: '60'),
    DistrictModel(
        districtCode: '608',
        districtName: 'Thành phố Kon Tum',
        provinceCode: '62'),
    DistrictModel(
        districtCode: '610',
        districtName: 'Huyện Đắk Glei',
        provinceCode: '62'),
    DistrictModel(
        districtCode: '611',
        districtName: 'Huyện Ngọc Hồi',
        provinceCode: '62'),
    DistrictModel(
        districtCode: '612', districtName: 'Huyện Đắk Tô', provinceCode: '62'),
    DistrictModel(
        districtCode: '613',
        districtName: 'Huyện Kon Plông',
        provinceCode: '62'),
    DistrictModel(
        districtCode: '614', districtName: 'Huyện Kon Rẫy', provinceCode: '62'),
    DistrictModel(
        districtCode: '615', districtName: 'Huyện Đắk Hà', provinceCode: '62'),
    DistrictModel(
        districtCode: '616', districtName: 'Huyện Sa Thầy', provinceCode: '62'),
    DistrictModel(
        districtCode: '617',
        districtName: 'Huyện Tu Mơ Rông',
        provinceCode: '62'),
    DistrictModel(
        districtCode: '618',
        districtName: 'Huyện Ia H\' Drai',
        provinceCode: '62'),
    DistrictModel(
        districtCode: '622',
        districtName: 'Thành phố Pleiku',
        provinceCode: '64'),
    DistrictModel(
        districtCode: '623', districtName: 'Thị xã An Khê', provinceCode: '64'),
    DistrictModel(
        districtCode: '624',
        districtName: 'Thị xã Ayun Pa',
        provinceCode: '64'),
    DistrictModel(
        districtCode: '625', districtName: 'Huyện KBang', provinceCode: '64'),
    DistrictModel(
        districtCode: '626', districtName: 'Huyện Đăk Đoa', provinceCode: '64'),
    DistrictModel(
        districtCode: '627', districtName: 'Huyện Chư Păh', provinceCode: '64'),
    DistrictModel(
        districtCode: '628', districtName: 'Huyện Ia Grai', provinceCode: '64'),
    DistrictModel(
        districtCode: '629',
        districtName: 'Huyện Mang Yang',
        provinceCode: '64'),
    DistrictModel(
        districtCode: '630',
        districtName: 'Huyện Kông Chro',
        provinceCode: '64'),
    DistrictModel(
        districtCode: '631', districtName: 'Huyện Đức Cơ', provinceCode: '64'),
    DistrictModel(
        districtCode: '632',
        districtName: 'Huyện Chư Prông',
        provinceCode: '64'),
    DistrictModel(
        districtCode: '633', districtName: 'Huyện Chư Sê', provinceCode: '64'),
    DistrictModel(
        districtCode: '634', districtName: 'Huyện Đăk Pơ', provinceCode: '64'),
    DistrictModel(
        districtCode: '635', districtName: 'Huyện Ia Pa', provinceCode: '64'),
    DistrictModel(
        districtCode: '637',
        districtName: 'Huyện Krông Pa',
        provinceCode: '64'),
    DistrictModel(
        districtCode: '638',
        districtName: 'Huyện Phú Thiện',
        provinceCode: '64'),
    DistrictModel(
        districtCode: '639', districtName: 'Huyện Chư Pưh', provinceCode: '64'),
    DistrictModel(
        districtCode: '643',
        districtName: 'Thành phố Buôn Ma Thuột',
        provinceCode: '66'),
    DistrictModel(
        districtCode: '644',
        districtName: 'Thị Xã Buôn Hồ',
        provinceCode: '66'),
    DistrictModel(
        districtCode: '645',
        districtName: 'Huyện Ea H\'leo',
        provinceCode: '66'),
    DistrictModel(
        districtCode: '646', districtName: 'Huyện Ea Súp', provinceCode: '66'),
    DistrictModel(
        districtCode: '647',
        districtName: 'Huyện Buôn Đôn',
        provinceCode: '66'),
    DistrictModel(
        districtCode: '648',
        districtName: 'Huyện Cư M\'gar',
        provinceCode: '66'),
    DistrictModel(
        districtCode: '649',
        districtName: 'Huyện Krông Búk',
        provinceCode: '66'),
    DistrictModel(
        districtCode: '650',
        districtName: 'Huyện Krông Năng',
        provinceCode: '66'),
    DistrictModel(
        districtCode: '651', districtName: 'Huyện Ea Kar', provinceCode: '66'),
    DistrictModel(
        districtCode: '652', districtName: 'Huyện M\'Đrắk', provinceCode: '66'),
    DistrictModel(
        districtCode: '653',
        districtName: 'Huyện Krông Bông',
        provinceCode: '66'),
    DistrictModel(
        districtCode: '654',
        districtName: 'Huyện Krông Pắc',
        provinceCode: '66'),
    DistrictModel(
        districtCode: '655',
        districtName: 'Huyện Krông A Na',
        provinceCode: '66'),
    DistrictModel(
        districtCode: '656', districtName: 'Huyện Lắk', provinceCode: '66'),
    DistrictModel(
        districtCode: '657', districtName: 'Huyện Cư Kuin', provinceCode: '66'),
    DistrictModel(
        districtCode: '660',
        districtName: 'Thành phố Gia Nghĩa',
        provinceCode: '67'),
    DistrictModel(
        districtCode: '661',
        districtName: 'Huyện Đăk Glong',
        provinceCode: '67'),
    DistrictModel(
        districtCode: '662', districtName: 'Huyện Cư Jút', provinceCode: '67'),
    DistrictModel(
        districtCode: '663', districtName: 'Huyện Đắk Mil', provinceCode: '67'),
    DistrictModel(
        districtCode: '664',
        districtName: 'Huyện Krông Nô',
        provinceCode: '67'),
    DistrictModel(
        districtCode: '665',
        districtName: 'Huyện Đắk Song',
        provinceCode: '67'),
    DistrictModel(
        districtCode: '666',
        districtName: 'Huyện Đắk R\'Lấp',
        provinceCode: '67'),
    DistrictModel(
        districtCode: '667', districtName: 'Huyện Tuy Đức', provinceCode: '67'),
    DistrictModel(
        districtCode: '672',
        districtName: 'Thành phố Đà Lạt',
        provinceCode: '68'),
    DistrictModel(
        districtCode: '673',
        districtName: 'Thành phố Bảo Lộc',
        provinceCode: '68'),
    DistrictModel(
        districtCode: '674',
        districtName: 'Huyện Đam Rông',
        provinceCode: '68'),
    DistrictModel(
        districtCode: '675',
        districtName: 'Huyện Lạc Dương',
        provinceCode: '68'),
    DistrictModel(
        districtCode: '676', districtName: 'Huyện Lâm Hà', provinceCode: '68'),
    DistrictModel(
        districtCode: '677',
        districtName: 'Huyện Đơn Dương',
        provinceCode: '68'),
    DistrictModel(
        districtCode: '678',
        districtName: 'Huyện Đức Trọng',
        provinceCode: '68'),
    DistrictModel(
        districtCode: '679', districtName: 'Huyện Di Linh', provinceCode: '68'),
    DistrictModel(
        districtCode: '680', districtName: 'Huyện Bảo Lâm', provinceCode: '68'),
    DistrictModel(
        districtCode: '681',
        districtName: 'Huyện Đạ Huoai',
        provinceCode: '68'),
    DistrictModel(
        districtCode: '682', districtName: 'Huyện Đạ Tẻh', provinceCode: '68'),
    DistrictModel(
        districtCode: '683',
        districtName: 'Huyện Cát Tiên',
        provinceCode: '68'),
    DistrictModel(
        districtCode: '688',
        districtName: 'Thị xã Phước Long',
        provinceCode: '70'),
    DistrictModel(
        districtCode: '689',
        districtName: 'Thành phố Đồng Xoài',
        provinceCode: '70'),
    DistrictModel(
        districtCode: '690',
        districtName: 'Thị xã Bình Long',
        provinceCode: '70'),
    DistrictModel(
        districtCode: '691',
        districtName: 'Huyện Bù Gia Mập',
        provinceCode: '70'),
    DistrictModel(
        districtCode: '692',
        districtName: 'Huyện Lộc Ninh',
        provinceCode: '70'),
    DistrictModel(
        districtCode: '693', districtName: 'Huyện Bù Đốp', provinceCode: '70'),
    DistrictModel(
        districtCode: '694',
        districtName: 'Huyện Hớn Quản',
        provinceCode: '70'),
    DistrictModel(
        districtCode: '695',
        districtName: 'Huyện Đồng Phú',
        provinceCode: '70'),
    DistrictModel(
        districtCode: '696', districtName: 'Huyện Bù Đăng', provinceCode: '70'),
    DistrictModel(
        districtCode: '697',
        districtName: 'Thị xã Chơn Thành',
        provinceCode: '70'),
    DistrictModel(
        districtCode: '698',
        districtName: 'Huyện Phú Riềng',
        provinceCode: '70'),
    DistrictModel(
        districtCode: '703',
        districtName: 'Thành phố Tây Ninh',
        provinceCode: '72'),
    DistrictModel(
        districtCode: '705',
        districtName: 'Huyện Tân Biên',
        provinceCode: '72'),
    DistrictModel(
        districtCode: '706',
        districtName: 'Huyện Tân Châu',
        provinceCode: '72'),
    DistrictModel(
        districtCode: '707',
        districtName: 'Huyện Dương Minh Châu',
        provinceCode: '72'),
    DistrictModel(
        districtCode: '708',
        districtName: 'Huyện Châu Thành',
        provinceCode: '72'),
    DistrictModel(
        districtCode: '709',
        districtName: 'Thị xã Hòa Thành',
        provinceCode: '72'),
    DistrictModel(
        districtCode: '710', districtName: 'Huyện Gò Dầu', provinceCode: '72'),
    DistrictModel(
        districtCode: '711', districtName: 'Huyện Bến Cầu', provinceCode: '72'),
    DistrictModel(
        districtCode: '712',
        districtName: 'Thị xã Trảng Bàng',
        provinceCode: '72'),
    DistrictModel(
        districtCode: '718',
        districtName: 'Thành phố Thủ Dầu Một',
        provinceCode: '74'),
    DistrictModel(
        districtCode: '719',
        districtName: 'Huyện Bàu Bàng',
        provinceCode: '74'),
    DistrictModel(
        districtCode: '720',
        districtName: 'Huyện Dầu Tiếng',
        provinceCode: '74'),
    DistrictModel(
        districtCode: '721',
        districtName: 'Thị xã Bến Cát',
        provinceCode: '74'),
    DistrictModel(
        districtCode: '722',
        districtName: 'Huyện Phú Giáo',
        provinceCode: '74'),
    DistrictModel(
        districtCode: '723',
        districtName: 'Thành phố Tân Uyên',
        provinceCode: '74'),
    DistrictModel(
        districtCode: '724',
        districtName: 'Thành phố Dĩ An',
        provinceCode: '74'),
    DistrictModel(
        districtCode: '725',
        districtName: 'Thành phố Thuận An',
        provinceCode: '74'),
    DistrictModel(
        districtCode: '726',
        districtName: 'Huyện Bắc Tân Uyên',
        provinceCode: '74'),
    DistrictModel(
        districtCode: '731',
        districtName: 'Thành phố Biên Hòa',
        provinceCode: '75'),
    DistrictModel(
        districtCode: '732',
        districtName: 'Thành phố Long Khánh',
        provinceCode: '75'),
    DistrictModel(
        districtCode: '734', districtName: 'Huyện Tân Phú', provinceCode: '75'),
    DistrictModel(
        districtCode: '735',
        districtName: 'Huyện Vĩnh Cửu',
        provinceCode: '75'),
    DistrictModel(
        districtCode: '736',
        districtName: 'Huyện Định Quán',
        provinceCode: '75'),
    DistrictModel(
        districtCode: '737',
        districtName: 'Huyện Trảng Bom',
        provinceCode: '75'),
    DistrictModel(
        districtCode: '738',
        districtName: 'Huyện Thống Nhất',
        provinceCode: '75'),
    DistrictModel(
        districtCode: '739', districtName: 'Huyện Cẩm Mỹ', provinceCode: '75'),
    DistrictModel(
        districtCode: '740',
        districtName: 'Huyện Long Thành',
        provinceCode: '75'),
    DistrictModel(
        districtCode: '741',
        districtName: 'Huyện Xuân Lộc',
        provinceCode: '75'),
    DistrictModel(
        districtCode: '742',
        districtName: 'Huyện Nhơn Trạch',
        provinceCode: '75'),
    DistrictModel(
        districtCode: '747',
        districtName: 'Thành phố Vũng Tàu',
        provinceCode: '77'),
    DistrictModel(
        districtCode: '748',
        districtName: 'Thành phố Bà Rịa',
        provinceCode: '77'),
    DistrictModel(
        districtCode: '750',
        districtName: 'Huyện Châu Đức',
        provinceCode: '77'),
    DistrictModel(
        districtCode: '751',
        districtName: 'Huyện Xuyên Mộc',
        provinceCode: '77'),
    DistrictModel(
        districtCode: '752',
        districtName: 'Huyện Long Điền',
        provinceCode: '77'),
    DistrictModel(
        districtCode: '753', districtName: 'Huyện Đất Đỏ', provinceCode: '77'),
    DistrictModel(
        districtCode: '754', districtName: 'Thị xã Phú Mỹ', provinceCode: '77'),
    DistrictModel(
        districtCode: '755', districtName: 'Huyện Côn Đảo', provinceCode: '77'),
    DistrictModel(
        districtCode: '760', districtName: 'Quận 1', provinceCode: '79'),
    DistrictModel(
        districtCode: '761', districtName: 'Quận 12', provinceCode: '79'),
    DistrictModel(
        districtCode: '764', districtName: 'Quận Gò Vấp', provinceCode: '79'),
    DistrictModel(
        districtCode: '765',
        districtName: 'Quận Bình Thạnh',
        provinceCode: '79'),
    DistrictModel(
        districtCode: '766', districtName: 'Quận Tân Bình', provinceCode: '79'),
    DistrictModel(
        districtCode: '767', districtName: 'Quận Tân Phú', provinceCode: '79'),
    DistrictModel(
        districtCode: '768',
        districtName: 'Quận Phú Nhuận',
        provinceCode: '79'),
    DistrictModel(
        districtCode: '769',
        districtName: 'Thành phố Thủ Đức',
        provinceCode: '79'),
    DistrictModel(
        districtCode: '770', districtName: 'Quận 3', provinceCode: '79'),
    DistrictModel(
        districtCode: '771', districtName: 'Quận 10', provinceCode: '79'),
    DistrictModel(
        districtCode: '772', districtName: 'Quận 11', provinceCode: '79'),
    DistrictModel(
        districtCode: '773', districtName: 'Quận 4', provinceCode: '79'),
    DistrictModel(
        districtCode: '774', districtName: 'Quận 5', provinceCode: '79'),
    DistrictModel(
        districtCode: '775', districtName: 'Quận 6', provinceCode: '79'),
    DistrictModel(
        districtCode: '776', districtName: 'Quận 8', provinceCode: '79'),
    DistrictModel(
        districtCode: '777', districtName: 'Quận Bình Tân', provinceCode: '79'),
    DistrictModel(
        districtCode: '778', districtName: 'Quận 7', provinceCode: '79'),
    DistrictModel(
        districtCode: '783', districtName: 'Huyện Củ Chi', provinceCode: '79'),
    DistrictModel(
        districtCode: '784', districtName: 'Huyện Hóc Môn', provinceCode: '79'),
    DistrictModel(
        districtCode: '785',
        districtName: 'Huyện Bình Chánh',
        provinceCode: '79'),
    DistrictModel(
        districtCode: '786', districtName: 'Huyện Nhà Bè', provinceCode: '79'),
    DistrictModel(
        districtCode: '787', districtName: 'Huyện Cần Giờ', provinceCode: '79'),
    DistrictModel(
        districtCode: '794',
        districtName: 'Thành phố Tân An',
        provinceCode: '80'),
    DistrictModel(
        districtCode: '795',
        districtName: 'Thị xã Kiến Tường',
        provinceCode: '80'),
    DistrictModel(
        districtCode: '796',
        districtName: 'Huyện Tân Hưng',
        provinceCode: '80'),
    DistrictModel(
        districtCode: '797',
        districtName: 'Huyện Vĩnh Hưng',
        provinceCode: '80'),
    DistrictModel(
        districtCode: '798', districtName: 'Huyện Mộc Hóa', provinceCode: '80'),
    DistrictModel(
        districtCode: '799',
        districtName: 'Huyện Tân Thạnh',
        provinceCode: '80'),
    DistrictModel(
        districtCode: '800',
        districtName: 'Huyện Thạnh Hóa',
        provinceCode: '80'),
    DistrictModel(
        districtCode: '801', districtName: 'Huyện Đức Huệ', provinceCode: '80'),
    DistrictModel(
        districtCode: '802', districtName: 'Huyện Đức Hòa', provinceCode: '80'),
    DistrictModel(
        districtCode: '803', districtName: 'Huyện Bến Lức', provinceCode: '80'),
    DistrictModel(
        districtCode: '804',
        districtName: 'Huyện Thủ Thừa',
        provinceCode: '80'),
    DistrictModel(
        districtCode: '805', districtName: 'Huyện Tân Trụ', provinceCode: '80'),
    DistrictModel(
        districtCode: '806',
        districtName: 'Huyện Cần Đước',
        provinceCode: '80'),
    DistrictModel(
        districtCode: '807',
        districtName: 'Huyện Cần Giuộc',
        provinceCode: '80'),
    DistrictModel(
        districtCode: '808',
        districtName: 'Huyện Châu Thành',
        provinceCode: '80'),
    DistrictModel(
        districtCode: '815',
        districtName: 'Thành phố Mỹ Tho',
        provinceCode: '82'),
    DistrictModel(
        districtCode: '816',
        districtName: 'Thị xã Gò Công',
        provinceCode: '82'),
    DistrictModel(
        districtCode: '817',
        districtName: 'Thị xã Cai Lậy',
        provinceCode: '82'),
    DistrictModel(
        districtCode: '818',
        districtName: 'Huyện Tân Phước',
        provinceCode: '82'),
    DistrictModel(
        districtCode: '819', districtName: 'Huyện Cái Bè', provinceCode: '82'),
    DistrictModel(
        districtCode: '820', districtName: 'Huyện Cai Lậy', provinceCode: '82'),
    DistrictModel(
        districtCode: '821',
        districtName: 'Huyện Châu Thành',
        provinceCode: '82'),
    DistrictModel(
        districtCode: '822', districtName: 'Huyện Chợ Gạo', provinceCode: '82'),
    DistrictModel(
        districtCode: '823',
        districtName: 'Huyện Gò Công Tây',
        provinceCode: '82'),
    DistrictModel(
        districtCode: '824',
        districtName: 'Huyện Gò Công Đông',
        provinceCode: '82'),
    DistrictModel(
        districtCode: '825',
        districtName: 'Huyện Tân Phú Đông',
        provinceCode: '82'),
    DistrictModel(
        districtCode: '829',
        districtName: 'Thành phố Bến Tre',
        provinceCode: '83'),
    DistrictModel(
        districtCode: '831',
        districtName: 'Huyện Châu Thành',
        provinceCode: '83'),
    DistrictModel(
        districtCode: '832',
        districtName: 'Huyện Chợ Lách',
        provinceCode: '83'),
    DistrictModel(
        districtCode: '833',
        districtName: 'Huyện Mỏ Cày Nam',
        provinceCode: '83'),
    DistrictModel(
        districtCode: '834',
        districtName: 'Huyện Giồng Trôm',
        provinceCode: '83'),
    DistrictModel(
        districtCode: '835',
        districtName: 'Huyện Bình Đại',
        provinceCode: '83'),
    DistrictModel(
        districtCode: '836', districtName: 'Huyện Ba Tri', provinceCode: '83'),
    DistrictModel(
        districtCode: '837',
        districtName: 'Huyện Thạnh Phú',
        provinceCode: '83'),
    DistrictModel(
        districtCode: '838',
        districtName: 'Huyện Mỏ Cày Bắc',
        provinceCode: '83'),
    DistrictModel(
        districtCode: '842',
        districtName: 'Thành phố Trà Vinh',
        provinceCode: '84'),
    DistrictModel(
        districtCode: '844',
        districtName: 'Huyện Càng Long',
        provinceCode: '84'),
    DistrictModel(
        districtCode: '845', districtName: 'Huyện Cầu Kè', provinceCode: '84'),
    DistrictModel(
        districtCode: '846',
        districtName: 'Huyện Tiểu Cần',
        provinceCode: '84'),
    DistrictModel(
        districtCode: '847',
        districtName: 'Huyện Châu Thành',
        provinceCode: '84'),
    DistrictModel(
        districtCode: '848',
        districtName: 'Huyện Cầu Ngang',
        provinceCode: '84'),
    DistrictModel(
        districtCode: '849', districtName: 'Huyện Trà Cú', provinceCode: '84'),
    DistrictModel(
        districtCode: '850',
        districtName: 'Huyện Duyên Hải',
        provinceCode: '84'),
    DistrictModel(
        districtCode: '851',
        districtName: 'Thị xã Duyên Hải',
        provinceCode: '84'),
    DistrictModel(
        districtCode: '855',
        districtName: 'Thành phố Vĩnh Long',
        provinceCode: '86'),
    DistrictModel(
        districtCode: '857', districtName: 'Huyện Long Hồ', provinceCode: '86'),
    DistrictModel(
        districtCode: '858',
        districtName: 'Huyện Mang Thít',
        provinceCode: '86'),
    DistrictModel(
        districtCode: '859',
        districtName: 'Huyện  Vũng Liêm',
        provinceCode: '86'),
    DistrictModel(
        districtCode: '860',
        districtName: 'Huyện Tam Bình',
        provinceCode: '86'),
    DistrictModel(
        districtCode: '861',
        districtName: 'Thị xã Bình Minh',
        provinceCode: '86'),
    DistrictModel(
        districtCode: '862', districtName: 'Huyện Trà Ôn', provinceCode: '86'),
    DistrictModel(
        districtCode: '863',
        districtName: 'Huyện Bình Tân',
        provinceCode: '86'),
    DistrictModel(
        districtCode: '866',
        districtName: 'Thành phố Cao Lãnh',
        provinceCode: '87'),
    DistrictModel(
        districtCode: '867',
        districtName: 'Thành phố Sa Đéc',
        provinceCode: '87'),
    DistrictModel(
        districtCode: '868',
        districtName: 'Thành phố Hồng Ngự',
        provinceCode: '87'),
    DistrictModel(
        districtCode: '869',
        districtName: 'Huyện Tân Hồng',
        provinceCode: '87'),
    DistrictModel(
        districtCode: '870',
        districtName: 'Huyện Hồng Ngự',
        provinceCode: '87'),
    DistrictModel(
        districtCode: '871',
        districtName: 'Huyện Tam Nông',
        provinceCode: '87'),
    DistrictModel(
        districtCode: '872',
        districtName: 'Huyện Tháp Mười',
        provinceCode: '87'),
    DistrictModel(
        districtCode: '873',
        districtName: 'Huyện Cao Lãnh',
        provinceCode: '87'),
    DistrictModel(
        districtCode: '874',
        districtName: 'Huyện Thanh Bình',
        provinceCode: '87'),
    DistrictModel(
        districtCode: '875', districtName: 'Huyện Lấp Vò', provinceCode: '87'),
    DistrictModel(
        districtCode: '876',
        districtName: 'Huyện Lai Vung',
        provinceCode: '87'),
    DistrictModel(
        districtCode: '877',
        districtName: 'Huyện Châu Thành',
        provinceCode: '87'),
    DistrictModel(
        districtCode: '883',
        districtName: 'Thành phố Long Xuyên',
        provinceCode: '89'),
    DistrictModel(
        districtCode: '884',
        districtName: 'Thành phố Châu Đốc',
        provinceCode: '89'),
    DistrictModel(
        districtCode: '886', districtName: 'Huyện An Phú', provinceCode: '89'),
    DistrictModel(
        districtCode: '887',
        districtName: 'Thị xã Tân Châu',
        provinceCode: '89'),
    DistrictModel(
        districtCode: '888', districtName: 'Huyện Phú Tân', provinceCode: '89'),
    DistrictModel(
        districtCode: '889',
        districtName: 'Huyện Châu Phú',
        provinceCode: '89'),
    DistrictModel(
        districtCode: '890',
        districtName: 'Thị xã Tịnh Biên',
        provinceCode: '89'),
    DistrictModel(
        districtCode: '891', districtName: 'Huyện Tri Tôn', provinceCode: '89'),
    DistrictModel(
        districtCode: '892',
        districtName: 'Huyện Châu Thành',
        provinceCode: '89'),
    DistrictModel(
        districtCode: '893', districtName: 'Huyện Chợ Mới', provinceCode: '89'),
    DistrictModel(
        districtCode: '894',
        districtName: 'Huyện Thoại Sơn',
        provinceCode: '89'),
    DistrictModel(
        districtCode: '899',
        districtName: 'Thành phố Rạch Giá',
        provinceCode: '91'),
    DistrictModel(
        districtCode: '900',
        districtName: 'Thành phố Hà Tiên',
        provinceCode: '91'),
    DistrictModel(
        districtCode: '902',
        districtName: 'Huyện Kiên Lương',
        provinceCode: '91'),
    DistrictModel(
        districtCode: '903', districtName: 'Huyện Hòn Đất', provinceCode: '91'),
    DistrictModel(
        districtCode: '904',
        districtName: 'Huyện Tân Hiệp',
        provinceCode: '91'),
    DistrictModel(
        districtCode: '905',
        districtName: 'Huyện Châu Thành',
        provinceCode: '91'),
    DistrictModel(
        districtCode: '906',
        districtName: 'Huyện Giồng Riềng',
        provinceCode: '91'),
    DistrictModel(
        districtCode: '907', districtName: 'Huyện Gò Quao', provinceCode: '91'),
    DistrictModel(
        districtCode: '908', districtName: 'Huyện An Biên', provinceCode: '91'),
    DistrictModel(
        districtCode: '909', districtName: 'Huyện An Minh', provinceCode: '91'),
    DistrictModel(
        districtCode: '910',
        districtName: 'Huyện Vĩnh Thuận',
        provinceCode: '91'),
    DistrictModel(
        districtCode: '911',
        districtName: 'Thành phố Phú Quốc',
        provinceCode: '91'),
    DistrictModel(
        districtCode: '912',
        districtName: 'Huyện Kiên Hải',
        provinceCode: '91'),
    DistrictModel(
        districtCode: '913',
        districtName: 'Huyện U Minh Thượng',
        provinceCode: '91'),
    DistrictModel(
        districtCode: '914',
        districtName: 'Huyện Giang Thành',
        provinceCode: '91'),
    DistrictModel(
        districtCode: '916',
        districtName: 'Quận Ninh Kiều',
        provinceCode: '92'),
    DistrictModel(
        districtCode: '917', districtName: 'Quận Ô Môn', provinceCode: '92'),
    DistrictModel(
        districtCode: '918',
        districtName: 'Quận Bình Thuỷ',
        provinceCode: '92'),
    DistrictModel(
        districtCode: '919', districtName: 'Quận Cái Răng', provinceCode: '92'),
    DistrictModel(
        districtCode: '923', districtName: 'Quận Thốt Nốt', provinceCode: '92'),
    DistrictModel(
        districtCode: '924',
        districtName: 'Huyện Vĩnh Thạnh',
        provinceCode: '92'),
    DistrictModel(
        districtCode: '925', districtName: 'Huyện Cờ Đỏ', provinceCode: '92'),
    DistrictModel(
        districtCode: '926',
        districtName: 'Huyện Phong Điền',
        provinceCode: '92'),
    DistrictModel(
        districtCode: '927',
        districtName: 'Huyện Thới Lai',
        provinceCode: '92'),
    DistrictModel(
        districtCode: '930',
        districtName: 'Thành phố Vị Thanh',
        provinceCode: '93'),
    DistrictModel(
        districtCode: '931',
        districtName: 'Thành phố Ngã Bảy',
        provinceCode: '93'),
    DistrictModel(
        districtCode: '932',
        districtName: 'Huyện Châu Thành A',
        provinceCode: '93'),
    DistrictModel(
        districtCode: '933',
        districtName: 'Huyện Châu Thành',
        provinceCode: '93'),
    DistrictModel(
        districtCode: '934',
        districtName: 'Huyện Phụng Hiệp',
        provinceCode: '93'),
    DistrictModel(
        districtCode: '935', districtName: 'Huyện Vị Thuỷ', provinceCode: '93'),
    DistrictModel(
        districtCode: '936', districtName: 'Huyện Long Mỹ', provinceCode: '93'),
    DistrictModel(
        districtCode: '937',
        districtName: 'Thị xã Long Mỹ',
        provinceCode: '93'),
    DistrictModel(
        districtCode: '941',
        districtName: 'Thành phố Sóc Trăng',
        provinceCode: '94'),
    DistrictModel(
        districtCode: '942',
        districtName: 'Huyện Châu Thành',
        provinceCode: '94'),
    DistrictModel(
        districtCode: '943', districtName: 'Huyện Kế Sách', provinceCode: '94'),
    DistrictModel(
        districtCode: '944', districtName: 'Huyện Mỹ Tú', provinceCode: '94'),
    DistrictModel(
        districtCode: '945',
        districtName: 'Huyện Cù Lao Dung',
        provinceCode: '94'),
    DistrictModel(
        districtCode: '946',
        districtName: 'Huyện Long Phú',
        provinceCode: '94'),
    DistrictModel(
        districtCode: '947',
        districtName: 'Huyện Mỹ Xuyên',
        provinceCode: '94'),
    DistrictModel(
        districtCode: '948',
        districtName: 'Thị xã Ngã Năm',
        provinceCode: '94'),
    DistrictModel(
        districtCode: '949',
        districtName: 'Huyện Thạnh Trị',
        provinceCode: '94'),
    DistrictModel(
        districtCode: '950',
        districtName: 'Thị xã Vĩnh Châu',
        provinceCode: '94'),
    DistrictModel(
        districtCode: '951', districtName: 'Huyện Trần Đề', provinceCode: '94'),
    DistrictModel(
        districtCode: '954',
        districtName: 'Thành phố Bạc Liêu',
        provinceCode: '95'),
    DistrictModel(
        districtCode: '956',
        districtName: 'Huyện Hồng Dân',
        provinceCode: '95'),
    DistrictModel(
        districtCode: '957',
        districtName: 'Huyện Phước Long',
        provinceCode: '95'),
    DistrictModel(
        districtCode: '958',
        districtName: 'Huyện Vĩnh Lợi',
        provinceCode: '95'),
    DistrictModel(
        districtCode: '959',
        districtName: 'Thị xã Giá Rai',
        provinceCode: '95'),
    DistrictModel(
        districtCode: '960',
        districtName: 'Huyện Đông Hải',
        provinceCode: '95'),
    DistrictModel(
        districtCode: '961',
        districtName: 'Huyện Hoà Bình',
        provinceCode: '95'),
    DistrictModel(
        districtCode: '964',
        districtName: 'Thành phố Cà Mau',
        provinceCode: '96'),
    DistrictModel(
        districtCode: '966', districtName: 'Huyện U Minh', provinceCode: '96'),
    DistrictModel(
        districtCode: '967',
        districtName: 'Huyện Thới Bình',
        provinceCode: '96'),
    DistrictModel(
        districtCode: '968',
        districtName: 'Huyện Trần Văn Thời',
        provinceCode: '96'),
    DistrictModel(
        districtCode: '969',
        districtName: 'Huyện Cái Nước',
        provinceCode: '96'),
    DistrictModel(
        districtCode: '970', districtName: 'Huyện Đầm Dơi', provinceCode: '96'),
    DistrictModel(
        districtCode: '971', districtName: 'Huyện Năm Căn', provinceCode: '96'),
    DistrictModel(
        districtCode: '972', districtName: 'Huyện Phú Tân', provinceCode: '96'),
    DistrictModel(
        districtCode: '973',
        districtName: 'Huyện Ngọc Hiển',
        provinceCode: '96'),
  ];

  static List<DistrictModel> getDistrictOfProvince(String provinceCode) {
    return districtList
        .where((DistrictModel element) => element.provinceCode == provinceCode)
        .toList();
  }
}
