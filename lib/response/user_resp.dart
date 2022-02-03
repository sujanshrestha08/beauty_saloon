class ResponseUser {
  bool? success;
  String? token;
  Map<String, dynamic>? userData;
  ResponseUser({this.success, this.token, this.userData});

  factory ResponseUser.fromJson(Map<String, dynamic> json) {
    return ResponseUser(
        success: json['success'], token: json['token'], userData: json['userData']);
  }
}
