import 'package:hive/hive.dart';
part 'salaryadvance_model.g.dart';

@HiveType(typeId: 1)
class SalaryadvanceModel extends HiveObject {
  @HiveField(0)
  final String advancesalaryid;

  @HiveField(1)
  final String staffid;

  @HiveField(2)
  final double amount;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final String reason;
  SalaryadvanceModel({
    required this.advancesalaryid,
    required this.staffid,
    required this.amount,
    required this.date,
    required this.reason,
  });
}
