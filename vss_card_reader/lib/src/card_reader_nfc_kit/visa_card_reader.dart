import 'dart:typed_data';

import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

import '../emv_card_scheme.dart';

class VisaCardReader {
  Future<String> readData() async {
    String data = "";
    var visaApdu = Uint8List.fromList([
      0x00,
      // CLA
      0xa4,
      // INS
      0x04,
      // P1
      0x00,
      // P2
      0x07,
      // LC (data length = 7)
      // POS is selecting the AID (Visa debit or credit) that we specified in the PPSE
      // response:
      0xA0,
      0x00,
      0x00,
      0x00,
      0x03,
      0x10,
      0x10,
      0x00
    ]);
    var visaApduData =
    await FlutterNfcKit.transceive(visaApdu,
        timeout: const Duration(seconds: 5));

    if (visaApduData.isNotEmpty) {
      //TODO
      var getChalegeVisaApdu = Uint8List.fromList([
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
      var getChalegeVisaData =
      await FlutterNfcKit.transceive(
          getChalegeVisaApdu,
          timeout: const Duration(seconds: 5));
      if (getChalegeVisaData.isNotEmpty) {
        var readDataVisaApdu = Uint8List.fromList(
            [0x00, 0xB2, 0x01, 0x14, 0x00]);

        var readDataVisa =
        await FlutterNfcKit.transceive(
            readDataVisaApdu,
            timeout: const Duration(seconds: 5));
        if (readDataVisa.isNotEmpty) {
          data =
          EmvCardScheme.bytes2Hex(
              readDataVisa);
          if (data != "") {}
        }
      }
    }
    return data;
  }
}
