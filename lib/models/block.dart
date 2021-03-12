import 'package:hive/hive.dart';

import 'exercise.dart';

part 'block.g.dart';

@HiveType(typeId: 1)
class Block {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String desc;
  @HiveField(3)
  List<Exercise> exercises;
}
