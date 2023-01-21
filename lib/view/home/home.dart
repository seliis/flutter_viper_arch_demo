import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";

import "header.dart";
import "panel.dart";
import "menu.dart";

class Home extends ConsumerWidget {
  const Home({super.key});

  Future<bool> showLogoutDialog(BuildContext parentContext) async {
    await showDialog(
      context: parentContext,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Do You Want Logout?",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          actions: [
            TextButton(
              child: const Text(
                "No",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(
                  color: Colors.pink,
                ),
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, "lobby", (route) => false);
              },
            ),
          ],
        );
      },
    );
    return false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: [
                Header(key, showLogoutDialog),
                Expanded(
                  child: Row(
                    children: const [
                      Menu(),
                      Panel(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async => await showLogoutDialog(context),
    );
  }
}
