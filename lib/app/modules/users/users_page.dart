import 'package:flutter_modular/flutter_modular.dart';
import 'package:search_gitgraphql/app/modules/users/users_store.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  final String title;
  const UsersPage({Key? key, this.title = 'UsersPage'}) : super(key: key);
  @override
  UsersPageState createState() => UsersPageState();
}
class UsersPageState extends State<UsersPage> {
  final UsersStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}