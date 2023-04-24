import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:howlongtobeat/models/game.dart';

class GameCard extends StatelessWidget {
  final Game game;

  const GameCard(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 2.0,
        child: InkWell(
          splashColor: Theme.of(context).colorScheme.secondaryContainer,
          onTap: () {},
          child: SizedBox(
            height: 160.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        children: [
                          Image.network(
                            game.smallImage.toString(),
                            height: 160.0,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Positioned.fill(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => _showBigImage(context),
                                splashColor: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18.0,
                          ),
                          child: Text(
                            game.name,
                            textAlign: TextAlign.start,
                            softWrap: true,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: DurationWidget(
                                duration: game.mainStoryCompletionTime,
                                label: "Main",
                              ),
                            ),
                            Expanded(
                              child: DurationWidget(
                                duration: game.mainPlusExtraCompletionTime,
                                label: "Main + Extra",
                              ),
                            ),
                            Expanded(
                              child: DurationWidget(
                                duration: game.completionistCompletionTime,
                                label: "100%",
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<Object?> _showBigImage(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierLabel: "${game.name} Image",
      barrierDismissible: true,
      barrierColor: Colors.black87,
      pageBuilder: (context, animation, secondaryAnimation) => Center(
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Image.network(
            game.image.toString(),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class DurationWidget extends StatelessWidget {
  final Duration duration;
  final String label;

  const DurationWidget(
      {required this.duration, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    var durationText = (duration.inSeconds == 0)
        ? "-"
        : duration.inHours == 0
            ? "${duration.inMinutes}m"
            : "${duration.inHours}h";

    return Column(
      children: [
        Text(
          durationText,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 8.0,
            fontFeatures: [
              FontFeature.enable('smcp'),
            ],
          ),
        ),
      ],
    );
  }
}
