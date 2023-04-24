import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:howlongtobeat/presentation/screens/game_details_screen.dart';
import 'package:howlongtobeat/presentation/screens/search_screen.dart';
import 'package:howlongtobeat/presentation/screens/search_results_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HowLongToBeat',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme ??
              ColorScheme.fromSwatch(
                primarySwatch: Colors.indigo,
              ),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme ??
              ColorScheme.fromSwatch(
                primarySwatch: Colors.indigo,
                brightness: Brightness.dark,
              ),
        ),
        themeMode: ThemeMode.system,
        initialRoute: '/',
        routes: {
          '/': (context) => const SearchScreen(),
          '/search': (context) => const SearchResultsScreen(),
          '/game': (context) => GameDetailsScreen(),
        },
      );
    });
  }
}
