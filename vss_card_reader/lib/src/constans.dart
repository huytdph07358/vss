import 'dart:typed_data';

class Constans {
  static Uint8List apduTheViet = Uint8List.fromList([
    0x00,
    0xA4,
    0x04,
    0x00,
    0x0C,
    0xf7,
    0x04,
    0x00,
    0x00,
    0x01,
    0x65,
    0x49,
    0x44,
    0x2D,
    0x56,
    0x53,
    0x53,
    0x00
  ]);

  static Uint8List getChalege =
      Uint8List.fromList([0x00, 0x84, 0x00, 0x00, 0x00]);

  static Uint8List readDataApdu =
      Uint8List.fromList([0x00, 0xB2, 0x01, 0x14, 0x00]);

  static Uint8List inAuth = Uint8List.fromList([
    0x00,
    0x88,
    0x00,
    0x80,
    0x08,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x01,
    0x00
  ]);

}
