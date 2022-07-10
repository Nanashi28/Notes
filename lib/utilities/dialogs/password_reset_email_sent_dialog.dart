import 'package:flutter/material.dart';
import 'package:notes/utilities/dialogs/generic_dialog.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: 'Password Reset',
    content:
        "We have sent you an email for a password reset link. Please check your spam/junk if you can't find the email.",
    optionsBuilder: () => {
      'OK': null,
    },
  );
}
