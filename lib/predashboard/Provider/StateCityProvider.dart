import 'package:flutter/material.dart';

class StateCityProvider extends ChangeNotifier {
  String _selectedState = 'Select State';
  String _selectedCity = 'Select City';

  String get selectedState => _selectedState;
  String get selectedCity => _selectedCity;

  // Update the selected state and notify listeners
  void updateState(String state) {
    _selectedState = state;
    notifyListeners();
  }

  // Update the selected city and notify listeners
  void updateCity(String city) {
    _selectedCity = city;
    notifyListeners();
  }

  // Reset the values when leaving PageView
  void reset() {
    _selectedState = 'Select State';
    _selectedCity = 'Select City';
    notifyListeners();
  }
}
