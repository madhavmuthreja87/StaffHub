import 'package:flutter/material.dart';

import 'package:staffhub/models/owner_model.dart';

class OwnerProvider extends ChangeNotifier {
  List<OwnerModel> _owner = [];
  List<OwnerModel> get l => _owner;
  void AddOwner(OwnerModel owner) {
    l.add(owner);
    notifyListeners();
  }
}
