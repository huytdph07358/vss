import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:rsa_encrypt/rsa_encrypt.dart';
import 'package:encrypt/encrypt.dart' hide RSA;

class HexUtil {
  static Uint8List hex2Bytes(String str) {
    final Uint8List unit8List = Uint8List.fromList(hex.decode(str));
    return unit8List;
  }

  static String bytes2Hex(Uint8List uint8list) {
    return hex.encode(uint8list);
  }
}
