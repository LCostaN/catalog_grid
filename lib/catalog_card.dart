import 'package:flutter/material.dart';

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
