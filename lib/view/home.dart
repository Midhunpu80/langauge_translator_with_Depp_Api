// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:gtranslate/model/model.dart';
import 'package:gtranslate/service/api.dart';
import 'package:gtranslate/service/postdata.dart';
import 'package:gtranslate/widgets/lang.dart';
import 'package:gtranslate/widgets/textformfield.dart';
import 'package:gtranslate/widgets/translated.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

late Future<Marvel> data;
String? value;
String? value2;
String? translated;

class _homeState extends State<home> {
  @override
  void initState() {
    data = getdata();

    super.initState();
  }

  TextEditingController textcont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.more_vert_outlined,
            color: Colors.white,
          )
        ],
        elevation: 0,
        shadowColor: Colors.black,
        leading: const Icon(
          Icons.translate,
          color: Colors.white,
          size: 45,
        ),
        backgroundColor: Colors.purple,

        title: const Text(
          "MdX Langauge Translator",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 100,
        //  backgroundColor: Colors.purple,
      ),
      body: FutureBuilder<Marvel>(
          future: data,
          builder: (context, AsyncSnapshot<Marvel> snapshot) {
            return !snapshot.hasData
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: [
                      Container(
                        height: 70,
                        width: 100,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 70,
                              width: 180,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      icon: const Icon(
                                        Icons.arrow_drop_down_circle,
                                        size: 20,
                                        color: Colors.purple,
                                      ),
                                      value: value,
                                      hint: const Text(
                                        "pick a lanagauge",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.purple,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // value: snapshot.data!.languages.map((e) => e.language).toList(),
                                      items: List.generate(
                                          snapshot.data!.languages.length,
                                          (index) => DropdownMenuItem(
                                                // ignore: sort_child_properties_last
                                                child: Text(
                                                  snapshot.data!
                                                      .languages[index].name
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.purple),
                                                ),
                                                value: snapshot.data!
                                                    .languages[index].language,
                                              )).toList(),
                                      onChanged: (val) {
                                        setState(() {
                                          value = val.toString();
                                        });
                                      })),
                            ),
                            const VerticalDivider(
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 80,
                                width: 180,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        icon: const Icon(
                                          Icons.arrow_drop_down_circle,
                                          size: 20,
                                          color: Colors.purple,
                                        ),
                                        value: value2,
                                        hint: const Text(
                                          "Target Langaguge",
                                          style:
                                              TextStyle(color: Colors.purple),
                                        ),
                                        // value: snapshot.data!.languages.map((e) => e.language).toList(),
                                        items: List.generate(
                                            snapshot.data!.languages.length,
                                            (index) => DropdownMenuItem(
                                                  // ignore: sort_child_properties_last
                                                  child: Text(
                                                    snapshot.data!
                                                        .languages[index].name
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.purple),
                                                  ),
                                                  value: snapshot
                                                      .data!
                                                      .languages[index]
                                                      .language,
                                                )).toList(),
                                        onChanged: (val) {
                                          setState(() {
                                            value2 = val.toString();
                                          });
                                        })),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      langauge(
                          text: textcont,
                          value: value.toString().toUpperCase()),
                      textfromed(textcont),
                      ///////
                      const Divider(
                        thickness: 2,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            if (value!.isNotEmpty &&
                                value2!.isNotEmpty &&
                                textcont.text.isNotEmpty) {
                              translated = await postdata(textcont.text,
                                  value.toString(), value2.toString());

                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor:
                                          Color.fromARGB(255, 255, 0, 0),
                                      content: Text("is not empty")));
                            }
                          },
                          child: const Text("Translate")),

                      translated == null
                          ? SizedBox()
                          : translatedlangauge(text: translated.toString())
                    ],
                  );
          }),
    );
  }
}
