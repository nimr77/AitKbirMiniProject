import 'dart:async';
import 'dart:html';

import 'package:image_ui_search/API/SearchViaImage.dart';
import 'package:image_ui_search/Functions/MyConverters.dart';
import 'package:image_ui_search/html/HtmlFunctions.dart';

class MySearchController {
  // ignore: close_sinks
  static StreamController<File> img = StreamController<File>();
  // ignore: close_sinks
  static StreamController<int> loadingRes = StreamController<int>();

  // ignore: cancel_subscriptions
  static StreamSubscription myImgSub = img.stream.listen((event) {});
  // ignore: cancel_subscriptions
  static StreamSubscription myLoadingRes = loadingRes.stream.listen((event) {});
  static Future doSearchForElementFromText(String text) async {
    // add the stream controller
    // add the api
    // save into the model
  }

  static Future searchByImg() async {
    img.sink.add(await MyFunctionsHtml.getImage());
  }

  static resetTheSearchImg() {
    img.sink.add(null);
  }

  static initSearcherIMG(data) async {
    // request via API
    var bit = await MyConverter.getHtmlBloobAs64Biyte(data);
    await MySearchViaImage.search(bit);
    // notify the streamer
  }
}
