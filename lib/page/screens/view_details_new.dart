
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectname33/page/helper/constants.dart';
import 'package:projectname33/page/network/ApiCall.dart';
import 'package:projectname33/page/network/response/HomeScreenResponse.dart';
import 'package:projectname33/page/notifier/checkbox_notifier.dart';
import 'package:provider/provider.dart';

import 'balance_screen_new.dart';
class ViewDetailsNew extends StatefulWidget {
 Accepted accept;
 String orderDetailsId;




  @override
  _ViewDetailsNewState createState() => new _ViewDetailsNewState(item: this.accept,orderDetailsId: this.orderDetailsId);
   ViewDetailsNew(Accepted accept,orderDetailsId)
  {
    this.accept=accept;
    this.orderDetailsId=orderDetailsId;
}
}

class _ViewDetailsNewState extends State<ViewDetailsNew> {
  bool value = false;
  Accepted item;
  String orderDetailsId;
  String _value = " ";
  CheckBoxNotifier _checkBoxNotifier;
  _ViewDetailsNewState({this.item,this.orderDetailsId});

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
    _checkBoxNotifier = Provider.of<CheckBoxNotifier>(context, listen: false);
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





  Widget _buildDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Confirmation'),
      content: Text("Are you sure?"),
      actions: <Widget>[
        FlatButton(
          child: const Text('CLOSE'),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        FlatButton(
          child: const Text('CONFIRM'),
        ),
      ],
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
      margin: EdgeInsets.only(left: 15,right: 15,top: 15),
      color:Colors.white,
      child:Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Order ID : ',style: TextStyle(color: Colors.black,fontSize: 12),),
                        Text(item.orderid,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                      ],
                    )),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Payment : ',style: TextStyle(color: Colors.black,fontSize: 12),),
                        Text(item.paymentmod,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                      ],
                    )),

                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 15,bottom: 15),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: iconColor1,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 25,bottom: 25),
                    child: Center(
                      child: Text(item.status,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Status : ', style: TextStyle(color: Colors.black,fontSize: 12),),
                      Text(item.status, style: TextStyle(color: colorPrimary,fontSize: 15),),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width:15,
                        child:Consumer<CheckBoxNotifier>(
                          builder: (context,value,child){
                            return Checkbox(
                              value: this.value,
                              activeColor: colorPrimary,
                              onChanged: (bool value) {
                                setState(() {
                                  this.value = value;
                                });
                              },
                            );
                          }

                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width-60,
                          margin: EdgeInsets.only(left: 10),
                          child: Text('Checked and verified all the items and none of the otems are expired or perished',style: TextStyle(color: Colors.grey,fontSize: 12),))//
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap:  ()async{
               if(!_checkBoxNotifier.isChecked){
                 ApiCall().showToast("Please accept the Verification box");
               }
               else{

               }
                // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreenNew()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 35),
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
}
