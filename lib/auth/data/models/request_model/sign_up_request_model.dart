class SignUpRequestModel {
  SignUpRequestModel({
      this.fullName, 
      this.phoneNumber, 
      this.email, 
      this.password,});

  SignUpRequestModel.fromJson(dynamic json) {
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    password = json['password'];
  }
  String? fullName;
  String? phoneNumber;
  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullName'] = fullName;
    map['phoneNumber'] = phoneNumber;
    map['email'] = email;
    map['password'] = password;
    return map;
  }

}