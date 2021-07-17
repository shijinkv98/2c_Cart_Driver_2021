import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectname33/first.dart';
import 'package:projectname33/page/helper/constants.dart';
import 'package:projectname33/page/notifier/age_restrict_notifier.dart';
import 'package:projectname33/page/notifier/checkbox_notifier.dart';
import 'package:projectname33/page/notifier/home/duty_notifier.dart';
import 'package:projectname33/page/notifier/loading_notifier.dart';
import 'package:projectname33/page/notifier/loginnotifier.dart';
import 'package:projectname33/page/notifier/updatenotifier.dart';
import 'package:projectname33/page/screens/balance_screen_new.dart';
import 'package:projectname33/page/screens/home_screen2.dart';
import 'package:projectname33/page/screens/login_screen.dart';
import 'package:projectname33/page/screens/profile_screen_new.dart';
import 'package:projectname33/page/screens/settings.dart';
import 'package:projectname33/page/screens/splash_screen.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:background_location/background_location.dart';


void main() {
  // SharedPreferences.setMockInitialValues({});
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const MethodChannel platformMethodChannel =
      const MethodChannel('com.jafseel/firebase');
  @override
  void initState() {
    super.initState();
    getDeviceToken();
    getDeviceId();
    // BackgroundLocation.startLocationService();
    // BackgroundLocation.getLocationUpdates((location) {
    //   // setState(() {
    //   this.latitude = location.latitude.toString();
    //   this.longitude = location.longitude.toString();
    //   this.accuracy = location.accuracy.toString();
    //   this.altitude = location.altitude.toString();
    //   this.bearing = location.bearing.toString();
    //   this.speed = location.speed.toString();
    //   this.time =
    //       DateTime.fromMillisecondsSinceEpoch(location.time.toInt()).toString();
    // });

    // _firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     print("onMessage: $message");
    //     _showItemDialog(context, message);
    //   },
    //   onLaunch: (Map<String, dynamic> message) async {
    //     print("onLaunch: $message");
    //     _navigateToItemDetail(message);
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     print("onResume: $message");
    //     _navigateToItemDetail(message);
    //   },
    // );
    // _firebaseMessaging.requestNotificationPermissions(
    //     const IosNotificationSettings(
    //         sound: true, badge: true, alert: true, provisional: true));
    // _firebaseMessaging.onIosSettingsRegistered
    //     .listen((IosNotificationSettings settings) {
    //   print("Settings registered: $settings");
    // });
    // _firebaseMessaging.getToken().then((String token) {
    //   deviceToken = token;
    //   print("token $token");
    // });
  }

  @override
  void dispose() {
    // BackgroundLocation.stopLocationService();
    super.dispose();
  }

  getDeviceToken() async {
    try {
      deviceToken = await platformMethodChannel.invokeMethod('getDeviceToken');
      debugPrint("***MJM device token: $deviceToken");
    } catch (e) {
      debugPrint("***MJM getDeviceToken: error: $e");
    }
  }

  getDeviceId() async {
    try {
      deviceId = await platformMethodChannel.invokeMethod('getDeviceId');
      debugPrint("***MJM deviceId: $deviceId");
    } catch (e) {
      debugPrint("***MJM getDeviceId error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provider<HomeChangeNotifier>(create: (_) => HomeChangeNotifier()),
        ChangeNotifierProvider(
          create: (context) => LoginUpdateNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => UpdateNotifier(),
        ),

        ChangeNotifierProvider(
          create: (context) => DutyChangeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => AgeRestrictNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeLoadNotifier(),
        ),

        ChangeNotifierProvider.value(
          // create: (context) => DeliveryLoadingNotifier(),
          value: DeliveryLoadingNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => PickupLoadingNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => PaymentCheckboxNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginLoadingNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => ReturnScreenLoadingNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckBoxNotifier(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => PaymentCheckboxNotifier(),
        // )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              {
                return MaterialPageRoute(builder: (_) => LoginScreen());
              }
              break;
            // case '/home':
            //   {
            //     return MaterialPageRoute(builder: (_) => HomeScreen());
            //   }
            //   break;
            case '/homenew':
              {
                return MaterialPageRoute(builder: (_) => HomeScreenNew());
              }
              break;
            case '/settings':
              {
                return MaterialPageRoute(builder: (_) => Setting());
              }
              break;
            case '/welcome':
              {
                return MaterialPageRoute(builder: (_) => MyApp());
              }
              break;
            case '/balanceNew':
              {
                return MaterialPageRoute(builder: (_) => BalanceScreenNew());
              }
              break;
            case '/first':
              {
                return MaterialPageRoute(
                    builder: (_) =>First());
              }
              break;

            case '/profile':
              {
                return MaterialPageRoute(builder: (_) => ProfileScreenNew());
              }
              break;
            case '/profilenew':
              {
                return MaterialPageRoute(builder: (_) => ProfileScreenNew());
              }
              break;

            default:
              break;
          }
        },
        // routes: <String, WidgetBuilder>{
        //   '/login': (BuildContext context) => LoginScreen(),
        //   '/home': (BuildContext context) => HomeScreen(),
        //   '/history': (BuildContext context) => HistoryScreen(),
        //   '/order_details': (BuildContext context) => OrderDetail(),
        //   '/settings': (BuildContext context) => Setting(),
        //   // '/chat': (BuildContext context) => ChatScreen(),
        //   '/pickup': (BuildContext context) => PickupScreen(),
        //   '/signature': (BuildContext context) => SignatureScreen(),
        //   '/delivery': (BuildContext context) => DeliveryScreen(),
        //   '/balance': (BuildContext context) => BalanceScreen(),
        //   '/profile': (BuildContext context) => ProfileScreen(),
        // },
        home: SplashScreen(),
      ),
    );
  }

  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final Map<String, Item> _items = <String, Item>{};
  Item _itemForMessage(Map<String, dynamic> message) {
    final dynamic data = message['data'] ?? message;
    final String itemId = data['id'];
    final Item item = _items.putIfAbsent(itemId, () => Item(itemId: itemId))
      ..status = data['status'];
    return item;
  }

  void _showItemDialog(BuildContext context, Map<String, dynamic> message) {
    showDialog<bool>(
      context: context,
      builder: (_) => _buildDialog(context, _itemForMessage(message)),
    ).then((bool shouldNavigate) {
      if (shouldNavigate == true) {
        // _navigateToItemDetail(message);
      }
    });
  }

  Widget _buildDialog(BuildContext context, Item item) {
    return AlertDialog(
      content: Text("Item ${item.itemId} has been updated"),
      actions: <Widget>[
        FlatButton(
          child: const Text('CLOSE'),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        FlatButton(
          child: const Text('SHOW'),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ],
    );
  }

  void _navigateToItemDetail(Map<String, dynamic> message) {
    // final Item item = _itemForMessage(message);
    // // Clear away dialogs
    // Navigator.popUntil(context, (Route<dynamic> route) => route is PageRoute);
    // if (!item.route.isCurrent) {
    //   Navigator.push(context, item.route);
    // }
  }
  String latitude = "waiting...";
  String longitude = "waiting...";
  String altitude = "waiting...";
  String accuracy = "waiting...";
  String bearing = "waiting...";
  String speed = "waiting...";
  String time = "waiting...";
}

class Item {
  Item({this.itemId});
  final String itemId;

  StreamController<Item> _controller = StreamController<Item>.broadcast();
  Stream<Item> get onChanged => _controller.stream;

  String _status;
  String get status => _status;
  set status(String value) {
    _status = value;
    _controller.add(this);
  }

  static final Map<String, Route<void>> routes = <String, Route<void>>{};
  Route<void> get route {
    final String routeName = '/detail/$itemId';
    return routes.putIfAbsent(
      routeName,
      () => MaterialPageRoute<void>(
        settings: RouteSettings(name: routeName),
        builder: (BuildContext context) => Text(itemId.toString()),
      ),
    );
  }
}
