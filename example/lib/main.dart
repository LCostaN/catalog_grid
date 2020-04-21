import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        body: CatalogGrid(itemCount: null),
      ),
    );
  }
}

class CatalogGrid extends StatefulWidget {
  CatalogGrid({
    Key key,
    this.images,
    this.contents,
    this.cardOptions,
    @required this.itemCount,
    this.childWidth,
    this.horizontalCount,
    this.horizontalMargin,
    this.verticalMargin,
  })  : assert(itemCount != null && itemCount > 0),
        assert(childWidth != null || horizontalCount != null),
        super(key: key);

  /// List of Widgets to use in the top part of the card. If empty, use
  /// an empty [Container] to avoid mismatch of image and content.
  final List<Widget> images;

  /// List of Widgets to use in bottom part of the card. Usually a [Text]
  /// is used here. Use an empty Container or Text to avoid mismatch with
  /// images.
  final List<Widget> contents;

  /// List of actions to be added on the bottom of the card. This is shown
  /// below the content. Usually buttons are placed here.
  final List<List<Widget>> cardOptions;

  /// Total number of items in the Grid. Cannot be a negative number.
  final int itemCount;

  /// The width each child should have. Defaults to 300.
  final double childWidth;

  /// How many children should be in an horizontal "Line". If not null, [childWidth]
  /// would be ignored and width would be equal to screen's width / count.
  final int horizontalCount;

  /// Horizontal Spacing.
  final double horizontalMargin;

  /// Vertical Spacing.
  final double verticalMargin;

  @override
  _CatalogGridState createState() => _CatalogGridState();
}

class _CatalogGridState extends State<CatalogGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: widget.childWidth,
      ),
      itemCount: widget.itemCount,
      itemBuilder: (context, i) => CatalogCard(
        image: widget.images[i],
        content: widget.contents[i],
        options: widget.cardOptions[i],
      ),
    );
  }
}

class CatalogCard extends StatefulWidget {
  const CatalogCard({
    Key key,
    this.image,
    this.content,
    this.options,
  }) : super(key: key);

  final Widget image;
  final Widget content;
  final List<Widget> options;

  @override
  _CatalogCardState createState() => _CatalogCardState();
}

class _CatalogCardState extends State<CatalogCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: widget.image),
          Expanded(child: widget.content),
          widget.options != null
              ? ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 200),
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: widget.options,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
