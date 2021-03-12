import 'package:hive/hive.dart';

import 'block.dart';

part 'training.g.dart';

@HiveType(typeId: 2)
class Training extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String desc;
  @HiveField(2)
  List<Block> blocks;

  Training(this.title, this.desc, this.blocks);
}
