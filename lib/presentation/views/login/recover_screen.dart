// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class RecoverScreen extends StatefulWidget {
//   const RecoverScreen({Key? key}) : super(key: key);

//   @override
//   State<RecoverScreen> createState() => _RecoverScreenState();
// }

// class _RecoverScreenState extends State<RecoverScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color(0xff2C1D57),
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           iconTheme: IconThemeData(
//             color: Colors.white,
//           ),
//           title: Text(
//             "Recover",
//             textAlign: TextAlign.left,
//             style: GoogleFonts.inter(
//                 fontWeight: FontWeight.w800, fontSize: 24, color: Colors.white),
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: SingleChildScrollView(
//               child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.1,
//               ),
//               Text(
//                 "Enter your Email and we will send you a link to recover your password",
//                 style: TextStyle(color: Colors.grey),
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               Text("Email", style: TextStyle(color: Colors.grey)),
//               TextFormField(
//                 key: _formKey,
//                 keyboardType: TextInputType.emailAddress,
//                 controller: _emailController,
//                 decoration: const InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   hintText: "Email",
//                   border: OutlineInputBorder(),
//                 ),
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 validator: (value) {
//                   return value != null && !EmailValidator.validate(value)
//                       ? 'Enter a valid email'
//                       : null;
//                 },
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.50),
//               SizedBox(
//                 height: 50,
//                 width: MediaQuery.of(context).size.width,
//                 child: ElevatedButton(
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(
//                         Color.fromARGB(255, 1, 180, 153)),
//                   ),
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       Navigator.pop(context);
//                     }
//                   },
//                   child: const Text('Next'),
//                 ),
//               )
//             ],
//           )),
//         ));
//   }
// }
