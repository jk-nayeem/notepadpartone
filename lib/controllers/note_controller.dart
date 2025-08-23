import 'package:get/get.dart';
import 'package:notepadpartone/models/note_model.dart';

class NoteController extends GetxController {
  List<NoteModel> notes = [];
  List<NoteModel> favNotes = [];

  void addNote(NoteModel note) {
    notes.add(note);
    update();
  }

  void addFavNote(int index, bool isFav) {
    notes[index].isFav = isFav;
    update();

    if (notes[index].isFav == true) {
      favNotes.add(notes[index]);
      update();
    } else {
      int inFavIndex = favNotes.indexOf(notes[index]);
      favNotes.removeAt(inFavIndex);
      update();
    }
  }

  void deleteNote(index) {
    int inFavIndex = favNotes.indexOf(notes[index]);

    if (inFavIndex == -1) {
      notes.removeAt(index);
      update();
    } else {
      favNotes.removeAt(inFavIndex);
      notes.removeAt(index);
      update();
    }
  }

  void updateNote(int index, NoteModel note) {
    notes.removeAt(index);
    notes.insert(index, note);
    update();
  }
}
