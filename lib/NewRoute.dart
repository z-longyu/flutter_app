import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget{

  NewRoute({ Key key,
    @required this.text, // 接收一个text参数}
  }): super(key : key);

  final String text;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('New route'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        )
      ),
    );
  }

}




