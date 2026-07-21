import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:staffhub/models/owner_model.dart';

class OwnerProvider extends ChangeNotifier {
  final Box<OwnerModel> box = Hive.box<OwnerModel>("ownerBox");
  List<OwnerModel> get l => box.values.toList();

  void AddOwnerToLocal(OwnerModel owner) {
    box.put(owner.ownerid, owner);
    notifyListeners();
  }
}
