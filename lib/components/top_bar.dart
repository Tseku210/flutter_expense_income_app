import 'package:flutter/material.dart';
import 'package:green_ui/components/circle.dart';
import 'package:green_ui/constants/constants.dart';

class TopBar extends StatelessWidget {
  final bool isHomeScreen;
  final bool isNotification;
  final String? title;
  final String name;
  final Size size;

  const TopBar(
      {super.key,
      this.isHomeScreen = false,
      this.isNotification = false,
      this.title,
      this.name = '',
      required this.size});

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
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.notifications_outlined,
                              color: Colors.white),
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
