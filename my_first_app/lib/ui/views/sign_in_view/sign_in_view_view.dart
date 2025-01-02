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

import 'sign_in_view_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class SignInViewView extends StackedView<SignInViewViewModel> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // final bool _isChecked = false;
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
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back),
                      const SizedBox(width: 70),
                      Container(
                        color: Colors.transparent,
                        child: Center(
                            child: Image.asset(
                          "assets/images/logo.png",
                          width: 120,
                          height: 120,
                        )),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Welcome Back! 👋 ",
                      style: GoogleFonts.poppins(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                CustomTextField(
                  hintText: 'name@example.com',
                  label: 'Email adress',
                  isPassword: false,
                  controller: emailController,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: 'Enter  your Password',
                  label: 'Enter Password',
                  isPassword: true,
                  controller: passwordController,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Align to the left
                  children: [
                    GestureDetector(
                      onTap: () {
                        viewModel.toggleRememberMe();
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              viewModel.isChecked ? Colors.green : Colors.white,
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
                    const SizedBox(width: 8),
                    Text(
                      'Remember Me',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 17),
                    TextButton(
                      onPressed: () {
                        // Navigate using the Stacked NavigationService
                        locator<NavigationService>()
                            .navigateTo(Routes.otpVerificationView);
                      },
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 164),
                ButtonOne(
                  label: "Next",
                  onPressed: () {},
                  width: 250.0,
                )
              ],
            )),
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
