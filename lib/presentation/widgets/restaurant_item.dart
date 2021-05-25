import 'package:flutter/material.dart';
import 'package:yammi/data/models/restaurant/restaurant.dart';
import 'package:yammi/presentation/resources/colors.dart';
import 'package:yammi/presentation/resources/dimensions.dart';
import 'package:yammi/presentation/widgets/rate_bar.dart';

class RestaurantItem extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantItem(this.restaurant, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(roundRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(roundRadius),
                child: Image.network(restaurant.images[0],
                    height: 202, width: double.infinity, fit: BoxFit.fill),
              ),
              const SizedBox(
                height: 8,
              ),
              Hero(
                  tag: restaurant.name,
                  child: Text(
                    restaurant.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              Hero(
                  tag: restaurant.cuisine,
                  child: Text(
                    restaurant.cuisine,
                    style: const TextStyle(fontSize: 11),
                  )),
              const SizedBox(
                height: 8,
              ),
              Hero(
                tag: '${restaurant.id}-status',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RateBar(
                      rate: restaurant.rate,
                    ),
                    Text(
                      restaurant.status,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
