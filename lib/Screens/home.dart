import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/baner.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Stack(
        children: [
          Baner(),
          DraggableScrollableSheet(
              initialChildSize: 0.677,
              minChildSize: 0.677,
              builder: (context, cntroller) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Column(
                    children: [
                      SizedBox(
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
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: const [
                                                Text(
                                                  "Title",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 25),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                    "Title ljkjlfbknfnbkjbjdvxnj"),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    CupertinoButton(
                                      onPressed: () {},
                                      child: Container(
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.black12,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20))),
                                          child: Icon(Icons.delete)),
                                      padding: EdgeInsets.only(top: 8),
                                    )
                                  ],
                                ),
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
                child: Container(
                    height: 40,
                    width: 150,
                    alignment: Alignment.center,
                    child: Text("Add Note",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () {},
              ))
        ],
      ),
    );
  }
}
