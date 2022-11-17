import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:model_house/services/security_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class EditProfile extends StatefulWidget {
  User? user;
  EditProfile(this.user, {Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final userName = TextEditingController();
  final phone = TextEditingController();
  HttpSecurity? _httpSecurity;
  String? imagePath;
  bool? response;
  InputDecoration decorationInput(String message) {
    return InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: message,
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffEBDCFA)),
            borderRadius: BorderRadius.circular(15)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffEBDCFA)),
            borderRadius: BorderRadius.circular(15)));
  }

  @override
  void initState() {
    _httpSecurity = HttpSecurity();
  }

  Future initialize() async {
    //List<int> bytes = File(imagePath!).readAsBytesSync();
    //imagen64 = base64.encode(bytes);
    final prefs = await SharedPreferences.getInstance();
    var response = await _httpSecurity?.updateUser(
        widget.user!.id.toString(), userName.text, imagePath!, phone.text);
    print(response);
    setState(() {
      print("object");
      response = response;
      if (response != null) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Updated User successfully"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        userName.text = "";
                        phone.text = "";
                        prefs.setBool('isChange', true);
                      },
                      child: const Text("Ok"))
                ],
              );
            });
      } else {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Something went wrong"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        userName.text = "";
                        phone.text = "";
                      },
                      child: const Text("Ok"))
                ],
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            MaterialButton(
              onPressed: () async {
                final ImagePicker _picker = ImagePicker();
                PickedFile? _pickedFile =
                    await _picker.getImage(source: ImageSource.gallery);
                setState(() {
                  imagePath = _pickedFile?.path;
                });
              },
              child: Column(
                children: const <Widget>[
                  Icon(Icons.add_a_photo),
                  Text("Add A Photo")
                ],
              ),
            ),
            (imagePath == null) ? Container() : Image.file(File(imagePath!)),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: TextField(
                  controller: userName,
                  decoration: decorationInput("UserName")),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: TextField(
                  keyboardType: TextInputType.number,
                  controller: phone,
                  decoration: decorationInput("Phone")),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              decoration: BoxDecoration(
                  color: const Color(0xff007AFF),
                  borderRadius: BorderRadius.circular(15)),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: MaterialButton(
                onPressed: () => {initialize()},
                child: const Text(
                  'Publish',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
