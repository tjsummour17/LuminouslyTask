import 'package:flutter/cupertino.dart';
import 'package:luminously/src/common/models/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User? value, {bool notify = true}) {
    _user = value;
    if (notify) {
      notifyListeners();
    }
  }
}
