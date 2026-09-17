import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/auth/presentation/providers/auth_provider.dart';
import 'provider/theme_provider.dart';
import 'theme/app_theme.dart';
import 'router/router_provider.dart';


class LifePilotApp extends ConsumerWidget {
  const LifePilotApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);
    final router = ref.watch(routerProvider);
    final authState = ref.watch(authStateProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,

      theme: AppTheme.light,

      darkTheme: AppTheme.light,

      themeMode: mode
    );
  }
}