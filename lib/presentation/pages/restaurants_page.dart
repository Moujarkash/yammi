import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yammi/application/bloc/restaurants/restaurants_bloc.dart';
import 'package:yammi/injection.dart';
import 'package:yammi/presentation/routes/router.gr.dart';
import 'package:yammi/presentation/widgets/error_view.dart';
import 'package:yammi/presentation/widgets/restaurant_item.dart';

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({Key? key}) : super(key: key);

  @override
  _RestaurantsPageState createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  final RestaurantsBloc _bloc = getIt<RestaurantsBloc>();

  @override
  void initState() {
    _bloc.add(GetRestaurantsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RestaurantsBloc, RestaurantsState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FetchSuccess) {
            final restaurants = state.restaurants;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(26),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Best New York City restaurants',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: restaurants.length(),
                    itemBuilder: (context, index) {
                      final restaurant = restaurants.toList()[index];
                      return GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(RestaurantDetailsPageRoute(restaurant: restaurant));
                        },
                        child: RestaurantItem(restaurant),
                      );
                    },
                  ),
                ],
              ),
            );
          } else if (state is FetchFailure) {
            return Center(
              child: ErrorView(
                errorMessage: 'Something went wrong',
                onRetryClicked: () {
                  _bloc.add(GetRestaurantsEvent());
                },
              ),
            );
          }

          return Container();
        },
      ),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
