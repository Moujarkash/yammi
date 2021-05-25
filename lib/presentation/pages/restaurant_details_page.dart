import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yammi/application/bloc/restaurant_details/restaurant_details_bloc.dart';
import 'package:yammi/data/models/restaurant/restaurant.dart';
import 'package:yammi/injection.dart';
import 'package:yammi/presentation/resources/colors.dart';
import 'package:yammi/presentation/widgets/error_view.dart';
import 'package:yammi/presentation/widgets/menu_list_item.dart';
import 'package:yammi/presentation/widgets/rate_bar.dart';

class RestaurantDetailsPage extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantDetailsPage(this.restaurant, {Key? key}) : super(key: key);

  @override
  _RestaurantDetailsPageState createState() => _RestaurantDetailsPageState();
}

class _RestaurantDetailsPageState extends State<RestaurantDetailsPage> {
  final RestaurantDetailsBloc _bloc = getIt<RestaurantDetailsBloc>();

  @override
  void initState() {
    _bloc.add(GetRestaurantMenusEvent(widget.restaurant.id.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                  top: 8, right: 37, left: 37, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            AutoRouter.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          )),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: Hero(
                        tag: widget.restaurant.name,
                        child: Text(
                          widget.restaurant.name,
                          style: const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Hero(
                      tag: widget.restaurant.cuisine,
                      child: Text(
                        widget.restaurant.cuisine,
                        style: const TextStyle(fontSize: 13),
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  Hero(
                    tag: '${widget.restaurant.id}-status',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RateBar(
                          rate: widget.restaurant.rate,
                        ),
                        Text(
                          widget.restaurant.status,
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
            ),
            BlocBuilder<RestaurantDetailsBloc, RestaurantDetailsState>(
              bloc: _bloc,
              builder: (context, state) {
                if (state is Loading) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is FetchSuccess) {
                  final menus = state.menus;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(26),
                    itemBuilder: (context, index) {
                      final menu = menus.toList()[index];
                      return MenuListItem(menu);
                    },
                    itemCount: menus.length(),
                  );
                } else if (state is FetchFailure) {
                  return Expanded(
                    child: Center(
                      child: ErrorView(
                        errorMessage: 'Something went wrong',
                        onRetryClicked: () {
                          _bloc.add(GetRestaurantMenusEvent(
                              widget.restaurant.id.toString()));
                        },
                      ),
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
