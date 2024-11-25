import 'package:flutter/material.dart';

Class SocialMediaGroup{
  final String name;
  final String type;

  SocialMediaGroup({required this.name, required this.type});

  Map<String, dynamic> toMap(){
    return{
      'name': name,
      'type': type,
    };
  }


  factory SocialMediaGroup.fromMap(Map<String, dynamic> map){
    return SocialMediaGroup(
      name: map['name'] ?? '',
      type: map['type'] ?? '',
    );
  } 
}