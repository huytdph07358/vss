import 'dart:core';

import 'package:convert/convert.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

import 'command_apdu.dart';
import 'command_enum.dart';

enum EmvCardScheme {
  napas("Napas", "^9[0-9]{6,}", [
    [
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
    ]
  ]), //
  theViet("The Viet", "^0[0-9]{6,}", [
    [
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
    ]
  ]), //
  visa("VISA", "^4[0-9]{6,}", [
    [0xA0, 0x00, 0x00, 0x00, 0x03],
    [0xA0, 0x00, 0x00, 0x00, 0x03, 0x10, 0x10],
    [0xA0, 0x00, 0x00, 0x00, 0x98, 0x08, 0x48]
  ]), //
  masterCard("Master card", "^5[1-5][0-9]{5,}", [
    [0xA0, 0x00, 0x00, 0x00, 0x04],
    [0xA0, 0x00, 0x00, 0x00, 0x05],
    [0xA0, 0x00, 0x00, 0x00, 0x04, 0x10, 0x10],
    [0xA0, 0x00, 0x00, 0x00, 0x04, 0x10, 0x10, 0x12, 0x13],
    [0xA0, 0x00, 0x00, 0x00, 0x04, 0x10, 0x10, 0x12, 0x15]
  ]), //
  americianExpress("American express", "^3[47][0-9]{5,}", [
    [0xA0, 0x00, 0x00, 0x00, 0x25]
  ]), //
  cb("CB", null, [
    [0xA0, 0x00, 0x00, 0x00, 0x42]
  ]), //
  link("LINK", null, [
    [0xA0, 0x00, 0x00, 0x00, 0x29]
  ]), //
  jcb("JCB", "^(?:2131|1800|35[0-9]{3})[0-9]{3,}", [
    [0xA0, 0x00, 0x00, 0x00, 0x65]
  ]), //
  darkort("Dankort", null, [
    [0xA0, 0x00, 0x00, 0x01, 0x21, 0x10, 0x10]
  ]), //
  coGenBan("CoGeBan", null, [
    [0xA0, 0x00, 0x00, 0x01, 0x41, 0x00, 0x01]
  ]), //
  disCover("Discover", "(6011|65|64[4-9]|622)[0-9]*", [
    [0xA0, 0x00, 0x00, 0x01, 0x52, 0x30, 0x10]
  ]), //
  banRisul("Banrisul", null, [
    [0xA0, 0x00, 0x00, 0x01, 0x54]
  ]); //
  // SPAN("Saudi Payments Network", null, ["A0 00 00 02 28"]), //
  // INTERAC("Interac", null, ["A0 00 00 02 77"]), //
  // ZIP("Discover Card", null, ["A0 00 00 03 24"]), //
  // UNIONPAY("UnionPay", "^62[0-9]{14,17}", ["A0 00 00 03 33"]), //
  // EAPS("Euro Alliance of Payment Schemes", null, ["A0 00 00 03 59"]), //
  // VERVE("Verve", null, ["A0 00 00 03 71"]), //
  // TENN("The Exchange Network ATM Network", null, ["A0 00 00 04 39"]), //
  // RUPAY("Rupay", null, ["A0 00 00 05 24 10 10"]), //
  // //ПРО100("ПРО100", null, "A0 00 00 04 32 00 01"), //
  // ZKA("ZKA", null, ["D2 76 00 00 25 45 50 01 00"]), //
  // BANKAXEPT("Bankaxept", null, ["D5 78 00 00 02 10 10"]), //
  // BRADESCO("BRADESCO", null, ["F0 00 00 00 03 00 01"]),
  // MIDLAND("Midland", null, ["A0 00 00 00 24 01"]), //
  // PBS("PBS", null, ["A0 00 00 01 21 10 10"]), //
  // ETRANZACT("eTranzact", null, ["A0 00 00 04 54"]), //
  // GOOGLE("Google", null, ["A0 00 00 04 76 6C"]), //
  // INTER_SWITCH("InterSwitch", null, ["A0 00 00 03 71 00 01"]), //
  // MEEZA("Meeza", "^50[0-9]{11}(?:[0-9]{3})?",
  //     ["A0 00 00 07 32 10 01 23"]); // Card in Egypt

  /// array of Card AID or partial AID (RID)
  final List<List<int>> aids;

  /// Card scheme (card number IIN ranges)
  final String name;

  /// Card number pattern regex
  final Pattern? pattern;

  /// Constructor using fields
  ///
  /// @param pAid
  ///            Card AID or RID
  /// @param pScheme
  ///            scheme name
  /// @param pRegex
  ///            Card regex
  const EmvCardScheme(this.name, this.pattern, this.aids);

  List<Uint8List> getAidByte() {
    List<Uint8List> aidBytes = [];
    for (List<int> aid in aids) {
      aidBytes.add(Uint8List.fromList(aid));
    }
    return aidBytes;
  }

  /// Method used to get the field name
  ///
  /// @return the name
  String getName() {
    return name;
  }

  // static Future<Uint8List> getVaiableAID() async {
  //   // Test each card from know EMV AID
  //   for (EmvCardScheme type in EmvCardScheme.values) {
  //     for (Uint8List aid in type.getAidByte()) {
  //       var data = await selectAID(aid, type.getName());
  //       String strSelect_data =
  //       convertUint8ListToString(data);
  //       if (data.isNotEmpty && strSelect_data != "6a82") {
  //         return aid;
  //       }
  //     }
  //   }
  // }

  static Uint8List hex2Bytes(String str) {
    final Uint8List unit8List = Uint8List.fromList(hex.decode(str));
    return unit8List;
  }

  static String bytes2Hex(Uint8List uint8list) {
    return hex.encode(uint8list);
  }

  /// Select application with AID or RID
  ///
  /// @param pAid byte array containing AID or RID
  /// @return response byte array
  /// @throws CommunicationException
  static Future<Uint8List> selectAID(final Uint8List pAid, String pName) {
    return FlutterNfcKit.transceive(
        CommandApdu(CommandEnum.select, pAid, 0).toBytes());
  }

  /// Get card type by AID
  ///
  /// @param pAid
  ///            card AID
  /// @return CardType or null
  static EmvCardScheme getCardTypeByAid(final Uint8List pAid) {
    EmvCardScheme ret = EmvCardScheme.visa;
    if (pAid.isNotEmpty) {
      for (EmvCardScheme val in EmvCardScheme.values) {
        for (Uint8List schemeAid in val.getAidByte()) {
          if (pAid == schemeAid) {
            ret = val;
            break;
          }
        }
      }
    }
    return ret;
  }

  /// Method used to the the card type with regex
  ///
  /// @param pCardNumber
  ///            card number
  /// @return the type of the card using regex
  static EmvCardScheme getCardTypeByCardNumber(String pCardNumber) {
    EmvCardScheme ret = EmvCardScheme.visa;
    if (pCardNumber.isNotEmpty) {
      for (EmvCardScheme val in EmvCardScheme.values) {
        if (val.pattern != null &&
            val.pattern!
                .allMatches(pCardNumber.replaceAll(" ", ""))
                .isNotEmpty) {
          ret = val;
          break;
        }
      }
    }
    return ret;
  }
}
