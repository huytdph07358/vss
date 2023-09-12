import 'dart:typed_data';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import '../emv_card_scheme.dart';
import '../../vss_card_reader_method_channel.dart';

class TheVietCardReaderNfcKit {
  final String resultIMKEncrypt;
  final String resultKCAEncrypt;

  const TheVietCardReaderNfcKit(this.resultIMKEncrypt, this.resultKCAEncrypt);

  Future<String> readData() async {
    String data = "";

    var selectData = await FlutterNfcKit.transceive(
        Uint8List.fromList(EmvCardScheme.theViet.aids.first),
        timeout: const Duration(
            seconds:
                5)); // timeout is still Android-only, persist until next change

    Uint8List keyImk = Uint8List.fromList([0]); //TODO

    MethodChannelVssCardReader platform = MethodChannelVssCardReader();
    if (resultIMKEncrypt.isNotEmpty) {
      String? resultIMK = await platform.decryptKey(resultIMKEncrypt); //
      if (resultIMK != null) {
        keyImk = EmvCardScheme.hex2Bytes(resultIMK);
      }
    } else {
      String? resultIMK = await platform.decryptKey(
          "s9UGR+d7moRbAZnXiSmEvKYWCp4as6KHUeWrf3wPtTRs9rOKgH0LrDnOz593uaHDjj4il/Tk0TJo+fr9N47hCCGTZLaAJ+q/VZLXN0IxXmNgNxZIfXJOZtkmbrbQ03HbX45xT+hTO1wdHksnbnlHvfbeIEFXoaSOFd3BBwaDfUHueGx5DP886NxNcKAluPsfaV16TskPH4CPmBCEnwzrfzKbGbBu1G7BE6HYdif21kNVBZdhTVkR7nyF7hma3cfyZWzOE4A1zQSJkRwB9QIHW1UETlcr8nmhdrN+B4CtBudZZz4OKjUb56/s5BGq6JvhaGFz6ev6fHUhg8WGWaaBtQ==");
      if (resultIMK != null) {
        keyImk = EmvCardScheme.hex2Bytes(resultIMK);
      }
    }

    var getChalege = Uint8List.fromList([0x00, 0x84, 0x00, 0x00, 0x00]);

    var dataTmp = Uint8List(16);
    // internal authen
    var inAuth = Uint8List.fromList([
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
    var exAuth = Uint8List.fromList([
      0x00,
      0x82,
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
      0x00
    ]);

    Uint8List readDataApdu = Uint8List.fromList([0x00, 0xB2, 0x01, 0x14, 0x00]);

    for (int i = 0; i < selectData.length; i++) {
      if (selectData[i] == 0x5F && selectData[i + 1] == 0x54) {
        for (int j = 0; j < 8; j++) {
          dataTmp[j] = selectData[i + 3 + j];
          dataTmp[8 + j] = (dataTmp[j] ^ 0xff);
        }
      }
    }

    // Uint8List key_udk1 = Uint8List(16);
    // List.copyRange(key_udk, 0, keyImk, 16, 32);
    // Uint8List dataEncrypted = encryptUtil.encryptECB(data_tmp, key_udk1);
    // String strkey_udk = EmvCardScheme.bytes2Hex(key_udk);
    // String strkey_udk1 = EmvCardScheme.bytes2Hex(key_udk1);

    Uint8List udkKeyExternal =
        await platform.getUdExternalKey(selectData, keyImk);
    //
    // String strudk_key_external = EmvCardScheme.bytes2Hex(udk_key_external);
    // String strdataEncrypted = EmvCardScheme.bytes2Hex(dataEncrypted);

    Uint8List internalAuthData = await FlutterNfcKit.transceive(inAuth,
        timeout: const Duration(seconds: 5));
    if (internalAuthData.length >= 8) {
      var getChalegeData = await FlutterNfcKit.transceive(getChalege,
          timeout: const Duration(seconds: 5));
      if (getChalegeData.length > 8) {
        Uint8List externalEncrypt =
            await platform.encryptCBC(getChalegeData, udkKeyExternal); //TODO
        exAuth[5] = externalEncrypt[0];
        exAuth[6] = externalEncrypt[1];
        exAuth[7] = externalEncrypt[2];
        exAuth[8] = externalEncrypt[3];
        exAuth[9] = externalEncrypt[4];
        exAuth[10] = externalEncrypt[5];
        exAuth[11] = externalEncrypt[6];
        exAuth[12] = externalEncrypt[7];
        var externAuth = await FlutterNfcKit.transceive(exAuth,
            timeout: const Duration(seconds: 5));
        if (externAuth.isNotEmpty) {
          var readData = await FlutterNfcKit.transceive(readDataApdu,
              timeout: const Duration(seconds: 5));
          if (readData.isNotEmpty) {
            String dataResult = EmvCardScheme.bytes2Hex(readData);
            if (dataResult != "" && dataResult.endsWith("9000")) {
              //70175f30145b95c7d2e52a7972ec5ff9a815f60b93cd56e5f29000
              Uint8List dataService = Uint8List.sublistView(readData, 5, 25);
              data = EmvCardScheme.bytes2Hex(dataService);
            }
          }
        }
      }
    }
    return data;
  }
}
