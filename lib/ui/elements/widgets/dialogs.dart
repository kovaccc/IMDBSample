import 'package:flutter/material.dart';
import 'package:imdb_sample/ui/resources/colors.dart';
import 'package:imdb_sample/ui/resources/text_styles.dart';

import '../../../generated/l10n.dart';

class ErrorMessageDialog extends StatelessWidget {
  final String title;
  final String message;

  const ErrorMessageDialog(
      {Key? key, required this.title, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ImdbColors.primaryBlack,
      title: Text(title, style: ImdbTextStyles.heading1SfWhiteBold),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(message, style: ImdbTextStyles.paragraph2SfWhite),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child:
              Text(S.of(context).ok, style: ImdbTextStyles.paragraph2SfWhite),
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
