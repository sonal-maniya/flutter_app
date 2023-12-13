import 'package:flutter/foundation.dart';

class ExampleOneProvider with ChangeNotifier {
  double _sliderValue = 1.0;

  double get sliderValue => _sliderValue;

  void setSliderValue(double value) {
    _sliderValue = value;
    notifyListeners();
  }
}
