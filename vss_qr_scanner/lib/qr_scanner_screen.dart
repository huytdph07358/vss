import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vss_global_constant/global_constant.dart';
import 'package:vss_locale/language_store.dart';
import 'package:vss_ivt_api/api_result_model.dart';
import 'package:vss_ivt_api/api_consumer.dart';
import 'package:permission_handler/permission_handler.dart';

import 'l10n/translate.dart';

class QrScannerScreen extends StatefulWidget {
  QrScannerScreen({super.key, this.option, this.cosBackendDomain});

  int? option;
  String? cosBackendDomain;

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen>
    with WidgetsBindingObserver {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? barcodeData;
  QRViewController? controller;
  PermissionStatus? permissionStatus;
  final TextEditingController currentRawDataController =
      TextEditingController();
  final TextEditingController currentReturnDataController =
      TextEditingController();
  final TextEditingController currentDisplayDataController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    askPermission();
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    currentRawDataController.dispose();
    currentReturnDataController.dispose();
    currentDisplayDataController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    final Translate translate = lookupTranslate(LanguageStore.localeSelected);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return buildBodyColumn(context, translate, textTheme, colorScheme);
  }

  Column buildBodyColumn(BuildContext context, Translate translate,
      TextTheme textTheme, ColorScheme colorScheme) {
    return Column(
      children: <Widget>[
        Expanded(flex: 1, child: _buildQrView(context)),
        Visibility(
            visible: barcodeData == null,
            child: Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.black.withOpacity(0.3),
                    height: 80,
                    alignment: Alignment.center,
                    child: RotatedBox(
                      quarterTurns: 4,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        translate.datQrcoeNamVuaKhungHinh_DuSangVaRoNet,
                        style: textTheme.bodyMedium!
                            .copyWith(color: colorScheme.onPrimary),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        // translate.datQrcoeNamVuaKhungHinh_DuSangVaRoNet,
                        // textAlign: TextAlign.center,
                        // maxLines: 2,
                        // style: Theme.of(context)
                        //     .textTheme
                        //     .bodySmall
                        //     ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )),
        Visibility(
            visible: barcodeData != null &&
                (widget.option == null || widget.option == 0),
            child: Expanded(
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    color: Colors.black.withOpacity(0.3),
                    height: 30,
                    alignment: Alignment.center,
                    child: RotatedBox(
                      quarterTurns: 4,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        translate.datQrcoeNamVuaKhungHinh_DuSangVaRoNet,
                        style: textTheme.bodyMedium!
                            .copyWith(color: colorScheme.onPrimary),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        // style: Theme.of(context)
                        //     .textTheme
                        //     .bodySmall
                        //     ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      rawReadTextField(translate),
                      GlobalConstant.colDivider,
                      returnReadTextField(translate),
                      GlobalConstant.colDivider,
                      otherReadTextField(translate),
                      GlobalConstant.colDivider,
                    ],
                  ),
                ],
              )),
            )),
        Visibility(
            visible: permissionStatus == PermissionStatus.permanentlyDenied ||
                permissionStatus == PermissionStatus.denied,
            child: Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.black.withOpacity(0.3),
                    height: 20,
                    alignment: Alignment.center,
                    child: RotatedBox(
                      quarterTurns: 4,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        permissionStatus == PermissionStatus.permanentlyDenied
                            ? translate.khongTruyCapDuocCameraMay
                            : translate
                                .banCanCapQuyenTruyCapCameraMayChoUngDung,
                        style:
                            textTheme.bodyMedium!.copyWith(color: Colors.red),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        // translate.datQrcoeNamVuaKhungHinh_DuSangVaRoNet,
                        // textAlign: TextAlign.center,
                        // maxLines: 2,
                        // style: Theme.of(context)
                        //     .textTheme
                        //     .bodySmall
                        //     ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  TextFormField otherReadTextField(Translate translate) {
    return TextFormField(
        controller: currentDisplayDataController,
        maxLines: 2,
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

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    final double scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (QRViewController ctrl, bool p) async =>
          await _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((Barcode scanData) async {
      if (scanData.code != null && scanData.code != barcodeData?.code) {
        if (widget.option == 1) {
          controller.pauseCamera();
          barcodeData = scanData;
          await qrCodeDataProcess(scanData);
        } else if (widget.option == 2) {
          controller.pauseCamera();
          barcodeData = scanData;
          Future.delayed(Duration.zero, () {
            Navigator.pop(context, barcodeData?.code);
          });
        }
      }
    });
  }

  Future<void> qrCodeDataProcess(Barcode? barcodeData) async {
    if (barcodeData != null && barcodeData.code != null) {
      currentRawDataController.text = barcodeData.code!;
      Map<String, dynamic> body = {
        'ApiData': {'QRCode': barcodeData.code}
      };
      final ApiResultModel apiResultModel = await ApiConsumer.dotNetApi.post(
          '${widget.cosBackendDomain ?? 'https://cos.onelink.vn'}/api/CosPeople/CheckQRCode',
          body: body);
      if (apiResultModel.Success && apiResultModel.Data != null) {
        final String? cardCode = apiResultModel.Data['CardCode'] as String?;
        final String? serviceCode =
            apiResultModel.Data['ServiceCode'] as String?;
        final String cardServiceCode = cardCode ?? serviceCode ?? '';

        currentReturnDataController.text = cardServiceCode;
        currentDisplayDataController.text = cardServiceCode;
        if (widget.option == 1) {
          Future.delayed(Duration.zero, () {
            Navigator.pop(context, cardServiceCode);
          });
        } else {
          setState(() {});
        }
      }
    }
  }

  Future<bool> askPermission() async {
    final Translate translate = lookupTranslate(LanguageStore.localeSelected);
    permissionStatus = await getCameraPermission();
    if (permissionStatus == PermissionStatus.granted) {
      return true;
    } else {
      if (permissionStatus == PermissionStatus.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text(translate.banCanCapQuyenTruyCapCameraMayChoUngDung)),
        );
      } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text(translate.choPhepUngDungTruyCapMayAnhCuaBan),
            content: Text(translate
                .banCanChoPhepCapquyenTruyCapMayAnhCuaBanDeSuDungTrongUngDung),
            actions: <Widget>[
              // if user deny again, we do nothing
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(translate.tuChoi),
              ),

              // if user is agree, you can redirect him to the app parameters :)
              TextButton(
                onPressed: () {
                  openAppSettings();
                  Navigator.pop(context);
                },
                child: Text(translate.dongY),
              ),
            ],
          ),
        );
      }
      return false;
    }
  }

  Future<PermissionStatus> getCameraPermission() async {
    final PermissionStatus permission = await Permission.camera.status;
    if (permission != PermissionStatus.granted
        // &&
        // permission != PermissionStatus.permanentlyDenied
        ) {
      final PermissionStatus permissionStatus =
          await Permission.camera.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  Future<void> _onPermissionSet(
      BuildContext context, QRViewController ctrl, bool p) async {
    if (!p) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('no Permission')),
      // );
    }
  }
}
