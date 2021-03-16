import 'package:hive/hive.dart';

part 'exercise.g.dart';

@HiveType(typeId: 0)
class Exercise extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String desc;

  Exercise(this.title, this.desc);
}
