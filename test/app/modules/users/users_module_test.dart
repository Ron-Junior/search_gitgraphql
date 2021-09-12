import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_gitgraphql/app/modules/users/users_module.dart';

void main() {

  setUpAll(() {
    initModule(UsersModule());
  });
}
