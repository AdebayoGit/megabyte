class User {
  final String firstName;
  final String lastName;
  final String email;
  String country = 'Nigeria';
  String? address;
  String? city;
  String phoneNo;
  String? imagePath;

  User(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.country,
      this.address,
      this.city,
      required this.phoneNo,
      this.imagePath});
}
