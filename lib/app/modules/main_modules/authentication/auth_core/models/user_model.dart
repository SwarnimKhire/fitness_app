class User {
  final int? id;
  final String? name;
  final String? mobile;
  final String? email;
  final String? password;

  User({
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.password,
  });

  // Copy constructor to create a new instance with updated values
  User copyWith({
    int? id,
    String? name,
    String? mobile,
    String? email,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  // Convert user object to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'mobile': mobile,
      'email': email,
      'password': password,
    };
  }

  // Create a user object from a map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      mobile: map['mobile'],
      email: map['email'],
      password: map['password'],
    );
  }
}
