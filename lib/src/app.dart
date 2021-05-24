import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yammi/application/bloc/auth/auth_bloc.dart';
import 'package:yammi/injection.dart';
import 'package:yammi/presentation/resources/colors.dart';
import 'package:yammi/presentation/resources/dimensions.dart';
import 'package:yammi/presentation/resources/styles.dart';
import 'package:yammi/presentation/routes/router.gr.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AuthBloc>()..add(const AuthCheckRequested()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: getThemeColor(),
          accentColor: secondaryColor,
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: backgroundColor,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(roundRadius),
              borderSide: const BorderSide(
                color: primaryColor,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            hintStyle: const TextStyle(fontSize: 14),
          ),
          textTheme: const TextTheme(
            subtitle2: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
