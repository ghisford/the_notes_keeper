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
              Row(children: [
                ElevatedButton(
                  onPressed: (() {}),
                  child: Icon(
                    Icons.arrow_back,
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                    Colors.grey[700],
                  )),
                )
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
                    style: TextStyle(
                      fontSize: 36.0,
                      fontFamily: 'lato',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    onChanged: (_val) {
                      title = _val;
                    },
                  )
                ],
              ))
            ]),
          ),
        ),
      ),
    );
  }
}
