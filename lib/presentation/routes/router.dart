import 'package:auto_route/auto_route.dart';
import 'package:yammi/presentation/pages/confirm_phone_page.dart';
import 'package:yammi/presentation/pages/restaurant_details_page.dart';
import 'package:yammi/presentation/pages/restaurants_page.dart';
import 'package:yammi/presentation/pages/sign_in_page.dart';
import 'package:yammi/presentation/pages/splash_page.dart';

@CupertinoAutoRouter(  
  routes: <AutoRoute>[  
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: SignInPage),
    AutoRoute(page: ConfirmPhonePage),
    AutoRoute(page: RestaurantsPage),
    AutoRoute(page: RestaurantDetailsPage),
  ],  
)  
class $AppRouter {}  