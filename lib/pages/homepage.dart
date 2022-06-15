import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_keeper/pages/add_note.dart';
import 'package:notes_keeper/pages/view_note.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 

  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('notes');

  List<Color?> myColors = [
    Colors.yellow[200],
    Colors.red[200],
    Colors.green[200],
    Colors.deepPurpleAccent[200],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => const AddNote(),
            ),
          )
              .then((value) {
            print("calling set ");
            setState(() {});
          });
        },
        backgroundColor: Colors.grey[700],
        child: const Icon(
          Icons.add,
          color: Colors.white70,
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Notes",
          style: TextStyle(
            fontSize: 24.0,
            fontFamily: 'lato',
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Color(0xff070706),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: ref.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  Random random = new Random();
                  Color? bg = myColors[random.nextInt(4)];
                  Map data = {};
                  data = snapshot.data?.docs[index].data() as Map;
                  DateTime mydateTime = data['created'].toDate();
                   String formattedTime = DateFormat.yMMMd().add_jm().format(mydateTime);
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => viewNote( ref: snapshot.data!.docs[index].reference, data: {}, time: formattedTime),
                          )
                          );
                    },
                    child: Card(
                      color: bg,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${data['title']} ",
                                style: const TextStyle(
                                  fontSize: 24.0,
                                  fontFamily: 'lato',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  DateFormat.yMMMd()
                                      .add_jm()
                                      .format(mydateTime),
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: 'lato',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            ]),
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: Text("loading..."),
            );
          }
        },
      ),
    );
  }
}
