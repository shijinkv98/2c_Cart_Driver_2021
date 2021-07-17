
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectname33/page/helper/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'balance_screen_new.dart';
class DirectionNew extends StatefulWidget {

  @override
  _ReturnState createState() => new _ReturnState();
}

class _ReturnState extends State<DirectionNew> {
String _value = "";
  _ReturnState();

  @override
  void initState() {
    super.initState();
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  Widget appBar(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
  color: colorPrimary,),
      centerTitle: true,
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
        child: Text(
          '2c Cart',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    debugPrint('$APP_TAG ReturnToStoreScreen build()');
    return Scaffold(
      // use Scaffold also in order to provide material app widgets
      backgroundColor: Colors.white,
      appBar: appBar(context),
      body: getContent(),

    );
  }
Widget getContent(){
    return Container(
      margin: EdgeInsets.only(left: 0,right: 0,top: 0),
      color:Colors.white,
      child:Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child:
            Column(
              children: [
               Container(
                 height: MediaQuery.of(context).size.height/2.5,
                 width: MediaQuery.of(context).size.width,
                 color: Colors.red,
                 child: Image.asset('assets/images/direction.png',fit: BoxFit.cover,),
                 // child:
               ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text('Abdul Naseer',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),)),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text('5/23, Al Seeq Apartment,Al Maqtam Street Abudhabi,Abhudhabi',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 15),)),
                    ],
                  ),
                )

              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: (){
                _launchUrl(
                  // 'http://maps.google.com/?saddr=My+Location&daddr=${task.order.first?.packageInfo?.origination?.address}');
                    'http://maps.google.com/?saddr=My+Location&daddr=${'kannur'}');
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 35,left: 15,right: 15),
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.black
                ),
                child: Center(child: Text('PROCEED',style: TextStyle(color: Colors.white,fontSize: 15),)),
              ),
            ),
          )
        ],
      )

    );
}

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }




}
