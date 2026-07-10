class StaffModel {
  final String staffid;
  final String ownerid;
  final String name;
  final String email;
  final String address;
  final String role;
  final int salary;
  final String profileImage;
  final DateTime joiningDate;

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
  });
}
