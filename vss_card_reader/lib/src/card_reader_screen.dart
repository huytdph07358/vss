import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vss_global_constant/global_constant.dart';
import 'package:vss_ivt_api/api_consumer.dart';
import 'package:vss_locale/language_store.dart';
import '../src/emv_card_scheme.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:nb_utils/nb_utils.dart';
import 'card_reader_nfc_kit/napas_card_reader.dart';
import 'card_reader_nfc_kit/the_viet_card_reader_nfc_kit.dart';
import 'card_reader_nfc_kit/visa_card_reader.dart';
import 'package:lottie/lottie.dart';
import '../l10n/translate.dart';
import 'card_reader_nfc_manager/nfc_manager.dart';

typedef NfcReaderResultDataCallback = Future<void> Function(String result);

class CardReaderScreen extends StatefulWidget {
  CardReaderScreen(
      {super.key,
      this.appBar,
      this.option,
      this.appCode,
      this.appScheme,
      this.appHost,
      this.cosBackendDomain,
      this.nfcReaderResultDataCallback});

  final PreferredSizeWidget? appBar;
  int? option;
  String? appCode;
  String? appScheme;
  String? appHost;
  String? cosBackendDomain;
  NfcReaderResultDataCallback? nfcReaderResultDataCallback;

  @override
  _CardReaderScreenState createState() => _CardReaderScreenState();
}

class _CardReaderScreenState extends State<CardReaderScreen> {
  String resultIMKEncrypt = '';
  String resultKCAEncrypt = '';
  bool isOpen = false;
  bool isViewInfo = false;
  bool isCallbackWhileFinish = false;
  bool isRunAllway = false;

  final TextEditingController currentRawDataController =
      TextEditingController();
  final TextEditingController currentReturnDataController =
      TextEditingController();
  final TextEditingController currentDisplayDataController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void init() async {
    if (isOpen) return;
    Future.delayed(const Duration(milliseconds: 500), () {
      processReadCard();
    });
    isOpen = true;
  }

  @override
  void dispose() {
    try {
      FlutterNfcKit.finish();
    } catch (e) {
      log(e);
    }

    try {
      NfcManager.instance.stopSession();
    } catch (e) {
      log(e);
    }

    currentRawDataController.dispose();
    currentReturnDataController.dispose();
    currentDisplayDataController.dispose();
    super.dispose();
  }

  Future<void> processReadCard() async {
    final Translate translate = lookupTranslate(LanguageStore.localeSelected);
    resultIMKEncrypt = getStringAsync('keyDataImkDecrypt', defaultValue: '');
    resultKCAEncrypt = getStringAsync('keyDataKcaDecrypt', defaultValue: '');
    if (resultIMKEncrypt == '') {
      //Gọi api get imk get form server
      var rs = await ApiConsumer.dotNetApi
          .get('https://cos.onelink.vn/api/Config/GetKeyReadCard');
      if (rs.Success && rs.Data != null) {
        resultIMKEncrypt = rs.Data['IMKKey'] as String;
        resultKCAEncrypt = rs.Data['KCAKey'] as String;
        setValue('keyDataImkDecrypt', resultIMKEncrypt);
        setValue('keyDataKcaDecrypt', resultKCAEncrypt);

        await processReadNfc();
      } else {
        if (!mounted) {
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(translate.khongDocDuocKeyHeThong),
            backgroundColor: Colors.red));
      }
    } else {
      await processReadNfc();
    }
  }

  Future<void> processReadNfc() async {
    log('processReadNfc: running');
    final Translate translate = lookupTranslate(LanguageStore.localeSelected);
    setState(() {
      isCallbackWhileFinish = false;
    });

    if (defaultTargetPlatform == TargetPlatform.android) {
      try {
        var availability = await NfcManager.instance.isAvailable();
        if (!availability) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(translate.thietLapNfcChuaBat),
              backgroundColor: Colors.black));
          return;
        }
        NfcManager.instance.startSession(
            onNfcResultDataCallback: (String dataResult) async {
          returnResultData(dataResult);
          if (widget.option == 1) {
            NfcManager.instance.stopSession();
          }
        });
      } catch (ex) {
        NfcManager.instance.stopSession();
        setState(() {
          isCallbackWhileFinish = true;
        });
        log(ex);
      }
    } else {
      try {
        var availability = await FlutterNfcKit.nfcAvailability;
        if (availability != NFCAvailability.available) {
          if (!mounted) {
            return;
          }
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(translate.thietLapNfcChuaBat),
              backgroundColor: Colors.black));
          return;
        }

        var tag = await FlutterNfcKit.poll(
            timeout: const Duration(seconds: 300),
            androidPlatformSound: false,
            iosAlertMessage: translate.iosAlertMessage,
            iosMultipleTagMessage: translate.iosMultipleTagMessage,
            androidCheckNDEF: false);
        if (tag.type == NFCTagType.iso7816) {
          var apduTheViet =
              Uint8List.fromList(EmvCardScheme.theViet.aids.first);
          var selectData = await FlutterNfcKit.transceive(apduTheViet,
              timeout: const Duration(
                  seconds:
                      5)); // timeout is still Android-only, persist until next change
          String strselectData = EmvCardScheme.bytes2Hex(selectData);
          if (strselectData != "" && strselectData.length > 20) {
            TheVietCardReaderNfcKit theVietCardReader =
                TheVietCardReaderNfcKit(resultIMKEncrypt, resultKCAEncrypt);
            String serviceCode = await theVietCardReader.readData();
            if (!mounted) {
              return;
            }
            if (serviceCode != "") {
              returnResultData(serviceCode);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(translate.khongDocDuocDuLieuTrenThe),
                  backgroundColor: Colors.red));
            }
          } else {
            var napasApdu = Uint8List.fromList(EmvCardScheme.napas.aids.first);
            var napasApduData = await FlutterNfcKit.transceive(napasApdu,
                timeout: const Duration(seconds: 5));

            if (napasApduData.isNotEmpty &&
                EmvCardScheme.bytes2Hex(napasApduData) != "6a82") {
              NapasCardReader napasCardReader = NapasCardReader();
              String cardData = await napasCardReader.readData();
              if (!mounted) {
                return;
              }
              if (cardData != "" && cardData.contains("9000")) {
                returnResultData(cardData);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(translate.khongDocDuocDuLieuTrenThe),
                    backgroundColor: Colors.red));
              }
            } else {
              VisaCardReader visaCardReader = VisaCardReader();
              String cardData = await visaCardReader.readData();
              if (!mounted) {
                return;
              }
              if (cardData != "" && cardData.contains("9000")) {
                returnResultData(cardData);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(translate.khongDocDuocDuLieuTrenThe),
                    backgroundColor: Colors.red));
              }
            }
          }
        }
        // iOS only: set alert message on-the-fly
        // this will persist until finish()
        //await FlutterNfcKit.setIosAlertMessage("Tap nfc card on your phone!");

        // Call finish() only once
        await FlutterNfcKit.finish();
        if (widget.option == null && isRunAllway) {
          Future.delayed(const Duration(milliseconds: 2000), () {
            processReadNfc();
          });
        } else if (widget.option == 2) {
          Future.delayed(const Duration(milliseconds: 2500), () {
            processReadNfc();
          });
        }
        // // iOS only: show alert/error message on finish
        //     await FlutterNfcKit.finish(iosAlertMessage: "Success");
        // // or
        //     await FlutterNfcKit.finish(iosErrorMessage: "Failed");
      } catch (e) {
        await FlutterNfcKit.finish();

        //setState(() {
        //  isCallbackWhileFinish = true;
        //});
        log(e);
        if (e is PlatformException) {
          PlatformException exx = e as PlatformException;
          if (exx.code == '500') {
            Future.delayed(const Duration(milliseconds: 2500), () {
              processReadNfc();
            });
          } else if (exx.code == '409') {
            //Session cancel by user
            Future.delayed(const Duration(milliseconds: 2000), () {
              processReadNfc();
            });
          } else if (exx.code == '408') {
            //processReadNfc();
            //Session timeout
            Future.delayed(const Duration(milliseconds: 2000), () {
              processReadNfc();
            });
          }
        }
      }
    }
  }

  String getCardDataFromRawData(String cardData, String type) {
    String resultData = '';
    var cardDataArray = cardData.split(":");

    if (type == 'cardNumber' && cardDataArray.isNotEmpty) {
      resultData = cardDataArray[0];
    }
    if (type == 'expireDateString' && cardDataArray.length > 1) {
      resultData = cardDataArray[1];
    }
    if (type == 'type' && cardDataArray.length > 2) {
      resultData = cardDataArray[2];
    }
    if (type == 'displayData' && cardDataArray.length > 2) {
      resultData =
          'Số thẻ: ${cardDataArray[0]}\nHạn thẻ: ${cardDataArray[1]}\nLoại thẻ: ${cardDataArray[2]}';
    }
    if (type == 'returnData' && cardDataArray.length > 2) {
      resultData =
          '${cardDataArray[0]}:${cardDataArray[1]}:${cardDataArray[2]}';
    }
    if (type == 'raw' && cardDataArray.length > 3) {
      resultData = cardDataArray[3];
    }
    return resultData;
  }

  void returnResultData(String cardServiceCode) async {
    String cardServiceCodeLink = (cardServiceCode.length == 16)
        ? 'cardCode=$cardServiceCode'
        : (cardServiceCode.contains(':'))
            ? 'cardData=$cardServiceCode'
            : 'serviceCode=$cardServiceCode';

    if (widget.appScheme != null &&
        widget.appScheme != '' &&
        widget.appHost != null &&
        widget.appHost != '') {
      await launchUrl(Uri(
        scheme: widget.appScheme,
        host: widget.appHost,
        path: 'view?appCode=TVA&appScheme=tva&appHost=app&$cardServiceCodeLink',
      ));
      Navigator.popUntil(context, (route) => false);
    } else {
      if (widget.option == 1) {
        Future.delayed(Duration.zero, () {
          Navigator.pop(
              context,
              cardServiceCode.contains(':')
                  ? getCardDataFromRawData(cardServiceCode, 'returnData')
                  : cardServiceCode);
        });
      } else if (widget.option == 2) {
        if (widget.nfcReaderResultDataCallback != null) {
          widget.nfcReaderResultDataCallback!(cardServiceCode);
        }
      } else {
        if (cardServiceCodeLink.contains('serviceCode')) {
          setState(() {
            isViewInfo = true;
          });
          currentRawDataController.text = cardServiceCode;
          currentReturnDataController.text = cardServiceCode;

          Map<String, dynamic> param = {'SERVICE_CODE': cardServiceCode};
          var cosCardData = await ApiConsumer.dotNetApi.get(
              '${widget.cosBackendDomain ?? 'https://cos.onelink.vn'}/api/CosCard/GetView',
              param: param);
          if (cosCardData.Success &&
              cosCardData.Data != null &&
              cosCardData.Data.length > 0) {
            currentDisplayDataController.text =
                cosCardData.Data[0]['CARD_CODE'];
          }
        } else {
          currentRawDataController.text =
              getCardDataFromRawData(cardServiceCode, 'raw');
          currentReturnDataController.text =
              getCardDataFromRawData(cardServiceCode, 'returnData');
          currentDisplayDataController.text =
              getCardDataFromRawData(cardServiceCode, 'displayData');
          setState(() {
            isViewInfo = true;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      final Map<String, dynamic> argument =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      widget.option = argument.containsKey('option')
          ? argument['option'] as int?
          : widget.option;
      widget.appCode = argument.containsKey('appCode')
          ? argument['appCode'] as String?
          : widget.appCode;
      widget.appScheme = argument.containsKey('appScheme')
          ? argument['appScheme'] as String?
          : widget.appScheme;
      widget.appHost = argument.containsKey('appHost')
          ? argument['appHost'] as String?
          : widget.appHost;
      widget.nfcReaderResultDataCallback =
          argument.containsKey('nfcReaderResultDataCallback')
              ? argument['nfcReaderResultDataCallback']
                  as NfcReaderResultDataCallback?
              : widget.nfcReaderResultDataCallback;
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      init();
    });
    if (widget.option == null) {
      setState(() {
        isRunAllway = true;
      });
    }
    final Translate translate = lookupTranslate(LanguageStore.localeSelected);
    return widget.option == 2 ? const SizedBox.shrink() : _buildBody();
  }

  Widget _buildBody() {
    final Translate translate = lookupTranslate(LanguageStore.localeSelected);
    return Column(
      children: <Widget>[
        Visibility(
            visible: widget.option == null,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      translate.kiemTraLienTuc,
                    ),
                    Switch(
                      value: isRunAllway,
                      onChanged: (value) {
                        setState(() {
                          isRunAllway = value;
                        });
                      },
                    ),
                  ],
                ),
                GlobalConstant.colDivider,
              ],
            )),
        Visibility(
            visible: isCallbackWhileFinish,
            child: Column(
              children: <Widget>[
                Container(
                  padding:
                      const EdgeInsets.all(GlobalConstant.paddingMarginLength),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: processReadNfc,
                      child: Text(translate.tapThe),
                    ),
                  ),
                )
              ],
            )),
        Visibility(
            visible: isViewInfo,
            child: Column(
              children: <Widget>[
                rawReadTextField(translate),
                GlobalConstant.colDivider,
                returnReadTextField(translate),
                GlobalConstant.colDivider,
                otherReadTextField(translate),
                GlobalConstant.colDivider,
              ],
            )),
      ],
    );
  }

  TextFormField otherReadTextField(Translate translate) {
    return TextFormField(
        controller: currentDisplayDataController,
        maxLines: 5,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              Clipboard.setData(
                  ClipboardData(text: currentDisplayDataController.text));
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(translate.copiedToClipboard),
                  backgroundColor: Colors.green));
            },
            icon: const Icon(Icons.content_copy_outlined),
          ),
          border: const OutlineInputBorder(),
        ));
  }

  TextFormField returnReadTextField(Translate translate) {
    return TextFormField(
        controller: currentReturnDataController,
        maxLines: 2,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              Clipboard.setData(
                  ClipboardData(text: currentReturnDataController.text));
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(translate.copiedToClipboard),
                  backgroundColor: Colors.green));
            },
            icon: const Icon(Icons.content_copy_outlined),
          ),
          border: const OutlineInputBorder(),
        ));
  }

  TextFormField rawReadTextField(Translate translate) {
    return TextFormField(
        controller: currentRawDataController,
        maxLines: 5,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              Clipboard.setData(
                  ClipboardData(text: currentRawDataController.text));
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(translate.copiedToClipboard),
                  backgroundColor: Colors.green));
            },
            icon: const Icon(Icons.content_copy_outlined),
          ),
          border: const OutlineInputBorder(),
        ));
  }

  Container lottieAnimationContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 190,
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 30,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Lottie.asset('assets/lottie/106126-tap-card-animation.zip'),
        ],
      ),
    );
  }
}
