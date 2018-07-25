class ResponseData {
  int code;
  dynamic data;
  String message;

  ResponseData.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        data = json['data'],
        message = json['message'];

  Map<String, dynamic> toJson() => {
        'code': code,
        'data': data,
        'message': message,
      };
}
