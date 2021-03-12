import 'block.dart';

class Training {
  final String id;
  final String title;
  final String desc;
  final List<Block> blocks;

  Training(this.id, this.title, this.desc, this.blocks);

  Training.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        desc = json['desc'],
        blocks = json['blocks'].map((i) => Block.fromJson(i)).toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'desc': desc,
        'blocks': blocks.map((block) => block.toJson()).toList(),
      };
}
