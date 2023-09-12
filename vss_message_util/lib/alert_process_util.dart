import 'package:flutter/material.dart';

class AlertProcessUtil {
  static void show(
    BuildContext context, {
    Color? color,
  }) {
    try {
      AlertDialog alert = AlertDialog(
        backgroundColor: Colors.white,
        content:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              // The loading indicator
              CircularProgressIndicator(),
              SizedBox(
                height: 15,
              ),
              // Some text
              Text('Đang xử lý...')
            ],
          ),
        ),
      );
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static void hide(
    BuildContext context) {
    try {
      //if(Get.isDialogOpen!){
        Navigator.of(context).pop();
      //}
    } catch (e) {
      print(e);
    }
  }
}
