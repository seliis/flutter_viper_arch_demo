import "package:flutter_viper_arch_demo/router/router_library.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";

void main() {
  final ThemeData themeData = ThemeData(
    primarySwatch: Colors.teal,
    useMaterial3: true,
  );

  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: themeData,
        initialRoute: NavigateGraph.lobby,
        onGenerateRoute: NavigateGraph.onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
