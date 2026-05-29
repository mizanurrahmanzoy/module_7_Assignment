import 'package:flutter/material.dart';

class TaskModel {
  int? id;
  String? title;
  String? time;
  String? status;
  int? colorValue;

  TaskModel({
    this.id,
    required this.title,
    required this.time,
    required this.status,
    required this.colorValue,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['title'],
      time: map['time'],
      status: map['status'],
      colorValue: map['colorValue'],
    );
  }
  Color get color => Color(colorValue!);
}
