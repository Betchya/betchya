import 'package:betchya/logic/authentication/authentication_bloc/auth_bloc.dart';
import 'package:betchya/presentation/views/login/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:betchya/logic/API_calls.dart';

class UpdateEmail extends StatefulWidget {
  const UpdateEmail({Key? key}) : super(key: key);

  @override
  State<UpdateEmail> createState() => _UpdateEmailState();
}

class _UpdateEmailState extends State<UpdateEmail> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  String? email;
  bool checked = true;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff2C1D57),
        body: Column(children: [
          Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  // Get additional information for User needed by database
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Please update your information below.",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w800,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _emailController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "email",
                        border: OutlineInputBorder(),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return value != null && !EmailValidator.validate(value)
                            ? 'Enter a valid email'
                            : null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 1, 180, 153)),
                          ),
                          onPressed: () {
                            APIWrangler()
                                .updateEmail(_emailController.text)
                                .then((user) {
                              print(user);
                              if (user != null) {
                                AuthenticatedWithUserObject(user);
                              }
                            });
                          },
                          child: const Text('Next'),
                        ),
                      )),
                ],
              ),
            ),
          )
        ]));
  }
}
