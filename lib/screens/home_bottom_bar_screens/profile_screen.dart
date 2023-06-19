import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:traveller/widget/pages/auth.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  File? _profileImage;
  String? _savedImagePath;

  @override
  void dispose() {
    if (_profileImage != null) {
      _profileImage!.delete();
    }
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    if (!kIsWeb) {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        setState(() {
          _profileImage = File(pickedImage.path);
        });
      }
    }
  }

  Future<void> _saveImage(File image) async {
    if (!kIsWeb) {
      print('============== using android platform');
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = '${directory.path}/profile_image.png';
      await image.copy(imagePath);
      setState(() {
        _savedImagePath = imagePath;
      });
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 14, 40, 62),
          title: const Text(
            'Success',
            style: TextStyle(
              color: Color.fromARGB(255, 198, 177, 197),
            ),
          ),
          content: const Text(
            'Profile image saved successfully.',
            style: TextStyle(
              color: Color.fromARGB(255, 198, 177, 197),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK',
                  style: TextStyle(color: Color.fromARGB(255, 198, 177, 197))),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteImage() async {
    if (!kIsWeb) {
      if (_profileImage != null) {
        await _profileImage!.delete();
        setState(() {
          _profileImage = null;
          _savedImagePath = null;
        });
      }
      ;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 14, 40, 62),
            title: const Text('Success',
                style: TextStyle(color: Color.fromARGB(255, 198, 177, 197))),
            content: const Text('Profile image deleted successfully.',
                style: TextStyle(color: Color.fromARGB(255, 198, 177, 197))),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK',
                    style:
                        TextStyle(color: Color.fromARGB(255, 198, 177, 197))),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      _loadSavedImage();
    }
  }

  Future<void> _loadSavedImage() async {
    if (!kIsWeb) {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = '${directory.path}/profile_image.png';
      final savedImage = File(imagePath);
      if (await savedImage.exists()) {
        setState(() {
          _savedImagePath = imagePath;
        });
      }
    }
  }

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 198, 177, 197),
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 14, 40, 62),
        title: Text('User Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Color.fromARGB(255, 198, 177, 197),
              backgroundImage: _profileImage != null
                  ? FileImage(_profileImage!)
                  : _savedImagePath != null
                      ? FileImage(File(_savedImagePath!))
                      : AssetImage('images/user.png') as ImageProvider,
            ),
            SizedBox(height: 16),
            Text(
              user.email!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 14, 40, 62),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 14, 40, 62),
                shadowColor: Colors.black,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Color.fromARGB(255, 14, 40, 62),
                      title: Text(
                        'Change Profile Picture',
                        style: TextStyle(
                            color: Color.fromARGB(255, 198, 177, 197)),
                      ),
                      content: Text(
                        'Choose an option to change your profile picture:',
                        style: TextStyle(
                            color: Color.fromARGB(255, 198, 177, 197)),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _pickImage(ImageSource.camera);
                          },
                          child: const Text('Camera',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 198, 177, 197))),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _pickImage(ImageSource.gallery);
                          },
                          child: const Text('Gallery',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 198, 177, 197))),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Change Profile Picture',
                style: TextStyle(
                  color: Color.fromARGB(255, 198, 177, 197),
                ),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 14, 40, 62),
                shadowColor: Colors.black,
              ),
              onPressed: () {
                if (_profileImage != null) {
                  _saveImage(_profileImage!);
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Color.fromARGB(255, 14, 40, 62),
                        title: const Text('Error',
                            style: TextStyle(
                                color: Color.fromARGB(255, 198, 177, 197))),
                        content: const Text('Please select a profile picture.',
                            style: TextStyle(
                                color: Color.fromARGB(255, 198, 177, 197))),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 198, 177, 197))),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text(
                'Save  Profile  Picture',
                style: TextStyle(
                  color: Color.fromARGB(255, 198, 177, 197),
                ),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 14, 40, 62),
                shadowColor: Colors.black,
              ),
              onPressed: _deleteImage,
              child: Text(
                'Delete Profile Picture',
                style: TextStyle(
                  color: Color.fromARGB(255, 198, 177, 197),
                ),
              ),
            ),
            MaterialButton(
              onLongPress: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Auth()),
                );
              },
              color: Color.fromARGB(255, 14, 40, 62),
              onPressed: () {},
              child: Text(
                'Sign Out',
                style: TextStyle(
                  color: Color.fromARGB(255, 198, 177, 197),
                ),
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onDoubleTap: () {
                SystemNavigator.pop();
              },
              child: Center(
                child: Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 14, 40, 62),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Exit',
                      style: TextStyle(
                        color: Color.fromARGB(255, 198, 177, 197),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
