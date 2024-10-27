import 'package:flutter/material.dart';
import 'package:neura_chat/core/services/app_router.dart';

void main(List<String> args) {
  runApp(
    const NeuraChat(),
  );
}

class NeuraChat extends StatelessWidget {
  const NeuraChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Neura Chat',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('NeuraChat'),
        ),
      ),
    );
  }
}
