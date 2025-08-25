import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notepadpartone/controllers/note_controller.dart';
import 'package:notepadpartone/models/note_model.dart';
import 'package:notepadpartone/pages/all_note.dart';
import 'package:notepadpartone/pages/favourite_note.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List _pageList = [AllNote(), FavouriteNote()];

  int _currentIndex = 0;

  final NoteController _controller = Get.put(NoteController());
  final TextEditingController _titleCon = TextEditingController();
  final TextEditingController _desCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes ++', style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.deepPurple[300],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'Add New Notes',
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
                content: SizedBox(
                  width: double.maxFinite,
                  height: 300,
                  child: Column(
                    children: [
                      TextField(
                        controller: _titleCon,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Note's Title",
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: _desCon,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Write here...',
                        ),
                        maxLines: 8,
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      _titleCon.clear();
                      _desCon.clear();
                      Navigator.pop(context);
                    },
                    child: Text(
                      'cancel',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      DateTime nowTimeComplex = DateTime.now();
                      String nowTime = DateFormat(
                        'd MMM y, hh:mm a',
                      ).format(nowTimeComplex);
                      _controller.addNote(
                        NoteModel(
                          title: _titleCon.text,
                          description: _desCon.text,
                          Createdate: nowTime,
                        ),
                      );
                      _titleCon.clear();
                      _desCon.clear();
                      Navigator.pop(context);
                    },
                    child: Text(
                      'save',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      extendBody: true,
      bottomNavigationBar: CrystalNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        outlineBorderColor: Colors.deepPurple[400]!,
        borderWidth: 2,
        backgroundColor: Colors.deepPurple[300],

        items: [
          CrystalNavigationBarItem(
            icon: Icons.notes_outlined,
            selectedColor: Colors.white,
          ),

          CrystalNavigationBarItem(
            icon: Icons.favorite_outline_outlined,
            selectedColor: Colors.white,
          ),
        ],
      ),
      body: _pageList[_currentIndex],
    );
  }
}
