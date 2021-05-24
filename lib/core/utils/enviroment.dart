import 'package:injectable/injectable.dart';

abstract class Environment {
  static const dev = 'dev';

  String get getBaseUrl;
}

@LazySingleton(as: Environment, env: [Environment.dev])
class DevEnvironment implements Environment {
  @override
  String get getBaseUrl => 'https://long-rubber.herokuapp.com';
}