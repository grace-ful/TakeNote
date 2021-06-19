import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TakeNote',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> notes = [];

  void _addNewNote(String task) {
    if (task.length > 0) {
      setState(() => notes.add(task));
    }
  }

  void _deleteNote(int index) {
    setState(() => notes.removeAt(index));
  }

  Widget _buildNotes() {
    return new ListView.builder(itemBuilder: (context, index) {
      if (index < notes.length) {
        return _buildNote(notes[index], index);
      } else {
        return _buildNote("", -1);
      }
    });
  }

  Widget _buildNote(String noteText, int index) {
    if (noteText != "") {
      return new ListTile(
        title: new Text(noteText),
        trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _removeNote(index);
            }),
      );
    }
    return new ListTile(
      title: new Text(noteText),
    );
  }

  void _addNewNoteScreen() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: new AppBar(
            title: TextField(
              autocorrect: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'New Note',
              ),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            backgroundColor: Colors.purple,
          ),
          body: new TextField(
            autofocus: true,
            decoration: new InputDecoration(
                hintText: 'Enter note here ...',
                contentPadding: const EdgeInsets.all(16.0)),
            keyboardType: TextInputType.text,
            maxLines: null,
            onSubmitted: (val) {
              _addNewNote(val);
              Navigator.pop(context); // Close the add todo screen
            },
          ));
    }));
  }

  void _removeNote(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text(
                  'Are you sure you want to delete note #${index + 1} ?'),
              actions: <Widget>[
                new TextButton(
                    child: new Text('CANCEL'),
                    onPressed: () => Navigator.of(context).pop()),
                new TextButton(
                    child: new Text('DELETE'),
                    onPressed: () {
                      _deleteNote(index);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Take Note "),
      ),
      body: _buildNotes(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addNewNoteScreen,
        tooltip: 'Add note',
        child: new Icon(Icons.add),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white70,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.purple,
                ),
                child: Text('TakeNote',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                ),
        ),
              ),
              ListTile(
                leading: Icon(Icons.home_outlined, color: Colors.purple[800],),
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.purple[800],
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.star_border_outlined, color: Colors.purple[800]),
                title: Text(
                  'Favourites',
                  style: TextStyle(
                    color: Colors.purple[800],
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.archive_outlined, color: Colors.purple[800],),
                title: Text(
                  'Archive',
                  style: TextStyle(
                    color: Colors.purple[800],
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.settings_outlined, color: Colors.purple[800],),
                title: Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.purple[800],
                  ),
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
