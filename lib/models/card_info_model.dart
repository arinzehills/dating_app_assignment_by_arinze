import 'dart:convert';

import 'dart:io';

class CardInfoModel {
  String name;
  String description; //this is the user that created the question
  String age;
  String? location;
  // List<String> images;
  // List<String> tags;
  // int duration;
  // String? createAt;
  // DateTime? expiresAt;
  CardInfoModel({
    required this.name,
    required this.description,
    required this.age,
    required this.location,
    // required this.images,
    // required this.tags,
    // required this.duration,
    // this.createAt,
    // this.expiresAt,
  });

  factory CardInfoModel.fromJson(Map<Object?, Object?> json) {
    print("json at CardInfoModel");
    print(json);
    return CardInfoModel(
      name: "json['name']",
      description: "json['description']",
      age: "json['age']",
      location: "json['location']",
      // images: json['images'],
      // tags: json['tags'],
    );
  }

  Map<String, dynamic> toJson() => {
        // "user_id": user_id,
        // "title": title,
        // "listOfQuestions": listOfQuestions,
        // "participants": participants,
        // 'duration': duration,
        // 'expiresAt': MyDateFormatter.convertToTimestamp(expiresAt!)
        // "createAt": DateTime.now().toString(),
        // "createAt": DateTime.now().toString(),
      };
}
