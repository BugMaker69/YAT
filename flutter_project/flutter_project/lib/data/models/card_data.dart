import 'package:hive/hive.dart';

part 'card_data.g.dart';
@HiveType(typeId: 0)
class CardData extends HiveObject {
  
  @HiveField(0)
  final bool isChecked;

@HiveField(1)
  final String data;

  CardData({required this.isChecked, required this.data});
}
