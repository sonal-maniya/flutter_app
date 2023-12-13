import 'package:flutter/foundation.dart';

class FavoriteProvider with ChangeNotifier {
  List<int> _selectedItem = [];

  List<int> get selectedItem => _selectedItem;

  void manageFavorite(int item) {
    if (_selectedItem.contains(item)) {
      _selectedItem.remove(item);
    } else {
      _selectedItem.add(item);
    }
    notifyListeners();
  }
}
