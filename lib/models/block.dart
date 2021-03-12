import 'exercise.dart';

class Block {
  final String id;
  final String title;
  final String desc;
  final List<Exercise> exercises;

  Block(this.id, this.title, this.desc, this.exercises);

  Block.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        desc = json['desc'],
        exercises = json['exercises'].map((i) => Exercise.fromJson(i)).toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'desc': desc,
        'exercises': exercises.map((exercise) => exercise.toJson()).toList(),
      };
}
