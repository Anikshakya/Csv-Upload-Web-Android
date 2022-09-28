import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
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
              ElevatedButton(
                child: const Text('Csv File Uplaod'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const FilePage()));
                 },
              ),
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
        showDialog(
          context: context,
            builder: ((BuildContext context) {
              return SimpleDialog(
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Title ${message.notification!.title}'),
                      Text('Title ${message.notification!.body}'),
                    ],
                  ),
              );
            }
          ),
        );
      }
    }
  );
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) { 
      debugPrint(message.notification!.title);
      debugPrint(message.notification!.body);
    });
  }
}