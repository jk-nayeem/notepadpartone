import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepadpartone/controllers/note_controller.dart';
import 'package:notepadpartone/models/note_model.dart';
import 'package:notepadpartone/pages/homepage.dart';

class ViewNote extends StatelessWidget {
  NoteModel note;
  int index;
  ViewNote({super.key, required this.note, required this.index});

  final NoteController _controller = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          note.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.deepPurple[300],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('share is on Update'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            icon: Icon(Icons.share, size: 25),
          ),
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Deleted Successfully'),
                              duration: Duration(seconds: 1),
                            ),
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
          padding: EdgeInsetsGeometry.symmetric(horizontal: 12, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'created : ${note.Createdate}',
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 5),
              note.updateDate == ''
                  ? SizedBox(height: 1)
                  : Text(
                      'last modified : ${note.updateDate}',
                      style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
              Divider(thickness: 2, color: Colors.deepPurple[100]),
              SizedBox(height: 10),
              Text(note.description, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
