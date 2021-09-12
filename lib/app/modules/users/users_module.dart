import 'package:search_gitgraphql/app/modules/users/users_page.dart';
import 'package:search_gitgraphql/app/modules/users/users_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UsersModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => UsersStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => UsersPage()),
  ];
}
