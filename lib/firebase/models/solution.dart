import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Solution {
  String type;
  String title;
  String description;
  Solution({
    required this.type,
    required this.title,
    required this.description,
  });

  factory Solution.fromMap(Map<String, dynamic> map) {
    return Solution(
      type: map['type'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }
}
