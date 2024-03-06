class Account {
  String? message;
  String? accessToken;
  String? refreshToken;

  Account({
    this.message,
    this.accessToken,
    this.refreshToken,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        message: json["message"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}
