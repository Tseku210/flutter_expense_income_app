import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:green_ui/components/circle.dart';
import 'package:green_ui/constants/constants.dart';
import 'package:http/http.dart' as http;

class TopBar extends StatelessWidget {
  final bool isHomeScreen;
  final bool isNotification;
  final String? title;
  final String name;
  final Size size;

  TopBar({
    super.key,
    this.isHomeScreen = false,
    this.isNotification = false,
    this.title,
    this.name = '',
    required this.size,
  });

  final _credentials = ServiceAccountCredentials.fromJson({
    "type": "service_account",
    "project_id": "finance-flutter-app-ed66d",
    "private_key_id": "3eb6e611d8586a1ed2165a9e7e1606e8087099ca",
    "private_key":
        "-----BEGIN PRIVATE KEY-----\nMIIEugIBADANBgkqhkiG9w0BAQEFAASCBKQwggSgAgEAAoIBAQDWsNXl2OeRA+hv\n5DfVxbhD8AlhUQlTWaESRYfdIZJCzgp/8m1C3Yo3lI8wfCLFcm5qfy8HmOqnl2si\nJ4buEzyA7p5XbCNc0MoA8SPacjq1+C8VUNqFyNkqY/kJW3J3q5jahsTuaQaNrY6Y\nFEcwYGuzw8wna+VuVzMeRzkep/1mMLBc6gZB/Xs1aTLhS3sRMRyODvu5HR/+I55/\nRjjH3tIaA6UfOs8NtPt2fiCZp59+aq8vR+uOdWcdGILICnmW0O1zvt/AYRoxdpqV\nqrBhM7ivmZ+PwkQuvM4usSFXX+tipW48mdV02QRQNUKEEzqmeCN9Tab10LXLOyYQ\nhtKHAPUXAgMBAAECgf9gKX+ldCzvciX/+DkKMjBW6IKgaavDqbcmd/5jDfvKmyoY\nz9LLdcUdysJYSpdIg/jxEAarYH26k21pNEs7rWIXCMqOXeF5BrbJtTkEn3sCBtMQ\nDnx9cCPVg5yzPu1cAisftpMpi+FjlFmfxMrI4GddcwCpUlVxwZ0j8sL4TZvdfnSw\nLAKRTofebuPqK+Laf9m+E40VLL7o9lRh0TrV7AsJ2OtGb3GKKDMuJnYVJJF5UW3V\n+XliYL+M3M4PotDdpK+GhF4p3x3Q0bLiBBAXuwW/Se/VeIRxFAvOJAMnuVeokP1B\nd/Tyn6ryCiDYc0jqQapR2xfixAaAbmynXdmJLwECgYEA8tg3M/Y9x1NBxRHp2Ul2\ncm7gh/e5MOdvHPtQhQ5GO9ssNiUiIFQwjSCJV1GV6LC521S38pB7dNk8YxTxtq5Y\n/III+QYLwK223mYulkrO1y0cxvyLiTVkVjwxEDXrOuFY8SoZ5jrv8XCTcRcA3l9B\nu0YIra9OcZ34ihc9IrB+TGcCgYEA4lIuSTP4yRKbUMEaonf8EcSNy/VZ5fgZ7Kda\nShTKt9JvV6I8SZI5GvpiPNrQQtJo27I4NfVgWR+FAVvJaHxH04tN9BeRAOkaHxVU\nx/wQh+KJdVMMRZaHAeG2DjzVz6a2NIoJImPG9JRg6MCd+flaUheYJQPYykcH+8ij\nWnlpo9ECgYAYjHTgItdR6/+tDUeHeJ6pqL234PnukKax1lHocW32JQzOGGjfvcL+\nsThRBGVUFXFkU6cYtTRVtpQdLAPXRL6oH/kKO2s6uhTPXKL+/Gb2Z5AOKX9timEv\nOnx3OAwkcp1MG8ZseK7CyG+PMhUbZaO+a7D65crXP3Hde8XpWNAbpwKBgHciD19V\nTkZ51uwhWiXfxv6LWqDcXCAkA3GBfpO0cillSlr0+Ys4v3qmBoRGIo6qN6w+Gjy9\nF6SSZO8cI98uXJjMoZI1vYyfJ7LpBaHn28PLydPKjZEr9ZFWAQFpoJsYBJ2Pc9N4\ndkhUutaKXh4x1guUg/AoIDwKO/eb2/FKLAOhAoGAALJHf0lvL31v1e9ikPiK/CtC\nscDvEbkh8Q8QhoCc19rous38eSatpmlVNOp97uAaYtmFuayixpFfK14IBuV9HOOO\nNcBLss3DOk9hgQNTZc+T6WqE9yA7KYfOjtRH35DISfziWYu2Jvfr7kq/7sj+qi+e\n9mcmcvsEz5Di2HCVMVA=\n-----END PRIVATE KEY-----\n",
    "client_email":
        "firebase-adminsdk-l6erx@finance-flutter-app-ed66d.iam.gserviceaccount.com",
    "client_id": "115556217610119505650",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url":
        "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-l6erx%40finance-flutter-app-ed66d.iam.gserviceaccount.com",
    "universe_domain": "googleapis.com"
  });

  Future<void> sendPushNotification() async {
    final client = http.Client();
    final scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

    obtainAccessCredentialsViaServiceAccount(_credentials, scopes, client)
        .then((AccessCredentials credentials) {
      const String url =
          'https://fcm.googleapis.com/v1/projects/finance-flutter-app-ed66d/messages:send';

      final message = {
        'message': {
          'token':
              'fjMN_FfMSfm3FDNG_8Mk-k:APA91bHl-6Z-n5sH4i8z7mXMSVOABvC77K52DQqafLyMAbWbwAWnPOl04XKMhFEquSqMh1OQSPzzWKIYhGhy9ThgIk7b-ZdzGmUfWH2i-kpY2KUmUdEnWIWEQN2bzmzz96uVxSZ3eliq',
          'notification': {
            'body': 'Message iin body heseg',
            'title': 'Message irlee',
            // 'android_channel_id': 'dbfood',
          }
        }
      };

      http
          .post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${credentials.accessToken.data}',
        },
        body: jsonEncode(message),
      )
          .then((response) {
        print('FCM request for device sent!');
        print('Status: ${response.statusCode}');
        print('Body: ${response.body}');
      });
    });
  }

  // void sendPushMessage(String token) async {
  //   try {
  //     await http.post(
  //       Uri.parse('https://fcm.googleapis.com/fcm/send'),
  //       headers: <String, String> {
  //         'Content-Type': 'application/json',
  //         'Authorization': ''
  //       }
  //     )
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height * 0.35,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [linearTopLeft, linearBottomRight],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            color: primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(200, 70),
              bottomRight: Radius.elliptical(200, 70),
            ),
          ),
        ),
        Positioned(
            top: 0,
            left: 100,
            child: Circle(
              radius: 90,
              color: Colors.white.withAlpha(10),
            )),
        Positioned(
            top: 50,
            left: 30,
            child: Circle(
              radius: 120,
              color: Colors.white.withAlpha(10),
            )),
        Positioned(
            top: 100,
            left: -50,
            child: Circle(
              radius: 170,
              color: Colors.white.withAlpha(10),
            )),
        Positioned(
          top: 70,
          left: 30,
          child: SizedBox(
            width: size.width * 0.85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                isHomeScreen
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            const Text("Good afternoon",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                )),
                            const SizedBox(height: 5),
                            Text(name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600))
                          ])
                    : const SizedBox(width: 40),
                title != null
                    ? Text(title!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600))
                    : const SizedBox(),
                isNotification
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.06),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: IconButton(
                              onPressed: () async {
                                // DocumentSnapshot snap = await FirebaseFirestore
                                //     .instance
                                //     .collection('UserTokens')
                                //     .doc('user1')
                                //     .get();
                                // String token = snap['token'];
                                // print(token);
                                // sendPushMessage(token);
                                sendPushNotification();
                              },
                              icon: const Icon(Icons.notifications_outlined,
                                  color: Colors.white)),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
