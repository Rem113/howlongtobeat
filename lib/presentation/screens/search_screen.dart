import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:howlongtobeat/presentation/screens/search_results_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<StatefulWidget> {
  final TextEditingController _searchBoxTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "HowLongToBeat",
            style: TextStyle(
              fontSize: 48.0,
              fontFeatures: [
                FontFeature.enable('smcp'),
              ],
            ),
          ),
          const SizedBox(
            height: 48.0,
          ),
          SizedBox(
            height: 48.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 300.0),
                  child: TextField(
                    controller: _searchBoxTextController,
                    onEditingComplete: () {
                      if (_searchBoxTextController.text.isNotEmpty) {
                        Navigator.of(context).pushNamed('/search',
                            arguments: SearchResultsScreenArgs(
                                _searchBoxTextController.text));
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      hintText: "Search for a game...",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w200,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                SizedBox(
                  height: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.primaryContainer,
                      ),
                      shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_searchBoxTextController.text.isNotEmpty) {
                        Navigator.of(context).pushNamed('/search',
                            arguments: SearchResultsScreenArgs(
                                _searchBoxTextController.text));
                      }
                    },
                    child: const Text("Search"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
