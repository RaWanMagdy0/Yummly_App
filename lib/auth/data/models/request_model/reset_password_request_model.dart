class ResetPasswordRequestModel {
  ResetPasswordRequestModel({
      this.email, 
      this.newPassword, 
      this.confirmPassword,});

  ResetPasswordRequestModel.fromJson(dynamic json) {
    email = json['email'];
    newPassword = json['newPassword'];
    confirmPassword = json['confirmPassword'];
  }
  String? email;
  String? newPassword;
  String? confirmPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['newPassword'] = newPassword;
    map['confirmPassword'] = confirmPassword;
    return map;
  }

}