import 'package:flutter/material.dart';

class MyImage extends StatefulWidget {
  final String urlImage;

  MyImage(this.urlImage);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyImageState();
  }
}

class _MyImageState extends State<MyImage> {
  ImageProvider imgProvider;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.urlImage.contains('http')) {
      imgProvider = NetworkImage(widget.urlImage);
    } else {
      imgProvider = AssetImage(widget.urlImage);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        decoration: BoxDecoration(
      image: DecorationImage(
          image: imgProvider, fit: BoxFit.cover),
    ));
  }
}
