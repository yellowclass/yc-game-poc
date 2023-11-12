// To parse this JSON data, do
//
//     final gameModel = gameModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GameModel gameModelFromJson(String str) => GameModel.fromJson(json.decode(str));

String gameModelToJson(GameModel data) => json.encode(data.toJson());

class GameModel {
  final String background;
  final Parallax parallax;
  final Player player;
  final List<Obstacle> obstacles;

  GameModel({
    required this.background,
    required this.parallax,
    required this.player,
    required this.obstacles,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
    background: json["background"],
    parallax: Parallax.fromJson(json["parallax"]),
    player: Player.fromJson(json["player"]),
    obstacles: List<Obstacle>.from(json["obstacles"].map((x) => Obstacle.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "background": background,
    "parallax": parallax.toJson(),
    "player": player.toJson(),
    "obstacles": List<dynamic>.from(obstacles.map((x) => x.toJson())),
  };
}

class Obstacle {
  final SpriteUrl spriteUrl;
  final List<int> spriteSectionSize;
  final List<int> position;
  final List<int> size;
  final List<double> hitboxRelation;
  final List<double> hitboxSizeDivider;
  final String collisionMessage;

  Obstacle({
    required this.spriteUrl,
    required this.spriteSectionSize,
    required this.position,
    required this.size,
    required this.hitboxRelation,
    required this.hitboxSizeDivider,
    required this.collisionMessage,
  });

  factory Obstacle.fromJson(Map<String, dynamic> json) => Obstacle(
    spriteUrl: SpriteUrl.fromJson(json["spriteUrl"]),
    spriteSectionSize: List<int>.from(json["spriteSectionSize"].map((x) => x)),
    position: List<int>.from(json["position"].map((x) => x)),
    size: List<int>.from(json["size"].map((x) => x)),
    hitboxRelation: List<double>.from(json["hitboxRelation"].map((x) => x?.toDouble())),
    hitboxSizeDivider: List<double>.from(json["hitboxSizeDivider"].map((x) => x?.toDouble())),
    collisionMessage: json["collisionMessage"],
  );

  Map<String, dynamic> toJson() => {
    "spriteUrl": spriteUrl.toJson(),
    "spriteSectionSize": List<dynamic>.from(spriteSectionSize.map((x) => x)),
    "position": List<dynamic>.from(position.map((x) => x)),
    "size": List<dynamic>.from(size.map((x) => x)),
    "hitboxRelation": List<dynamic>.from(hitboxRelation.map((x) => x)),
    "hitboxSizeDivider": List<dynamic>.from(hitboxSizeDivider.map((x) => x)),
    "collisionMessage": collisionMessage,
  };
}

class SpriteUrl {
  final String run;
  final String idle;
  final String walk;

  SpriteUrl({
    required this.run,
    required this.idle,
    required this.walk,
  });

  factory SpriteUrl.fromJson(Map<String, dynamic> json) => SpriteUrl(
    run: json["run"],
    idle: json["idle"],
    walk: json["walk"],
  );

  Map<String, dynamic> toJson() => {
    "run": run,
    "idle": idle,
    "walk": walk,
  };
}

class Parallax {
  final List<String> layers;
  final List<int> baseVelocity;
  final List<double> velocityMultiplier;

  Parallax({
    required this.layers,
    required this.baseVelocity,
    required this.velocityMultiplier,
  });

  factory Parallax.fromJson(Map<String, dynamic> json) => Parallax(
    layers: List<String>.from(json["layers"].map((x) => x)),
    baseVelocity: List<int>.from(json["baseVelocity"].map((x) => x)),
    velocityMultiplier: List<double>.from(json["velocityMultiplier"].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "layers": List<dynamic>.from(layers.map((x) => x)),
    "baseVelocity": List<dynamic>.from(baseVelocity.map((x) => x)),
    "velocityMultiplier": List<dynamic>.from(velocityMultiplier.map((x) => x)),
  };
}

class Player {
  final SpriteUrl spriteUrl;
  final List<int> spriteSectionSize;
  final List<int> position;
  final List<int> size;
  final List<double> hitboxRelation;
  final List<double> hitboxSizeDivider;
  final int runSpeedMultiplier;
  final int idlePenaltyMultiplier;
  final int leftBoundaryLimit;

  Player({
    required this.spriteUrl,
    required this.spriteSectionSize,
    required this.position,
    required this.size,
    required this.hitboxRelation,
    required this.hitboxSizeDivider,
    required this.runSpeedMultiplier,
    required this.idlePenaltyMultiplier,
    required this.leftBoundaryLimit,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
    spriteUrl: SpriteUrl.fromJson(json["spriteUrl"]),
    spriteSectionSize: List<int>.from(json["spriteSectionSize"].map((x) => x)),
    position: List<int>.from(json["position"].map((x) => x)),
    size: List<int>.from(json["size"].map((x) => x)),
    hitboxRelation: List<double>.from(json["hitboxRelation"].map((x) => x?.toDouble())),
    hitboxSizeDivider: List<double>.from(json["hitboxSizeDivider"].map((x) => x?.toDouble())),
    runSpeedMultiplier: json["runSpeedMultiplier"],
    idlePenaltyMultiplier: json["idlePenaltyMultiplier"],
    leftBoundaryLimit: json["leftBoundaryLimit"],
  );

  Map<String, dynamic> toJson() => {
    "spriteUrl": spriteUrl.toJson(),
    "spriteSectionSize": List<dynamic>.from(spriteSectionSize.map((x) => x)),
    "position": List<dynamic>.from(position.map((x) => x)),
    "size": List<dynamic>.from(size.map((x) => x)),
    "hitboxRelation": List<dynamic>.from(hitboxRelation.map((x) => x)),
    "hitboxSizeDivider": List<dynamic>.from(hitboxSizeDivider.map((x) => x)),
    "runSpeedMultiplier": runSpeedMultiplier,
    "idlePenaltyMultiplier": idlePenaltyMultiplier,
    "leftBoundaryLimit": leftBoundaryLimit,
  };
}
