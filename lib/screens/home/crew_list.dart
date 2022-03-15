//Widget to cycle through crews
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class CrewList extends StatefulWidget {
  const CrewList({Key? key}) : super(key: key);

  @override
  State<CrewList> createState() => _CrewListState();
}

class _CrewListState extends State<CrewList> {
  @override
  Widget build(BuildContext context) {
    //Access data from the stream
    final crews = Provider.of<QuerySnapshot?>(context);
    //Make sure snapshot is not null
    if (crews == null) return CircularProgressIndicator();
    for (var doc in crews.docs) {
      print(doc.data());
    }
    return Container();
  }
}
