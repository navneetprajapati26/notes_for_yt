import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  final TextEditingController controllerTitel;
  final TextEditingController controllerNote;
  VoidCallback onSave;
  AddNote({
    Key? key,
    required this.controllerTitel,
    required this.controllerNote,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusNode noteFoucus = FocusNode();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 150,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller: controllerTitel,
                    autofocus: true,
                    onSubmitted: (val) {
                      if (val != "") {
                        noteFoucus.requestFocus();
                      }
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Title",
                        hintStyle: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFD9D9D9))),
                    style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  //SizedBox(height: 15,),
                  Container(
                    height: 400,
                    alignment: Alignment.topRight,
                    child: ListView(
                      children: [
                        TextField(
                          controller: controllerNote,
                          focusNode: noteFoucus,
                          maxLines: null,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Write your note",
                              hintStyle: TextStyle(
                                  fontSize: 20,
                                  //fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFD9D9D9))),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          CupertinoButton(
            child: Container(
                height: 40,
                width: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(30)),
                child: const Text(
                  "Save Note",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            onPressed: onSave,
          ),
          //SizedBox(height: 20,)
        ],
      ),
    );
  }
}
