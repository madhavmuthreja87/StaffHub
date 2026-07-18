import 'package:hive/hive.dart';
part 'staff_model.g.dart';

@HiveType(typeId: 0)
class StaffModel extends HiveObject {
  @HiveField(0)
  final String staffid;

  @HiveField(1)
  final String ownerid;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final String address;

  @HiveField(5)
  final String role;

  @HiveField(6)
  final double salary;

  @HiveField(7)
  final String profileImage;

  @HiveField(8)
  final DateTime joiningDate;

  @HiveField(9)
  final bool todayPresent;

  StaffModel({
    required this.staffid,
    required this.ownerid,
    required this.name,
    required this.email,
    required this.address,
    required this.role,
    required this.salary,
    required this.profileImage,
    required this.joiningDate,
    required this.todayPresent,
  });
}
