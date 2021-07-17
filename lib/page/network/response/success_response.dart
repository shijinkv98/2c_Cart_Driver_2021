class SuccessResponse {
  int success;
  String message;

  SuccessResponse(this.message, this.success);

  SuccessResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
  }
}
