import 'package:flutter/cupertino.dart';

class MySearchResults {
  static List<SearchItem> listOfMe = List<SearchItem>();
}

class SearchItem {
  String id;
  double distance;
  String url;
  String name;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  SearchItem({
    @required this.id,
    @required this.distance,
    @required this.url,
    @required this.name,
  });

  SearchItem copyWith({
    String id,
    double distance,
    String url,
    String name,
  }) {
    return new SearchItem(
      id: id ?? this.id,
      distance: distance ?? this.distance,
      url: url ?? this.url,
      name: name ?? this.name,
    );
  }

  @override
  String toString() {
    return 'SearchItem{id: $id, distance: $distance, url: $url, name: $name}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          distance == other.distance &&
          url == other.url &&
          name == other.name);

  @override
  int get hashCode =>
      id.hashCode ^ distance.hashCode ^ url.hashCode ^ name.hashCode;

  factory SearchItem.fromMap(Map<String, dynamic> map) {
    return new SearchItem(
      id: map['id'] as String,
      distance: map['distance'] as double,
      url: map['url'] as String,
      name: map['name'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'distance': this.distance,
      'url': this.url,
      'name': this.name,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
