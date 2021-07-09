

import 'dart:convert';

class Simples {
  String? title;
  String? icon;
  String? count;
  Simples({
    this.title,
    this.icon,
    this.count,

  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'icon': icon,
      'count': count,
    };
  }

  factory Simples.fromMap(Map<String, dynamic> map) {
    return Simples(
      title: map['title'],
      icon: map['icon'],
      count: map['count'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Simples.fromJson(String source) =>
      Simples.fromMap(json.decode(source));
}