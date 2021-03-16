import 'package:hive/hive.dart';

part 'training.g.dart';

@HiveType(typeId: 2)
class Training extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String desc;
  @HiveField(2)
  List<int> blocks;

  Training(this.title, this.desc, this.blocks);
}
