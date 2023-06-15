import 'package:flutter/material.dart';

langauge({TextEditingController? text,required String value}) {
  return SizedBox(
    height: 50,
    width: 100,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.volume_down,
              color: Colors.purple,
              size: 39,
            ),
            label:  Text(
             value,
              style: TextStyle(fontSize: 18),
            )),
        IconButton(
            onPressed: () {
              text!.clear();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.purple,
              size: 35,
            ))
      ],
    ),
  );
}
