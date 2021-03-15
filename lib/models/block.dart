import 'package:hive/hive.dart';

part 'block.g.dart';

@HiveType(typeId: 1)
class Block extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String desc;
  @HiveField(2)
  List<int> exercises;

  Block(this.title, this.desc);
}
