

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

class Standard {
  String? title;
  String? price;
  String? image;
  Standard({
    this.title,
    this.price,
    this.image,

  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'icon': price,
      'count': image,
    };
  }

  factory Standard.fromMap(Map<String, dynamic> map) {
    return Standard(
      title: map['title'],
      price: map['price'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Standard.fromJson(String source) =>
      Standard.fromMap(json.decode(source));
}