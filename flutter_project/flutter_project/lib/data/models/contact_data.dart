import 'package:hive/hive.dart';

part 'contact_data.g.dart';

@HiveType(typeId: 0)
class ContactItemData extends HiveObject {
  ContactItemData({
    // required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
  });

  // @HiveField(0)
  // final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String phoneNumber;
  @HiveField(3)
  final String email;
}
