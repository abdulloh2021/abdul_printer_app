class User {
  final int id; // ID pengguna
  final String username; // Username pengguna
  final String email; // Email pengguna
  final String firstName; // Nama depan pengguna
  final String lastName; // Nama belakang pengguna
  final String gender; // Gender pengguna
  final String image; // URL foto profil pengguna

  // Konstruktor untuk membuat objek User
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
  });

  // Factory method untuk membuat objek User dari JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      image: json['image'],
    );
  }

  // Konversi objek User ke dalam bentuk Map/JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'image': image,
    };
  }
}
