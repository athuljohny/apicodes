// To parse this JSON data, do
//
//     final courses = coursesFromJson(jsonString);

import 'dart:convert';

Courses coursesFromJson(String str) => Courses.fromJson(json.decode(str));

class Courses {
  Courses({
    this.data,
    this.source,
  });

  List<Datum>? data;
  List<Source>? source;

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        source:
            List<Source>.from(json["source"].map((x) => Source.fromJson(x))),
      );

  static Future<List<Courses>>? FromJson(String json) {}
}

class Datum {
  Datum({
    this.idNation,
    this.nation,
    this.idYear,
    this.year,
    this.population,
    this.slugNation,
  });

  String? idNation;
  String? nation;
  int? idYear;
  String? year;
  int? population;
  String? slugNation;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idNation: json["ID Nation"],
        nation: json["Nation"],
        idYear: json["ID Year"],
        year: json["Year"],
        population: json["Population"],
        slugNation: json["Slug Nation"],
      );

  Map<String, dynamic> toJson() => {
        "ID Nation": idNation,
        "Nation": nation,
        "ID Year": idYear,
        "Year": year,
        "Population": population,
        "Slug Nation": slugNation,
      };
}

class Source {
  Source({
    this.measures,
    this.annotations,
    this.name,
    this.substitutions,
  });

  List<String>? measures;
  Annotations? annotations;
  String? name;
  List<dynamic>? substitutions;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        measures: List<String>.from(json["measures"].map((x) => x)),
        annotations: Annotations.fromJson(json["annotations"]),
        name: json["name"],
        substitutions: List<dynamic>.from(json["substitutions"].map((x) => x)),
      );
}

class Annotations {
  Annotations({
    this.sourceName,
    this.sourceDescription,
    this.datasetName,
    this.datasetLink,
    this.tableId,
    this.topic,
    this.subtopic,
  });

  String? sourceName;
  String? sourceDescription;
  String? datasetName;
  String? datasetLink;
  String? tableId;
  String? topic;
  String? subtopic;

  factory Annotations.fromJson(Map<String, dynamic> json) => Annotations(
        sourceName: json["source_name"],
        sourceDescription: json["source_description"],
        datasetName: json["dataset_name"],
        datasetLink: json["dataset_link"],
        tableId: json["table_id"],
        topic: json["topic"],
        subtopic: json["subtopic"],
      );

  Map<String, dynamic> toJson() => {
        "source_name": sourceName,
        "source_description": sourceDescription,
        "dataset_name": datasetName,
        "dataset_link": datasetLink,
        "table_id": tableId,
        "topic": topic,
        "subtopic": subtopic,
      };
}
