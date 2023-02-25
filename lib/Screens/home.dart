import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_for_yt/Screens/add_note.dart';

import '../database.dart';
import '../util/baner.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _myBox = Hive.box('myBox');
  NotesDataBase db = NotesDataBase();
  final _controllerTitel = TextEditingController();
  final _controllerNote = TextEditingController();

  void initState() {
    // whene first time
    if (_myBox.get("NOTELIST") == null) {
      db.createInitialData();
    } else {
      // alredy
      db.loadData();
    }
    super.initState();
  }

  // Save new task
  void saveNewNote() {
    setState(() {
      db.notesList.add([_controllerTitel.text, _controllerNote.text]);
      _controllerTitel.clear();
      _controllerNote.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  // create New Task
  void createNewNote() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddNote(
              controllerTitel: _controllerTitel,
              controllerNote: _controllerNote,
              onSave: saveNewNote,
            )));
  }

  // delete Task
  void deleteNote(int index) {
    setState(() {
      db.notesList.removeAt(index);
    });
    db.updateDatabase();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Stack(
        children: [
          const Baner(),
          DraggableScrollableSheet(
              initialChildSize: 0.677,
              minChildSize: 0.677,
              builder: (context, cntroller) {
                return Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 7,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      Expanded(
                        child: ListView.builder(
                            controller: cntroller,
                            itemCount: db.notesList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, top: 8, right: 8),
                                    child: Container(
                                      width: width,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFFE5E5E5),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            SelectableText(
                                              //note.title,
                                              db.notesList[index][0],
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            SelectableText(
                                              db.notesList[index][1],
                                              //todo Content
                                              // note.content,
                                              style: const TextStyle(fontSize: 15),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, top: 0, right: 8),
                                    child: CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      child: Container(
                                        width: width - 10,
                                        height: 30,
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                            color: Color(0xFF3C4043),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(20))),
                                        child: const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        deleteNote(index);
                                      },
                                    ),
                                  )
                                ],
                              );
                            }),
                      )
                    ],
                  ),
                );
              }),
          Positioned(
              width: MediaQuery.of(context).size.width,
              bottom: 20,
              child: CupertinoButton(
                onPressed: createNewNote,
                child: Container(
                    height: 40,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Text(
                      "Add Note",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              ))
        ],
      ),
    );
  }
}
