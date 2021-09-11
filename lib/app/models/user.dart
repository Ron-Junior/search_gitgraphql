import 'package:flutter/material.dart';
import 'package:search_gitgraphql/app/models/repository.dart';

class User {
  String nickName;
  String name;
  String avatarUrl;
  String bio;
  String location;
  String email;
  String url;
  List<Repository> ?starredRepositories;

  User(
    this.nickName,
    this.name,
    this.avatarUrl,
    this.bio,
    this.location,
    this.email,
    this.url,
    this.starredRepositories
  );

  factory User.toObject(Map<String, dynamic> json) {
    List<Repository> repositories = [];

    json["starredRepositories"].forEach((repositoryJson) {
      repositories.add(Repository.toObject(repositoryJson));
    });

    return User(
      json['login'],
      json['name'],
      json['avatar_url'],
      json['bio'],
      json['location'],
      json['email'],
      json['url'],
      repositories
    );
  }
}
