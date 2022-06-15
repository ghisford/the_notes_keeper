import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class viewNote extends StatefulWidget {
  final Map data;
  final String time;
  final DocumentReference ref;

  const viewNote(
      {Key? key, required this.data, required this.time, required this.ref})
      : super(key: key);

  @override
  State<viewNote> createState() => _viewNoteState();
}

class _viewNoteState extends State<viewNote> {
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
                      Colors.red[300],
                    ),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 7.0,
                    )),
                  ),
                  child: const Icon(
                    Icons.delete_forever,
                  ),
                ),
              ]),
              const SizedBox(
                height: 12.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.data["title"]}",
                    style: const TextStyle(
                      fontSize: 36.0,
                      fontFamily: 'lato',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
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
              )
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
