import 'package:factorymethodart/factories/dialog_action.dart';
import 'package:factorymethodart/factories/idialog.dart';
import 'package:flutter/cupertino.dart';

class IosDialog implements IDialog {
  @override
  Widget create(BuildContext context, Widget title, Widget content,
      List<DialogAction> actions) {
    return CupertinoAlertDialog(
        title: title,
        content: content,
        actions: actions.map<Widget>((e) {
          return CupertinoButton(child: e.child, onPressed: e.onPressed);
        }).toList());
  }
}
