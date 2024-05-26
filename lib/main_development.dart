import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart'
    as AmplifyCognito;
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:betchya/main_auth.dart';
import 'package:betchya/presentation/views/root_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'amplify_configuration.dart';
import 'amplifyconfiguration.dart';
import 'cognito_manager.dart';
import 'logic/events/events_bloc.dart';
import 'logic/navigation/navigation_cubit.dart';
import 'logic/points/points_cubit.dart';
import 'logic/rewards/rewards_bloc.dart';

/*
    This page connects the AWS authentication backend to the frontend and handles the sign-up and sign-in logic for the user.
*/

bool isUserSignedIn = false;

// Check if the user is signed in or not, set global variable
Future<void> checkUserStatus() async {
  try {
    final session = await Amplify.Auth.fetchAuthSession();
    isUserSignedIn = session.isSignedIn;
    print("isUserSignedIN: $isUserSignedIn");
  } catch (e) {
    print("Error checking sign in status: $e");
  }
}

/* Configures Amplify for the app per Flutter docs
Uses the imported amplifyconfig object to connect to our user pool
*/
Future<void> _configureAmplify() async {
  try {
    await Amplify.addPlugin(AmplifyCognito.AmplifyAuthCognito());
    await Amplify.configure(amplifyconfig);
    safePrint('Successfully configured');
  } on Exception catch (e) {
    safePrint('Error configuring Amplify: $e');
  }
}

// Check if the user is currently signed in and go to the homepage if true
Future<void> _isSignedIn(BuildContext context) async {
  try {
    final session = await Amplify.Auth.fetchAuthSession();
    if (session.isSignedIn) {
      // Navigate to the homepage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  } catch (e) {
    print('Error checking if user is signed in: $e');
  }
}

// Main function that runs the application after initializing Amplify
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await _configureAmplify();
    await checkUserStatus();
    runApp(const MyApp());
  } on AmplifyException catch (e) {
    runApp(Text("Error configuring Amplify: ${e.message}"));
  }
}

// Main page of the app that has tabs for signing in and signing up
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Betchya',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xff2C1D57),
            statusBarIconBrightness: Brightness.light,
          ),
        ),
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Betchya'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Sign-Up'),
                Tab(text: 'Sign-In'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SignUpView(),
              CustomAuthenticator(),
            ],
          ),
        ),
      ),
    );
  }
}

// These two classes contain the logic for the sign in page
class CustomAuthenticator extends StatefulWidget {
  @override
  _CustomAuthenticatorState createState() => _CustomAuthenticatorState();
}

class _CustomAuthenticatorState extends State<CustomAuthenticator> {
  // Set up text fields for the user to enter credentials
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late final CognitoManager _cognitoManager;

  @override
  void initState() {
    super.initState();
    _cognitoManager = CognitoManager();
    _initCognitoManager();
    // check if user is signed in already
    _isSignedIn(context);
  }

  Future<void> _initCognitoManager() async {
    await _cognitoManager.init();
  }

  // This will be called when the user clicks the sign-in button and calls the Amplify signIn method
  void _signIn() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      final result = await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
      AmplifyCognito.CognitoAuthSession session =
          await Amplify.Auth.fetchAuthSession()
              as AmplifyCognito.CognitoAuthSession;
      safePrint('Is User Signed in: ${session.isSignedIn}');

      if (session.isSignedIn) {
        print("User is signed in!");

        // Accessing and printing the ID and Access Tokens
        print("ID Token: ${session.userPoolTokens?.idToken}");
        print("Access Token: ${session.userPoolTokens?.accessToken}");

        // context.go('/root');
        // Once the user is signed in, take them to the homepage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } on AuthException catch (e) {
      safePrint('Error signing in: ${e}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    }
  }

  // Frontend widget to display the sign in fields to the user
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _signIn,
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}

// These two classes contain the logic for the sign up page
class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  // Define all of the fields the user will need to enter
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  DateTime? _selectedBirthdate;
  late final CognitoManager _cognitoManager;

  @override
  void initState() {
    super.initState();
    _cognitoManager = CognitoManager();
    _initCognitoManager();
    // Make sure the user isn’t already signed in
    _isSignedIn(context);
  }

  Future<void> _initCognitoManager() async {
    await _cognitoManager.init();
  }

// Returns the age of the user based on the date that they entered
  int _getAge(DateTime birthdate) {
    DateTime today = DateTime.now();
    int age = today.year - birthdate.year;
    if (today.month < birthdate.month ||
        (today.month == birthdate.month && today.day < birthdate.day)) {
      age--;
    }
    return age;
  }

// This will be called when the user clicks the sign-up button and calls the Amplify signUp method
  Future<void> signUpUser() async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;
    final email = _emailController.text;
    final birthdate = _selectedBirthdate;

    if (birthdate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select your birthdate')),
      );
      return;
    }

// Make sure the user enters all of the required fields
    if (username.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        email.isEmpty ||
        _selectedBirthdate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill out all fields')),
      );
      return;
    }

// Make sure that the user is 21 or older
    if (_getAge(birthdate) < 21) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You must be at least 21 years old to sign up')),
      );
      return;
    }

// Make sure that the two passwords match
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }
    //commit user input attributes to Amplify server
    try {
      final userAttributes = {
        AuthUserAttributeKey.email: email,
        AuthUserAttributeKey.birthdate:
            DateFormat('yyyy-MM-dd').format(birthdate!),
      };
      //asynchronously check if user was able to successfully sign up
      final result = await Amplify.Auth.signUp(
        username: username,
        password: password,
        options: SignUpOptions(
          userAttributes: userAttributes,
        ),
      );
      await _handleSignUpResult(result, password);
    } on AuthException catch (e) {
      safePrint('Error signing up user: ${e.message}');
    }
  }

//handles whether signup will require authentication or not
  Future<void> _handleSignUpResult(SignUpResult result, String password) async {
//check if there are additional signup steps (verifications)
    switch (result.nextStep.signUpStep) {
      case AuthSignUpStep.confirmSignUp:
        final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
        _handleCodeDelivery(codeDeliveryDetails);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ConfirmationScreen(
                    username: _usernameController.text,
                    password: password,
                  )),
        );
        break;
      case AuthSignUpStep.done:
        safePrint('Sign up is complete');
        break;
    }
  }

//intended to inform the user about further signup verification
  void _handleCodeDelivery(AuthCodeDeliveryDetails codeDeliveryDetails) {
    safePrint(
      'A confirmation code has been sent to ${codeDeliveryDetails.destination}. '
      'Please check your ${codeDeliveryDetails.deliveryMedium.name} for the code.',
    );
  }

// Date-picker for age verification aspect of sign-up page
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Set initial times
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedBirthdate) {
      setState(() {
        _selectedBirthdate = picked;
      });
    }
  }

// UI for the signup screen including input form
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //sign-up form input fields
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            Row(
              //date-picker for age verification in UI
              children: [
                //ensure date is chosen, otherwise state date
                Text(
                  _selectedBirthdate == null
                      ? 'No date chosen!'
                      : 'Birthdate: ${DateFormat('yyyy-MM-dd').format(_selectedBirthdate!)}',
                ),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Choose Date'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: signUpUser,
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

// Handles the user-confirmation step of the signup process with AWS
class ConfirmationScreen extends StatefulWidget {
  final String username;
  final String password;

  ConfirmationScreen({required this.username, required this.password});

  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

// Handles logic on whether or not confirmation is necessary in signup process
class _ConfirmationScreenState extends State<ConfirmationScreen> {
  final _confirmationCodeController = TextEditingController();

  Future<void> _confirmSignUp() async {
    final confirmationCode = _confirmationCodeController.text.trim();

    try {
//asynchronously check if signup has been completed
      final result = await Amplify.Auth.confirmSignUp(
        username: widget.username,
        confirmationCode: confirmationCode,
      );

      if (result.isSignUpComplete) {
        await _signIn(widget.username, widget.password);
        // Navigate to the homepage or sign-in page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        // Handle other steps if needed
      }
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error confirming sign up: ${e.message}')),
      );
    }
  }

// Handle signin with Amplify
  Future<void> _signIn(String username, String password) async {
    try {
//asynchronously grab signin information from server
      final result = await Amplify.Auth.signIn(
        username: username,
        password: password,
      );

      if (result.isSignedIn) {
//navigate to main page if user has been successfully signed in
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error signing in user')),
        );
      }
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing in user: ${e.message}')),
      );
    }
  }

// Widget for a signup confirmation screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Confirm Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _confirmationCodeController,
              decoration: InputDecoration(labelText: 'Confirmation Code'),
            ),
            ElevatedButton(
              onPressed: _confirmSignUp,
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}

// Home screen for demo purposes to show that a user has successfully
// logged into the app through the server. To be hooked up to a root
// page at a later date.
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchUserData(), // Fetch username asynchronously
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading indicator while fetching username
          return CircularProgressIndicator();
        } else {
          // Once username is fetched, build the UI
          // final username = snapshot.data as String?;
          final userData = snapshot.data as Map<String, dynamic>;
          final username = userData['username'] as String?;
          final userId = userData['userId'] as String?;
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome, $username!'),
                  Text("User ID: $userId"),
                  ElevatedButton(
                    onPressed: () => _signOut(context),
                    child: Text('Sign Out'),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

//signout functionalities with Amplify
  void _signOut(BuildContext context) async {
    try {
      // Perform sign-out operation
      await Amplify.Auth.signOut();

      // Navigate back to the sign-in page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
      // context.go('/signup');
    } on AuthException catch (e) {
      // Handle sign-out error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    } catch (e) {
      // Handle other errors
      print('An error occurred during sign out: $e');
    }
  }
}

// Function to grab user data from an Amplify server
Future<Map<String, dynamic>> fetchUserData() async {
  try {
// Asynchronously grab user data from server
    final user = await Amplify.Auth.getCurrentUser();
    final username = user.username;
    final userId = user.userId; // Assuming client ID is the user ID
    return {
      'username': username,
      'userId': userId,
    };
  } on AuthException catch (e) {
    safePrint('Error fetching user data: ${e.message}');
    throw 'Error fetching user data: ${e.message}';
  }
}
