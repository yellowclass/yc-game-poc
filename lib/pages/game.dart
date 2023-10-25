import 'dart:math' as math;
import 'package:flame/collisions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yc_game_poc/components/obstacle.dart';
import 'package:yc_game_poc/components/player.dart';
import 'package:yc_game_poc/providers/providers.dart';

class TryGame extends FlameGame with HasCollisionDetection {
  final WidgetRef ref;

  TryGame({required this.ref});

  @override
  Future<void> onLoad() async {
    add(Player(ref: ref));
    add(Obstacle(ref: ref));
    // camera.follow(man);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
