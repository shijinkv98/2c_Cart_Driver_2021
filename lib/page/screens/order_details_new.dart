
import 'package:flutter/material.dart';
import 'package:projectname33/page/custom/custom_switch.dart';
import 'package:projectname33/page/helper/constants.dart';
import 'package:projectname33/page/network/response/HomeScreenResponse.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

import 'balance_screen_new.dart';
import 'direction_new.dart';
class OrderDetailsNew extends StatefulWidget {

  Accepted accept;
  String orderDetailsId;
  @override
  _OrderDetailState createState() => new _OrderDetailState(item:this.accept,orderDetailsId:this.orderDetailsId);
  OrderDetailsNew(Accepted accept, orderDetailsId)
  {
  this.accept=accept;
  this.orderDetailsId=orderDetailsId;
  }
}

class _OrderDetailState extends State<OrderDetailsNew> {
  bool isSwitched = false;
  Accepted item;
  String orderDetailsId;
  String _value = "";
  String _selectedGender = 'Door closed';
    _OrderDetailState({this.item,this.orderDetailsId});

  @override
  void initState() {
    super.initState();
  }

  Widget appBar(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
  color: colorPrimary,),
        actions: [
          PopupMenuButton(
              color: Colors.white,
              elevation: 20,
              enabled: true,
              onSelected: (value) {
                setState(() {
                  _value = value;
                });
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      BalanceScreenNew()));
                        },
                        child: TextField(
                          enabled: false,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "COD balance",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 12),
                            prefixIcon: Icon(
                              Icons.monetization_on,
                              size: 18,
                            ),
                            border: InputBorder.none,

                            // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                          ),
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          logout(context);
                        },
                        child: TextField(
                          enabled: false,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Logout",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 12),
                            prefixIcon: Icon(
                              Icons.logout,
                              size: 18,
                            ),
                            border: InputBorder.none,
                            // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                          ),
                        ),
                      ),
                    ),
                  ])
        ],


      title: Container(
        // child: Image(
        //   image: AssetImage("assets/images/logo_1.png"),
        //   height: 30.0,
        //   color: Colors.white,
        //   fit: BoxFit.contain,
        // ),

        child: Center(
          child: Text(
            '2c Cart',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // use Scaffold also in order to provide material app widgets
        appBar: appBar(context),
        backgroundColor: Colors.white,
        body:getAllContent(),
);
  }
  Widget getAllContent(){
    return Column(
      children: [
        _titleName(),
        _tabSection(context),

      ],
    );
  }
  Widget getContent(){
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child:  _getPadding()),
          SliverToBoxAdapter(child:   getAllContentsList()),
          SliverToBoxAdapter(child:  _getPadding()),
          SliverToBoxAdapter(child:  _getDeliveryInfo()),
        ],
      ),
    );
  }
  void launchWhatsApp({
    @required String phone,
    @required String message,
  }) async {
    String url() {
      if (Platform.isIOS) {
        return "whatsapp://wa.me/$phone/?text=${Uri.parse(message)}";
      } else {
        return "whatsapp://send?phone=$phone&text=${Uri.parse(message)}";
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  Widget getMainBody(){
    return Column(
      children: [
        _getContent(),
        _productsTitle(),
         getProductList(),
        _totalProductsText(),
        _getPadding()

      ],
    );
  }

  Widget _tabSection(BuildContext context) {
    return DefaultTabController(
      length: 1,

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top:20),
            child:
            Align(
              alignment: Alignment.centerLeft,
              child: Center(
                child: TabBar(
                  isScrollable: true,
                  // indicator:  BoxDecoration(
                  //   color: Colors.white,
                  // ),
                  indicatorColor: colorPrimary,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [ Center(
                    child: Container(
                        height: 30,
                        child: Center(child: Text("Orders Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))),
                  ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            //Add this to give height
            height: MediaQuery.of(context).size.height-220,
            child: TabBarView(children: [
              Container(
                  child: getContent()),


            ]),
          ),
        ],
      ),
    );
  }

  Widget getAllContentsList(){
    return ListView.builder(
        itemCount:2,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return getMainBody();
        });
  }
  Widget getProductList(){
    return ListView.builder(
        itemCount: 2,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return _products();
        });
  }

  Widget _products(){
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      padding: EdgeInsets.only(bottom: 10),
      color: colorGrayBg,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 15,right: 15,top: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width-120,
                    child: Text('Bounty Coconut filled Chocolate Bar BAr Bar',style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.bold),)),
                Container(
                    width: MediaQuery.of(context).size.width-340,
                    child: Text('2 Nos',style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.bold),))
              ],
            ),
            Container(margin:EdgeInsets.only(top: 5),child: _getDivider())
          ],
        ),
      ),
    );
  }

  Widget _productsTitle(){
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      color: colorGrayBg,
      child:
          Container(
            margin: EdgeInsets.only(left: 15,right: 15,top: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Product',style: TextStyle(fontSize: 15,color: Colors.grey,fontStyle: FontStyle.italic),),
                    Text('Qty.',style: TextStyle(fontSize: 15,color: Colors.grey,fontStyle: FontStyle.italic),)
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Divider(
                    height: 5,color: Colors.grey[500],
                  ),
                )
              ],
            ),
          ),
    );
  }

  Widget _totalProductsText(){
    return Container(
      margin: EdgeInsets.only(left: 20,right: 15,top: 10,bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('${'Total'}${' '}${'( '}${'2'}${' Products,'}${' Qty : '}${'5'}${' Nos.'}${' )'}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
        ],
      ),
    );
  }

  Widget _title() {
    return Center(
      child: Container(
        child: Text(
          'Orders Details',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _getContent() {
    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(top: 1, bottom: 15),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
          child: Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${'Order ID : '}${'item.orderid'}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  // 'Order Id: ${task.orderId}'
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.access_time,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: Text(
                        "10:20am ??",
                        // task.createdAt,
                        style: TextStyle(
                            color: colorPrimary, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: DecoratedBox(

                        decoration: const BoxDecoration(color: iconColor1),
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                          child: Text(
                            'item.paymentmod',
                            // task.paymentMethod,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                orderInfo2(),
                SizedBox(
                  height: 10.0,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _titleName() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10, bottom: 15, right: 20),
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // margin: EdgeInsets.only(top: 15),
            child: Text("Hi, Hameed Irshan",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          Container(
            height: 25,
            child: CustomSwitch(
              value: isSwitched,
              activeColor: colorPrimaryLight,
              activeTextColor: colorPrimary,
              inactiveColor: colorPrimaryLight,
              inactiveTextColor: colorPrimary,
              onChanged: (value) {
                print("VALUE : $value");
                setState(() {
                  isSwitched = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget orderInfo2() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FadeInImage.assetNetwork(
          width: 80.0,
          height: 60,
          fit: BoxFit.fitHeight,
          placeholder: 'assets/images/homemade.jpg',
          image: 'assets/images/homemade.jpg',
          // image: item.image,
          // image: order?.packageInfo?.origination?.logo ?? '',
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
               ' item.product',
                // order?.packageInfo?.origination?.name ?? '',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('item.description',
                // "5/23, Al Seeq Apartment, Al Maqtam Street Abudhab",
                // order?.packageInfo?.origination?.getAddress() ?? '',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Expanded(child:
        Column(
          children: [
            RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: colorPrimary,
              onPressed: () {
                String phone ="6238839396";
                if (phone != null && phone.trim().isNotEmpty) {
                  phone = 'tel:$phone';
                  if ( canLaunch(phone) != null) {
                 launch(phone);
                }
              }

                // _launchUrl(
                //   // 'tel:${task.order.first?.packageInfo?.location?.phone}');
                //     'tel:${'6238839396'}');
              },
              child:
              Container(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/call-icon.png',height: 15,width: 15,),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        "Call",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Color.fromARGB(255, 159, 145, 101),
              onPressed: () {

                String phone ="wa.me/+916238839396/?text=${Uri.parse('Hi')}";
                if (phone != null && phone.trim().isNotEmpty) {
                  phone = 'https:$phone';
                  if ( canLaunch(phone) != null) {
                    launch(phone);
                  }
                }
              },
              child: Container(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/chat-icon.png',height: 15,width: 15,color: Colors.white,),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        "Chat",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>DirectionNew()));

                // _launchUrl(
                //   // 'http://maps.google.com/?saddr=My+Location&daddr=${task.order.first?.packageInfo?.location?.address}'
                //     'http://maps.google.com/?saddr=My+Location&daddr=${'kannur'}');
              },
              textColor: Colors.white,
              color: Color.fromARGB(255, 27, 40, 19),
              padding: const EdgeInsets.all(8.0),
              child:Container(
                width: 80,
                child: Row(
                  children: [
                    Image.asset('assets/images/location-icon.png',height: 15,width: 15,color: Colors.white,),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        "Location",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        ),
      ],
    );
  }

  Widget _getDeliveryInfo() {
    // DeliveryAddress deliveryAddress=history.address!=null&&history.address.length>0?history.address[0]:null;
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: const Text(
              'Delivery Details',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black),
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const DecoratedBox(
                decoration: const BoxDecoration(
                    color: colorPrimary,
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 3.0),
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Usoof Mahaboob',
                    // task.order.first?.packageInfo?.location?.getName(),
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '5/23, Al Seeq Apartment, Al Maqtam Street Abudhab',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              )),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 1,
                child:
                RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: colorPrimary,
                  onPressed: () {
                    String phone ="6238839396";
                    if (phone != null && phone.trim().isNotEmpty) {
                      phone = 'tel:$phone';
                      if ( canLaunch(phone) != null) {
                        launch(phone);
                      }
                    }
                  },
                  child: new Text(
                    "Call",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                flex: 1,
                child:
                RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Color.fromARGB(255, 159, 145, 101),
                  onPressed: () {
                    String phone ="wa.me/+916238839396/?text=${Uri.parse('Hi')}";
                    if (phone != null && phone.trim().isNotEmpty) {
                      phone = 'https:$phone';
                      if ( canLaunch(phone) != null) {
                        launch(phone);
                      }
                    }

                    // Navigator.of(context).pushNamed("/chat");
                    // if (task.order.length > 0) {
                    //   _launchUrl(
                    //     // 'https://wa.me/$contryCode${task.order.first?.packageInfo?.location?.phone}?text=hi');
                    //       'https://wa.me/${'6238839396'}?text=hi');
                    //       // 'https://wa.me/${task.customerPhone}?text=hi');
                    // }
                  },
                  child: new Text(
                    "Chat",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                flex: 1,
                child:
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>DirectionNew()));

                    // _launchUrl(
                    //     // 'http://maps.google.com/?saddr=My+Location&daddr=${task.order.first?.packageInfo?.location?.address}'
                    //     'http://maps.google.com/?saddr=My+Location&daddr=${'kannur'}');
                  },
                  textColor: Colors.white,
                  color: Color.fromARGB(255, 27, 40, 19),
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    "View Location",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // ProductTable(task?.order?.first?.products),
        ],
      ),
    );
  }

  Widget _getPadding() {
    return Container(
      height: 1,
      width: MediaQuery.of(context).size.width,
      color: colorGrayBg,
    );
  }

  Widget _getDivider() {
    return Divider(
      height: 2,color: Colors.grey[700],);
  }

  _launch(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("Not supported");
    }
  }
}
