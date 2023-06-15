// To parse this JSON data, do
//
//     final marvel = marvelFromJson(jsonString);

import 'dart:convert';

Marvel marvelFromJson(String str) => Marvel.fromJson(json.decode(str));

String marvelToJson(Marvel data) => json.encode(data.toJson());

class Marvel {
    List<Language> languages;

    Marvel({
        required this.languages,
    });

    factory Marvel.fromJson(Map<String, dynamic> json) => Marvel(
        languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
    };
}

class Language {
    String language;
    String name;

    Language({
        required this.language,
        required this.name,
    });

    factory Language.fromJson(Map<String, dynamic> json) => Language(
        language: json["language"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "language": language,
        "name": name,
    };
}
