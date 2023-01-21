import "package:flutter_viper_arch_demo/presenter/presenter_library.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";

class Panel extends ConsumerWidget {
  const Panel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(PresenterOfMenu.provider);

    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(
          top: 16,
          left: 8,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.teal,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(provider.name),
      ),
    );
  }
}
