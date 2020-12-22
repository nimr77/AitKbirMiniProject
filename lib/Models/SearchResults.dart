import 'package:flutter/cupertino.dart';

class MySearchResults {
  static List<SearchItem> listOfMe = List<SearchItem>();
}

class SearchItem {
  String id;
  String title;
  String imageUrl;
  bool good;
  int alphaValue;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  SearchItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.good,
    @required this.alphaValue,
  });

  SearchItem copyWith({
    String id,
    String title,
    String imageUrl,
    bool good,
    int alphaValue,
  }) {
    return new SearchItem(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      good: good ?? this.good,
      alphaValue: alphaValue ?? this.alphaValue,
    );
  }

  @override
  String toString() {
    return 'SearchItem{id: $id, title: $title, imageUrl: $imageUrl, good: $good, alphaValue: $alphaValue}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          imageUrl == other.imageUrl &&
          good == other.good &&
          alphaValue == other.alphaValue);

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      imageUrl.hashCode ^
      good.hashCode ^
      alphaValue.hashCode;

  factory SearchItem.fromMap(Map<String, dynamic> map) {
    return new SearchItem(
      id: map['id'] as String,
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
      good: map['good'] as bool,
      alphaValue: map['alphaValue'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'title': this.title,
      'imageUrl': this.imageUrl,
      'good': this.good,
      'alphaValue': this.alphaValue,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
