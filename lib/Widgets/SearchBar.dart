import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_ui_search/Models/Search.dart';
import 'package:image_ui_search/generated/l10n.dart';

class MySearchBar extends StatefulWidget {
  @override
  _MySearchBarState createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  TextEditingController searchText = TextEditingController();
  @override
  void initState() {
    searchText.text = MySearch.me.textInput;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: searchText,
        decoration: InputDecoration(
            hintText: S.of(context).search,
            prefixIcon: Icon(Icons.search_rounded),
            border: OutlineInputBorder()),
      ),
    );
  }
}
