import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_notifier.dart';
import 'home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeNotifier(),
      child: const HomeScreen(),
    );
  }
}
