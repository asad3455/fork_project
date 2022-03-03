import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
    //Fill colour of the form field should be White
    fillColor: Colors.white,
    filled: true,
    //Any enabled form field will have this border
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2.0)),
    //Change style when text box is in focus
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.pink, width: 2.0)));
