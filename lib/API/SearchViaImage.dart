import 'dart:html';

import 'package:dio/dio.dart';
import 'package:image_ui_search/Models/SearchResults.dart';

import 'RootsAPIGeneral.dart';

class MySearchViaImage {
  static Future<Iterator> search(List<int> image) async {
    var formData = FormData.fromMap({'file': MultipartFile.fromBytes(image)});
    // http.MultipartFile myFile = http.MultipartFile.fromBytes('file', image);
    // http.MultipartRequest myRed =
    //     http.MultipartRequest('POST', Uri.parse(MyAPIRootsGeneral.SearchImg))
    //       ..files.add(myFile);
    //
    // var x = await myRed.send();
    // final res = await x.stream.bytesToString();
    // print(res);
    // var resBody = json.decode(res);
    //
    // var formData = FormData.fromMap({
    //   "name": "wendux",
    //   "age": 25,
    //   "file":
    //       await MultipartFile.fromFile("./text.txt", filename: "upload.txt"),
    //   "files": [
    //     await MultipartFile.fromFile("./text1.txt", filename: "text1.txt"),
    //     await MultipartFile.fromFile("./text2.txt", filename: "text2.txt"),
    //   ]
    // });
    Dio dio = new Dio();

    var response = await dio.post(MyAPIRootsGeneral.SearchImg, data: formData);
    for (final x in response.data) {
      try {
        Map data = Map();
        data.addAll({'distance': x[1]['distance']});
        data.addAll(
          {'name': x[1]['data']['name'], 'url': x[1]['data']['urlImage']},
        );
        MySearchResults.listOfMe.add(SearchItem.fromMap(data));
      } catch (e) {}
    }
    return response.data;
  }
}
