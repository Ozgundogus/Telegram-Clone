import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:telegram_clone_app/pages/chats_page.dart';
import 'package:telegram_clone_app/pages/contact_page.dart';
import 'package:telegram_clone_app/pages/setting_page.dart';
import 'package:telegram_clone_app/theme/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        ContactPage(),
        ChatPage(),
        SettinPage(),
      ],
    );
  }

  Widget getFooter() {
    List IconItems = [
      MaterialIcons.account_circle,
      Ionicons.ios_chatbubbles,
      MaterialIcons.settings,
    ];
    List textItems = ["Contacts", "Chats", "Settings"];

    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(color: greyColor),
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            IconItems.length,
            (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    pageIndex = index;
                  });
                },
                child: Column(
                  children: [
                    index == 1
                        ? Badge(
                            badgeContent: Text(
                              "3",
                              style: TextStyle(
                                color: white,
                              ),
                            ),
                            child: Icon(
                              IconItems[index],
                              size: 30,
                              color: pageIndex == index
                                  ? primary
                                  : white.withOpacity(0.5),
                            ),
                          )
                        : Icon(
                            IconItems[index],
                            size: 30,
                            color: pageIndex == index
                                ? primary
                                : white.withOpacity(0.5),
                          ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      textItems[index],
                      style: TextStyle(
                          fontSize: 11,
                          color: pageIndex == index
                              ? primary
                              : white.withOpacity(0.5)),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
