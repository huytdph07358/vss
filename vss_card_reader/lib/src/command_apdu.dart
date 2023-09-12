import 'package:flutter/services.dart' show Uint8List;

import 'command_enum.dart';

class CommandApdu {
  int mCla = 0x00;

  int mIns = 0x00;

  int mP1 = 0x00;

  int mP2 = 0x00;

  int mLc = 0x00;

  Uint8List? mData;

  int mLe = 0x00;

  bool mLeUsed = false;

  CommandApdu(CommandEnum pEnum, Uint8List? data, int le) {
    mCla = pEnum.getCla();
    mIns = pEnum.getIns();
    mP1 = pEnum.getP1();
    mP2 = pEnum.getP2();
    mLc = data == null ? 0 : data.length;
    mData = data;
    mLe = le;
    mLeUsed = true;
  }

  Uint8List toBytes() {
    int length = 4; // CLA, INS, P1, P2
    if (mData != null && mData!.isNotEmpty) {
      length += 1; // LC
      length += mData!.length; // DATA
    }
    if (mLeUsed) {
      length += 1; // LE
    }

    Uint8List apdu = Uint8List(length);

    int index = 0;
    apdu[index] = mCla;
    index++;
    apdu[index] = mIns;
    index++;
    apdu[index] = mP1;
    index++;
    apdu[index] = mP2;
    index++;
    if (mData != null && mData!.isNotEmpty) {
      apdu[index] = mLc;
      index++;

      List.copyRange(apdu, index, mData!, 0, mData!.length);
      index += mData!.length;
    }
    if (mLeUsed) {
      apdu[index] += mLe; // LE
    }

    return apdu;
  }
}
