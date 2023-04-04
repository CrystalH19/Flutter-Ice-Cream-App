import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About",),
      ),
      body: SafeArea(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text("\n\n\n"
                   "This is the Ice Cream Sundae Maker app. \n "
                   "This was created by Crystal Ho.", style: TextStyle(fontSize: 18.0)),
            ],
          )),
    );
  }
}