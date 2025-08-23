import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepadpartone/controllers/note_controller.dart';
import 'package:notepadpartone/models/note_model.dart';

import 'view_note.dart';

class FavouriteNote extends StatelessWidget {
  FavouriteNote({super.key});

  final NoteController _controller = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _controller.favNotes.isEmpty
          ? Center(
              child: Text(
                'No Notes found as Favourite',
                style: TextStyle(fontSize: 18),
              ),
            )
          : GetBuilder<NoteController>(
              builder: (_) {
                return ListView.builder(
                  itemCount: _controller.favNotes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: ListTile(
                        title: Text(
                          _controller.favNotes[index].title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(
                          _controller.favNotes[index].description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            bool isFav = _controller.favNotes[index].isFav;
                            _controller.addFavNote(index, !isFav);
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.deepPurple[400],
                          ),
                        ),
                        tileColor: Colors.deepPurple[50],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewNote(
                                note: _controller.favNotes[index],
                                index: index,
                              ),
                            ),
                          );
                        },
                        onLongPress: () {},
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
