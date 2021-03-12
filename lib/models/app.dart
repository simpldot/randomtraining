import 'training.dart';

class App {
  final String theme;
  final List<Training> trainings;

  App(this.theme, this.trainings);

  App.fromJson(Map<String, dynamic> json)
      : theme = json['theme'],
        trainings = json['trainings'].map((i) => Training.fromJson(i)).toList();

  Map<String, dynamic> toJson() => {
        'theme': theme,
        'trainings': trainings.map((block) => block.toJson()).toList(),
      };
}
