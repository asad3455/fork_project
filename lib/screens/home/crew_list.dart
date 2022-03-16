//Widget to cycle through crews
import 'package:asad_crew/models/crew.dart';
import 'package:flutter/material.dart';
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
    final crews = Provider.of<List<Crew>?>(context);
    //Make sure snapshot is not null
    if (crews == null) return CircularProgressIndicator();
    crews.forEach((crewItem) {
      print(crewItem.name);
      print(crewItem.sugars);
      print(crewItem.strength);
    });
    return Container();
  }
}
