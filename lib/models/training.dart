import 'package:hive/hive.dart';

import 'block.dart';

part 'training.g.dart';

@HiveType(typeId: 2)
class Training {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String desc;
  @HiveField(3)
  List<Block> blocks;
}
