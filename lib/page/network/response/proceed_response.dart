class ProceedResponse {
  String success;
  String message;

  ProceedResponse({this.success, this.message});

  ProceedResponse.fromJson(Map<String, dynamic> json) {
    success = json['Success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

