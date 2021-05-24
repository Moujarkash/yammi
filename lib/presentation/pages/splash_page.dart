import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yammi/application/bloc/auth/auth_bloc.dart';
import 'package:yammi/presentation/routes/router.gr.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          AutoRouter.of(context).replace(const RestaurantsPageRoute());
        } else if (state is Unauthenticated) {
          AutoRouter.of(context).replace(const SignInPageRoute());
        } 
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}