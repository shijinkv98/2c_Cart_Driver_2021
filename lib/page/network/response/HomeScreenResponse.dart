class HomeScreenResponse {
  String success;
  String message;
  String firstname;
  String lastname;
  String driver_duty;
  List<Orders> orders;
  List<Accepted> accepted;
  List<History> history;

  HomeScreenResponse(
      {this.success,
        this.message,
        this.firstname,
        this.lastname,
        this.orders,
        this.driver_duty,
        this.accepted,
        this.history});

  HomeScreenResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    driver_duty = json['driver_duty'];
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
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['driver_duty'] = this.driver_duty;
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
  String orderid;
  String ordertime;
  String paymentmod;
  String accepted;
  List<Address> address;
  String customername;
  List<Ordersnew> ordersnew;

  Orders(
      {this.orderid,
        this.ordertime,
        this.paymentmod,
        this.accepted,
        this.address,
        this.customername,
        this.ordersnew});

  Orders.fromJson(Map<String, dynamic> json) {
    orderid = json['orderid'];
    ordertime = json['ordertime'];
    paymentmod = json['paymentmod'];
    accepted = json['accepted'];
    if (json['address'] != null) {
      address = new List<Address>();
      json['address'].forEach((v) {
        address.add(new Address.fromJson(v));
      });
    }
    customername = json['customername'];
    if (json['ordersnew'] != null) {
      ordersnew = new List<Ordersnew>();
      json['ordersnew'].forEach((v) {
        ordersnew.add(new Ordersnew.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderid'] = this.orderid;
    data['ordertime'] = this.ordertime;
    data['paymentmod'] = this.paymentmod;
    data['accepted'] = this.accepted;
    if (this.address != null) {
      data['address'] = this.address.map((v) => v.toJson()).toList();
    }
    data['customername'] = this.customername;
    if (this.ordersnew != null) {
      data['ordersnew'] = this.ordersnew.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  String name;
  String house;
  String roadName;
  String streetName;
  String state;
  String country;
  String lat;
  String long;
  String mobile;

  Address(
      {this.name,
        this.house,
        this.roadName,
        this.streetName,
        this.state,
        this.country,
        this.lat,
        this.long,
        this.mobile});

  Address.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    house = json['house'];
    roadName = json['road_name'];
    streetName = json['street_name'];
    state = json['state'];
    country = json['country'];
    lat = json['lat'];
    long = json['long'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['house'] = this.house;
    data['road_name'] = this.roadName;
    data['street_name'] = this.streetName;
    data['state'] = this.state;
    data['country'] = this.country;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['mobile'] = this.mobile;
    return data;
  }
}

class Ordersnew {
  String shopidnew;
  String shopnamenew;
  String contactnew;
  String latitudenew;
  String longitudenew;
  String addressnew;
  String shopimagenew;
  List<Products> products;
  int productcount;
  int itemcount;

  Ordersnew(
      {this.shopidnew,
        this.shopnamenew,
        this.contactnew,
        this.latitudenew,
        this.longitudenew,
        this.addressnew,
        this.shopimagenew,
        this.products,
        this.productcount,
        this.itemcount});

  Ordersnew.fromJson(Map<String, dynamic> json) {
    shopidnew = json['shopidnew'];
    shopnamenew = json['shopnamenew'];
    contactnew = json['contactnew'];
    latitudenew = json['latitudenew'];
    longitudenew = json['longitudenew'];
    addressnew = json['addressnew'];
    shopimagenew = json['shopimagenew'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    productcount = json['productcount'];
    itemcount = json['itemcount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shopidnew'] = this.shopidnew;
    data['shopnamenew'] = this.shopnamenew;
    data['contactnew'] = this.contactnew;
    data['latitudenew'] = this.latitudenew;
    data['longitudenew'] = this.longitudenew;
    data['addressnew'] = this.addressnew;
    data['shopimagenew'] = this.shopimagenew;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    data['productcount'] = this.productcount;
    data['itemcount'] = this.itemcount;
    return data;
  }
}

class Products {
  String productname;
  String productid;
  String quantity;
  String price;
  int itemtotal;

  Products(
      {this.productname,
        this.productid,
        this.quantity,
        this.price,
        this.itemtotal});

  Products.fromJson(Map<String, dynamic> json) {
    productname = json['productname'];
    productid = json['productid'];
    quantity = json['quantity'];
    price = json['price'];
    itemtotal = json['itemtotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productname'] = this.productname;
    data['productid'] = this.productid;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['itemtotal'] = this.itemtotal;
    return data;
  }
}

class Accepted {
  String orderid;
  String ordertime;
  String paymentmod;
  String accepted;
  String orderstatus;
  String shipping;
  String customer_image;
  String rupees;
  String ordertotal;
  String walletapplied;
  int itemcount;
  List<Deliaddressacc> deliaddressacc;
  List<Acceptedorders> acceptedorders;

  Accepted(
      {this.orderid,
        this.ordertime,
        this.paymentmod,
        this.accepted,
        this.customer_image,
        this.orderstatus,
        this.shipping,
        this.rupees,
        this.ordertotal,
        this.walletapplied,
        this.itemcount,
        this.deliaddressacc,
        this.acceptedorders});

  Accepted.fromJson(Map<String, dynamic> json) {
    orderid = json['orderid'].toString();
    ordertime = json['ordertime'].toString();
    paymentmod = json['paymentmod'].toString();
    accepted = json['accepted'].toString();
    customer_image = json['customer_image'].toString();
    orderstatus = json['orderstatus'].toString();
    shipping = json['shipping'].toString();
    rupees = json['rupees'].toString();
    ordertotal = json['ordertotal'].toString();
    walletapplied = json['walletapplied'].toString();
    itemcount = json['itemcount'];
    if (json['deliaddressacc'] != null) {
      deliaddressacc = new List<Deliaddressacc>();
      json['deliaddressacc'].forEach((v) {
        deliaddressacc.add(new Deliaddressacc.fromJson(v));
      });
    }
    if (json['acceptedorders'] != null) {
      acceptedorders = new List<Acceptedorders>();
      json['acceptedorders'].forEach((v) {
        acceptedorders.add(new Acceptedorders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderid'] = this.orderid;
    data['ordertime'] = this.ordertime;
    data['paymentmod'] = this.paymentmod;
    data['accepted'] = this.accepted;
    data['orderstatus'] = this.orderstatus;
    data['shipping'] = this.shipping;
    data['customer_image'] = this.customer_image;
    data['rupees'] = this.rupees;
    data['ordertotal'] = this.ordertotal;
    data['walletapplied'] = this.walletapplied;
    data['itemcount'] = this.itemcount;
    if (this.deliaddressacc != null) {
      data['deliaddressacc'] =
          this.deliaddressacc.map((v) => v.toJson()).toList();
    }
    if (this.acceptedorders != null) {
      data['acceptedorders'] =
          this.acceptedorders.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Deliaddressacc {
  String name;
  String house;
  String road_name;
  String street_name;
  String state;
  String country;
  String lat;
  String long;
  String mobile;

  Deliaddressacc(
      {this.name,
        this.house,
        this.road_name,
        this.street_name,
        this.state,
        this.country,
        this.lat,
        this.long,
        this.mobile,
      });

  Deliaddressacc.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    house = json['house'];
    road_name = json['road_name'];
    street_name = json['street_name'];
    state = json['state'];
    country = json['country'];
    lat = json['lat'];
    long = json['long'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['house'] = this.house;
    data['road_name'] = this.road_name;
    data['street_name'] = this.street_name;
    data['state'] = this.state;
    data['country'] = this.country;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['mobile'] = this.mobile;
    return data;
  }
}

class Acceptedorders {
  String shopid;
  String shopname;
  String contact;
  String latitude;
  String longitude;
  String address;
  String shopimage;
  List<Accproducts> accproducts;
  int productcountacc;
  int itemcountshopacc;

  Acceptedorders(
      {this.shopid,
        this.shopname,
        this.contact,
        this.latitude,
        this.longitude,
        this.address,
        this.shopimage,
        this.accproducts,
        this.productcountacc,
        this.itemcountshopacc});

  Acceptedorders.fromJson(Map<String, dynamic> json) {
    shopid = json['shopid'].toString();
    shopname = json['shopname'].toString();
    contact = json['contact'].toString();
    latitude = json['latitude'].toString();
    longitude = json['longitude'].toString();
    address = json['address'].toString();
    shopimage = json['shopimage'].toString();
    if (json['accproducts'] != null) {
      accproducts = new List<Accproducts>();
      json['accproducts'].forEach((v) {
        accproducts.add(new Accproducts.fromJson(v));
      });
    }
    productcountacc = json['productcountacc'];
    itemcountshopacc = json['itemcountshopacc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shopid'] = this.shopid;
    data['shopname'] = this.shopname;
    data['contact'] = this.contact;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['shopimage'] = this.shopimage;
    if (this.accproducts != null) {
      data['accproducts'] = this.accproducts.map((v) => v.toJson()).toList();
    }
    data['productcountacc'] = this.productcountacc;
    data['itemcountshopacc'] = this.itemcountshopacc;
    return data;
  }
}

class Accproducts {
  String productnameacc;
  String productidacc;
  String quantityacc;
  String priceacc;
  int itemtotalacc;
  List<Imageacc> imageacc;

  Accproducts(
      {this.productnameacc,
        this.productidacc,
        this.quantityacc,
        this.priceacc,
        this.itemtotalacc,
        this.imageacc});

  Accproducts.fromJson(Map<String, dynamic> json) {
    productnameacc = json['productnameacc'];
    productidacc = json['productidacc'];
    quantityacc = json['quantityacc'];
    priceacc = json['priceacc'];
    itemtotalacc = json['itemtotalacc'];
    if (json['imageacc'] != null) {
      imageacc = new List<Imageacc>();
      json['imageacc'].forEach((v) {
        imageacc.add(new Imageacc.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productnameacc'] = this.productnameacc;
    data['productidacc'] = this.productidacc;
    data['quantityacc'] = this.quantityacc;
    data['priceacc'] = this.priceacc;
    data['itemtotalacc'] = this.itemtotalacc;
    if (this.imageacc != null) {
      data['imageacc'] = this.imageacc.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Imageacc {
  String imageint;

  Imageacc({this.imageint});

  Imageacc.fromJson(Map<String, dynamic> json) {
    imageint = json['imageint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageint'] = this.imageint;
    return data;
  }
}

class History {
  String orderid;
  String ordertime;
  String paymentmod;
  String accepted;
  String orderstatus;
  List<Ordershis> ordershis;
  List<Deliaddresshis> deliaddresshis;

  History(
      {this.orderid,
        this.ordertime,
        this.paymentmod,
        this.accepted,
        this.orderstatus,
        this.ordershis,
        this.deliaddresshis});

  History.fromJson(Map<String, dynamic> json) {
    orderid = json['orderid'];
    ordertime = json['ordertime'];
    paymentmod = json['paymentmod'];
    accepted = json['accepted'];
    orderstatus = json['orderstatus'];
    if (json['ordershis'] != null) {
      ordershis = new List<Ordershis>();
      json['ordershis'].forEach((v) {
        ordershis.add(new Ordershis.fromJson(v));
      });
    }
    if (json['deliaddresshis'] != null) {
      deliaddresshis = new List<Deliaddresshis>();
      json['deliaddresshis'].forEach((v) {
        deliaddresshis.add(new Deliaddresshis.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderid'] = this.orderid;
    data['ordertime'] = this.ordertime;
    data['paymentmod'] = this.paymentmod;
    data['accepted'] = this.accepted;
    data['orderstatus'] = this.orderstatus;
    if (this.ordershis != null) {
      data['ordershis'] = this.ordershis.map((v) => v.toJson()).toList();
    }
    if (this.deliaddresshis != null) {
      data['deliaddresshis'] =
          this.deliaddresshis.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Deliaddresshis {
  String name;
  String house;
  String road_name;
  String street_name;
  String state;
  String country;
  String lat;
  String long;
  String mobile;

  Deliaddresshis(
      {this.name,
        this.house,
        this.road_name,
        this.street_name,
        this.state,
        this.country,
        this.lat,
        this.long,
        this.mobile,
      });

  Deliaddresshis.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    house = json['house'];
    road_name = json['road_name'];
    street_name = json['street_name'];
    state = json['state'];
    country = json['country'];
    lat = json['lat'];
    long = json['long'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['house'] = this.house;
    data['road_name'] = this.road_name;
    data['street_name'] = this.street_name;
    data['state'] = this.state;
    data['country'] = this.country;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['mobile'] = this.mobile;
    return data;
  }
}
class Ordershis {
  String shopidhis;
  String shopnamehis;
  String contacthis;
  String latitudehis;
  String longitudehis;
  String addresshis;
  String shopimagehis;
  List<Productshis> productshis;
  int productcount;
  int itemcount;

  Ordershis(
      {this.shopidhis,
        this.shopnamehis,
        this.contacthis,
        this.latitudehis,
        this.longitudehis,
        this.addresshis,
        // this.shopimagehis,
        this.productshis,
        this.productcount,
        this.itemcount});

  Ordershis.fromJson(Map<String, dynamic> json) {
    shopidhis = json['shopidhis'];
    shopnamehis = json['shopnamehis'];
    contacthis = json['contacthis'];
    latitudehis = json['latitudehis'];
    longitudehis = json['longitudehis'];
    addresshis = json['addresshis'];
    // shopimagehis = json['shopimagehis'];
    if (json['productshis'] != null) {
      productshis = new List<Productshis>();
      json['productshis'].forEach((v) {
        productshis.add(new Productshis.fromJson(v));
      });
    }
    productcount = json['productcount'];
    itemcount = json['itemcount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shopidhis'] = this.shopidhis;
    data['shopnamehis'] = this.shopnamehis;
    data['contacthis'] = this.contacthis;
    data['latitudehis'] = this.latitudehis;
    data['longitudehis'] = this.longitudehis;
    data['addresshis'] = this.addresshis;
    // data['shopimagehis'] = this.shopimagehis;
    if (this.productshis != null) {
      data['productshis'] = this.productshis.map((v) => v.toJson()).toList();
    }
    data['productcount'] = this.productcount;
    data['itemcount'] = this.itemcount;
    return data;
  }
}

class Productshis {
  String productname;
  String productid;
  String quantity;
  String price;
  int itemtotal;
  List<Image> image;

  Productshis(
      {this.productname,
        this.productid,
        this.quantity,
        this.price,
        this.itemtotal,
        this.image});

  Productshis.fromJson(Map<String, dynamic> json) {
    productname = json['productname'];
    productid = json['productid'];
    quantity = json['quantity'];
    price = json['price'];
    itemtotal = json['itemtotal'];
    if (json['image'] != null) {
      image = new List<Image>();
      json['image'].forEach((v) {
        image.add(new Image.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productname'] = this.productname;
    data['productid'] = this.productid;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['itemtotal'] = this.itemtotal;
    if (this.image != null) {
      data['image'] = this.image.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Image {
  String image;

  Image({this.image});

  Image.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}
