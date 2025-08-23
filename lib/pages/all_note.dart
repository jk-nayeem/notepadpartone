import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepadpartone/controllers/note_controller.dart';
import 'package:notepadpartone/pages/update_note.dart';
import 'package:notepadpartone/pages/view_note.dart';

class AllNote extends StatefulWidget {
  const AllNote({super.key});

  @override
  State<AllNote> createState() => _AllNoteState();
}

class _AllNoteState extends State<AllNote> {
  final NoteController _controller = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NoteController>(
        builder: (_) {
          return ListView.builder(
            itemCount: _controller.notes.length,
            itemBuilder: (context, index) {
              bool inFavList = _controller.notes[index].isFav;
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: ListTile(
                  title: Text(
                    _controller.notes[index].title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    _controller.notes[index].description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      bool isFav = _controller.notes[index].isFav;
                      _controller.addFavNote(index, !isFav);
                    },
                    icon: inFavList
                        ? Icon(Icons.favorite, color: Colors.deepPurple[400])
                        : Icon(Icons.favorite_border_outlined),
                  ),
                  tileColor: Colors.deepPurple[50],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewNote(
                          note: _controller.notes[index],
                          index: index,
                        ),
                      ),
                    );
                  },
                  onLongPress: () {
                    final parentContext = context;
                    showDialog(
                      context: parentContext,
                      builder: (context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.all(10),
                          content: SizedBox(
                            height: 150,
                            child: Column(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.of(parentContext).push(
                                      MaterialPageRoute(
                                        builder: (context) => UpdateNote(
                                          note: _controller.notes[index],
                                          index: index,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _controller.deleteNote(index);
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('share is on Update'),
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Share',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
