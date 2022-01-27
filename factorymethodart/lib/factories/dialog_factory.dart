import 'dart:io';

import 'package:factorymethodart/factories/android_dialog.dart';
import 'package:factorymethodart/factories/dialog_action.dart';
import 'package:factorymethodart/factories/idialog.dart';
import 'package:factorymethodart/factories/ios_dialog.dart';
import 'package:flutter/material.dart';

class DialogFactory {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Future showAlertDialog<T>({
    Widget? title,
    Widget? content,
    List<DialogAction>? actions,
  }) {
    IDialog dialogData;

    if (Platform.isIOS) {
      dialogData = IosDialog();
    } else {
      dialogData = AndroidDialog();
    }

    return showDialog(
      context: navigatorKey.currentState!.overlay!.context,
      builder: (context) => dialogData.create(
          context,
          title ?? Text("Não informado"),
          content ?? Text("Não informado"),
          actions ?? []),
    );
  }
}
