import 'package:flutter/cupertino.dart';
import 'package:luminously/src/common/api/api_repo.dart';
import 'package:luminously/src/common/models/doctor.dart';

class DashboardViewModel with ChangeNotifier {
  final ApiRepo _repo = ApiRepo();
  List<Doctor> _doctors = [];
  bool _isLoading = true;

  List<Doctor> get doctors => _doctors;

  bool get isLoading => _isLoading;

  Future<void> fetchDoctors() async {
    _isLoading = true;
    _doctors = await _repo.getDoctorsInfo();
    _isLoading = false;
    notifyListeners();
  }

  void onSearchDoctor(String searchValue) async {
    if (searchValue.isNotEmpty) {
      _doctors = _doctors
          .where(
            (element) => element.doctorName
                .toLowerCase()
                .contains(searchValue.toLowerCase()),
          )
          .toList();
      notifyListeners();
    } else {
      fetchDoctors();
    }
  }
}
