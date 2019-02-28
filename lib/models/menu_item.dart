import 'package:flutter/material.dart';

class MenuItemModel extends Object {
  MenuItemModel(this.label, this.image, this.bgColor, this.labelColor, this.id);

  final String label;
  final Color bgColor;
  final Color labelColor;
  final String image;
  final String id;
}