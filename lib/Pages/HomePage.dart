import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_ui_search/Controllers/MySearchController.dart';
import 'package:image_ui_search/Functions/MyConverters.dart';
import 'package:image_ui_search/Models/SearchResults.dart';
import 'package:image_ui_search/Widgets/SearchBar.dart';
import 'package:image_ui_search/generated/l10n.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loading = false;
  bool showImg = false;
  List<int> bytes;
  @override
  void initState() {
    MySearchController.myImgSub.onData((data) async {
      if (data != null) {
        setState(() {
          showImg = false;
        });
        bytes = await MyConverter.getHtmlBloobAs64Biyte(data);
        setState(() {
          showImg = true;
        });
        if (!loading)
          setState(() {
            loading = true;
          });
      } else {
        setState(() {
          showImg = false;
          if (loading) loading = false;
        });
      }
    });
    MySearchController.myLoadingRes.onData((data) {
      if (data != 0) {
        if (loading)
          setState(() {
            loading = false;
          });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: showImg
          ? InkWell(
              onTap: () {
                MySearchController.resetTheSearchImg();
              },
              child: Container(
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: MemoryImage(bytes), fit: BoxFit.cover)),
              ),
            )
          : null,
      appBar: AppBar(
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              MySearchResults.listOfMe.length.toString(),
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ),
        actions: [
          // the number of results
          Center(child: Container(width: 300, child: MySearchBar())),
          // upload Image
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextButton.icon(
              icon: Icon(Icons.image),
              onPressed: () async {
                await MySearchController.searchByImg();
              },
              label: Text(S.of(context).useImage),
            ),
          ),
        ],
        title: Text(
          "Image Search engine",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: !loading
            ? Padding(
                key: ValueKey<bool>(false),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Row(
                        children: [],
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                key: ValueKey<bool>(true),
                child: SpinKitCubeGrid(
                  color: Colors.grey,
                ),
              ),
      ),
    );
  }
}
