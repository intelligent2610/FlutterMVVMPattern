import 'package:flutter/material.dart';

class DialogLoading extends Dialog {

  Function(BuildContext context) onDissmis;

  DialogLoading(){
    onDissmis =(BuildContext context){
      dissmisDialog(context);
    };
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  void dissmisDialog(BuildContext context) {
    Navigator.pop(context);
  }
}


