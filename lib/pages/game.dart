import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flame/game.dart';
import 'package:yc_game_poc/components/obstacle.dart';
import 'package:yc_game_poc/components/player.dart';

class TryGame extends FlameGame with HasCollisionDetection {
  final WidgetRef ref;

  TryGame({required this.ref});

  @override
  Future<void> onLoad() async {
    add(Obstacle(ref: ref));
    add(Player(ref: ref));
    // camera.follow(man);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
