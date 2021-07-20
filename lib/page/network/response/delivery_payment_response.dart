class DeliveryPaymentResponse {
  String success;
  String message;
  int total;
  String orderid;
  String paymenttype;

  DeliveryPaymentResponse(
      {this.success, this.message, this.total, this.orderid, this.paymenttype});

  DeliveryPaymentResponse.fromJson(Map<String, dynamic> json) {
    success = json['Success'];
    message = json['message'];
    total = json['Total'];
    orderid = json['Orderid'];
    paymenttype = json['Paymenttype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Success'] = this.success;
    data['message'] = this.message;
    data['Total'] = this.total;
    data['Orderid'] = this.orderid;
    data['Paymenttype'] = this.paymenttype;
    return data;
  }
}
