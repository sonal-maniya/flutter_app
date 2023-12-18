class UserModal {
  final int id;
  final String name;
  final String username;
  final String email;
  final String? phone;

  const UserModal({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.phone,
  });

  factory UserModal.fromJson(Map<String, dynamic> json) {
    return UserModal(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );
  }
}
