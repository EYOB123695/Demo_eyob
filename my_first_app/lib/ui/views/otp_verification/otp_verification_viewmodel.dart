import 'package:stacked/stacked.dart';

class OtpVerificationViewModel extends BaseViewModel {
  List<String> _otp = ["", "", "", ""]; // To store OTP digits

  List<String> get otp => _otp;

  void updateOtp(int index, String value) {
    if (index >= 0 && index < _otp.length) {
      _otp[index] = value;
      notifyListeners(); // Notify the UI to rebuild
    }
  }

  String getOtpCode() {
    return _otp.join(); // Combine digits into a single string
  }
}
