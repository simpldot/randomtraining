import 'package:hive/hive.dart';

part 'exercise.g.dart';

@HiveType(typeId: 0)
class Exercise {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String desc;
}
