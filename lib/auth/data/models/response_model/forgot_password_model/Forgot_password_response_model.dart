class ForgotPasswordResponseModel {
  ForgotPasswordResponseModel({
      this.result,});

  ForgotPasswordResponseModel.fromJson(dynamic json) {
    result = json['result'];
  }
  String? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = result;
    return map;
  }

}