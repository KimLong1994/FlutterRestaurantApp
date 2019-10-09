import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Kitchen {
  final String title;
  final String image;

  const Kitchen({
    @required this.title,
    @required this.image,
  });
}

class VegetableKitchen {
  final String image;
  final String title;

  const VegetableKitchen({
    @required this.image,
    @required this.title,
  });
}

class MaterialInvolved {
  final String title;
  final String subtitle;
  final String image;

  const MaterialInvolved({
    @required this.title,
    @required this.subtitle,
    @required this.image,
  });
}
