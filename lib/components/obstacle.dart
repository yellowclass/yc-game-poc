import 'dart:convert';
import 'package:flame/collisions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:http/http.dart' as http;
import '../pages/game.dart';

class Obstacle extends SpriteAnimationComponent with HasGameRef<TryGame> {
  final WidgetRef ref;

  Obstacle({required this.ref}) : super() {
    debugMode = true;
  }

  late SpriteAnimation animationRun;
  late SpriteAnimation animationIdle;
  late SpriteAnimationComponent man;
  late SpriteSheet spriteRun;
  late SpriteSheet spriteIdle;
  bool isFlipped = false;

  @override
  Future<void> onLoad() async {
    http.Response responseIdle = await http.get(Uri.parse('https://firebasestorage.googleapis.com/v0/b/contract-522d7.appspot.com/o/idle_wizard.png?alt=media&token=88078047-f629-4ec8-aece-088b30e783a3&_gl=1*24s220*_ga*ODM1MDc4NzMyLjE2OTgxNTU1MTc.*_ga_CW55HF8NVT*MTY5ODU3Njc0Ny4zLjEuMTY5ODU3NzIyMi42MC4wLjA.'),);  
    String idleWizard = base64Encode(responseIdle.bodyBytes);
    spriteIdle = SpriteSheet(
        image: await gameRef.images.fromBase64("1",idleWizard),
        srcSize: Vector2(128, 128));
    animationIdle = spriteIdle.createAnimation(row: 0, stepTime: 0.1);
    animation = animationIdle;
    position = Vector2(gameRef.size[0] - 200, gameRef.size[1] / 3);
    size = Vector2.all(200);
    flipHorizontallyAroundCenter();
    add(RectangleHitbox.relative(
      Vector2(0.5, 0.6),
      parentSize: size, position: Vector2(size.y / 4, size.y / 2.5),
    )..flipHorizontallyAroundCenter());
  }
}
