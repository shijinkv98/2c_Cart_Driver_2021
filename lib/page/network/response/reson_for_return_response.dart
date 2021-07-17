class ReasonForReturnResponse {
  String success;
  String message;

  ReasonForReturnResponse({this.success, this.message});

  ReasonForReturnResponse.fromJson(Map<String, dynamic> json) {
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
