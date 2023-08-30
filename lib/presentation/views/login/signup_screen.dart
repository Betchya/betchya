// import 'package:betchya/logic/authentication/authentication_bloc/auth_bloc.dart';
// import 'package:betchya/presentation/views/login/login_screen.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:passwordfield/passwordfield.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({Key? key}) : super(key: key);

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _dateController = TextEditingController();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _birthdateController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _dateController.dispose();
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _birthdateController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff2C1D57),
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         iconTheme: const IconThemeData(
//           color: Colors.white,
//         ),
//         title: Text(
//           'Register',
//           textAlign: TextAlign.left,
//           style: GoogleFonts.inter(
//               fontWeight: FontWeight.w800, fontSize: 24, color: Colors.white),
//         ),
//       ),
//       body: BlocConsumer<AuthBloc, AuthState>(
//         listener: (context, state) {
//           if (state is Authenticated) {
//             _getUser(context);
//           }
//           if (state is AuthenticatedWithUserObject) {
//             // Navigating to the root screen if the user is authenticated
//             Navigator.of(context).pushNamed('/root');
//           }
//           if (state is AuthError) {
//             // Displaying the error message if the user is not authenticated
//             ScaffoldMessenger.of(context)
//                 .showSnackBar(SnackBar(content: Text(state.error)));
//           }
//         },
//         builder: (context, state) {
//           if (state is Loading) {
//             // Displaying the loading indicator while the user is signing up
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (state is AuthenticatedWithoutUserObject) {
//             return Center(
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     const SizedBox(
//                       height: 100,
//                     ),
//                     // Get additional information for User needed by database
//                     Text(
//                       'Please enter your information below.',
//                       style: GoogleFonts.inter(
//                           fontWeight: FontWeight.w800,
//                           fontSize: 24,
//                           color: Colors.white),
//                     ),
//                     TextFormField(
//                       keyboardType: TextInputType.text,
//                       controller: _firstNameController,
//                       decoration: const InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         hintText: 'First Name',
//                         border: OutlineInputBorder(),
//                       ),
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       validator: (value) {
//                         return value == null ? 'Enter your first name' : null;
//                       },
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       keyboardType: TextInputType.text,
//                       controller: _lastNameController,
//                       decoration: const InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         hintText: 'Last Name',
//                         border: OutlineInputBorder(),
//                       ),
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       validator: (value) {
//                         return value == null ? 'Enter your last name' : null;
//                       },
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                         keyboardType: TextInputType.text,
//                         controller: _birthdateController,
//                         decoration: const InputDecoration(
//                           filled: true,
//                           fillColor: Colors.white,
//                           hintText: 'Date of Birth (MM/DD/YYYY)',
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (context) {
//                           if (_checkBirthdate() == false) {
//                             return 'You must be 21 years old to have an account.';
//                           } else {
//                             return null;
//                           }
//                         }),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     SizedBox(
//                       height: 50,
//                       width: MediaQuery.of(context).size.width,
//                       child: ElevatedButton(
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all<Color>(
//                               Color.fromARGB(255, 1, 180, 153)),
//                         ),
//                         onPressed: () {
//                           _registerName(context);
//                         },
//                         child: const Text('Next'),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           }
//           if (state is UnAuthenticated) {
//             // Displaying the sign up form if the user is not authenticated
//             return Padding(
//               padding: const EdgeInsets.all(18.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 200.0,
//                     ),
//                     Text(
//                       'Register',
//                       textAlign: TextAlign.left,
//                       style: GoogleFonts.inter(
//                           fontWeight: FontWeight.w800,
//                           fontSize: 24,
//                           color: Colors.white),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const Text(
//                       'Sign up with email',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         fontSize: 13,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     Center(
//                       child: Form(
//                         key: _formKey,
//                         child: Column(
//                           children: [
//                             TextFormField(
//                               keyboardType: TextInputType.emailAddress,
//                               controller: _emailController,
//                               decoration: const InputDecoration(
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 hintText: 'Email',
//                                 border: OutlineInputBorder(),
//                               ),
//                               autovalidateMode:
//                                   AutovalidateMode.onUserInteraction,
//                               validator: (value) {
//                                 return value != null &&
//                                         !EmailValidator.validate(value)
//                                     ? 'Enter a valid email'
//                                     : null;
//                               },
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             PasswordField(
//                               passwordConstraint: r'[a-zA-Z@$#.*!0-9]{8}',
//                               errorMessage:
//                                   '8 + characters. 1 capital letter, number & special character',
//                               backgroundColor: Colors.white,
//                               controller: _passwordController,
//                             ),
//                             const SizedBox(
//                               height: 12,
//                             ),
//                             SizedBox(
//                               height: 50,
//                               width: MediaQuery.of(context).size.width,
//                               child: ElevatedButton(
//                                 style: ButtonStyle(
//                                   backgroundColor: MaterialStateProperty.all<
//                                           Color>(
//                                       const Color.fromARGB(255, 1, 180, 153)),
//                                 ),
//                                 onPressed: () {
//                                   _createAccountWithEmailAndPassword(context);
//                                 },
//                                 child: const Text('Next'),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Row(children: [
//                       const Text(
//                         'Already have an account?',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                       OutlinedButton(
//                         onPressed: () {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const LoginScreen()),
//                           );
//                         },
//                         child: const Text('Sign In'),
//                       ),
//                     ]),
//                     const Text(
//                       'Or continue with',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Ink(
//                           width: MediaQuery.of(context).size.width * 0.28,
//                           decoration: ShapeDecoration(
//                               color: Colors.white, shape: OutlineInputBorder()),
//                           child: IconButton(
//                             iconSize: 3,
//                             onPressed: () {
//                               _authenticateWithGoogle(context);
//                             },
//                             icon: Image.network(
//                               'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png',
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.03,
//                         ),
//                         Ink(
//                           width: MediaQuery.of(context).size.width * 0.28,
//                           decoration: ShapeDecoration(
//                               color: Colors.white, shape: OutlineInputBorder()),
//                           child: IconButton(
//                             iconSize: 3,
//                             onPressed: () {
//                               _authenticateWithApple(context);
//                             },
//                             icon: Image.network(
//                               'https://purepng.com/public/uploads/large/21502362885rmhziap3wm5w0jogfdubr1fgyzuycu5rqkam39wjhh7yhmcncxka3vxq3xglitq4iwze8v0gpi1wmolyrtqkts57kit8ibyd2apb.png',
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                             width: MediaQuery.of(context).size.width * 0.03),
//                         Ink(
//                           width: MediaQuery.of(context).size.width * 0.28,
//                           decoration: const ShapeDecoration(
//                               color: Colors.white, shape: OutlineInputBorder()),
//                           child: IconButton(
//                             iconSize: 3,
//                             onPressed: () {
//                               _authenticateWithFacebook(context);
//                             },
//                             icon: Image.network(
//                               'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/2021_Facebook_icon.svg/300px-2021_Facebook_icon.svg.png',
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }
//           return Container();
//         },
//       ),
//     );
//   }

//   void _createAccountWithEmailAndPassword(BuildContext context) {
//     if (_formKey.currentState!.validate()) {
//       BlocProvider.of<AuthBloc>(context).add(
//         SignUpRequested(
//           _emailController.text,
//           _passwordController.text,
//         ),
//       );
//     }
//   }

//   void _authenticateWithGoogle(BuildContext context) {
//     BlocProvider.of<AuthBloc>(context).add(
//       GoogleSignInRequested(),
//     );
//   }

//   void _authenticateWithApple(BuildContext context) {
//     BlocProvider.of<AuthBloc>(context).add(
//       AppleSignInRequested(),
//     );
//   }

//   void _authenticateWithFacebook(BuildContext context) {
//     BlocProvider.of<AuthBloc>(context).add(
//       FacebookSignInRequested(),
//     );
//   }

//   void _getUser(BuildContext context) {
//     BlocProvider.of<AuthBloc>(context).add(
//       UserObjectWasRequested(),
//     );
//   }

// // Add User to database
//   void _registerName(BuildContext context) {
//     if (_formKey.currentState!.validate()) {
//       BlocProvider.of<AuthBloc>(context).add(
//         RegisterName(_firstNameController.text, _lastNameController.text,
//             _birthdateController.text),
//       );
//     }
//   }

// // Validate over 21 as of today
//   bool _checkBirthdate() {
//     const datePattern = 'mm/dd/yyyy';
//     final today = DateTime.now();
//     final birthdateString = _birthdateController.text;
//     final parsedBirthdate = DateFormat(datePattern).parse(birthdateString);
//     final adultDate = DateTime(
//         parsedBirthdate.year + 21, parsedBirthdate.month, parsedBirthdate.day);
//     return adultDate.isBefore(today);
//   }
// }
