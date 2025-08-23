import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepadpartone/controllers/note_controller.dart';
import 'package:notepadpartone/models/note_model.dart';
import 'package:notepadpartone/pages/homepage.dart';

class UpdateNote extends StatelessWidget {
  NoteModel note;
  int index;
  UpdateNote({super.key, required this.note, required this.index});

  final NoteController _controller = Get.put(NoteController());

  final TextEditingController _noteCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _noteCon.text = note.description;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          note.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.deepPurple[300],
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share, size: 25)),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Want to delete this?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'no',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _controller.deleteNote(index);
                          Navigator.pop(context);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Homepage()),
                            (route) => false,
                          );
                        },
                        child: Text(
                          'delete',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.delete, size: 25),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            children: [
              TextField(
                controller: _noteCon,
                maxLines: 28,
                decoration: InputDecoration(border: InputBorder.none),
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.updateNote(
                    index,
                    NoteModel(
                      title: note.title,
                      description: _noteCon.text,
                      date: note.date,
                    ),
                  );
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Note Updated Successfully'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[400],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text(
                  'Update',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
