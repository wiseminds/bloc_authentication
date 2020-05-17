
class User {
  final String name;
  final String email;
  final String image;



  User({
    this.image,
    this.name,
    this.email,
  });
  User copyWith({String name, String email, String token, String image}) =>
      User(
          email: email ?? this.email,
          image: image ?? this.image,
          name: name ?? this.name);

  

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json['name'] as String,
    email: json['email'] as String,
    image: json['image'] as String,
  );


  Map<String, dynamic> toJson() => <String, dynamic>{
      'name': this.name,
      'email': this.email,
      'image': this.image,
    };
}
