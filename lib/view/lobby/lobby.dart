import "package:flutter_viper_arch_demo/presenter/presenter_library.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";
import "dart:developer";

class Lobby extends ConsumerWidget {
  const Lobby({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(PresenterOfLobby.provider.notifier);
    final repository = ref.watch(PresenterOfLobby.provider);

    TextFormField getTextFormField(Function onChanged, String labelText, bool isObscure) {
      return TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        onChanged: (value) => onChanged(value),
        obscureText: isObscure,
      );
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getTextFormField(notifier.onIdChange, "ID", false),
            const SizedBox(height: 8),
            getTextFormField(notifier.onPwChange, "Password", true),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    child: const Text(
                      "Entrance",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      notifier.enterToHomeScreen(context);
                      if (repository.id != null && repository.pw != null) {
                        log("ID: ${repository.id} / PW: ${repository.pw} / IsMember: ${notifier.isMember(repository.id!, repository.pw!)}");
                      } else {
                        log("ID: ${repository.id} / PW: ${repository.pw} / IsMember: ${null}");
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
