import 'package:hive/hive.dart';

import 'exercise.dart';

part 'block.g.dart';

@HiveType(typeId: 1)
class Block extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String desc;
  @HiveField(2)
  HiveList exercises;

  Block(this.title, this.desc);
}
