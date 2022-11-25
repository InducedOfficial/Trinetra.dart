import 'package:flutter/material.dart';

class BottomNavigationBar {
  Widget componentOne(BuildContext context, int index, List<Widget> children) {
    return children[index];
  }

  Widget componentTwo(BuildContext context, int index, List<Widget> children) {
    return children[index];
  }
}
