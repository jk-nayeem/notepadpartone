class NoteModel {
  String title;
  String description;
  String Createdate;
  String updateDate;
  bool isFav;
  NoteModel({
    required this.title,
    required this.description,
    required this.Createdate,
    this.updateDate = '',
    this.isFav = false,
  });
}
