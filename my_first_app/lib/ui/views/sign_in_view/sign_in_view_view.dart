import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/app/app.dart';
import 'package:my_first_app/widgets/button.dart';
import 'package:my_first_app/widgets/custom_input_fields';
import 'package:stacked/stacked.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:my_first_app/app/app.locator.dart';
import 'package:my_first_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil

import 'sign_in_view_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class SignInViewView extends StackedView<SignInViewViewModel> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInViewView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignInViewViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.w), // Use .w for padding
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.h), // Use .h for height
                child: Row(
                  children: [
                    Icon(Icons.arrow_back),
                    SizedBox(width: 70.w), // Use .w for spacing
                    Container(
                      color: Colors.transparent,
                      child: Center(
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: 120.w, // Use .w for width
                          height: 120.h, // Use .h for height
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    "Welcome Back! 👋 ",
                    style: GoogleFonts.poppins(
                        fontSize: 25.sp, // Use .sp for font size
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              CustomTextField(
                hintText: 'name@example.com',
                label: 'Email address',
                isPassword: false,
                controller: emailController,
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                hintText: 'Enter your Password',
                label: 'Enter Password',
                isPassword: true,
                controller: passwordController,
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align to the left
                children: [
                  GestureDetector(
                    onTap: () {
                      viewModel.toggleRememberMe();
                    },
                    child: Container(
                      width: 24.w, // Use .w for width
                      height: 24.h, // Use .h for height
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            viewModel.isChecked ? Colors.green : Colors.white,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: viewModel.isChecked
                          ? Icon(
                              Icons.check,
                              size: 16.sp, // Use .sp for icon size
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Remember Me',
                    style: TextStyle(
                      fontSize: 16.sp, // Use .sp for font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 17.w),
                  TextButton(
                    onPressed: () {
                      // Navigate using the Stacked NavigationService
                      locator<NavigationService>()
                          .navigateTo(Routes.otpVerificationView);
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        fontSize: 16.sp, // Use .sp for font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 164.h),
              ButtonOne(
                label: "Next",
                onPressed: () {},
                width: 250.w, // Use .w for width
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  SignInViewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignInViewViewModel();

  @override
  void onDispose(SignInViewViewModel viewModel) {
    super.onDispose(viewModel);
    emailController.dispose();
    passwordController.dispose();
  }
}
