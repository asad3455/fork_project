import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      //Loader shown in center of the screen
      child: Center(
          child: SpinKitFadingCube(
        //Colour and size of the spinner
        color: Colors.grey,
        size: 50.0,
      )),
    );
  }
}
