class NoteModel {
  String? text;
  bool done;

  NoteModel({this.text, this.done = false});

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      NoteModel(text: json['text'], done: json['done']);

  Map<String, dynamic> toJson() => {'text': text, 'done': done};
}