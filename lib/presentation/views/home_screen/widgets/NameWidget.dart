import 'package:flutter/material.dart';

// Widget to display first name of current user.  Includes optional prefix/suffix.
class FirstNameWidget extends StatefulWidget {
  final String? prefix;
  final String? suffix;

  FirstNameWidget({this.prefix, this.suffix});

  @override
  _FirstNameWidgetState createState() => _FirstNameWidgetState();
}

// Widget to display first and last name of current user.  Includes optional prefix/suffix.
class WholeNameWidget extends StatefulWidget {
  final String? prefix;
  final String? suffix;

  WholeNameWidget({this.prefix, this.suffix});

  @override
  _WholeNameWidgetState createState() => _WholeNameWidgetState();
}

// Waits for user to be authenticated, then diplays first name of current user with any prefix/suffix specified.
class _FirstNameWidgetState extends State<FirstNameWidget> {
  Widget build(BuildContext context) {
    return Container(child: Text('First Name Widget'));
    // return Container(
    //     child: BlocListener<AuthBloc, AuthState>(listener: (context, state) {
    //   if (state is AuthenticatedWithUserObject) {
    //     print(context.size);
    //   }
    // }, child: BlocBuilder<AuthBloc, AuthState>(
    //   builder: (context, state) {
    //     if (state is AuthenticatedWithUserObject) {
    //       // final name = state.user.firstName;
    //       final prefix = widget.prefix ?? "";
    //       final suffix = widget.suffix ?? "";

    //       return Text("$prefix _name_ $suffix",
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

// Waits for user to be authenticated, then diplays entire name of current user with any prefix/suffix specified.
class _WholeNameWidgetState extends State<WholeNameWidget> {
  Widget build(BuildContext context) {
    return Container(child: Text('First Name Widget state'));
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

    //       return Text("_prefix_firstName _lastName_suffix",
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
