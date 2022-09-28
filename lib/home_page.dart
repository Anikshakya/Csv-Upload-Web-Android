import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:web_notification/Motion%20Toast/motion_toasts.dart';
import 'package:web_notification/csv_file.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  FirebaseInAppMessaging inAppMessage = FirebaseInAppMessaging.instance;
  @override
  void initState() {
    super.initState();
    messageListener(context);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height:20.0),
            const Text("Home Page"),
            const SizedBox(height: 10),
            ElevatedButton(
                child: const Text('Csv File Uplaod'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const FilePage()));
                 },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text('In App Message'),
                onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Triggering event: awesome_event'),
                  ),
                );
                inAppMessage.triggerEvent('Ayo');
                inAppMessage.triggerEvent('Test');
               },
              ),
             const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Toast Notifications'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const StyledToasts())));
              },
            ), 
          ],
        ),
      ),
    );
    
  }

  //listens to the message from firebase
  void messageListener(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Got a message in the foreground!');
      debugPrint('Message data: ${message.data}');
      if (message.notification != null) {
        debugPrint('Message also contained a notification: ${message.notification!.body}');
        MotionToast(
          icon: Icons.check_circle_outline,
          iconSize: 0.0,
          primaryColor: Colors.transparent,
          secondaryColor: Colors.transparent,
          animationCurve: Curves.bounceOut,
          backgroundType: BackgroundType.transparent,
          layoutOrientation: ToastOrientation.rtl,
          animationType: AnimationType.fromTop,
          position: MotionToastPosition.top,
          animationDuration: const Duration(milliseconds: 1000),
          borderRadius: 4.0,
          padding: const EdgeInsets.only(top : 8.0, left: 8.0, right: 8.0),
          height: MediaQuery.of(context).size.height * 0.095,
          width: MediaQuery.of(context).size.width - 40,
          title: Row(
            children: [
              const SizedBox(width: 20.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    '${message.notification!.title}',
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(

                    height: 10,
                  ),
                  Text(
                    '${message.notification!.body}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
            ],
          ),
          description: const SizedBox(),
        ).show(context);
      }
    }
  );
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) { 
      debugPrint(message.notification!.title);
      debugPrint(message.notification!.body);
    });
  }
}