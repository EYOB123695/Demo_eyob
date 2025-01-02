import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/widgets/CustomLogoButton.dart';
import 'package:my_first_app/widgets/button.dart';
import 'package:my_first_app/widgets/custom_input_fields';

import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil

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
          padding: EdgeInsets.only(
              left: 25.0.w, right: 25.0.w), // Use ScreenUtil for padding
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_back, size: 20.sp), // Scale icon size
                  SizedBox(width: 70.w), // Scale width
                  Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 27.h), // Scale vertical padding
                      child: Center(
                          child: Image.asset(
                        "assets/images/logo.png",
                        width: 120.w, // Scale width
                        height: 120.h, // Scale height
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Center(
                child: Text(
                  "Create Account",
                  style: GoogleFonts.poppins(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold), // Scale font size
                ),
              ),
              SizedBox(height: 15.h),
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
                    width: 24.w, // Scale width
                    height: 24.h, // Scale height
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: viewModel.isChecked ? Colors.green : Colors.white,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: viewModel.isChecked
                        ? Icon(
                            Icons.check,
                            size: 16.sp, // Scale icon size
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
                SizedBox(width: 9.w),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
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
                              print('Terms of Use clicked');
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
              SizedBox(height: 20.h),
              ButtonOne(
                label: "Next",
                onPressed: () {},
                width: 250.w, // Scale button width
              ),
              SizedBox(height: 10.h),
              Text(
                "Or connect via",
                style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w200), // Scale font size
              ),
              SizedBox(height: 10.h),
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
                      height: 20.h, // Scale height
                    ),
                  ),
                  SizedBox(width: 10.w), // Space between buttons
                  Expanded(
                    flex: 4, // 40% of the available space
                    child: CustomLogoButton(
                      logoPath: "assets/images/applelogo.png",
                      backgroundColor: Colors.white,
                      onPressed: () {
                        print('Apple button pressed');
                      },
                      height: 20.h, // Scale height
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
