import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  late Stream<QuerySnapshot> _noteStream;

  @override
  void initState() {
    super.initState();
    _noteStream = FirebaseFirestore.instance.collection('notes').snapshots();
  }

  void _addNote() {
    String title = _titleController.text;
    String content = _contentController.text;

    if (title.isNotEmpty && content.isNotEmpty) {
      FirebaseFirestore.instance.collection('notes').add({
        'title': title,
        'content': content,
      }).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Note Added')),
        );
        _titleController.clear();
        _contentController.clear();
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $error')),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Title And Content Can\'t Be Empty !')),
      );
    }
  }

  void _deleteNote(String noteId) {
    FirebaseFirestore.instance
        .collection('notes')
        .doc(noteId)
        .delete()
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Note Deleted')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erroe: $error')),
      );
    });
  }

  void _updateNote(String noteId, String newTitle, String newContent) {
    FirebaseFirestore.instance.collection('notes').doc(noteId).update({
      'title': newTitle,
      'content': newContent,
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Note Updated')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 198, 177, 197),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 14, 40, 62),
        title: Text('Add Note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: 'Content',
              ),
              maxLines: 4,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 14, 40, 62),
                shadowColor: Colors.black,
              ),
              onPressed: _addNote,
              child: Text(
                'Add',
                style: TextStyle(color: Color.fromARGB(255, 198, 177, 197)),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Added Notes',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _noteStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Erroe: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasData) {
                    final notes = snapshot.data!.docs;

                    return ListView.builder(
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        final note =
                            notes[index].data() as Map<String, dynamic>;
                        final noteId = notes[index].id;
                        String title = note['title'];
                        String content = note['content'];

                        return ListTile(
                          title: Text(title),
                          subtitle: Text(content),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      backgroundColor:
                                          Color.fromARGB(255, 14, 40, 62),
                                      title: Text('Update Note',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 198, 177, 197))),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            initialValue: title,
                                            decoration: InputDecoration(
                                                labelText: 'Title',
                                                labelStyle: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 198, 177, 197))),
                                            onChanged: (value) {
                                              setState(() {
                                                title = value;
                                              });
                                            },
                                          ),
                                          SizedBox(height: 16.0),
                                          TextFormField(
                                            initialValue: content,
                                            decoration: InputDecoration(
                                                labelText: 'Content',
                                                labelStyle: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 198, 177, 197))),
                                            onChanged: (value) {
                                              setState(() {
                                                content = value;
                                              });
                                            },
                                            maxLines: 4,
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromARGB(
                                                255, 28, 113, 31),
                                            shadowColor: Colors.black,
                                          ),
                                          onPressed: () {
                                            _updateNote(noteId, title, content);
                                            Navigator.pop(context);
                                          },
                                          child: Text('Update',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 198, 177, 197))),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancle',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 198, 177, 197))),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      backgroundColor:
                                          Color.fromARGB(255, 14, 40, 62),
                                      title: Text('Delete Note',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 198, 177, 197))),
                                      content: Text('This Note Will Be Deleted',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 198, 177, 197))),
                                      actions: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            shadowColor: Colors.black,
                                          ),
                                          onPressed: () {
                                            _deleteNote(noteId);
                                            Navigator.pop(context);
                                          },
                                          child: Text('Delete',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 198, 177, 197))),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancle',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 198, 177, 197))),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }

                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
