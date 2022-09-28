import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_notification/home_page.dart';


//get data to app when on background
Future<void> backgroundHandler(RemoteMessage message)async{
  debugPrint(message.data.toString());
  debugPrint(message.notification!.title.toString());
}
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBu9eAd26DVhQwFFcmnOuDHHm25tvApRUI",
      authDomain: "web-notification-e24ec.firebaseapp.com",
      projectId: "web-notification-e24ec",
      storageBucket: "web-notification-e24ec.appspot.com",
      messagingSenderId: "270162009803",
      appId: "1:270162009803:web:e0843a216355a655c4054e"
    ),
  );
  }
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(const MyApp());
  FirebaseMessaging.instance.getToken().then((value) {
    debugPrint(value);
  });
}

var navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}





