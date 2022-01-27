import 'package:factorymethodart/factories/dialog_action.dart';
import 'package:factorymethodart/factories/idialog.dart';
import 'package:flutter/material.dart';

class AndroidDialog implements IDialog {
  @override
  Widget create(BuildContext context, Widget title, Widget content,
      List<DialogAction> actions) {
    return AlertDialog(
        content: content,
        actions: actions.map<Widget>((e) {
          return TextButton(child: e.child, onPressed: e.onPressed);
        }).toList());
  }
}
