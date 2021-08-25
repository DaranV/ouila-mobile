import 'dart:core';

class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String username;
  String password;
  String cardNumber;
  String phone;
  String address;
  int courseId;
  String role;
  String token;

  User(
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.username,
      this.password,
      this.cardNumber,
      this.phone,
      this.address,
      this.courseId,
      this.role,
      this.token);

  @override
  String toString() {
    return 'User{id: $id, firstName: $firstName, lastName: $lastName, email: $email, username: $username, password: $password, cardNumber: $cardNumber, phone: $phone, address: $address, courseId: $courseId, role: $role, token: $token}';
  }
}
