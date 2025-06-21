class SignupEntity {
  SignupEntity({
    this.message,
    this.isAuthenticated,
    this.userName,
    this.email,
    this.roles,
    this.token,
    this.expiresOn,});

  dynamic message;
  bool? isAuthenticated;
  String? userName;
  String? email;
  List<String>? roles;
  String? token;
  String? expiresOn;


}