import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/widgets/CustomLogoButton.dart';
import 'package:my_first_app/widgets/button.dart';
import 'package:my_first_app/widgets/custom_input_fields';
import 'package:stacked/stacked.dart';

import 'signup_viewmodel.dart';

class SignupView extends StackedView<SignupViewModel> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController repeatpasswordController =
      TextEditingController();
  SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_back),
                  const SizedBox(width: 70),
                  Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.only(top: 27),
                      child: Center(
                          child: Image.asset(
                        "assets/images/logo.png",
                        width: 120,
                        height: 120,
                      )),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Center(
                child: Text(
                  "Create Account",
                  style: GoogleFonts.poppins(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15),
              CustomTextField(
                  hintText: 'Enter your Name',
                  label: 'Full Name',
                  isPassword: false,
                  controller: fullnameController),
              CustomTextField(
                  hintText: '+123 456 789 ',
                  label: 'Phone Number',
                  isPassword: false,
                  controller: phonenumberController),
              CustomTextField(
                  hintText: 'Enter Your Password',
                  label: 'Enter Your Password',
                  isPassword: true,
                  controller: passwordController),
              CustomTextField(
                  hintText: 'Repeat New password ',
                  label: 'Enter your password',
                  isPassword: true,
                  controller: repeatpasswordController),
              Row(children: [
                GestureDetector(
                  onTap: () {
                    viewModel.toggleRememberMe();
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: viewModel.isChecked ? Colors.green : Colors.white,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: viewModel.isChecked
                        ? Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
                SizedBox(
                  width: 9,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text.rich(
                    TextSpan(
                      text: 'By registering, you are agreeing with our\n',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Terms of use',
                          style: TextStyle(
                            color: Colors.green,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle Terms of Use link tap
                              print('Terms of Use clicked');
                              // Navigate to Terms of Use page or open a URL
                            },
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: Colors.green,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('Privacy Policy clicked');
                            },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
              const SizedBox(height: 20),
              ButtonOne(
                label: "Next",
                onPressed: () {},
                width: 250.0,
              ),
              const SizedBox(height: 10),
              Text(
                "Or connect via",
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w200),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 4, // 40% of the available space
                    child: CustomLogoButton(
                      logoPath: "assets/images/googlelogo.png",
                      backgroundColor: Colors.white,
                      onPressed: () {
                        print('Google button pressed');
                      },
                      height: 20.0, // Adjust height as needed
                    ),
                  ),
                  const SizedBox(width: 10), // Space between buttons
                  Expanded(
                    flex: 4, // 40% of the available space
                    child: CustomLogoButton(
                      logoPath: "assets/images/applelogo.png",
                      backgroundColor: Colors.white,
                      onPressed: () {
                        print('Apple button pressed');
                      },
                      height: 20.0, // Adjust height as needed
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
