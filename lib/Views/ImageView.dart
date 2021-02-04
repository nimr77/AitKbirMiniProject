import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_ui_search/Models/SearchResults.dart';

class MyImageView extends StatefulWidget {
  final SearchItem mySearchItem;
  MyImageView({@required this.mySearchItem});
  @override
  _MyImageViewState createState() => _MyImageViewState();
}

class _MyImageViewState extends State<MyImageView> {
  NetworkImage imProvider;
  bool loading = true;

  loadImage() {
    imProvider = NetworkImage(widget.mySearchItem.url);
    setState(() {
      loading = true;
    });
    imProvider
        .resolve(ImageConfiguration())
        .addListener(ImageStreamListener((_, __) {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 600),
        child: !loading
            ? Stack(
                key: ValueKey<bool>(false),
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: imProvider)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 120,
                      color: Colors.black54.withOpacity(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // the like
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/like.png'),
                          ),
                          // the title
                          Text(
                            widget.mySearchItem.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(color: Colors.white),
                          ),
                          // the dislike
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/dislike.png'),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            : SpinKitChasingDots(
                key: ValueKey<bool>(true),
                color: Colors.grey,
              ),
      ),
    );
  }
}
