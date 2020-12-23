import 'dart:async';
import 'dart:html';

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

  static theSearcherIMG() {
    myImgSub.onData((data) async {
      if (data != null) {
        // request via API
        // notify the streamer

      }
    });
  }
}
