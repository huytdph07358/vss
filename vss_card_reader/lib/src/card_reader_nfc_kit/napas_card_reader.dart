import 'dart:typed_data';

import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

import '../emv_card_scheme.dart';

class NapasCardReader {
  Future<String> readData() async {
    String data = "";
    var napasApdu = Uint8List.fromList([
      0x00,
      0xA4,
      0x04,
      0x00,
      0x07,
      0xA0,
      0x00,
      0x00,
      0x07,
      0x27,
      0x10,
      0x10,
      0x00
    ]);
    //String napas_APDU = "A4040007A000000727101000";
    var napasApduData = await FlutterNfcKit.transceive(napasApdu,
        timeout: const Duration(seconds: 5));

    if (napasApduData.isNotEmpty &&
        EmvCardScheme.bytes2Hex(napasApduData) != "6a82") {
      //TODO
      var getChalegeNapasApdu = Uint8List.fromList([
        0x80,
        0xA8,
        0x00,
        0x00,
        0x0F,
        0x83,
        0x0D,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x09,
        0x78
      ]);
      //String get_chalege_Napas_APDU =
      //    "80A800000F830D00000000000000000000000978";
      var getChalegeData = await FlutterNfcKit.transceive(
          getChalegeNapasApdu,
          timeout: const Duration(seconds: 5));
      if (getChalegeData.isNotEmpty) {
        var readDataNapasApdu =
            Uint8List.fromList([0x00, 0xB2, 0x01, 0x14, 0x00]);
        //String read_data_Napas_APDU =
        //    "80A800000F830D00000000000000000000000978";
        var readDataNapas = await FlutterNfcKit.transceive(
            readDataNapasApdu,
            timeout: const Duration(seconds: 5));
        if (readDataNapas.isNotEmpty) {
          data = EmvCardScheme.bytes2Hex(readDataNapas);
          if (data != "") {}
        }
      }
    }
    return data;
  }
}
