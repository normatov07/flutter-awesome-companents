import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  // const TextInputWiget({Key? key}) : super(key: key);

  Function(String) callback;

  TextInputWidget(this.callback);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  // String text = "";

  // @override
  // void dispose(){
  //   super.dispose();
  //   controller.dispose();
  // }

  // void changeText(text){
  //   if(text == 'Hello'){
  //     controller.clear();
  //     text="";
  //   }
  //   setState(() {
  //     this.text = text;
  //   });
  // }

  void click() {
    widget.callback(controller.text);
    controller.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.message),
          labelText: 'Type Message',
          suffixIcon: IconButton(
            splashColor: Colors.green,
            icon: Icon(Icons.send),
            onPressed: this.click,
            tooltip: 'this is post',
          )),
      // onChanged: (text) =>  this.changeText(text),
    );
    //Text(this.text)
  }
}