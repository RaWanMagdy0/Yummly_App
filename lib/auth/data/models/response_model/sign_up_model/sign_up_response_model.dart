class SignupResponseModel {
  SignupResponseModel({
      this.message, 
      this.isAuthenticated, 
      this.userName, 
      this.email, 
      this.roles, 
      this.token, 
      this.expiresOn,});
  SignupResponseModel.fromJson(dynamic json) {
    message = json['message'];
    isAuthenticated = json['isAuthenticated'];
    userName = json['userName'];
    email = json['email'];
    roles = json['roles'] != null ? json['roles'].cast<String>() : [];
    token = json['token'];
    expiresOn = json['expiresOn'];
  }
  dynamic message;
  bool? isAuthenticated;
  String? userName;
  String? email;
  List<String>? roles;
  String? token;
  String? expiresOn;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['isAuthenticated'] = isAuthenticated;
    map['userName'] = userName;
    map['email'] = email;
    map['roles'] = roles;
    map['token'] = token;
    map['expiresOn'] = expiresOn;
    return map;
  }
}