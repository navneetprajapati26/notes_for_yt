import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Baner extends StatelessWidget {
  const Baner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: MediaQuery.of(context).size.width,
      color: Color(0xffbed9fa),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
              ),
              Container(
                  height: 90,
                  width: 90,
                  child: Lottie.asset("assets/sun.json")),
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 60,),
              Column(
                children: [
                  SizedBox(height: 60,),
                  Container(
                      height: 100,
                      width: 100,
                      child: Lottie.asset("assets/polite_chicky.json")),
                ],
              ),
              SizedBox(width: 100,),
              Container(
                  height: 200,
                  width: 200,
                  child: Lottie.asset("assets/127919-black-cow.json")),
            ],
          ),
        ],
      ),
    );
  }
}
