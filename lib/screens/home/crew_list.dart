//Widget to cycle through crews
import 'package:asad_crew/models/crew.dart';
import 'package:asad_crew/screens/home/crew_tile.dart';
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
    if (crews != null) {
      return ListView.builder(
        itemCount: crews.length,
        //0 index
        itemBuilder: (context, index) {
          return CrewTile(crew: crews[index]);
        },
      );
    } else {
      return CircularProgressIndicator();
    }
  }
}
