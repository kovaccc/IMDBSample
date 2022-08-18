import 'package:flutter/material.dart';

class ErrorMessageDialog extends StatelessWidget {
  final String title;
  final String message;

  const ErrorMessageDialog(
      {Key? key, required this.title, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: KiKTextStyles.heading4GrayBold),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(message, style: KiKTextStyles.paragraph1GrayBold),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(S.of(context).ok, style: KiKTextStyles.paragraph1RedBold),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}

void showErrorDialog(BuildContext context, String title, String message) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return ErrorMessageDialog(title: title, message: message);
    },
  );
}
