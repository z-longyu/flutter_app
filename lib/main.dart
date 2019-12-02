import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/NewRoute.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    // TODO: implement build
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(primaryColor: Colors.blue),
      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter'),
//        ),
          body: new Center(
//          child: new Text('Hello World!'),
//          child: new Text(wordPair.asPascalCase),
        child: new RandomWords(),
      )),
//        body: Container(
//          child: Builder(builder: (context) {
//            // 在Widget树中向上查找最近的父级`Scaffold` widget
//            Scaffold scaffold = context.ancestorWidgetOfExactType(Scaffold);
//            // 直接返回 AppBar的title， 此处实际上是Text("Context测试")
//            return (scaffold.appBar as AppBar).title;
//          }),
//        ),
//      ),
//      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();

  final _biggerFont = const TextStyle(fontSize: 18);
  var _item_title = "Item_Title";

  @override
  Widget build(BuildContext context) {
    print("build");
//    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Startup Name Generator"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSave)
        ],
      ),
      body: _buildSuggestions(),
//      body: FlatButton.icon(label: Text("发送"),onPressed: null, icon: Icon(Icons.send), ),
//      body: _basicsWidget(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final isSaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        isSaved ? Icons.favorite : Icons.favorite_border,
        color: isSaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (isSaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSave() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
                onTap: () async {
                  var result = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return NewRoute(
                      // 路由参数
                      text: "我是提示xxxx",
                    );
                  }));

                  print("路由返回值: $result");
                  setState(() {
                    _item_title = result;
                  });
                },
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(
              children: divided,
            ),
          );
        },
      ),
    );
  }

  void _futureTest() {
    Future.wait([
      Future.delayed(new Duration(seconds: 2), () {
        return 'Hello';
      }),
      Future.delayed(new Duration(seconds: 4), () {
        return 'World';
      })
    ]).then((results) {
      print(results[0] + '  : ' + results[1]);
    }, onError: (e) {
      print(e.toString());
    });
  }

  @override
  void initState() {
    print("initState");
  }

  @override
  void didChangeDependencies() {
    //改变依赖
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void didUpdateWidget(RandomWords oldWidget) {
    //更新widget
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    //移除去活
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    //销毁
    // TODO: implement dispose
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    //重置
    super.reassemble();
    print("reassemble");
  }

  bool switchSelected = true;
  bool checkboxSelected = true;
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  Widget _basicsWidget() {
    return Column(
      children: <Widget>[
//        Switch(value: switchSelected, onChanged: (value){
//          setState(() {
//            switchSelected = value;
//          });
//        }),
//
//        Checkbox(value: checkboxSelected, onChanged: (value){
//          setState(() {
//            checkboxSelected = value;
//          });
//        }),

//        TextField(
//          autofocus: true,
//          focusNode: focusNode1,
//          keyboardType: TextInputType.number,
//          decoration: InputDecoration(
//              labelText: "用户名",
//              hintText: "用户名或者邮箱",
//              prefixIcon: Icon(Icons.person)),
//        ),
//
//        TextField(
//          focusNode: focusNode2,
//          decoration: InputDecoration(
//            labelText: "密码",
//            hintText: "你的密码",
//            prefixIcon: Icon(Icons.lock),
//          ),
//          obscureText: true,
//        ),
//
//        Builder(builder: (ctx) {
//          return Column(
//            children: <Widget>[
//              RaisedButton(
//                  child: Text("移动焦点"),
//                  onPressed: () {
//                    if (focusScopeNode == null) {
//                      focusScopeNode = FocusScope.of(context);
//                    }
//                    focusScopeNode.requestFocus(focusNode2);
//                  }),
//
//              RaisedButton(
//                  child: Text("移除焦点"),
//                  onPressed: () {
//                    focusNode1.unfocus();
//                    focusNode2.unfocus();
//                  }),
//
//
//            ],
//          );
//        })

        LinearProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        ),

        LinearProgressIndicator(
          value: .5,
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        ),

        CircularProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        ),
        CircularProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
          value: 0.5,
        ),

        // 线性进度条高度指定为3
        SizedBox(
          height: 10,
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            value: .5,
          ),
        ),
// 圆形进度条直径指定为100
        SizedBox(
          height: 100,
          width: 130,
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            value: .7,
          ),
        ),
      ],
    );
  }
}
