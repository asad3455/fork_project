import 'package:flutter/material.dart';
import 'package:asad_crew/models/crew.dart';

class CrewTile extends StatelessWidget {
  // const CrewTile({Key? key}) : super(key: key);
  const CrewTile({required this.crew});
  final Crew crew;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          //image on left
          leading: CircleAvatar(
              radius: 25.0, backgroundColor: Colors.grey[crew.strength]),
          title: Text(crew.name),
          subtitle: Text('Takes ${crew.sugars} sugar(s)'),
        ),
      ),
    );
  }
}
