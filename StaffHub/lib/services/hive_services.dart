import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:staffhub/models/leave_model.dart';
import 'package:staffhub/models/owner_model.dart';
import 'package:staffhub/models/salary_model.dart';
import 'package:staffhub/models/salaryadvance_model.dart';
import 'package:staffhub/models/staff_model.dart';

class HiveServices {
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(StaffModelAdapter());
    Hive.registerAdapter(SalaryModelAdapter());
    Hive.registerAdapter(SalaryadvanceModelAdapter());
    Hive.registerAdapter(OwnerModelAdapter());
    Hive.registerAdapter(LeaveModelAdapter());

    await Hive.openBox<LeaveModel>('leaveBox');
    await Hive.openBox<OwnerModel>('ownerBox');
    await Hive.openBox<SalaryadvanceModel>('salaryAdvanceBox');
    await Hive.openBox<SalaryModel>('salaryBox');
    await Hive.openBox<StaffModel>('staffBox');
  }
}
