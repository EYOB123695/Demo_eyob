import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/widgets/signinoptionsbutton.dart';
import 'package:stacked/stacked.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/gestures.dart'; // For TapGestureRecognizer

import 'sign_in_options_viewmodel.dart';

class SignInOptionsView extends StackedView<SignInOptionsViewModel> {
  const SignInOptionsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignInOptionsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png"),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Welcome to Afromile",
              style: GoogleFonts.poppins(
                  fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "   In publishing and graphic design,\nLorem is a placeholder text commonly",
            ),
            const SizedBox(height: 30),
            SignInButton(
                icon: Icons.phone,
                text: "Sign in with phone",
                isActive: viewModel.currentButtonIndex == 0,
                onPressed: () {
                  viewModel.updateCurrentButtonIndex(0);
                }),
            const SizedBox(height: 15),
            SignInButton(
                icon: FontAwesomeIcons.google,
                text: "Sign in with Google",
                isActive: viewModel.currentButtonIndex == 1,
                onPressed: () {
                  viewModel.updateCurrentButtonIndex(1);
                }),
            const SizedBox(height: 15),
            SignInButton(
                icon: Icons.email,
                text: "Sign in with Email",
                isActive: viewModel.currentButtonIndex == 2,
                onPressed: () {
                  viewModel.updateCurrentButtonIndex(2);
                }),
            const SizedBox(height: 15),
            SignInButton(
                icon: FontAwesomeIcons.apple,
                text: "Sign in with Apple",
                isActive: viewModel.currentButtonIndex == 3,
                onPressed: () {
                  viewModel.updateCurrentButtonIndex(3);
                }),
            const SizedBox(height: 28),
            // Here is the fixed part for "Don't have an account? Sign up" text
            RichText(
              text: TextSpan(
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black, // Default text color
                ),
                children: [
                  TextSpan(
                    text: "Don't have an account? ",
                  ),
                  TextSpan(
                    text: "Sign up",
                    style: TextStyle(
                      color: Colors.green, // Green color for "Sign up"
                      fontWeight: FontWeight.bold, // Optional: Make it bold
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigate to the SignUp page
                        // Uncomment and add your SignUp view here
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => SignUpView(),
                        //   ),
                        // );
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SignInOptionsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignInOptionsViewModel();
}
