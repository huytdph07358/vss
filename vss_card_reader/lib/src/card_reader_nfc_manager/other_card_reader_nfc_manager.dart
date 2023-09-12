import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:nb_utils/nb_utils.dart';
import '../hex_util.dart';
import 'channel.dart';
import 'nfc_manager.dart';
import 'platform_tags.dart';
import 'translator.dart';
import '../constans.dart';

class OtherCardReaderNfcManager {
  final NfcTag nfcTag;
  const OtherCardReaderNfcManager(this.nfcTag);

  Future<String> readData() async {
    String cardDataResult = "";
    cardDataResult = await otherCardReader(nfcTag.handle) ?? "";

    return cardDataResult;
  }

  Future<String?> otherCardReader(String handle) async {
    final data =
        await channel.invokeMethod<String>('VssCardReader#othercardReader', [
      {
        "handle": handle,
      }
    ]);
    return data;
  }
}
