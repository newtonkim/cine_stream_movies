class GenreMoviesModel {
  final String name;
  final int id;

  GenreMoviesModel({required this.name, required this.id});

  factory GenreMoviesModel.fromJson(Map<String, dynamic> json){
    return GenreMoviesModel(
      name: json['name'],
      id: json['id'],
    );
  }
    // .fromJ son()

  Map<String, dynamic> toJson() {
    return {'name': name, 'id': id};
  }

 
  @override
  String toString() {
    return 'GenreMoviesModel(name: $name, id: $id)';
  }
  
}
