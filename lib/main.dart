import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:green_ui/constants/constants.dart';
import 'package:green_ui/providers/transaction_provider.dart';
import 'package:green_ui/screens/add_expense_screen.dart';
import 'package:green_ui/screens/bill_details_screen.dart';
import 'package:green_ui/screens/connect_wallet_screen.dart';
import 'package:green_ui/screens/graph_screen.dart';
import 'package:green_ui/screens/home.dart';
import 'package:green_ui/screens/payment_screen.dart';
import 'package:green_ui/screens/payment_success_screen.dart';
import 'package:green_ui/screens/profile_screen.dart';
import 'package:green_ui/screens/splash_screen.dart';
import 'package:green_ui/screens/wallet_screen.dart';
import 'package:provider/provider.dart';

import 'components/custom_navigation_bar.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(
    ChangeNotifierProvider(
      create: (context) => TransactionProvider(),
      child: const MyApp(),
    ),
  );
}

class CustomColors {
  static const int _primaryColorValue = 0xFF2F7E79;

  static const MaterialColor primaryColor = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(_primaryColorValue),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: CustomColors.primaryColor,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const StartScreen(),
        '/connect_wallet': (context) => const ConnectWalletScreen(),
        '/expense': (context) => const AddExpenseScreen(),
        '/bill_details': (context) => const BillDetailsScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/payment_success': (context) => const PaymentSuccessScreen(),
        // энэ доошоо хэрэглэгдэхгүй байгаа
        '/graph': (context) => const HomeScreen(),
        '/wallet': (context) => const WalletScreen(),
        '/profile': (context) => const HomeScreen(),
      },
    );
  }
}

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int currentIndex = 0;
  String? mToken = '';
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    print("hello");
    requestPermission();
    getToken();
    initInfo();
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  initInfo() {
    print("i'm inside init");
    var androidInitialize =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitialize = const IOSInitializationSettings();
    var initializationsSettings =
        InitializationSettings(android: androidInitialize, iOS: iosInitialize);

    flutterLocalNotificationsPlugin.initialize(initializationsSettings,
        onSelectNotification: (String? payload) async {
      try {
        if (payload != null && payload.isNotEmpty) {
          // Navigator.pushNamed(context, '/expense');
        } else {}
      } catch (e) {}
      return;
    });

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        print("...........onMessage................");
        print(
            "onMessage: ${message.notification?.title}/${message.notification?.body}");

        BigTextStyleInformation bigTextStyleInformation =
            BigTextStyleInformation(
          message.notification!.body.toString(),
          htmlFormatBigText: true,
          contentTitle: message.notification!.title.toString(),
          htmlFormatContentTitle: true,
        );

        AndroidNotificationDetails androidPlatformChannelSpecifics =
            AndroidNotificationDetails(
          'dbfood',
          'dbfood',
          importance: Importance.high,
          styleInformation: bigTextStyleInformation,
          priority: Priority.high,
          playSound: false,
        );

        NotificationDetails platformChannelSpecifics = NotificationDetails(
            android: androidPlatformChannelSpecifics,
            iOS: const IOSNotificationDetails());

        await flutterLocalNotificationsPlugin.show(
            0,
            message.notification?.title,
            message.notification?.body,
            platformChannelSpecifics,
            payload: message.data['body']);
      },
    );
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        mToken = token;
        print("Token: $mToken");
      });

      saveToken(token!);
    });
  }

  void saveToken(String token) async {
    await FirebaseFirestore.instance.collection("UserTokens").doc("User1").set({
      'token': token,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[currentIndex],
      floatingActionButton: currentIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, "/expense");
              },
              backgroundColor: lightPrimaryColor,
              child: const Icon(
                Icons.add,
                size: 40,
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
