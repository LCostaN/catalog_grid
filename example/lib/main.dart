import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Widget> images;
  List<Widget> contents;
  List<List<Widget>> options;

  @override
  Widget build(BuildContext context) {
    images ??= List.generate(
      8,
      (index) => Container(
        color: Colors.green,
        child: FlutterLogo(),
      ),
    );
    contents ??= List.generate(
      8,
      (index) => Text(
        'This is the example of a card content. '
        'Usually, a Text is used here. This is item $index content example.',
        textAlign: TextAlign.justify,
      ),
    );
    options = List.generate(
        8,
        (index) => index != 5
            ? [
                SizedBox(
                  width: 120,
                  child: RaisedButton.icon(
                    icon: Icon(Icons.delete),
                    label: Text("Remove"),
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () => print('Pressed delete'),
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: RaisedButton.icon(
                    icon: Icon(Icons.edit),
                    label: Text("Edit"),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () => print('Pressed delete'),
                  ),
                ),
              ]
            : null);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Grid Catalog Example"),
        ),
        body: SafeArea(
          minimum: EdgeInsets.all(8.0),
          child: CatalogGrid(
            images: images,
            contents: contents,
            cardOptions: options,
            itemCount: 8,
            aspectRatio: 0.8,
            horizontalCount: 2,
          ),
        ),
      ),
    );
  }
}
