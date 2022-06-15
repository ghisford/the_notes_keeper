import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  late String title;
  late String des;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                ElevatedButton(
                  onPressed: (() {
                    Navigator.of(context).pop();
                  }),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.grey[700],
                    ),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 7.0,
                    )),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                  ),
                ),
                ElevatedButton(
                  onPressed: add,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.grey[700],
                    ),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 7.0,
                    )),
                  ),
                  child: const Text(
                    'save',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'lato',
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 12.0,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Title',
                    ),
                    style: const TextStyle(
                      fontSize: 36.0,
                      fontFamily: 'lato',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    onChanged: (_val) {
                      title = _val;
                    },
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    padding: const EdgeInsets.only(top: 12.0),
                    child: TextFormField(
                      decoration: const InputDecoration.collapsed(
                        hintText: 'note description',
                      ),
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'lato',
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                      onChanged: (_val) {
                        des = _val;
                      },
                      maxLines: 20,
                    ),
                  ),
                ],
              ))
            ]),
          ),
        ),
      ),
    );
  }

  void add() {
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('notes');
    var data = {
      'title': title,
      'description': des,
      'created': DateTime.now(),
    };
    ref.add(data);
    Navigator.pop(context);
  }
  //save to db
}
