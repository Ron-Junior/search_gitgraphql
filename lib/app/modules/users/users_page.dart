import 'package:flutter_mobx/flutter_mobx.dart';
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

  ScrollController _scrollController = ScrollController();

  UsersPageState() {
    _scrollController..addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        store.fetchMoreUsers();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              prefix: Icon(Icons.search),
            ),
            onChanged: (String value) => store.fetchUsers(value),
          ),

          Observer(
            builder: (_) =>
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: store.users?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(store.users?[index].name ?? 'Nothing'),
                  );
                },
              ),
            )
          )
        ],
      ),
    );
  }
}
