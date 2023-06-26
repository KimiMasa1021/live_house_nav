import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/go_router_provider/go_router_provider.dart';
import 'common/hex_color.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routeInformationProvider:
          ref.watch(routerProvider).routeInformationProvider,
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: HexColor("111111"),
        primaryColor: Colors.lightBlue[800],
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
        ).copyWith(
          background: Colors.red,
          onBackground: HexColor("#F0F1F1"),
        ),
        textTheme: const TextTheme(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
