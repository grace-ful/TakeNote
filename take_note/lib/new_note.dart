import 'package:flutter/material.dart';

void main() {
  runApp(NewNote());
}

class NewNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            NewNotes(),
          ]
        )
      )
    );
  }
}

class NewNotes extends StatefulWidget {
  const NewNotes({ Key? key }) : super(key: key);

  @override
  _NewNotesState createState() => _NewNotesState();
}

class _NewNotesState extends State<NewNotes> {
  @override
  Widget build(BuildContext context) {

    String align = "L";

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Container(

      child: Column(
        
        children: [

          AppBar(
            title: TextField(
              autocorrect: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'New Note',
              ),
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
            ),
            backgroundColor: Colors.purple,
          ),

          Container(
            child: TextField(
              textAlignVertical: TextAlignVertical(y: -1.0),
              autocorrect: true,
              decoration: InputDecoration(
                hintText: 'Begin typing here',
                contentPadding: EdgeInsets.symmetric(vertical: height-600, horizontal: 15)
              ),
            )
          )

        ],
      )
    );
  }
}