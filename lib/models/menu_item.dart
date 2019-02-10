import 'package:flutter/material.dart';

class MenuItemModel extends Object {
  MenuItemModel(this.label, this.image, this.bgColor, this.id);

  final String label;
  final Color bgColor;
  final String image;
  final String id;
}