class Exercise {
  final String id;
  final String title;
  final String desc;

  Exercise(this.id, this.title, this.desc);

  Exercise.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        desc = json['desc'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'desc': desc,
      };
}
