import 'package:fav_helper/src/fav_helper.dart';
import 'package:flutter/material.dart';

class FavWidget extends StatefulWidget {
  final String itemKey;
  final String id;
  final Widget Function(BuildContext context, bool isFav) builder;
  const FavWidget({
    Key? key,
    required this.itemKey,
    required this.id,
    required this.builder,
  }) : super(key: key);

  @override
  _FavWidgetState createState() => _FavWidgetState();
}

class _FavWidgetState extends State<FavWidget> {
  late bool lastStatus;
  @override
  void initState() {
    lastStatus = FavHelper.isFav(widget.itemKey, widget.id);
    FavHelper.listen(widget.itemKey, () {
      final newStatus = FavHelper.isFav(widget.itemKey, widget.id);
      if (lastStatus != newStatus) {
        print('package $lastStatus $newStatus');
        setState(() {
          lastStatus = newStatus;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (_) => widget.builder(
        _,
        lastStatus,
      ),
    );
  }
}
