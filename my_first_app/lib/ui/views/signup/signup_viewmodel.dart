import 'package:stacked/stacked.dart';

class SignupViewModel extends BaseViewModel {
  bool _isChecked = false;
  bool get isChecked => _isChecked;

  void toggleRememberMe() {
    _isChecked = !_isChecked;
    notifyListeners();
  }
}
