import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gtranslate/view/home.dart';

translatedlangauge({required String text, required BuildContext  context}) {
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
          child: Stack(
            children: [
              Positioned(
                  right: 10,
                  child: IconButton(
                      onPressed: () {
                        Clipboard.setData(
                                ClipboardData(text: translated.toString().substring(38)))
                            .then((value) => ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                  padding: EdgeInsets.only(left: 30,right: 30,bottom: 20,),
                             
                                  showCloseIcon: true,
                               
                                  
                                    backgroundColor: Color.fromARGB(255, 222, 37, 255),
                                    content: Text("Text copied",style: TextStyle(fontSize: 20),))));
                      },
                      icon: const Icon(
                        Icons.copy,
                        color: Colors.white,
                        size: 35,
                      ))),
              Text(
                text.isEmpty
                    ? text.toString().substring(0)
                    : text.toString().substring(38).toString(),
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
