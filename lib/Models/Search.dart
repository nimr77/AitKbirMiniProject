import 'dart:html';

import 'package:flutter/cupertino.dart';

class MySearch {
  String textInput;
  File imageFile;
  int when;
  int results;
  bool good;

  //<editor-fold desc="Data Methods" defaultstate="collapsed">

  MySearch({
    @required this.textInput,
    @required this.imageFile,
    @required this.when,
    @required this.results,
    @required this.good,
  });

  MySearch copyWith({
    String textInput,
    File imageFile,
    int when,
    int results,
    bool good,
  }) {
    return new MySearch(
      textInput: textInput ?? this.textInput,
      imageFile: imageFile ?? this.imageFile,
      when: when ?? this.when,
      results: results ?? this.results,
      good: good ?? this.good,
    );
  }

  @override
  String toString() {
    return 'MySearch{textInput: $textInput, imageFile: $imageFile, when: $when, results: $results, good: $good}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MySearch &&
          runtimeType == other.runtimeType &&
          textInput == other.textInput &&
          imageFile == other.imageFile &&
          when == other.when &&
          results == other.results &&
          good == other.good);

  @override
  int get hashCode =>
      textInput.hashCode ^
      imageFile.hashCode ^
      when.hashCode ^
      results.hashCode ^
      good.hashCode;

  factory MySearch.fromMap(Map<String, dynamic> map) {
    return new MySearch(
      textInput: map['textInput'] as String,
      imageFile: map['imageFile'] as File,
      when: map['when'] as int,
      results: map['results'] as int,
      good: map['good'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'textInput': this.textInput,
      'imageFile': this.imageFile,
      'when': this.when,
      'results': this.results,
      'good': this.good,
    } as Map<String, dynamic>;
  }

  //</editor-fold>

  static MySearch me;
}
