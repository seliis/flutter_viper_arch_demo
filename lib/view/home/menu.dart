import "package:flutter_viper_arch_demo/presenter/presenter_library.dart";
import "package:flutter_viper_arch_demo/entity/entity_library.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";

class Menu extends ConsumerWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(PresenterOfMenu.provider.notifier);
    final provider = ref.watch(PresenterOfMenu.provider);

    ElevatedButton getMenuButton(IconData iconData, MenuState menuState) {
      const Color notSelectedButtonColor = Colors.teal;
      const Color selectedButtonColor = Colors.pink;
      final bool isSelected = provider == menuState;

      return ElevatedButton(
        onPressed: () => notifier.onMenuButtonTapped(menuState),
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: isSelected ? selectedButtonColor : notSelectedButtonColor,
            width: 2,
          ),
          fixedSize: const Size.fromRadius(48),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: isSelected ? selectedButtonColor : notSelectedButtonColor,
            ),
            const SizedBox(height: 4),
            Text(
              menuState.name[0].toUpperCase() + menuState.name.substring(1),
              style: TextStyle(
                color: isSelected ? selectedButtonColor : notSelectedButtonColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          const SizedBox(height: 16),
          getMenuButton(Icons.wysiwyg, MenuState.status),
        ],
      ),
    );
  }
}
