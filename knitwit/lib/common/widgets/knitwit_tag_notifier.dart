import 'package:flutter/material.dart';

import 'widgets.dart';

class KnitwitTagNotifier extends ChangeNotifier {
  List<KnitwitTag> _tags = [];

  List<KnitwitTag> get tags => _tags;

  void setTags(List<KnitwitTag> tags) {
    _tags = tags;
    notifyListeners();
  }

  void toggleTagSelection(String tagName) {
    final tag = _tags.firstWhere((tag) => tag.text == tagName);
    tag.isSelected = !tag.isSelected;
    notifyListeners();
  }

  List<String> get selectedTags {
    return _tags.where((tag) => tag.isSelected).map((tag) => tag.text).toList();
  }
}

