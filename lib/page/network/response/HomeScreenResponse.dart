class HomeScreenResponse {
  String success;
  String message;
  String firstname;
  String lastname;
  List<Orders> orders;
  List<Accepted> accepted;
  List<History> history;

  HomeScreenResponse(
      {this.success, this.message,this.firstname,this.lastname, this.orders, this.accepted, this.history});

  HomeScreenResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    if (json['orders'] != null) {
      orders = new List<Orders>();
      json['orders'].forEach((v) {
        orders.add(new Orders.fromJson(v));
      });
    }
    if (json['accepted'] != null) {
      accepted = new List<Accepted>();
      json['accepted'].forEach((v) {
        accepted.add(new Accepted.fromJson(v));
      });
    }
    if (json['history'] != null) {
      history = new List<History>();
      json['history'].forEach((v) {
        history.add(new History.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['lastname'] = this.lastname;
    data['firstname'] = this.firstname;
    if (this.orders != null) {
      data['orders'] = this.orders.map((v) => v.toJson()).toList();
    }
    if (this.accepted != null) {
      data['accepted'] = this.accepted.map((v) => v.toJson()).toList();
    }
    if (this.history != null) {
      data['history'] = this.history.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  String orderdetailid;
  String orderid;
  String product;
  String productId;
  String description;
  String image;
  String price;
  String quantity;
  String orderslno;
  String accepted;

  Orders(
      {this.orderdetailid,
        this.orderid,
        this.product,
        this.productId,
        this.description,
        this.image,
        this.price,
        this.quantity,
        this.orderslno,
        this.accepted});

  Orders.fromJson(Map<String, dynamic> json) {
    orderdetailid = json['orderdetailid'].toString();
    orderid = json['orderid'].toString();
    product = json['product'].toString();
    productId = json['product_id'].toString();
    description = json['description'].toString();
    image = json['image'].toString();
    price = json['price'].toString();
    quantity = json['quantity'].toString();
    orderslno = json['orderslno'].toString();
    accepted = json['accepted'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderdetailid'] = this.orderdetailid;
    data['orderid'] = this.orderid;
    data['product'] = this.product;
    data['product_id'] = this.productId;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['orderslno'] = this.orderslno;
    data['accepted'] = this.accepted;
    return data;
  }
}

class Accepted {
  String orderdetailid;
  String orderid;
  String product;
  String productId;
  String description;
  String image;
  String price;
  String quantity;
  String orderslno;
  String paymentmod;
  String status;

  Accepted(
      {this.orderdetailid,
        this.orderid,
        this.product,
        this.productId,
        this.description,
        this.image,
        this.price,
        this.paymentmod,
        this.quantity,
        this.orderslno,
        this.status});

  Accepted.fromJson(Map<String, dynamic> json) {
    orderdetailid = json['orderdetailid'].toString();
    orderid = json['orderid'].toString();
    product = json['product'].toString();
    productId = json['product_id'].toString();
    description = json['description'].toString();
    image = json['image'];
    price = json['price'].toString();
    paymentmod = json['paymentmod'].toString();
    quantity = json['quantity'].toString();
    orderslno = json['orderslno'].toString();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderdetailid'] = this.orderdetailid;
    data['orderid'] = this.orderid;
    data['product'] = this.product;
    data['product_id'] = this.productId;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['paymentmod'] = this.paymentmod;
    data['quantity'] = this.quantity;
    data['orderslno'] = this.orderslno;
    data['status'] = this.status;
    return data;
  }
}

class History {
  String orderdetailid;
  String orderid;
  String datetime;
  String latitude;
  String longitude;
  String product;
  String productId;
  String description;
  String image;
  String price;
  String quantity;
  String paymentmod;
  String orderslno;
  String status;
  List<DeliveryAddress> address;

  History(
      {this.orderdetailid,
        this.orderid,
        this.datetime,
        this.latitude,
        this.longitude,
        this.product,
        this.productId,
        this.description,
        this.paymentmod,
        this.image,
        this.price,
        this.quantity,
        this.orderslno,
        this.status,
        this.address});

  History.fromJson(Map<String, dynamic> json) {
    orderdetailid = json['orderdetailid'].toString();
    orderid = json['orderid'].toString();
    datetime = json['datetime'].toString();
    latitude = json['latitude'].toString();
    longitude = json['longitude'].toString();
    product = json['product'].toString();
    productId = json['product_id'].toString();
    description = json['description'].toString();
    image = json['image'].toString();
    price = json['price'].toString();
    paymentmod = json['paymentmod'].toString();
    quantity = json['quantity'].toString();
    orderslno = json['orderslno'].toString();
    status = json['status'].toString();
    if (json['deliveryaddress'] != null) {
      address = new List<DeliveryAddress>();
      json['deliveryaddress'].forEach((v) {
        address.add(new DeliveryAddress.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderdetailid'] = this.orderdetailid;
    data['orderid'] = this.orderid;
    data['datetime'] = this.datetime;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['product'] = this.product;
    data['product_id'] = this.productId;
    data['description'] = this.description;
    data['paymentmod'] = this.paymentmod;
    data['image'] = this.image;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['orderslno'] = this.orderslno;
    data['status'] = this.status;
    if (this.address != null) {
      data['deliveryaddress'] = this.address.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeliveryAddress {
  String nameAdress;
  String house;
  String roadName;
  String streetName;
  String state;
  String country;
  String mobile;

  DeliveryAddress(
      {this.nameAdress,
        this.house,
        this.roadName,
        this.streetName,
        this.state,
        this.country,
        this.mobile});

  DeliveryAddress.fromJson(Map<String, dynamic> json) {
    nameAdress = json['name_adress'].toString();
    house = json['house'].toString();
    roadName = json['road_name'].toString();
    streetName = json['street_name'].toString();
    state = json['state'].toString();
    country = json['country'].toString();
    mobile = json['mobile'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_adress'] = this.nameAdress;
    data['house'] = this.house;
    data['road_name'] = this.roadName;
    data['street_name'] = this.streetName;
    data['state'] = this.state;
    data['country'] = this.country;
    data['mobile'] = this.mobile;
    return data;
  }
}
