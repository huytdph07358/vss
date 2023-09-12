import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'route_builders.dart';

Future goPage(context, page, {required String router, bool repl = false}) {
  if (repl)
    return replace(context, page, router);
  else
    return removeUntil(context, page, router, popCount: 0);
}

Future<Object?> removeUntil<T extends Object>(
    BuildContext context, Widget page, String name,
    {required int popCount}) {
  int count = 0;
  return Navigator.pushAndRemoveUntil(context, pageRoute(page, router: name),
      (Route<dynamic> route) => popCount > 0 ? (count++ == popCount) : false);
}

Future popUp<T extends Object>(Widget screen, BuildContext context) {
  return Navigator.push(context, SlideUpRoute(screen));
}

Future popUpPage<T extends Object>(
  Widget screen,
  BuildContext context, {
  String routeName = '',
  bool replace = false,
}) {
  print("updateRouteName:$routeName");
  if (replace) {
    return Navigator.pushReplacement(
        context, SlideBottomRoute(screen, routeName));
  }
  return Navigator.push<T>(context, SlideBottomRoute(screen, routeName));
}

popToPageWithRoute(BuildContext context, {required String route}) {
  Navigator.popUntil(context, ModalRoute.withName(route));
}

///warn: dangerous, $number must be exact
///damages: black screen, unwanted page popped
/// ==> todo:
/// check others method use $numCount
/// use Navigator.popUntil(
///              context, ModalRoute.withName(RoutePaths.routeName));
@deprecated
popUntil(context, number) {
  if (number > 0) {
    int count = 0;
    Navigator.popUntil(context, (route) => count++ == number);
  }
}

Future<Object?> replace<T extends Object>(
    BuildContext context, Widget page, String name) {
  return Navigator.pushReplacement(context, pageRoute(page, router: name));
}

Future goTrans<T extends Object>(BuildContext context, Widget page) {
  return Navigator.push(
      context, TransparentRoute(builder: (BuildContext context) => page));
}

Future go<T extends Object>(BuildContext context, Widget page,
    {bool cuper = true}) {
  if (cuper)
    return Navigator.push(
        context, CupertinoPageRoute(builder: (context) => page));
  return Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

Future goWithRoute<T extends Object>(
    BuildContext context, Widget page, String router,
    {bool cuper = true}) {
  if (cuper)
    return Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => page, settings: RouteSettings(name: router)));
  return Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => page, settings: RouteSettings(name: router)));
}

//non typed
pageRoute(page, {required String router, bool cuper = true}) {
  return cuper
      ? CupertinoPageRoute(
          builder: (context) => page, settings: RouteSettings(name: router))
      : MaterialPageRoute(
          builder: (context) => page, settings: RouteSettings(name: router));
}
