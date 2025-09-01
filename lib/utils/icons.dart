import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

IconData getBrandIcon(String brand) {
  switch (brand.toLowerCase()) {
    case "amazon":
      return FontAwesomeIcons.amazon;
    case "airbnb":
      return FontAwesomeIcons.airbnb;
    case "upwork":
      return FontAwesomeIcons.upwork;
    case "electric co.":
      return FontAwesomeIcons.bolt;
    default:
      return FontAwesomeIcons.building;
  }
}
