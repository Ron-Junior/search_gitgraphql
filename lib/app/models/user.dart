import 'package:search_gitgraphql/app/models/repository.dart';

class User {
  String nickName;
  String name;
  String avatarUrl;
  String bio;
  String location;
  String email;
  String url;
  int ?starredRepositoriesCount;
  List<Repository> ?starredRepositories;

  User(
    this.nickName,
    this.name,
    this.avatarUrl,
    this.bio,
    this.location,
    this.email,
    this.url,
    this.starredRepositoriesCount,
  );

  factory User.toObject(Map<String, dynamic> json) {

    return User(
      json['login'],
      json['name'],
      json['avatarUrl'],
      json['bio'],
      json['location'],
      json['email'],
      json['url'],
      json['starredRepositories']?['totalCount']
    );
  }
}
