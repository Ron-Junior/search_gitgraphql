class Repository {
  String description;
  String name;
  int stargazerCount;

  Repository(
    this.description,
    this.name,
    this.stargazerCount,
  );

  factory Repository.toObject(Map<String, dynamic> json) => Repository(
    json["description"],
    json["name"],
    json["stargazerCount"]
  );

}
