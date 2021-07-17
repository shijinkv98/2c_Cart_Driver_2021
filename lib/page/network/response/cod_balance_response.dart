class CodBalanceResponse {
  String success;
  String message;
  String collected;
  String cashinhand;

  CodBalanceResponse(
      {this.success, this.message, this.collected, this.cashinhand});

  CodBalanceResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    collected = json['collected'];
    cashinhand = json['cashinhand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['collected'] = this.collected;
    data['cashinhand'] = this.cashinhand;
    return data;
  }
}
