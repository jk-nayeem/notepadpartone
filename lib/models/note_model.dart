class NoteModel {
  String title;
  String description;
  String date;
  bool isFav;
  NoteModel({
    required this.title,
    required this.description,
    required this.date,
    this.isFav = false,
  });
}
