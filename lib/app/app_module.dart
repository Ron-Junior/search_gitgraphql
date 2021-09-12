import 'package:flutter_modular/flutter_modular.dart';
import 'package:search_gitgraphql/app/modules/users/users_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: UsersModule()),
  ];

}
