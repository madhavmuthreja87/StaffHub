import 'package:hive/hive.dart';
part 'leave_model.g.dart';

@HiveType(typeId: 4)
class LeaveModel {
  @HiveField(0)
  final String leaveid;

  @HiveField(1)
  final String staffid;

  @HiveField(2)
  final String reason;

  @HiveField(3)
  final bool isFullDay;

  @HiveField(4)
  final DateTime leavedate;
  LeaveModel({
    required this.leaveid,
    required this.staffid,
    required this.reason,
    required this.isFullDay,
    required this.leavedate,
  });
}
