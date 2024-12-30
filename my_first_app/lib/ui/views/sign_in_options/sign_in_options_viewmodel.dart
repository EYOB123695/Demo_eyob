import 'package:stacked/stacked.dart';

class SignInOptionsViewModel extends BaseViewModel {
  int? _currentButtonIndex;
  int? get currentButtonIndex => _currentButtonIndex;

  void updateCurrentButtonIndex(index) {
    _currentButtonIndex = index;
    notifyListeners();
  }
}
