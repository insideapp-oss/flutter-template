import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_insideapp/features/market/presentation/bloc/asset_bloc.dart';
import 'package:flutter_template_insideapp/features/market/presentation/bloc/asset_event.dart';
import 'package:flutter_template_insideapp/injection_container.dart';

import 'features/market/presentation/pages/home/assets.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AssetBloc>(
      create: (context) => sl()..add(const GetAssets()),
      child: MaterialApp(
        theme:  ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: const Assets(),
      ),
    );
  }
}
