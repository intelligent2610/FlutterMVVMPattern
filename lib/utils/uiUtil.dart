import 'package:flutter/material.dart';

ImageProvider makeImageDecoration(String url) {
  ImageProvider imgProvider;
  if (url.contains('http')) {
    imgProvider = NetworkImage(url);
  } else {
    imgProvider = AssetImage(url);
  }
  return imgProvider;
}

Widget makeImageWidget(String url,
    {double width, double height, BoxFit boxFit}) {
  Widget imgWidget;
  if (url.contains('http')) {
    imgWidget = Image.network(url, width: width, height: height, fit: boxFit);
  } else {
    imgWidget = Image.asset(
      url,
      width: width,
      height: height,
      fit: boxFit,
    );
  }
  return imgWidget;
}
