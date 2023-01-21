import "package:flutter_viper_arch_demo/entity/entity_library.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class PresenterOfMenu extends StateNotifier<MenuState> {
  PresenterOfMenu._singleInstance() : super(MenuState.status);
  static final _instance = PresenterOfMenu._singleInstance();
  factory PresenterOfMenu() => _instance;

  void onMenuButtonTapped(MenuState menuState) {
    state = menuState;
  }

  static final provider = StateNotifierProvider<PresenterOfMenu, MenuState>((ref) => PresenterOfMenu());
}
