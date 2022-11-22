import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:model_house/models/post.dart';
import 'package:model_house/services/post_service.dart';

import '../models/user.dart';

class FormPost extends StatefulWidget {
  final User? user;
  const FormPost(this.user, {Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FormPostState createState() => _FormPostState();
}

class _FormPostState extends State<FormPost> {
  String? imagePath;
  String? imagen64;
  final title = TextEditingController();
  final price = TextEditingController();
  String? category;
  final location = TextEditingController();
  final description = TextEditingController();
  HttpPost? _httpPost;
  Post? post;
  final List<String> services = [
    'Windows',
    'Floors',
    'Exterior',
    'Drywall',
    'Door',
    'Ceilings',
    'Attic',
    'Bathroom',
    'Deck & Patio',
    'Garage',
    'Bedroom',
    'Office',
    'Basement',
    'Kitchen',
    'Living Room',
    'Installation',
    'Maintenance',
    'Painting',
    'Plumbing',
    'Repair',
    'Electrical',
    'Assembly',
    'Safety & Mobility'
  ];
  final TextStyle inputStyle = TextStyle(
    fontSize: 20,
    color: Colors.blue[900],
  );

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

  void initState() {
    _httpPost = HttpPost();
    super.initState();
  }

  Future initialize() async {
    //List<int> bytes = File(imagePath!).readAsBytesSync();
    //imagen64 = base64.encode(bytes);
    var post = await _httpPost?.PathPost(
        title.text,
        int.parse(price.text),
        category!,
        location.text,
        description.text,
        widget.user!.id,
        imagePath!);
    setState(() {
      post = post;
      if (post?.title != null) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("The post was created successfully"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        title.text = "";
                        price.text = "";
                        category = "";
                        location.text = "";
                        description.text = "";
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
                        title.text = "";
                        price.text = "";
                        category = "";
                        location.text = "";
                        description.text = "";
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
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text("Create Post"),
        backgroundColor: const Color(0xff007AFF),
      ),
      body: Padding(
          padding: const EdgeInsets.all(30),
          // ignore: avoid_unnecessary_containers
          child: Container(
              child: ListView(
            children: [
              MaterialButton(
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();
                  PickedFile? pickedFile =
                      // ignore: deprecated_member_use
                      await picker.getImage(source: ImageSource.gallery);
                  setState(() {
                    imagePath = pickedFile?.path;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/512/1339/1339270.png",
                        width: 70,
                        height: 70,
                      ),
                      const Text(
                        "Add A Photo",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              (imagePath == null) ? Container() : Image.file(File(imagePath!)),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextField(
                    controller: title, decoration: decorationInput("Title")),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: price,
                    decoration: decorationInput("Price")),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: DropdownButton(
                  isExpanded: true,
                  value: category,
                  style: inputStyle,
                  items: services.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      category = value;
                    });
                  },
                ),
              ),
              //Container(
              //  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              //  child: TextField(
              //      controller: category,
              //      decoration: decorationInput("Category")),
              //),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextField(
                    controller: location,
                    decoration: decorationInput("Location")),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                height: 24 * 6,
                child: TextField(
                    maxLines: 6,
                    controller: description,
                    decoration: decorationInput("Description")),
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
          ))),
    );
  }
}
