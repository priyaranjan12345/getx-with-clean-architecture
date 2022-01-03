class User {
  const User({
    required this.name,
    required this.username,
    this.imagePath,
  });

  final String name;
  final String username;
  final String? imagePath;

  factory User.empty() => const User(
        name: 'name',
        username: 'username',
        imagePath: 'assets/img/four.png',
      );
}
