import 'package:flutter/material.dart';
import 'package:yammi/data/models/restaurant/restaurant.dart';

class RestaurantDetailsPage extends StatelessWidget {
  final Restaurant _restaurant;

  const RestaurantDetailsPage(this._restaurant, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_restaurant.name),
      ),
    );
  }
}