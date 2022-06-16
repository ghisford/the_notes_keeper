import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewNote extends StatefulWidget {
  final Map data;
  final String time;
  final DocumentReference ref;

  const ViewNote(
      {Key? key, required this.data, required this.time, required this.ref})
      : super(key: key);

  @override
  State<ViewNote> createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
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
                  onPressed: delete,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
                    child: Text(
                      widget.time,
                      style: const TextStyle(
                        fontSize: 23.0,
                        fontFamily: 'lato',
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: Text(
                      "${widget.data['description']}",
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'lato',
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
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

  void delete() async {
    await widget.ref.delete();
    Navigator.pop(context);
  }
  //save to db
}
