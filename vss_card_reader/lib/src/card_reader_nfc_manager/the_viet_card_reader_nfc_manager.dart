import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:nb_utils/nb_utils.dart';
import '../hex_util.dart';
import 'channel.dart';
import 'nfc_manager.dart';
import 'platform_tags.dart';
import 'translator.dart';
import '../constans.dart';

class TheVietCardReaderNfcManager {
  final NfcTag nfcTag;
  const TheVietCardReaderNfcManager(this.nfcTag);

  Future<String> readData() async {
    String cardDataResult = "";
    Uint8List keyImk = Uint8List.fromList([0]);
    var dataTmp = Uint8List(16);
    Uint8List exAuth = Uint8List.fromList([
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

    IsoDep? isoDep = $GetIsoDep(nfcTag);
    if (isoDep != null) {
      var selectData = await isoDep.transceive(data: Constans.apduTheViet);
      for (int i = 0; i < selectData.length; i++) {
        if (selectData[i] == 0x5F && selectData[i + 1] == 0x54) {
          for (int j = 0; j < 8; j++) {
            dataTmp[j] = selectData[i + 3 + j];
            dataTmp[8 + j] = (dataTmp[j] ^ 0xff);
          }
        }
      }

      String resultIMKEncrypt =
          getStringAsync('keyDataImkDecrypt', defaultValue: '');
      String? resultIMK = await decryptKey(resultIMKEncrypt);
      if (resultIMK != null) {
        keyImk = HexUtil.hex2Bytes(resultIMK);
      }

      Uint8List udkKeyExternal = await getUdExternalKey(selectData, keyImk);
      Uint8List internalAuthData =
          await isoDep.transceive(data: Constans.inAuth);
      if (internalAuthData.length >= 8) {
        var getChalegeData = await isoDep.transceive(data: Constans.getChalege);
        if (getChalegeData.length > 8) {
          Uint8List externalEncrypt =
              await encryptCBC(getChalegeData, udkKeyExternal); //TODO
          exAuth[5] = externalEncrypt[0];
          exAuth[6] = externalEncrypt[1];
          exAuth[7] = externalEncrypt[2];
          exAuth[8] = externalEncrypt[3];
          exAuth[9] = externalEncrypt[4];
          exAuth[10] = externalEncrypt[5];
          exAuth[11] = externalEncrypt[6];
          exAuth[12] = externalEncrypt[7];
          var externAuth =
              await isoDep.transceive(data: Uint8List.fromList(exAuth));
          if (externAuth.isNotEmpty) {
            var readData = await isoDep.transceive(data: Constans.readDataApdu);
            if (readData.isNotEmpty) {
              cardDataResult = HexUtil.bytes2Hex(readData);
              if (cardDataResult != "" && cardDataResult.endsWith("9000")) {
                Uint8List dataService = Uint8List.sublistView(readData, 5, 25);
                cardDataResult = HexUtil.bytes2Hex(dataService);
              }
            }
          }
        }
      }
    } else {
      String resultKCAEncrypt =
          getStringAsync('keyDataKcaDecrypt', defaultValue: '');
      resultKCAEncrypt =
          "DLBwzfZVhMssiTdWjyHhty1i5vpSMJ1UpxJTF4Q3R/+r/kg/O/voKggDIlB2kel3wyiom8fYYfTNepxm8NyDyT9N5c+ylxxs8w9rqbq4AM+FApcs5+JjaEuWCLvMwAeyz7tSu9ZY2T5fTdNT4VkhS6AM+fb3eIIXzjPHRUQeQIt6eMhVi78E6eokCKpurutPOGPyce4u/pA65a0gKupIazYel1ZsOfTCCY/w413uIgA3LbJT+w9IhzKYH6EWhVRKbk6RkfYorHW10ATF+yaRPqgT5nDVH+lGjlrqD//QXaVrXmdmZvoF6suGR3HsytJ/RXV257hydLvaaTj+SSpacw==";
      Uint8List keyKCA = Uint8List.fromList([0]); //TODO
      String? resultKCA = null; //await decryptKey(resultKCAEncrypt);
      if (resultKCA != null) {
        keyKCA = HexUtil.hex2Bytes(resultKCA.replaceAll("-", ""));
        cardDataResult = await mirfareReader(nfcTag.handle, keyKCA) ?? "";
      } else {
        cardDataResult = await mirfareReader(nfcTag.handle, null) ?? "";
      }
    }

    return cardDataResult;
  }

  Future<String?> decryptKey(String encryptData) async {
    final dataKey = await channel.invokeMethod<String>(
        'VssCardReader#decryptKey', encryptData);
    return dataKey;
  }

  Future<String?> mirfareReader(String handle, Uint8List? key) async {
    final data =
        await channel.invokeMethod<String>('VssCardReader#mirfareReader', [
      {
        "key": key,
        "handle": handle,
      }
    ]);
    return data;
  }

  Future<Uint8List> getUdExternalKey(Uint8List data, Uint8List key) async {
    final Uint8List dataEncrypt =
        await channel.invokeMethod('VssCardReader#getUdExternalKey', [
      {"data": data, "key": key}
    ]);
    return dataEncrypt;
  }

  Future<Uint8List> encryptCBC(Uint8List data, Uint8List key) async {
    final Uint8List dataEncrypt =
        await channel.invokeMethod('VssCardReader#encryptCBC', [
      {"data": data, "key": key}
    ]);
    return dataEncrypt;
  }
}
