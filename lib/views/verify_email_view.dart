import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/services/auth/bloc/auth_bloc.dart';
import 'package:notes/services/auth/bloc/auth_event.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(1),
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                ),
              ),
              child: const Text(
                  "We've sent you an Email verification, please open it to verify your account. Please check your spam / junk folder."),
            ),
            const Text(
                "If you haven't received an Email verification yet, please press the button below:"),
            ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(
                      const AuthEventSendEmailVerification(),
                    );
              },
              child: const Text('Send Email verification'),
            ),
            OutlinedButton(
              onPressed: () {
                context.read<AuthBloc>().add(
                      const AuthEventLogOut(),
                    );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 2.0, color: Colors.blue),
              ),
              child: const Text('Return to Login/Register'),
            ),
          ],
        ),
      ),
    );
  }
}
