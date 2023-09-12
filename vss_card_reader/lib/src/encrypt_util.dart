import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:rsa_encrypt/rsa_encrypt.dart';
import 'package:encrypt/encrypt.dart' hide RSA;


class EncryptUtil {
  final Uint8List myIVKey = Uint8List.fromList([0, 0, 0, 0, 0, 0, 0, 0]);

  Uint8List encryptECB(Uint8List data, Uint8List keyInput) {
    Uint8List keys = Uint8List(24);
    List.copyRange(keys, 0, keyInput, 0, 16);
    List.copyRange(keys, 16, keyInput, 0, 8);
    if (data.isEmpty) {
      return data;
    }
    Uint8List result = Uint8List(0);
    try {
      final key = Key(keyInput);
      final encrypter = Encrypter(AES(key, mode: AESMode.ecb, padding: null));
      final ivKey = IV(myIVKey);
      final encryptedByte = encrypter.encryptBytes(data, iv: ivKey);
      result = encryptedByte.bytes;
    } catch (e) {
      log(e.toString());
    }
    return result;
  }

  Uint8List encryptCBC(Uint8List data, Uint8List keyInput) {
    Uint8List keys = Uint8List(24);
    List.copyRange(keys, 0, keyInput, 0, 16);
    List.copyRange(keys, 16, keyInput, 0, 8);
    if (data.isEmpty) {
      return data;
    }
    Uint8List result = Uint8List(0);
    try {
      final key = Key(keyInput);
      final ivKey = IV(myIVKey);
      final encrypter =
          Encrypter(AES(key, mode: AESMode.cbc, padding: 'PCS5Padding'));
      final encryptedData = encrypter.encryptBytes(data, iv: ivKey);
      result = encryptedData.bytes;
    } catch (e) {
      log(e.toString());
    }
    return result;
  }

  Future<String> decryptRSA(String encryptData) async {
    final RsaKeyHelper rsaKeyHelper = RsaKeyHelper();

    final privKey = rsaKeyHelper.parsePrivateKeyFromPem(
        "TODO");

    final String decryptedString = decrypt(encryptData, privKey);
    return decryptedString;
  }

  List<int> decodePEM(String pem) {
    var startsWith = [
      "-----BEGIN PUBLIC KEY-----",
      "-----BEGIN PRIVATE KEY-----",
      "-----BEGIN PGP PUBLIC KEY BLOCK-----\r\nVersion: React-Native-OpenPGP.js 0.1\r\nComment: http://openpgpjs.org\r\n\r\n",
      "-----BEGIN PGP PRIVATE KEY BLOCK-----\r\nVersion: React-Native-OpenPGP.js 0.1\r\nComment: http://openpgpjs.org\r\n\r\n",
    ];
    var endsWith = [
      "-----END PUBLIC KEY-----",
      "-----END PRIVATE KEY-----",
      "-----END PGP PUBLIC KEY BLOCK-----",
      "-----END PGP PRIVATE KEY BLOCK-----",
    ];
    bool isOpenPgp = pem.contains('BEGIN PGP');

    for (var s in startsWith) {
      if (pem.startsWith(s)) {
        pem = pem.substring(s.length);
      }
    }

    for (var s in endsWith) {
      if (pem.endsWith(s)) {
        pem = pem.substring(0, pem.length - s.length);
      }
    }

    if (isOpenPgp) {
      var index = pem.indexOf('\r\n');
      pem = pem.substring(0, index);
    }

    pem = pem.replaceAll('\n', '');
    pem = pem.replaceAll('\r', '');

    return base64.decode(pem);
  }
}
