import 'package:hive/hive.dart';
part 'salary_model.g.dart';

@HiveType(typeId: 2)
class SalaryModel extends HiveObject {
  @HiveField(0)
  final String salaryid;

  @HiveField(1)
  final String staffid;

  @HiveField(2)
  final double salary;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final double deduction;

  @HiveField(5)
  final bool ispaid;

  SalaryModel({
    required this.salaryid,
    required this.staffid,
    required this.salary,
    required this.date,
    required this.deduction,
    required this.ispaid,
  });
}
