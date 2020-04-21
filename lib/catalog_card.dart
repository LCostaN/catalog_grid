import 'package:flutter/material.dart';

class CatalogCard extends StatefulWidget {
  const CatalogCard({
    Key key,
    @required this.image,
    @required this.content,
    this.options,
  })  : assert(options == null || options is List<Widget>),
        super(key: key);

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
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: widget.image),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: SingleChildScrollView(child: widget.content)),
                  const SizedBox(height: 8.0),
                  widget.options != null
                      ? SizedBox(
                          height: 40,
                          child: ListView.separated(
                            shrinkWrap: true,
                            reverse: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.options.length,
                            itemBuilder: (context, i) => widget.options[i],
                            separatorBuilder: (context, j) =>
                                const SizedBox(width: 8.0),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
