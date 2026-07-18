import 'package:hive/hive.dart';
part 'owner_model.g.dart';

@HiveType(typeId: 3)
class OwnerModel {
  @HiveField(0)
  final String ownerid;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String shopname;

  @HiveField(4)
  final String shopaddress;

  @HiveField(5)
  final String businesstype;

  @HiveField(6)
  final String profileImage;
  OwnerModel({
    required this.ownerid,
    required this.name,
    required this.email,
    required this.shopname,
    required this.shopaddress,
    required this.businesstype,
    required this.profileImage,
  });
}
