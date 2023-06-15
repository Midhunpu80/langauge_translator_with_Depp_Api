import 'package:flutter/material.dart';

textfromed(TextEditingController controll) {
  return Padding(
    padding: const EdgeInsets.only(left: 3, right: 3),
    child: Container(
      height: 150,
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: const Color.fromARGB(255, 251, 248, 248))),
      child: TextFormField(
        style: const TextStyle(
            color: Colors.purple, fontSize: 20, fontWeight: FontWeight.w700),
        keyboardType: TextInputType.multiline,
        controller: controll,
        maxLines: null,
        decoration: const InputDecoration(
            hintText: "write something ..",
            hintStyle: TextStyle(color: Colors.purple, fontSize: 20),
            filled: true,
            isDense: false,
            fillColor: Color.fromARGB(255, 255, 255, 255),
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    ),
  );
}
