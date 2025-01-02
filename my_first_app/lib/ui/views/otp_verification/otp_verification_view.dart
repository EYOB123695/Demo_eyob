import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/widgets/button.dart';
import 'package:my_first_app/widgets/signinoptionsbutton.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil

import 'otp_verification_viewmodel.dart';

class OtpVerificationView extends StackedView<OtpVerificationViewModel> {
  const OtpVerificationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OtpVerificationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Verify",
          style: TextStyle(
            fontSize: 20.sp, // Use sp for font size
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 18.h), // Use h for height
            Center(child: Image.asset("assets/images/otp.png")),
            SizedBox(height: 60.h),
            Text(
              "Enter OTP",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 30.sp),
            ),
            Text(
              "A 4 digit OTP has been sent to",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w200,
              ),
            ),
            Text(
              "+8801712345678",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 40.w), // Use w for width
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 50.w, // Use w for width
                    height: 50.h, // Use h for height
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: "",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(
                              8.0.r), // Use r for border radius
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(8.0.r),
                        ),
                      ),
                      onChanged: (value) {
                        viewModel.updateOtp(index, value);
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus(); // Auto-focus next
                        }
                      },
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 20.h),
            ButtonOne(
              label: "Next",
              onPressed: () {
                String otpCode = viewModel.getOtpCode();
              },
              width: 250.w, // Use w for width
            ),
            SizedBox(height: 20.h),
            Text("Resend OTP (00:12)"),
          ],
        ),
      ),
    );
  }

  @override
  OtpVerificationViewModel viewModelBuilder(BuildContext context) =>
      OtpVerificationViewModel();
}
