import "package:flutter_viper_arch_demo/interactor/interactor_library.dart";
import "package:flutter_viper_arch_demo/router/router_library.dart";
import "package:flutter_viper_arch_demo/entity/entity_library.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";

class PresenterOfLobby extends StateNotifier<UserAccountInfo> {
  PresenterOfLobby._singleInstance() : super(UserAccountInfo(null, null));
  static final _instance = PresenterOfLobby._singleInstance();
  factory PresenterOfLobby() => _instance;

  bool isMember(String id, String pw) {
    return InteractorOfAuth.isMember(id, pw);
  }

  void onIdChange(String value) {
    state.id = value;
  }

  void onPwChange(String value) {
    state.pw = value;
  }

  void enterToHomeScreen(BuildContext context) {
    NavigateGraph.changeTo(context, NavigateGraph.home);
  }

  static final provider = StateNotifierProvider<PresenterOfLobby, UserAccountInfo>((ref) => PresenterOfLobby());
}
