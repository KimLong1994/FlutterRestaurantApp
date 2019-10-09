import 'package:flutter/foundation.dart';

class Chef {
  final String id;
  final String title;
  final String description;
  final String image;

  const Chef({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.image,
  });
}

class ChefFood {
  final String title;
  final String image;

  const ChefFood({
    @required this.image,
    @required this.title,
  });
}
