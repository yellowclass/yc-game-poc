import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class Buttons extends ConsumerWidget {
  const Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int tappedButton = ref.watch(directionProvider);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTapDown: (x) {
                ref.read(directionProvider.notifier).state = 1;
                ref.read(flippedProvider.notifier).state = false;
              },
              onTapCancel: () {
                ref.read(directionProvider.notifier).state = 0;
              },
              onTapUp: (x) {
                ref.read(directionProvider.notifier).state = 0;
              },
              child: Icon(
                Icons.arrow_forward_rounded,
                size: 50,
                color: tappedButton != 1 ? Colors.white : Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}