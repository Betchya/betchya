import 'package:flutter/material.dart';

// Widget to display first name of current user.  Includes optional prefix/suffix.
class FormattedEmailWidget extends StatefulWidget {
  @override
  _FormattedEmailWidgetState createState() => _FormattedEmailWidgetState();
}

// Widget to display first name of current user.  Includes optional prefix/suffix.
class EmailWidget extends StatefulWidget {
  @override
  _EmailWidgetState createState() => _EmailWidgetState();
}

// Widget to display first and last name of current user.  Includes optional prefix/suffix.
class ProfileNameWidget extends StatefulWidget {
  final String? prefix;
  final String? suffix;

  ProfileNameWidget({this.prefix, this.suffix});

  @override
  _ProfileNameWidgetState createState() => _ProfileNameWidgetState();
}

// Waits for user to be authenticated, then diplays first name of current user with any prefix/suffix specified.
class _FormattedEmailWidgetState extends State<FormattedEmailWidget> {
  Widget build(BuildContext context) {
    return Container(child: Text('Formatted Email Widget state'));
    // return Container(
    //     child: BlocListener<AuthBloc, AuthState>(listener: (context, state) {
    //   if (state is AuthenticatedWithUserObject) {
    //     print(context.size);
    //   }
    // }, child: BlocBuilder<AuthBloc, AuthState>(
    //   builder: (context, state) {
    //     if (state is AuthenticatedWithUserObject) {
    //       // final email = state.user.email;

    //       return Text('_email_',
    //           style: TextStyle(
    //               fontSize: 22,
    //               color: Colors.white,
    //               fontWeight: FontWeight.w600));
    //     } else {
    //       return Text("Ha ha");
    //     }
    //   },
    // )));
  }
}

// Waits for user to be authenticated, then diplays first name of current user with any prefix/suffix specified.
class _EmailWidgetState extends State<EmailWidget> {
  Widget build(BuildContext context) {
    return Container(child: Text('Email Widget state'));
    // return Container(
    //     child: BlocListener<AuthBloc, AuthState>(listener: (context, state) {
    //   if (state is AuthenticatedWithUserObject) {
    //     print(context.size);
    //   }
    // }, child: BlocBuilder<AuthBloc, AuthState>(
    //   builder: (context, state) {
    //     if (state is AuthenticatedWithUserObject) {
    //       // final email = state.user.email;

    //       return Text(
    //           // "$email",
    //           '_email_');
    //     } else {
    //       return Text("Ha ha");
    //     }
    //   },
    // )));
  }
}

// Waits for user to be authenticated, then diplays entire name of current user with any prefix/suffix specified.
class _ProfileNameWidgetState extends State<ProfileNameWidget> {
  Widget build(BuildContext context) {
    return Container(child: Text('Profile Name Widget state'));
    // return Container(
    //     child: BlocListener<AuthBloc, AuthState>(listener: (context, state) {
    //   if (state is AuthenticatedWithUserObject) {
    //     print(context.size);
    //   }
    // }, child: BlocBuilder<AuthBloc, AuthState>(
    //   builder: (context, state) {
    //     if (state is AuthenticatedWithUserObject) {
    //       // final firstName = state.user.firstName;
    //       // final lastName = state.user.lastName;
    //       final prefix = widget.prefix ?? "";
    //       final suffix = widget.suffix ?? "";

    //       return Text("_prefix_firstName _lastName$suffix");
    //     } else {
    //       return Text("Ha ha");
    //     }
    //   },
    // )));
  }
}
