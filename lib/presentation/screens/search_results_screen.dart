import 'package:flutter/material.dart';
import 'package:howlongtobeat/api/games.dart';
import 'package:howlongtobeat/models/game.dart';
import 'package:howlongtobeat/presentation/components/game_card.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchResultsScreenArgs {
  final String query;

  SearchResultsScreenArgs(this.query);
}

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  final PagingController<int, Game> _pagingController =
      PagingController(firstPageKey: 1);
  late SearchResultsScreenArgs args;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    args =
        ModalRoute.of(context)!.settings.arguments as SearchResultsScreenArgs;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results for \"${args.query}\""),
      ),
      body: PagedListView(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Game>(
          noItemsFoundIndicatorBuilder: (context) => Center(
            child: Text("No games found for \"${args.query}\""),
          ),
          itemBuilder: (context, game, index) => GameCard(
            game,
            key: Key(game.name),
          ),
        ),
      ),
    );
  }

  Future<void> _fetchPage(int pageKey) async {
    final response = await Games.query(args.query, page: pageKey);
    if (response.pageTotal == null || response.pageTotal! < pageKey) {
      _pagingController.appendLastPage(response.games);
    } else {
      _pagingController.appendPage(response.games, response.pageCurrent + 1);
    }
  }
}
