import 'package:flutter/material.dart';

translatedlangauge({required String text}) {
  return Card(
    shadowColor: Colors.grey,
    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        height: 300,
        width: 100,
        decoration: const BoxDecoration(color: Colors.purple, boxShadow: [
          BoxShadow(
              offset: Offset.zero,
              blurRadius: 0.0,
              spreadRadius: 1.0,
              color: Colors.grey)
        ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
          child: 
          
               Text(
                text.isEmpty?text.toString().substring(0):
                  text.toString().substring(38).toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
        ),
      ),
    ),
  );
}
