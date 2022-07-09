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
      body: Column(
        children: [
          const Text(
              "We've sent you an Email verification, please open it to verify your account. Please check your spam / junk folder."),
          const Text(
              "If you haven't received an Email verification yet, please press the button below:"),
          TextButton(
            onPressed: () {
              context.read<AuthBloc>().add(
                    const AuthEventSendEmailVerification(),
                  );
            },
            child: const Text('Send Email verification'),
          ),
          TextButton(
            onPressed: () {
              context.read<AuthBloc>().add(
                    const AuthEventLogOut(),
                  );
            },
            child: const Text('Return to Login/Register'),
          ),
        ],
      ),
    );
  }
}
