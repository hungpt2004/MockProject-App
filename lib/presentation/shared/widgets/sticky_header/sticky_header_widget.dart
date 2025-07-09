import 'package:flutter/material.dart';

class StickySectionHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  StickySectionHeaderDelegate({required this.child, this.height = 60});

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant StickySectionHeaderDelegate oldDelegate) {
    return oldDelegate.child != child || oldDelegate.height != height;
  }
}
