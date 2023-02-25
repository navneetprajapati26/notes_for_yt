import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_for_yt/Screens/home.dart';
class SpleshScrenn extends StatefulWidget {
  const SpleshScrenn({Key? key}) : super(key: key);

  @override
  State<SpleshScrenn> createState() => _SpleshScrennState();
}

class _SpleshScrennState extends State<SpleshScrenn> {

  @override
  void initState() {
    // TODO: implement initState
    _navigatetohome();
    super.initState();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset("assets/xgdIUbcwgS.json"),),
    );
  }
}
